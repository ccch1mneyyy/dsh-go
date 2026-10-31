// A tap on a plugin's native control and what it may do next
// (docs/design/native-plugins-protocol.md §4.4, §5; native-plugins.md §3.7),
// plus ui.json's own actions, which run through the same hands.
//
// - A control with a static effect runs it here and never asks the plugin.
// - Otherwise the tap goes to the plugin (`invoke`); what comes back is read
//   against the whitelist and runs only within 3 s of the tap — except data
//   updates. While the call is out, the control shows it is working.
// - `insert` fills the composer and never sends. `link` asks every time,
//   naming the host. `command` needs an open conversation.
// - A plugin that reads the draft, the clipboard or the message asks once.

import 'dart:async';

import 'package:dsh_client/dsh_client.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../l10n/l10n.dart';
import '../../../plugins/native/native_capabilities.dart';
import '../../../plugins/native/native_effects.dart';
import '../../../plugins/native/native_files.dart';
import '../../../plugins/native/native_model.dart';
import '../../../plugins/native/native_state.dart';
import '../../../plugins/native/native_surface.dart';
import '../../../state/chat_state.dart';
import '../../../state/composer_insert.dart';
import '../../../state/hosts_state.dart';
import '../../../state/sessions_state.dart';
import '../../../ui_config/ui_config_model.dart';
import '../../features/all_features_page.dart' show dshWebOpenerProvider;
import '../../features/feature_catalog.dart';
import '../../memory/memory_page.dart';
import '../../settings/index/settings_pages.dart' show settingsPageForLink;
import '../../settings/settings_screen.dart';
import 'native_panel.dart';
import 'native_voice_consent.dart';

/// The composer a tap may write into: the chat screen lends its own.
abstract interface class NativeComposerHost {
  /// The conversation on screen; null on the new-chat screen.
  String? get sessionId;

  /// Identity of this draft's ownership, retired when the page or client
  /// changes, including leaving and returning to the same conversation.
  /// Editing the text within that ownership does not change it.
  Object get draftOwner;

  /// What is typed right now.
  String get draft;

  /// Puts [text] in at the caret (as a word of its own) and focuses the
  /// field. Never sends.
  void insert(String text);

  /// The chat screen's context while it is mounted: where a tap made in a
  /// sheet that has since closed carries on.
  BuildContext? get context;
}

/// Hands the chat screen's composer (and its [ref], for controls drawn by
/// plain widgets such as a reply's menu) to the plugin controls below it.
class NativeComposerScope extends InheritedWidget {
  const NativeComposerScope({super.key, required this.host, required this.ref, required super.child});

  final NativeComposerHost host;
  final WidgetRef ref;

  static NativeComposerScope? of(BuildContext context) => context.getInheritedWidgetOfExactType<NativeComposerScope>();

  static NativeComposerHost? maybeOf(BuildContext context) => of(context)?.host;

  @override
  bool updateShouldNotify(NativeComposerScope oldWidget) => !identical(oldWidget.host, host);
}

// ── Controls at work ─────────────────────────────────────────────────────────

/// Which control a tap came from: one per plugin control (and per reply,
/// for message-menu items).
String nativeControlKey(String package, NativeSurface surface, String id, {String? messageId}) =>
    '$package|${surface.wire}|$id|${messageId ?? ''}';

/// A control whose tap is still out.
@immutable
class NativeWork {
  const NativeWork({this.label, this.cancel, this.owner});

  /// Identity of this invocation; an obsolete completion cannot finish its successor.
  final Object? owner;

  /// What the plugin says it is doing, if anything.
  final String? label;

  /// Drops a deferred result (v1.1); null while the call itself is out.
  final VoidCallback? cancel;
}

/// Controls at work right now (their capsule shows a ring; a second tap is
/// not sent).
class NativeWorkController extends Notifier<Map<String, NativeWork>> {
  @override
  Map<String, NativeWork> build() {
    ref.watch(activeHostProvider);
    ref.watch(nativeBridgeProvider);
    return const {};
  }

