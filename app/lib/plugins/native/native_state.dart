// The active host's native plugin contributions (docs/design/native-plugins.md
// §3.6): read once the host is connected, read again when a plugin is turned on
// or off (the bridge's revisions key a cache, so an unchanged answer changes
// nothing on screen), and one multiplexed stream that sleeps 60 s after the app
// leaves the foreground. Also what the person decided: surfaces switched off
// per plugin, and the one-time 「要读取剪贴板」 notice. Nothing here runs until a
// surface asks.

import 'dart:async';
import 'dart:convert';

import 'package:dsh_client/dsh_client.dart';
import 'package:flutter/widgets.dart'
    show
        AppLifecycleListener,
        AppLifecycleState,
        ImageProvider,
        Locale,
        NetworkImage,
        WidgetsBinding,
        WidgetsBindingObserver;
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../l10n/l10n.dart';
import '../../state/app_info.dart';
import '../../state/connection_state.dart';
import '../../state/hosts_state.dart';
import '../../state/locale_state.dart';
import '../../state/plugins_state.dart';
import '../../ui_config/ui_config_ignores.dart' show uiHostKey;
import '../../ui/chat/dsh_ui/dsh_ui_model.dart' show dshUiPluginComponents;
import 'native_model.dart';
import 'native_platform.dart';

// ── Capabilities ─────────────────────────────────────────────────────────────

/// View components the app draws (the plugin view renderer's catalogue).
final nativeViewComponentsProvider = Provider<List<String>>((ref) => dshUiPluginComponents.toList());

/// The language plugin texts come in (`zh-CN`, `en`, `pt-BR`): the app's, resolved
/// from the setting right here — [AppLocale] switches only once the app's
/// root rebuilds, after this has recomputed — and, while the app follows the
/// system, again when the system languages change. A change asks for the
/// contributions and views afresh ([nativeCapsProvider], the stream's hello).
final nativeLocaleProvider = Provider<String>((ref) {
  final chosen = ref.watch(appLanguageProvider).locale;
  final binding = WidgetsBinding.instance;
  if (chosen == null) {
    final observer = _SystemLocales(ref.invalidateSelf);
    binding.addObserver(observer);
    ref.onDispose(() => binding.removeObserver(observer));
  }
  final locale = AppLocale.resolve(chosen, binding.platformDispatcher.locales);
  return switch (locale.languageCode) {
    'pt' => 'pt-BR',
    'en' => 'en',
    _ => 'zh-CN',
  };
});

class _SystemLocales with WidgetsBindingObserver {
  _SystemLocales(this.onChange);

  final void Function() onChange;

  @override
  void didChangeLocales(List<Locale>? locales) => onChange();
}

/// What the app tells the bridge it can do (protocol §3.1).
final nativeCapsProvider = Provider<DshGoCaps>(
  (ref) => DshGoCaps(
    app: AppInfo.version.split('+').first,
    locale: ref.watch(nativeLocaleProvider),
    components: ref.watch(nativeViewComponentsProvider),
    // v1.2: empty (nothing sent) until a plugin declares a capability.
    features: ref.watch(nativeFeatureStateProvider),
  ),
);

/// The clock behind the tap window (tests move it).
final nativeClockProvider = Provider<DateTime Function()>((ref) => DateTime.now);

// ── Contributions ────────────────────────────────────────────────────────────

/// The host's dsh-go bridge as the app uses it (tests swap in a fake).
abstract interface class NativeBridge {
  Future<DshGoContributions?> contributions(DshGoCaps caps, {DshGoContributions? previous});

  Future<DshGoView> view(String pkg, String id, {DshGoScope scope = DshGoScope.none, required DshGoCaps caps});

  Future<DshGoInvokeResult> invoke(DshGoInvocation invocation);

  DshGoStream openStream({String? locale});

  /// A plugin image (`asset:<path>` in a view) from the bridge's assets
  /// route, with the session's credentials; null when there is no route.
  ImageProvider? asset(String pkg, String path);
}

/// [NativeBridge] over a connected [DshClient].
class ClientNativeBridge implements NativeBridge {
  ClientNativeBridge(this.client);

  final DshClient client;

  @override
  Future<DshGoContributions?> contributions(DshGoCaps caps, {DshGoContributions? previous}) =>
      client.readDshGoContributions(caps: caps, previous: previous);

  @override
  Future<DshGoView> view(String pkg, String id, {DshGoScope scope = DshGoScope.none, required DshGoCaps caps}) =>
      client.readDshGoView(pkg, id, scope: scope, caps: caps);

  @override
  Future<DshGoInvokeResult> invoke(DshGoInvocation invocation) => client.invokeDshGo(invocation);

  @override
  DshGoStream openStream({String? locale}) => client.openDshGoStream(locale: locale);

