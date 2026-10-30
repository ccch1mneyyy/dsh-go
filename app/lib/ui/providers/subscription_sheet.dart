// 订阅登录 (a sheet): ChatGPT / Claude / Grok sign-in through the engine's bridge. One
// body per step of the attempt: preparing, finish in the browser, enter a code,
// paste a code, signed in, not completed.

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../l10n/l10n.dart';
import '../../state/account_state.dart' show accountBrowserProvider;
import '../../state/app_foreground.dart';
import '../../state/subscriptions_state.dart';
import '../common/app_sheet.dart';
import '../common/sheet_title_bar.dart';
import '../common/smooth_size.dart';
import '../theme/app_icons.dart';
import '../theme/theme.dart';

/// A subscription's monogram letter (a plain letter, no brand mark).
String subscriptionLetter(Subscription s) => switch (s) {
  Subscription.chatgpt => 'G',
  Subscription.claude => 'C',
  Subscription.grok => 'X',
};

/// Opens the sign-in sheet; true once signed in. Closing it cancels the
/// attempt.
Future<bool> showSubscriptionLogin(BuildContext context, Subscription subscription) async {
  final signedIn = await showAppSheet<bool>(
    context,
    dismissal: SheetDismissal.button,
    isScrollControlled: true,
    builder: (_) => SubscriptionLoginSheet(subscription: subscription),
  );
  return signedIn ?? false;
}

class SubscriptionLoginSheet extends ConsumerStatefulWidget {
  const SubscriptionLoginSheet({super.key, required this.subscription, this.interval = const Duration(seconds: 1)});

  final Subscription subscription;

  /// Poll interval (tests shorten it).
  final Duration interval;

  /// How long 「已登录」 stays before the sheet closes.
  static const doneDwell = Duration(milliseconds: 900);

  @override
  ConsumerState<SubscriptionLoginSheet> createState() => _SubscriptionLoginSheetState();
}

class _SubscriptionLoginSheetState extends ConsumerState<SubscriptionLoginSheet> {
  LoginSession? _session;
  final _answer = TextEditingController();

  /// The URL already handed to the browser for this attempt.
  String? _opened;
  bool _browserFailed = false;

  /// Which button just copied (its label reads 「已复制」 for a moment).
  String? _copied;
  Timer? _copiedTimer;
  Timer? _doneTimer;

  @override
  void initState() {
    super.initState();
    final backend = ref.read(subscriptionBackendProvider);
    if (backend == null) return;
    final session = LoginSession(backend, widget.subscription, interval: widget.interval)..addListener(_onStep);
    _session = session;
    unawaited(session.start());
  }

  @override
  void dispose() {
    _copiedTimer?.cancel();
    _doneTimer?.cancel();
    _session
      ?..removeListener(_onStep)
      ..dispose();
    _answer.dispose();
    super.dispose();
  }

  void _onStep() {
    if (!mounted) return;
    final step = _session!.step;
    if (step.phase == LoginPhase.open && step.url != null && step.url != _opened) {
      unawaited(_open(step.url!));
    }
    if (step.phase == LoginPhase.done && _doneTimer == null) {
      // Signed in through the browser: close its tab and come back here.
      if (_opened != null) unawaited(ref.read(appForegroundProvider)());
      refreshAfterSubscriptionChange(ref);
      _doneTimer = Timer(SubscriptionLoginSheet.doneDwell, () {
        if (mounted) Navigator.of(context).pop(true);
      });
    }
    setState(() {});
  }

  Future<void> _open(String url) async {
    _opened = url;
    final ok = await ref.read(accountBrowserProvider).open(Uri.parse(url));
    if (mounted) setState(() => _browserFailed = !ok);
  }

  Future<void> _copy(String id, String text) async {
    await Clipboard.setData(ClipboardData(text: text));
    if (!mounted) return;
    _copiedTimer?.cancel();
    setState(() => _copied = id);
    _copiedTimer = Timer(const Duration(milliseconds: 1500), () {
      if (mounted) setState(() => _copied = null);
    });
  }