  bool busy(String key) => state.containsKey(key);

  NativeWork? of(String key) => state[key];

  void start(String key, [NativeWork work = const NativeWork()]) => state = {...state, key: work};

  void finish(String key, {Object? owner}) {
    if (!ref.mounted || !state.containsKey(key)) return;
    if (owner != null && !identical(state[key]?.owner, owner)) return;
    state = {...state}..remove(key);
  }
}

final nativeWorkProvider = NotifierProvider<NativeWorkController, Map<String, NativeWork>>(NativeWorkController.new);

/// The work behind [key], if any.
final nativeWorkOfProvider = Provider.family<NativeWork?, String>((ref, key) => ref.watch(nativeWorkProvider)[key]);

/// One invocation belongs to the host, bridge, stream and surface that sent it.
/// A refresh in its own valid response may advance the surface generation;
/// unrelated refreshes/reconnects invalidate every later response from it.
class _NativeInvokeGuard {
  _NativeInvokeGuard(this.ref, this.package, this.client, this.target, this.stillCurrent)
    : host = ref.read(activeHostProvider) {
    final key = target;
    if (key != null && ref.exists(nativeSurfaceProvider(key))) {
      surface = ref.read(nativeSurfaceProvider(key).notifier);
      generation = surface!.generation;
    }
  }

  final WidgetRef ref;
  final String package;
  final NativeBridge client;
  final HostRef host;
  final NativeSurfaceKey? target;
  final bool Function()? stillCurrent;
  NativeSurfaceController? surface;
  int? generation;
  DshGoStream? stream;
  String? connection;

  bool get current {
    if (!ref.context.mounted || stillCurrent?.call() == false) return false;
    if (ref.read(activeHostProvider) != host || !identical(client, ref.read(nativeBridgeProvider))) return false;
    if (ref.read(nativeContributionsProvider).plugin(package)?.native != true) return false;
    if (connection != null && (!identical(stream, ref.read(nativeStreamProvider)) || stream?.conn != connection)) {
      return false;
    }
    final key = target;
    if (key == null) return true;
    if (surface == null || !ref.exists(nativeSurfaceProvider(key))) return false;
    if (!identical(surface, ref.read(nativeSurfaceProvider(key).notifier)) || surface!.generation != generation) {
      return false;
    }
    final state = ref.read(nativeSurfaceProvider(key));
    return !state.offline && state.failure == null;
  }

  void acceptRefresh(NativeSurfaceController? refreshed) {
    if (refreshed != null && identical(refreshed, surface)) generation = refreshed.generation;
  }
}

// ── Taps ─────────────────────────────────────────────────────────────────────

/// Toasts per plugin, at most one every 2 s.
final _toasts = ToastThrottle();

/// A tap on [action] (a capsule or a message-menu item). [message] is the
/// reply's text, sent only to a plugin that wants it.
Future<void> runNativeAction(
  BuildContext context,
  WidgetRef ref,
  NativeAction action, {
  DshGoScope scope = DshGoScope.none,
  String? message,
  NativeComposerHost? composer,
}) async {
  if (!context.mounted || !ref.context.mounted) return;
  composer ??= NativeComposerScope.maybeOf(context);
  final targetComposer = composer;
  // A capsule/menu closure can still carry the previous session before the
  // next frame. Do not send that scope with the new composer's contents.
  if (targetComposer != null && targetComposer.sessionId != scope.sessionId) return;
  final owner = targetComposer?.draftOwner;
  bool current() => ref.context.mounted && (targetComposer == null || identical(targetComposer.draftOwner, owner));
  if (action.effects.isNotEmpty) {
    HapticFeedback.selectionClick();
    final plugin = ref.read(nativeContributionsProvider).plugin(action.package);
    if (plugin == null) return;
    final issues = <NativeIssue>[];
    final effects = parseNativeEffects(action.effects, issues);
    for (final effect in effects) {
      if (!context.mounted || !current()) return;
      if (!effect.needsTap) continue;
      await _runEffect(
        context,
        ref,
        effect,
        plugin: plugin,
        scope: scope,
        composer: composer,
        issues: issues,
        stillCurrent: current,
      );
    }
    if (current()) ref.read(nativeDiagnosticsProvider.notifier).report(action.package, '/runtime/${action.id}', issues);
    return;
  }
  await runNativeTap(
    context,
    ref,
    package: action.package,
    surface: action.surface,
    id: action.id,
    scope: scope,
    message: message,
    composer: composer,
    stillCurrent: current,
  );
}