  @override
  ImageProvider? asset(String pkg, String path) {
    final carrier = client.carrier;
    if (carrier is! DshHttpCarrier) return null;
    final connection = carrier.connection;
    String segments(String s) => s.split('/').map((p) => Uri.encodeComponent(p).replaceAll('%40', '@')).join('/');
    final url = connection.resolve('/dsh-go/v1/assets/${segments(pkg)}/${segments(path)}');
    return NetworkImage(
      url.toString(),
      headers: {'cookie': ?connection.cookie?.header, 'host': ?connection.hostHeader},
    );
  }
}

/// The active host's bridge when its routes are reachable (not over the
/// relay); null otherwise.
final nativeBridgeProvider = Provider<NativeBridge?>((ref) {
  final client = ref.watch(activeConnectionProvider.select((c) => c.value?.client));
  if (client == null || !client.canReachDshGo) return null;
  return ClientNativeBridge(client);
});

/// The last answer per client, for `If-None-Match`.
final _lastRead = Expando<DshGoContributions>('dshGoContributions');

/// Raw contributions of the active host; null without a bridge that serves
/// them. Read once connected, again when the installed list changes (a plugin
/// turned on or off), when the stream says `changed`, and on coming back to
/// the foreground — each time with `If-None-Match`, so an unchanged answer is
/// a 304 and the same object.
final nativeRawContributionsProvider = FutureProvider<DshGoContributions?>((ref) async {
  final client = ref.watch(nativeBridgeProvider);
  if (client == null) return null;
  ref.watch(installedPluginsProvider.select((s) => s.value?.map((b) => '${b.name}:${b.enabled}').join(',')));
  final caps = ref.watch(nativeCapsProvider);
  final lifecycle = AppLifecycleListener(onResume: ref.invalidateSelf);
  ref.onDispose(lifecycle.dispose);
  final previous = _lastRead[client];
  try {
    final read = await client.contributions(
      caps,
      // A different language or app asks afresh.
      previous: previous != null && _lastCaps[client] == caps ? previous : null,
    );
    if (read != null) {
      _lastRead[client] = read;
      _lastCaps[client] = caps;
    }
    return read;
  } on DshException {
    return previous;
  }
});

final _lastCaps = Expando<DshGoCaps>('dshGoCaps');

/// Reads the active host's contributions again (a 304 when nothing
/// changed): after a reply ends, since the agent may have installed or
/// switched a plugin with no stream open to say so.
void rereadNativeContributions(WidgetRef ref) => ref.invalidate(nativeRawContributionsProvider);

/// Keeps 设置 › 插件's list in step with the engine: when the contributions
/// come back changed (a plugin added, removed or switched, by the agent or
/// in the terminal), the installed list reads again. Kept alive by the chat
/// page's bar and the plugins page.
final nativePluginsSyncProvider = Provider<void>((ref) {
  ref.listen(nativeRawContributionsProvider.select((s) => s.value?.rev), (previous, next) {
    if (previous == null || next == null || previous == next) return;
    unawaited(ref.read(installedPluginsProvider.notifier).refresh().catchError((Object _) {}));
  });
});

/// The active host's native contributions as the app shows them (limits
/// applied, plugins turned off in the engine left out). Empty without any:
/// then every surface draws nothing at all.
final nativeContributionsProvider = Provider<NativeContributions>((ref) {
  final raw = ref.watch(nativeRawContributionsProvider.select((s) => s.value));
  if (raw == null || raw.plugins.isEmpty) return NativeContributions.empty;
  // Equal answers compare equal: an unchanged read rebuilds nothing.
  final shaped = nativeContributionsFrom(raw, features: ref.watch(nativeFeatureStateProvider).toSet());
  final bundles = ref.watch(installedPluginsProvider.select((s) => s.value));
  if (bundles == null) return shaped;
  final off = {
    for (final b in bundles)
      if (!b.enabled) b.name,
  };
  if (!shaped.plugins.any((p) => off.contains(p.package))) return shaped;
  return NativeContributions(
    rev: shaped.rev,
    plugins: [
      for (final p in shaped.plugins)
        if (!off.contains(p.package)) p,
    ],
  );
});

/// A plugin's name for people: its own title, else its bundle's, else the
/// package name.
final nativePluginTitleProvider = Provider.family<String, String>((ref, package) {
  final declared = ref.watch(nativeContributionsProvider.select((c) => c.plugin(package)?.title?.trim()));
  if (declared != null && declared.isNotEmpty) return declared;
  final bundle = ref.watch(
    installedPluginsProvider.select((s) => s.value?.where((b) => b.name == package).firstOrNull),
  );
  return bundle?.title() ?? package;
});

// ── Stream ───────────────────────────────────────────────────────────────────