  void _retry() {
    _answer.clear();
    _opened = null;
    _browserFailed = false;
    unawaited(_session?.start());
  }

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final session = _session;
    final step = session?.step ?? LoginStep(phase: LoginPhase.failed, error: l10n.engineProvidersNotConnected);
    final quick = AppMotion.of(context, AppMotion.quick);
    final Widget body = switch (step.phase) {
      LoginPhase.starting => _Waiting(
        key: const ValueKey('starting'),
        label: l10n.engineSubscriptionPreparing,
        tall: true,
      ),
      LoginPhase.open => _OpenBody(
        key: const ValueKey('open'),
        browserFailed: _browserFailed,
        copied: _copied == 'link',
        onReopen: step.url == null ? null : () => unawaited(_open(step.url!)),
        onCopy: step.url == null ? null : () => unawaited(_copy('link', step.url!)),
      ),
      LoginPhase.device => _DeviceBody(
        key: const ValueKey('device'),
        code: step.userCode ?? '',
        copied: _copied == 'code',
        onCopy: step.userCode == null ? null : () => unawaited(_copy('code', step.userCode!)),
        onOpen: step.url == null ? null : () => unawaited(_open(step.url!)),
      ),
      LoginPhase.prompt => _PromptBody(
        key: const ValueKey('prompt'),
        controller: _answer,
        hint: step.placeholder,
        helper: step.message,
        busy: session?.answering ?? false,
        onSubmit: (value) => unawaited(session?.answer(value)),
      ),
      LoginPhase.done => _Outcome(key: const ValueKey('done'), ok: true, title: l10n.commonSignedIn),
      LoginPhase.failed || LoginPhase.cancelled => _Outcome(
        key: const ValueKey('failed'),
        ok: false,
        title: step.phase == LoginPhase.cancelled
            ? l10n.engineSubscriptionCancelled
            : l10n.engineSubscriptionIncomplete,
        message: step.phase == LoginPhase.cancelled ? null : step.error,
        onRetry: session == null ? null : _retry,
      ),
    };
    return SafeArea(
      top: false,
      child: Padding(
        padding: EdgeInsets.only(bottom: MediaQuery.viewInsetsOf(context).bottom),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            SheetTitleBar(l10n.engineSubscriptionSignIn(subscriptionLabel(widget.subscription))),
            SmoothSize(
              duration: AppMotion.of(context, AppMotion.standard),
              curve: AppMotion.std,
              alignment: Alignment.topCenter,
              child: AnimatedSwitcher(
                duration: quick,
                switchInCurve: AppMotion.enter,
                switchOutCurve: AppMotion.exit,
                layoutBuilder: (current, previous) =>
                    Stack(alignment: Alignment.topCenter, children: [...previous, ?current]),
                child: Padding(
                  key: ValueKey(step.phase),
                  padding: const EdgeInsets.fromLTRB(SheetTitleBar.inset, 8, SheetTitleBar.inset, 20),
                  child: body,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

/// A quiet ring and one line.
class _Waiting extends StatelessWidget {
  const _Waiting({super.key, required this.label, this.tall = false});

  final String label;
  final bool tall;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colors = DshColors.of(context);
    final row = Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        SizedBox.square(
          dimension: 14,
          child: CircularProgressIndicator(strokeWidth: 2, strokeCap: StrokeCap.round, color: colors.textTertiary),
        ),
        const SizedBox(width: 8),
        Text(label, style: theme.textTheme.bodyMedium?.copyWith(color: colors.textTertiary)),
      ],
    );
    return tall ? SizedBox(height: 160, child: Center(child: row)) : Center(child: row);
  }
}

/// 64 round badge, like [EmptyView]'s.
class _Badge extends StatelessWidget {
  const _Badge({required this.icon, this.color, this.fill});

  final IconData icon;
  final Color? color;
  final Color? fill;

  @override
  Widget build(BuildContext context) {
    final glyph = Icon(icon, size: 28, color: color ?? Theme.of(context).colorScheme.onSurfaceVariant);
    return SizedBox.square(
      dimension: 64,
      child: fill == null
          ? GlassSurface(
              tier: GlassTier.card,
              circle: true,
              child: Center(child: glyph),
            )
          : DecoratedBox(
              decoration: ShapeDecoration(color: fill, shape: const CircleBorder()),
              child: Center(child: glyph),
            ),
    );
  }
}

/// Badge, a title, a line under it: the head of every step.
class _Head extends StatelessWidget {
  const _Head({required this.badge, required this.title, this.line});

  final Widget badge;
  final String title;
  final Widget? line;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        const SizedBox(height: 8),
        badge,
        const SizedBox(height: 16),
        Text(title, textAlign: TextAlign.center, style: theme.textTheme.titleMedium),
        if (line case final line?) ...[const SizedBox(height: 6), line],
      ],
    );
  }
}