/// Sends a tap on [package]'s control [id] on [surface] to the plugin and
/// runs what comes back. In a panel, [id] is the panel's id, [action] the
/// view control's action and [value] its arguments; [target] is the panel a
/// `patch` / `refresh` lands on. [stillCurrent] may additionally bind the call
/// to its initiating widget identity. [gestureAt] retains a queued action's
/// original tap time; dispatch never grants a new gesture. Without a fresh
/// gesture, only data effects may run. Obsolete responses have no effects and
/// return false; a valid answer returns true.
Future<bool> runNativeTap(
  BuildContext context,
  WidgetRef ref, {
  required String package,
  required NativeSurface surface,
  required String id,
  DshGoScope scope = DshGoScope.none,
  String? action,
  Object? value,
  String? message,
  NativeSurfaceKey? target,
  NativeComposerHost? composer,
  bool userGesture = true,
  DateTime? gestureAt,
  bool Function()? stillCurrent,
}) async {
  if (!context.mounted || !ref.context.mounted) return false;
  final clock = ref.read(nativeClockProvider);
  final tappedAt = gestureAt ?? clock();
  if (userGesture && nativeTapIsFresh(tappedAt, clock())) HapticFeedback.selectionClick();
  final l10n = context.l10n;
  final plugin = ref.read(nativeContributionsProvider).plugin(package);
  final client = ref.read(nativeBridgeProvider);
  final title = ref.read(nativePluginTitleProvider(package));
  composer ??= NativeComposerScope.maybeOf(context);
  final work = ref.read(nativeWorkProvider.notifier);
  final control = nativeControlKey(package, surface, action ?? id, messageId: scope.messageId);
  if (work.busy(control)) return false;
  if (plugin == null || client == null) {
    if (userGesture && nativeTapIsFresh(tappedAt, clock())) _toast(context, l10n.plugslotsNoResponse(title));
    return false;
  }

  final guard = _NativeInvokeGuard(ref, package, client, target, stillCurrent);
  if (!guard.current) return false;
  final owner = Object();

  // What may travel with this tap, after asking once.
  final wants = switch (surface) {
    NativeSurface.composerActions => {if (plugin.wantsDraft) 'draft', if (plugin.wantsClipboard) 'clipboard'},
    NativeSurface.messageActions => {if (plugin.wantsMessage && message != null) 'message'},
    _ => const <String>{},
  };
  if (wants.isNotEmpty) {
    final host = ref.read(activeHostProvider);
    final acks = ref.read(nativeWantsAcksProvider.notifier);
    if (!acks.acknowledged(host, package, wants)) {
      final ok = await _askWants(context, title, wants);
      if (!ok || !context.mounted || !guard.current) return false;
      await acks.acknowledge(host, package, wants);
      if (!context.mounted || !guard.current) return false;
    }
  }
  String? clipboard;
  if (wants.contains('clipboard')) {
    try {
      clipboard = (await Clipboard.getData(Clipboard.kTextPlain))?.text;
    } catch (_) {
      clipboard = null;
    }
    if (!context.mounted || !guard.current) return false;
  }

  work.start(control, NativeWork(owner: owner));
  // A connection for a deferred result to come back on (v1.1).
  final stream = ref.read(nativeStreamProvider);
  try {
    // Quick on the device's own engine; the tap's 3 s include it.
    final conn = await stream?.hold(timeout: const Duration(seconds: 1));
    if (!context.mounted || !guard.current) return false;
    guard.stream = stream;
    guard.connection = conn;
    if (!guard.current) return false;
    return await _invoke(
      context,
      ref,
      plugin: plugin,
      client: client,
      guard: guard,
      owner: owner,
      title: title,
      surface: surface,
      id: id,
      scope: scope,
      action: action,
      value: value,
      target: target,
      control: control,
      tappedAt: tappedAt,
      stream: conn == null ? null : stream,
      composer: composer,
      invocation: DshGoInvocation(
        pkg: package,
        id: id,
        surface: surface.invoke,
        action: action,
        value: value,
        scope: scope,
        draft: wants.contains('draft') ? _cap(composer?.draft) : null,
        clipboard: _cap(clipboard),
        message: wants.contains('message') ? _cap(message) : null,
        locale: ref.read(nativeLocaleProvider),
        stream: conn,
        userGesture: userGesture && nativeTapIsFresh(tappedAt, clock()),
      ),
    );
  } finally {
    work.finish(control, owner: owner);
    stream?.release();
  }
}