/// The active host's stream: one socket, opened by the first subscription,
/// speaking the same locale as the view reads. It closes 60 s after the app
/// leaves the foreground and catches up when the app comes back; `changed`
/// reads the contributions again.
final nativeStreamProvider = Provider<DshGoStream?>((ref) {
  final bridge = ref.watch(nativeBridgeProvider);
  if (bridge == null) return null;
  final locale = ref.watch(nativeLocaleProvider);
  // v1.2 features go in `hello` only when there are any (a v1.1 hello otherwise).
  final features = ref.watch(nativeFeatureStateProvider);
  final stream = features.isNotEmpty && bridge is ClientNativeBridge
      ? bridge.client.openDshGoStream(locale: locale, features: features)
      : bridge.openStream(locale: locale);
  final lifecycle = AppLifecycleListener(
    onStateChange: (state) {
      switch (state) {
        case AppLifecycleState.resumed:
          stream.foreground();
        case AppLifecycleState.paused || AppLifecycleState.hidden || AppLifecycleState.detached:
          stream.background();
        case AppLifecycleState.inactive:
          break;
      }
    },
  );
  final changes = stream.changes.listen((_) => ref.invalidate(nativeRawContributionsProvider));
  ref.onDispose(() {
    lifecycle.dispose();
    unawaited(changes.cancel());
    unawaited(stream.close());
  });
  return stream;
});

// ── What the person decided ──────────────────────────────────────────────────

String _pluginKey(HostRef host, String package) => '${uiHostKey(host)}|$package';

/// Surfaces switched off, per host and plugin (设置 › 插件 › 某插件). Default:
/// everything on. Persisted.
class NativeSurfacePrefs extends Notifier<Map<String, Set<NativeSurface>>> {
  static const prefsKey = 'native_plugins.off';

  @override
  Map<String, Set<NativeSurface>> build() {
    unawaited(_load());
    return const {};
  }

  Future<void> _load() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final raw = prefs.getString(prefsKey);
      if (raw == null) return;
      final map = jsonDecode(raw);
      if (map is! Map) return;
      final restored = <String, Set<NativeSurface>>{
        for (final MapEntry(:key, :value) in map.entries)
          if (value is List)
            '$key': {
              for (final s in value)
                if (s is String) ?NativeSurface.byWire(s),
            },
      };
      state = {...restored, ...state};
    } catch (_) {
      // No preferences backend (tests) or a corrupt value: all on.
    }
  }

  bool isOn(HostRef host, String package, NativeSurface surface) =>
      !(state[_pluginKey(host, package)]?.contains(surface) ?? false);

  Future<void> set(HostRef host, String package, NativeSurface surface, bool on) async {
    final key = _pluginKey(host, package);
    final off = {...?state[key]};
    on ? off.remove(surface) : off.add(surface);
    state = {...state, key: off}..removeWhere((_, v) => v.isEmpty);
    try {
      final prefs = await SharedPreferences.getInstance();
      await prefs.setString(
        prefsKey,
        jsonEncode({
          for (final MapEntry(:key, :value) in state.entries) key: [for (final s in value) s.wire],
        }),
      );
    } catch (_) {
      // Kept for this run.
    }
  }
}

final nativeSurfacePrefsProvider = NotifierProvider<NativeSurfacePrefs, Map<String, Set<NativeSurface>>>(
  NativeSurfacePrefs.new,
);

/// Whether [NativeSurface] of a plugin is on, on the active host.
final nativeSurfaceOnProvider = Provider.family<bool, (String, NativeSurface)>((ref, key) {
  final host = ref.watch(activeHostProvider);
  final off = ref.watch(nativeSurfacePrefsProvider.select((s) => s[_pluginKey(host, key.$1)]));
  return !(off?.contains(key.$2) ?? false);
});

/// Plugins the person let read the draft / clipboard (`host|package|wants`).
/// Persisted; asked once per plugin and set of wants.
class NativeWantsAcks extends Notifier<Set<String>> {
  static const prefsKey = 'native_plugins.wants';

  @override
  Set<String> build() {
    unawaited(_load());
    return const {};
  }

  Future<void> _load() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final list = prefs.getStringList(prefsKey);
      if (list != null) state = {...list, ...state};
    } catch (_) {}
  }

  static String keyOf(HostRef host, String package, Set<String> wants) =>
      '${_pluginKey(host, package)}|${([...wants]..sort()).join('+')}';

  bool acknowledged(HostRef host, String package, Set<String> wants) =>
      wants.isEmpty || state.contains(keyOf(host, package, wants));

  Future<void> acknowledge(HostRef host, String package, Set<String> wants) async {
    state = {...state, keyOf(host, package, wants)};
    try {
      final prefs = await SharedPreferences.getInstance();
      await prefs.setStringList(prefsKey, [...state]);
    } catch (_) {}
  }
}