/// Two equal buttons side by side.
class _Pair extends StatelessWidget {
  const _Pair({required this.left, required this.right});

  final Widget left;
  final Widget right;

  @override
  Widget build(BuildContext context) => Row(
    children: [
      Expanded(child: SizedBox(height: 48, child: left)),
      const SizedBox(width: 12),
      Expanded(child: SizedBox(height: 48, child: right)),
    ],
  );
}

class _OpenBody extends StatelessWidget {
  const _OpenBody({
    super.key,
    required this.browserFailed,
    required this.copied,
    required this.onReopen,
    required this.onCopy,
  });

  final bool browserFailed;
  final bool copied;
  final VoidCallback? onReopen;
  final VoidCallback? onCopy;

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final theme = Theme.of(context);
    final colors = DshColors.of(context);
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        _Head(
          badge: const _Badge(icon: AppIcons.browser),
          title: l10n.engineAccountFinishInBrowser,
          line: browserFailed
              ? Text(
                  l10n.engineAccountBrowserFailed,
                  textAlign: TextAlign.center,
                  style: theme.textTheme.bodyMedium?.copyWith(color: colors.warning),
                )
              : _Waiting(label: l10n.engineSubscriptionWaitingSignIn),
        ),
        const SizedBox(height: 28),
        _Pair(
          left: OutlinedButton(onPressed: onReopen, child: Text(l10n.engineSubscriptionReopen)),
          right: OutlinedButton(onPressed: onCopy, child: Text(copied ? l10n.commonCopied : l10n.commonCopyLink)),
        ),
      ],
    );
  }
}

class _DeviceBody extends StatelessWidget {
  const _DeviceBody({super.key, required this.code, required this.copied, required this.onCopy, required this.onOpen});