Future<bool> _invoke(
  BuildContext context,
  WidgetRef ref, {
  required NativePlugin plugin,
  required NativeBridge client,
  required _NativeInvokeGuard guard,
  required Object owner,
  required String title,
  required NativeSurface surface,
  required String id,
  required DshGoScope scope,
  required String? action,
  required Object? value,
  required NativeSurfaceKey? target,
  required String control,
  required DateTime tappedAt,
  required DshGoStream? stream,
  required NativeComposerHost? composer,
  required DshGoInvocation invocation,
}) async {
  final l10n = context.l10n;
  final package = plugin.package;
  final diagnostics = ref.read(nativeDiagnosticsProvider.notifier);
  final work = ref.read(nativeWorkProvider.notifier);
  final clock = ref.read(nativeClockProvider);
  final DshGoInvokeResult result;
  final invokedAt = clock();
  try {
    result = await client.invoke(invocation);
  } on DshException catch (e) {
    if (!guard.current) return false;
    diagnostics.invoked(package, clock().difference(invokedAt));
    final code = e is DshRemoteException && e.code.startsWith('dsh-go/') ? e.code.substring(7) : null;
    final known = code != null && !code.startsWith('http-') && code != 'unsupported';
    diagnostics.report(package, '/runtime/$id', [
      NativeIssue('', nativeIssueText(known ? code : 'timeout'), code: known ? code : 'timeout'),
    ]);
    if (context.mounted && invocation.userGesture == true) {
      final quiet = !known || code == 'timeout';
      _toast(context, quiet ? l10n.plugslotsNoResponse(title) : l10n.plugslotsFailed(title));
    }
    return false;
  }
  if (!guard.current) return false;
  diagnostics.invoked(package, result.elapsed);
  void dataEffect(NativeEffect effect) {
    if (!guard.current) return;
    guard.acceptRefresh(_dataEffect(ref, plugin, target, effect));
  }

  final issues = [for (final i in result.issues) NativeIssue.fromBridge(i)];
  final arrived = clock();
  // v1.2 capability effects go their own way (below); the rest as in v1.1.
  final requestedCapabilities = [
    for (final e in result.effects)
      if (NativeCapabilityEffect.isType(e['type'])) e,
  ];
  final authorisedResponse = invocation.userGesture == true && nativeTapIsFresh(tappedAt, arrived);
  final capabilityEffects = authorisedResponse ? requestedCapabilities : const <Map<String, Object?>>[];
  if (!authorisedResponse && requestedCapabilities.isNotEmpty) {
    issues.add(NativeIssue('/effects', l10n.plugInputGestureRequired, code: 'gesture-required'));
  }
  final parsed = parseNativeEffects([
    for (final e in result.effects)
      if (!NativeCapabilityEffect.isType(e['type'])) e,
  ], issues);
  final effects = effectsInWindow(
    parsed.where((effect) => effect is! PickFileEffect).toList(),
    tappedAt: tappedAt,
    now: arrived,
    userGesture: invocation.userGesture == true,
    issues: issues,
  );
  for (final effect in effects) {
    if (!guard.current) return false;
    if (!effect.needsTap) {
      dataEffect(effect);
      continue;
    }
    if (!context.mounted) break;
    await _runEffect(
      context,
      ref,
      effect,
      plugin: plugin,
      scope: scope,
      composer: composer,
      issues: issues,
      stillCurrent: () => guard.current,
    );
  }
  for (final effect in parsed.whereType<PickFileEffect>()) {
    if (!context.mounted || !guard.current) break;
    final runtime = ref.read(nativeFileCoordinatorProvider);
    bool current() =>
        context.mounted &&
        guard.current &&
        stream != null &&
        identical(stream, ref.read(nativeStreamProvider)) &&
        stream.conn == invocation.stream &&
        stream.negotiatedFeatures.contains('files') &&
        ref.read(nativeContributionsProvider).plugin(package)?.native == true &&
        ref.read(nativeContributionsProvider).plugin(package)?.capabilities.contains('files') == true;
    if (runtime == null || invocation.stream == null) {
      issues.add(NativeIssue('/effects', l10n.plugslotsPickerUnavailable, code: 'unsupported'));
      continue;
    }
    try {
      final selected = await runtime.execute(
        effect,
        pkg: package,
        stream: invocation.stream!,
        userGesture: invocation.userGesture == true,
        tappedAt: tappedAt,
        now: clock,
        isCurrent: current,
      );
      if (selected == null || !current() || !context.mounted) continue;
      issues.addAll(selected.issues.map(NativeIssue.fromBridge));
      // The system chooser may take minutes. Its callback is data-only and cannot
      // inherit the original gesture to open another picker or launch a command.
      for (final returned in parseNativeEffects(selected.effects, issues)) {
        if (!current()) break;
        if (returned is PatchEffect || returned is RefreshEffect) {
          dataEffect(returned);
        } else if (returned is ToastEffect) {
          await _runEffect(
            context,
            ref,
            returned,
            plugin: plugin,
            scope: scope,
            composer: composer,
            issues: issues,
            stillCurrent: current,
          );
        } else {
          issues.add(NativeIssue('/effects', nativeIssueText('bad-effect'), code: 'bad-effect'));
        }
      }
    } on NativeFileException catch (error) {
      final message = switch (error.problem) {
        NativeFileProblem.limit => l10n.plugslotsPickerLimit(effect.maxFiles),
        NativeFileProblem.busy => l10n.plugslotsPickerBusy,
        NativeFileProblem.unavailable => l10n.plugslotsPickerUnavailable,
        NativeFileProblem.failed => l10n.plugslotsPickerFailed,
      };
      issues.add(NativeIssue('/effects', message, code: 'file-selection'));
      if (current() && context.mounted) _toast(context, message);
    }
  }
  // Only an immediate answer starts audio, listening or a caption: never a
  // static effect, never a deferred result. The 3 s window counts to the
  // answer's arrival, not to the end of a consent question — which comes
  // first, before anything starts playing.
  if (!guard.current) return false;
  bool? mayListen;
  if (capabilityEffects.any((e) => e['type'] == 'voice' && e['op'] == 'start') && context.mounted) {
    mayListen = await askNativeVoiceConsent(context, ref, package);
    if (!guard.current) return false;
  }
  for (final raw in capabilityEffects) {
    if (!guard.current) return false;
    final effect = NativeCapabilityEffect.parse(raw);
    final runtime = context.mounted && stream != null ? ref.read(nativeCapabilityRuntimeProvider) : null;
    final taken =
        effect != null &&
        runtime != null &&
        await runtime.execute(
          effect,
          pkg: package,
          scope: scope,
          connection: invocation.stream,
          tappedAt: tappedAt,
          now: arrived,
          consent: (pkg) async => mayListen ?? false,
        );
    if (!taken) issues.add(NativeIssue('/effects', nativeIssueText('bad-effect'), code: 'bad-effect'));
  }
  if (!guard.current) return false;
  diagnostics.report(package, '/runtime/$id', issues);

  // A pending acknowledgement must itself arrive in the original tap window
  // before its later result can inherit gesture effects. Data remains allowed.
  // Deferred (v1.1): the control stays at work until the result comes on
  // the stream, or is void; a tap on it (or 取消) drops it.
  final pending = result.pending;
  if (pending == null || stream == null) return true;
  var cancelled = false;
  void cancel() {
    cancelled = true;
    stream.cancel(pending.id);
  }

  work.start(control, NativeWork(label: pending.label, cancel: cancel, owner: owner));
  // No control on screen to show it (a menu item, the strip): a note does.
  final note = !authorisedResponse || surface == NativeSurface.composerActions || !context.mounted
      ? null
      : ScaffoldMessenger.maybeOf(context)?.showSnackBar(
          SnackBar(
            content: Text(pending.label ?? l10n.plugslotsWorking),
            duration: pending.timeout,
            persist: false,
            action: SnackBarAction(label: l10n.commonCancel, onPressed: cancel),
          ),
        );
  final outcome = await stream.outcome(pending.id, timeout: pending.timeout + const Duration(seconds: 5));
  if (context.mounted) note?.close();
  work.finish(control, owner: owner);
  if (!guard.current) return false;
  // The control's own context may be gone (a closed menu): the chat's stays.
  final host = context.mounted ? context : composer?.context;
  switch (outcome) {
    case DshGoDone(effects: final done, issues: final dropped):
      final later = [for (final i in dropped) NativeIssue.fromBridge(i)];
      for (final effect in parseNativeEffects(done, later)) {
        if (!guard.current) return false;
        if (effect.needsTap && !authorisedResponse) {
          later.add(NativeIssue('/effects', l10n.plugInputGestureRequired, code: 'gesture-required'));
          continue;
        }
        switch (effect) {
          case PatchEffect():
            dataEffect(effect);
          case InsertEffect() || CopyEffect() || ToastEffect():
            if (host != null && host.mounted) {
              await _runEffect(
                host,
                ref,
                effect,
                plugin: plugin,
                scope: scope,
                composer: composer,
                issues: later,
                stillCurrent: () => guard.current,
              );
            }
          default:
            later.add(NativeIssue('/effects', nativeIssueText('bad-effect'), code: 'bad-effect'));
        }
      }
      if (guard.current) diagnostics.report(package, '/runtime/$id', later);
    case DshGoVoid(:final reason):
      if (!(cancelled && reason == 'cancelled')) {
        diagnostics.report(package, '/runtime/$id', [NativeIssue('', nativeIssueText(reason), code: reason)]);
        if (authorisedResponse && host != null && host.mounted) _toast(host, l10n.plugslotsNotDone);
      }
  }
  return true;
}