final nativeWantsAcksProvider = NotifierProvider<NativeWantsAcks, Set<String>>(NativeWantsAcks.new);

// ── Slots ────────────────────────────────────────────────────────────────────

/// Plugin capsules for the composer, switched-on ones, in plugin order
/// (2 a plugin; the row caps the total with ui.json's).
final nativeComposerActionsProvider = Provider<List<NativeAction>>((ref) {
  final plugins = ref.watch(nativeContributionsProvider).plugins;
  return [
    for (final p in plugins)
      if (ref.watch(nativeSurfaceOnProvider((p.package, NativeSurface.composerActions)))) ...p.composerActions,
  ];
});

/// Message-menu groups: one per plugin with items.
final nativeMessageActionsProvider = Provider<List<NativePlugin>>((ref) {
  final plugins = ref.watch(nativeContributionsProvider).plugins;
  return [
    for (final p in plugins)
      if (p.messageActions.isNotEmpty && ref.watch(nativeSurfaceOnProvider((p.package, NativeSurface.messageActions))))
        p,
  ];
});

/// Status lines, switched-on ones, in plugin order (shown one at a time).
final nativeStripsProvider = Provider<List<NativeStrip>>((ref) {
  final plugins = ref.watch(nativeContributionsProvider).plugins;
  return [
    for (final p in plugins)
      if (ref.watch(nativeSurfaceOnProvider((p.package, NativeSurface.composerStrip)))) ...p.strips,
  ];
});

/// Native panels, switched-on ones: what the seat planner seats natively.
final nativePanelsProvider = Provider<List<NativePanel>>((ref) {
  final plugins = ref.watch(nativeContributionsProvider).plugins;
  return [
    for (final p in plugins)
      if (ref.watch(nativeSurfaceOnProvider((p.package, NativeSurface.panel)))) ...p.panels,
  ];
});

// ── Diagnostics ──────────────────────────────────────────────────────────────

/// What went wrong while running one plugin's native part, and how it is
/// doing (the 原生界面 row).
class NativeDiagnostics {
  const NativeDiagnostics({this.issues = const [], this.lastViewBytes, this.lastInvoke});

  static const none = NativeDiagnostics();
  static const maxIssues = 20;

  /// Newest first.
  final List<NativeIssue> issues;
  final int? lastViewBytes;
  final Duration? lastInvoke;

  NativeDiagnostics copyWith({List<NativeIssue>? issues, int? lastViewBytes, Duration? lastInvoke}) =>
      NativeDiagnostics(
        issues: issues ?? this.issues,
        lastViewBytes: lastViewBytes ?? this.lastViewBytes,
        lastInvoke: lastInvoke ?? this.lastInvoke,
      );
}

/// Per host and plugin; this run only.
class NativeDiagnosticsController extends Notifier<Map<String, NativeDiagnostics>> {
  @override
  Map<String, NativeDiagnostics> build() => const {};

  String _key(String package) => _pluginKey(ref.read(activeHostProvider), package);

  NativeDiagnostics of(String package) => state[_key(package)] ?? NativeDiagnostics.none;

  void _update(String package, NativeDiagnostics Function(NativeDiagnostics d) f) {
    final key = _key(package);
    state = {...state, key: f(state[key] ?? NativeDiagnostics.none)};
  }

  /// Runtime problems under [prefix] (`/composer.actions/translate`).
  void report(String package, String prefix, Iterable<NativeIssue> issues) {
    if (issues.isEmpty) return;
    final now = DateTime.now();
    _update(package, (d) {
      final fresh = [
        for (final i in issues) NativeIssue('$prefix${i.pointer}', i.message, code: i.code, error: i.error, at: now),
      ];
      final kept = [
        ...fresh,
        for (final old in d.issues)
          if (!fresh.contains(old)) old,
      ];
      return d.copyWith(issues: kept.take(NativeDiagnostics.maxIssues).toList(growable: false));
    });
  }

  void view(String package, int bytes) => _update(package, (d) => d.copyWith(lastViewBytes: bytes));

  void invoked(String package, Duration elapsed) => _update(package, (d) => d.copyWith(lastInvoke: elapsed));
}

final nativeDiagnosticsProvider = NotifierProvider<NativeDiagnosticsController, Map<String, NativeDiagnostics>>(
  NativeDiagnosticsController.new,
);

/// One plugin's diagnostics on the active host.
final nativePluginDiagnosticsProvider = Provider.family<NativeDiagnostics, String>((ref, package) {
  final host = ref.watch(activeHostProvider);
  return ref.watch(nativeDiagnosticsProvider.select((s) => s[_pluginKey(host, package)])) ?? NativeDiagnostics.none;
});