  final String code;
  final bool copied;
  final VoidCallback? onCopy;
  final VoidCallback? onOpen;

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final theme = Theme.of(context);
    final colors = DshColors.of(context);
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        const SizedBox(height: 8),
        Text(
          l10n.engineSubscriptionCode,
          textAlign: TextAlign.center,
          style: theme.textTheme.labelMedium?.copyWith(color: colors.textTertiary),
        ),
        const SizedBox(height: 10),
        Semantics(
          label: l10n.engineSubscriptionCodeSemantics(code.split('').join(' ')),
          excludeSemantics: true,
          child: GlassSurface(
            tier: GlassTier.card,
            borderRadius: AppShape.radiusLg,
            child: SizedBox(
              height: 80,
              child: Center(
                child: FittedBox(
                  fit: BoxFit.scaleDown,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: SelectableText(
                      code,
                      style: AppType.mono(
                        size: 30,
                        color: theme.colorScheme.onSurface,
                        height: 1.2,
                      ).copyWith(letterSpacing: 4, fontWeight: FontWeight.w600),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
        const SizedBox(height: 14),
        _Waiting(label: l10n.engineSubscriptionWaitingVerification),
        const SizedBox(height: 24),
        _Pair(
          left: OutlinedButton(
            onPressed: onCopy,
            child: Text(copied ? l10n.commonCopied : l10n.engineSubscriptionCopyCode),
          ),
          right: FilledButton(onPressed: onOpen, child: Text(l10n.engineSubscriptionOpenVerification)),
        ),
      ],
    );
  }
}

/// Chinese text: the flow's own words are shown only when already localized.
// l10n:keep detects Chinese engine text
final _cjk = RegExp(r'[\u4e00-\u9fff]');

/// What a prompt asks for, from the flow's wording: a redirect URL or a code.
String promptTitle(String? message) {
  final m = message?.toLowerCase() ?? '';
  // l10n:keep matches the engine’s prompt wording
  return m.contains('url') || m.contains('redirect') || m.contains('链接')
      ? appL10n.engineSubscriptionPasteRedirect
      : appL10n.engineSubscriptionPasteCode;
}

class _PromptBody extends StatefulWidget {
  const _PromptBody({
    super.key,
    required this.controller,
    required this.hint,
    required this.helper,
    required this.busy,
    required this.onSubmit,
  });

  final TextEditingController controller;
  final String? hint;
  final String? helper;
  final bool busy;
  final ValueChanged<String> onSubmit;

  @override
  State<_PromptBody> createState() => _PromptBodyState();
}

class _PromptBodyState extends State<_PromptBody> {
  @override
  void initState() {
    super.initState();
    widget.controller.addListener(_changed);
  }

  @override
  void dispose() {
    widget.controller.removeListener(_changed);
    super.dispose();
  }

  void _changed() => setState(() {});

  Future<void> _paste() async {
    final text = (await Clipboard.getData(Clipboard.kTextPlain))?.text?.trim();
    if (text == null || text.isEmpty || !mounted) return;
    widget.controller.value = TextEditingValue(
      text: text,
      selection: TextSelection.collapsed(offset: text.length),
    );
  }

  void _submit() {
    final value = widget.controller.text.trim();
    if (value.isEmpty || widget.busy) return;
    FocusManager.instance.primaryFocus?.unfocus();
    widget.onSubmit(value);
  }

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final theme = Theme.of(context);
    final scheme = theme.colorScheme;
    final ready = widget.controller.text.trim().isNotEmpty && !widget.busy;
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        _Head(
          badge: const _Badge(icon: AppIcons.apiKey),
          title: promptTitle(widget.helper),
        ),
        const SizedBox(height: 20),
        TextField(
          controller: widget.controller,
          autocorrect: false,
          enableSuggestions: false,
          enableIMEPersonalizedLearning: false,
          onSubmitted: (_) => _submit(),
          decoration: InputDecoration(
            hintText: widget.hint?.trim().isNotEmpty == true ? widget.hint : l10n.engineSubscriptionPasteHere,
            helperText: _cjk.hasMatch(widget.helper ?? '') ? widget.helper!.trim() : null,
            helperMaxLines: 3,
            suffixIcon: IconButton(
              tooltip: l10n.commonPaste,
              icon: const Icon(AppIcons.paste, size: 20),
              onPressed: widget.busy ? null : _paste,
            ),
          ),
        ),
        const SizedBox(height: 20),
        FilledButton(
          onPressed: ready ? _submit : null,
          child: widget.busy
              ? SizedBox.square(
                  dimension: 16,
                  child: CircularProgressIndicator(strokeWidth: 2, color: scheme.onSurfaceVariant),
                )
              : Text(l10n.engineSubscriptionConfirm),
        ),
      ],
    );
  }
}

class _Outcome extends StatelessWidget {
  const _Outcome({super.key, required this.ok, required this.title, this.message, this.onRetry});

  final bool ok;
  final String title;
  final String? message;
  final VoidCallback? onRetry;

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final theme = Theme.of(context);
    final colors = DshColors.of(context);
    final dark = theme.brightness == Brightness.dark;
    final message = this.message?.trim();
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        _Head(
          badge: ok
              ? _Badge(
                  icon: AppIcons.done,
                  color: dark ? colors.onSuccessContainer : colors.success,
                  fill: colors.success.withValues(alpha: dark ? 0.2 : 0.12),
                )
              : const _Badge(icon: AppIcons.error),
          title: title,
          line: message == null || message.isEmpty
              ? null
              : Text(
                  message,
                  textAlign: TextAlign.center,
                  maxLines: 3,
                  overflow: TextOverflow.ellipsis,
                  style: theme.textTheme.bodyMedium?.copyWith(color: colors.textTertiary),
                ),
        ),
        if (ok)
          const SizedBox(height: 24)
        else ...[
          const SizedBox(height: 28),
          FilledButton(onPressed: onRetry, child: Text(l10n.engineSubscriptionTryAgain)),
        ],
      ],
    );
  }
}