/// A `context` field is at most 16 KiB of UTF-8 (protocol §1.4).
String? _cap(String? text) {
  if (text == null || text.isEmpty) return null;
  const max = 16 * 1024;
  if (text.length * 3 <= max) return text;
  final runes = text.runes.toList();
  var bytes = 0;
  var end = 0;
  for (; end < runes.length; end++) {
    final r = runes[end];
    bytes += r < 0x80 ? 1 : (r < 0x800 ? 2 : (r < 0x10000 ? 3 : 4));
    if (bytes > max) break;
  }
  return String.fromCharCodes(runes.take(end));
}

/// The surface a data effect lands on: the named panel (in the tapped one's
/// scope), else the tapped one.
NativeSurfaceController? _dataEffect(
  WidgetRef ref,
  NativePlugin plugin,
  NativeSurfaceKey? target,
  NativeEffect effect,
) {
  final named = switch (effect) {
    RefreshEffect(:final panel) || PatchEffect(:final panel) => panel,
    _ => null,
  };
  var key = target;
  if (named != null && named != target?.id) {
    final panel = plugin.panels.where((p) => p.id == named).firstOrNull;
    key = panel == null ? null : nativePanelKey(panel, target?.scope ?? DshGoScope.none);
  }
  if (key == null || !ref.exists(nativeSurfaceProvider(key))) return null;
  final surface = ref.read(nativeSurfaceProvider(key).notifier);
  switch (effect) {
    case PatchEffect(:final data):
      surface.patch(data);
    case RefreshEffect():
      surface.refresh();
      return surface;
    default:
      break;
  }
  return null;
}

/// The surface key of [panel] in [scope].
NativeSurfaceKey nativePanelKey(NativePanel panel, DshGoScope scope) => NativeSurfaceKey(
  package: panel.package,
  surface: NativeSurface.panel,
  id: panel.id,
  scope: scope,
  live: panel.live,
);

Future<void> _runEffect(
  BuildContext context,
  WidgetRef ref,
  NativeEffect effect, {
  required NativePlugin plugin,
  required DshGoScope scope,
  NativeComposerHost? composer,
  required List<NativeIssue> issues,
  bool Function()? stillCurrent,
}) async {
  if (stillCurrent?.call() == false) return;
  final l10n = context.l10n;
  composer ??= NativeComposerScope.maybeOf(context);
  final sessionId = scope.sessionId ?? composer?.sessionId;
  switch (effect) {
    case InsertEffect(:final text):
      insertIntoComposer(context, ref, text, sessionId: sessionId, composer: composer);
    case CommandEffect(:final line):
      await runComposerCommand(context, ref, line, sessionId: sessionId);
    case OpenEffect(:final page?):
      await openNativePage(context, ref, page, sessionId: sessionId);
    case OpenEffect(:final panel?):
      final target = plugin.panels.where((p) => p.id == panel).firstOrNull;
      if (target == null) {
        issues.add(NativeIssue('/effects', l10n.plugslotsIssueUnknownPage('panel:$panel')));
      } else {
        await Navigator.of(context).push(NativePanelPage.route(panel: target, sessionId: sessionId));
      }
    case LinkEffect(:final url):
      await openConfirmedLink(context, url, stillCurrent: stillCurrent);
    case ToastEffect(:final text):
      if (_toasts.allow(plugin.package, ref.read(nativeClockProvider)())) {
        _toast(context, text);
      } else {
        issues.add(NativeIssue('/effects', l10n.plugslotsIssueThrottled));
      }
    case CopyEffect(:final text):
      await Clipboard.setData(ClipboardData(text: text));
      if (context.mounted && stillCurrent?.call() != false) _toast(context, l10n.commonCopied);
    case PickFileEffect():
      issues.add(NativeIssue('/effects', nativeIssueText('bad-effect'), code: 'bad-effect'));
    case OpenEffect() || RefreshEffect() || PatchEffect():
      break;
  }
}

// ── Shared with ui.json ──────────────────────────────────────────────────────

/// Runs a ui.json control's [action] (`send`, `open`, `command`, `link`).
Future<void> runUiAction(BuildContext context, WidgetRef ref, UiAction action) async {
  HapticFeedback.selectionClick();
  final composer = NativeComposerScope.maybeOf(context);
  final sessionId = composer?.sessionId ?? ref.read(currentSessionProvider);
  switch (action) {
    case UiSendAction(:final text):
      insertIntoComposer(context, ref, text, sessionId: sessionId, composer: composer);
    case UiOpenAction(:final page):
      await openNativePage(context, ref, page, sessionId: sessionId);
    case UiCommandAction(:final line):
      await runComposerCommand(context, ref, line, sessionId: sessionId);
    case UiLinkAction(:final url):
      await openConfirmedLink(context, url);
  }
}

/// Into the chat composer, never sent: the lent one when there is one, else
/// back to the chat with it.
void insertIntoComposer(
  BuildContext context,
  WidgetRef ref,
  String text, {
  String? sessionId,
  NativeComposerHost? composer,
}) {
  if (composer != null) {
    composer.insert(text);
    return;
  }
  Navigator.of(context).popUntil((route) => route.isFirst);
  ref.read(composerInsertProvider.notifier).request(ComposerInsert(token: text, sessionId: sessionId));
}

/// `/name args` in [sessionId]; a short note without an open conversation.
Future<void> runComposerCommand(BuildContext context, WidgetRef ref, String line, {String? sessionId}) async {
  if (sessionId == null) {
    _toast(context, context.l10n.plugslotsNeedsChat);
    return;
  }
  await ref.read(chatProvider(sessionId).notifier).runCommand(line);
}

/// An app page by its ui.json / 全部功能 id, `new-chat` or `settings`.
Future<void> openNativePage(BuildContext context, WidgetRef ref, String page, {String? sessionId}) async {
  final navigator = Navigator.of(context);
  switch (page) {
    case 'new-chat':
      navigator.popUntil((route) => route.isFirst);
      ref.read(currentSessionProvider.notifier).select(null);
      return;
    case 'settings':
      await navigator.push(MaterialPageRoute<void>(builder: (_) => const SettingsScreen()));
      return;
    case 'memory':
      if (sessionId == null) {
        _toast(context, context.l10n.plugslotsNeedsChat);
        return;
      }
      await navigator.push(MaterialPageRoute<void>(builder: (_) => MemoryPage(sessionId: sessionId)));
      return;
  }
  final item = [for (final section in featureSections) ...section.items].where((i) => i.id == page).firstOrNull;
  if (item == null) {
    // Settings left 全部功能 for 设置; their ids still open the same page.
    if (settingsPageForLink(page, sessionId: sessionId) case final settings? when context.mounted) {
      await navigator.push(MaterialPageRoute<void>(builder: (_) => settings));
    }
    return;
  }
  if (!context.mounted) return;
  if (item.needsSession && sessionId == null) {
    _toast(context, context.l10n.plugslotsNeedsChat);
    return;
  }
  if (item.native case final builder?) {
    await navigator.push(MaterialPageRoute<void>(builder: (_) => builder(sessionId)));
  } else if (item.action case final action?) {
    await Future.sync(() => action(context, ref, sessionId));
  } else if (item.webFor(sessionId) case final target?) {
    ref.read(dshWebOpenerProvider)(context, ref, target);
  }
}

/// An https page in the browser, after a confirmation that names its host.
Future<void> openConfirmedLink(BuildContext context, Uri url, {bool Function()? stillCurrent}) async {
  if (url.scheme != 'https') return;
  final l10n = context.l10n;
  final ok = await showDialog<bool>(
    context: context,
    builder: (dialog) => AlertDialog(
      title: Text(l10n.pluginsOpenBrowserHost(url.host)),
      actions: [
        TextButton(onPressed: () => Navigator.pop(dialog, false), child: Text(l10n.commonCancel)),
        FilledButton(onPressed: () => Navigator.pop(dialog, true), child: Text(l10n.commonOpen)),
      ],
    ),
  );
  if (ok == true && stillCurrent?.call() != false) {
    await launchUrl(url, mode: LaunchMode.externalApplication).catchError((_) => false);
  }
}

Future<bool> _askWants(BuildContext context, String title, Set<String> wants) async {
  final l10n = context.l10n;
  final heading = wants.contains('message')
      ? l10n.plugslotsWantsMessage(title)
      : wants.length > 1
      ? l10n.plugslotsWantsBoth(title)
      : wants.contains('draft')
      ? l10n.plugslotsWantsDraft(title)
      : l10n.plugslotsWantsClipboard(title);
  final ok = await showDialog<bool>(
    context: context,
    builder: (dialog) => AlertDialog(
      title: Text(heading),
      content: Text(l10n.plugslotsWantsWhen),
      actions: [
        TextButton(onPressed: () => Navigator.pop(dialog, false), child: Text(l10n.commonCancel)),
        FilledButton(onPressed: () => Navigator.pop(dialog, true), child: Text(l10n.plugslotsAllow)),
      ],
    ),
  );
  return ok == true;
}

void _toast(BuildContext context, String text) {
  ScaffoldMessenger.maybeOf(context)
    ?..hideCurrentSnackBar()
    ..showSnackBar(SnackBar(content: Text(text), duration: const Duration(seconds: 2)));
}
