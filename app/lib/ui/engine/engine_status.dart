import 'dart:math' as math;

import 'package:flutter/material.dart';

import '../../l10n/l10n.dart';
import '../../runtime/runtime_bridge.dart';
import '../../runtime/runtime_state.dart';
import '../common/status_dot.dart';
import '../theme/app_icons.dart';
import '../theme/theme.dart';

/// How the local engine's state reads in the UI. Colour is never the
/// only signal: every dot comes with one of these labels.
class EngineStatusView {
  const EngineStatusView(this.tone, this.label);

  final StatusTone tone;
  final String label;

  factory EngineStatusView.of(LocalRuntimeState state) {
    final status = state.status;
    return switch (status.phase) {
      RuntimePhase.notInstalled => EngineStatusView(StatusTone.idle, appL10n.phoneEngineNotInstalled),
      RuntimePhase.installing => EngineStatusView(
        StatusTone.busy,
        state.progress == null
            ? appL10n.phoneEngineInstalling
            : appL10n.phoneEngineInstallPercent((state.progress!.fraction * 100).round()),
      ),
      RuntimePhase.installed => EngineStatusView(
        StatusTone.idle,
        status.inSafeMode ? appL10n.phoneEngineStoppedSafe : appL10n.commonStopped,
      ),
      RuntimePhase.starting => EngineStatusView(
        StatusTone.busy,
        status.inSafeMode
            ? appL10n.phoneEngineStartingSafe
            : status.tidyingFiles
            ? appL10n.phoneEngineTidyingFiles
            : appL10n.phoneEngineStarting,
      ),
      RuntimePhase.running =>
        status.inSafeMode
            ? EngineStatusView(StatusTone.warn, appL10n.phoneSafeMode)
            : EngineStatusView(
                StatusTone.ok,
                status.onProbation ? appL10n.phoneEngineRunningProbation : appL10n.commonRunning,
              ),
      RuntimePhase.stopping => EngineStatusView(StatusTone.busy, appL10n.commonStopping),
      RuntimePhase.error => EngineStatusView(StatusTone.error, switch (status.failure?.kind) {
        FailureKind.launchFailed => appL10n.phoneFailureLaunch,
        FailureKind.startupFailed => appL10n.phoneEngineStartupFailed,
        FailureKind.crashedEarly || FailureKind.crashedLate => appL10n.phoneEngineCrashed,
        FailureKind.killed => appL10n.phoneEngineKilled,
        FailureKind.noSpace => appL10n.commonStorageFull,
        null => appL10n.phoneEngineError,
      }),
    };
  }
}

/// Turns a known native error into one human sentence; anything else is null
/// (callers show their own line) and the raw text stays in the logs.
String? humanizeRuntimeError(String? raw) {
  if (raw == null || raw.trim().isEmpty) return null;
  var text = raw.trim();
  for (final prefix in const ['install failed: ', 'start failed: ']) {
    if (text.startsWith(prefix)) text = text.substring(prefix.length);
  }
  // l10n:keep native engine error prefix
  if (text.startsWith('存储空间不足')) {
    if (!AppLocale.usesWesternConventions) return text;
    // l10n:keep native engine error format
    final sizes = RegExp(r'^存储空间不足：需要约 (.+) MB，当前可用 (.+) MB$').firstMatch(text);
    return sizes == null
        ? appL10n.commonStorageFull
        : appL10n.phoneEngineStorageDetails(sizes.group(1)!, sizes.group(2)!);
  }
  // l10n:keep native engine checksum error marker
  if (text.contains('校验失败')) return appL10n.phoneEngineRuntimeCorrupt;
  if (text.contains('No space left') || text.contains('ENOSPC')) {
    return appL10n.commonStorageFull;
  }
  if (text.startsWith('DSH exited unexpectedly')) {
    return appL10n.phoneEngineExited;
  }
  if (text == 'runtime not installed') return appL10n.phoneEngineRuntimeMissing;
  if (text.startsWith('safe mode:')) return appL10n.phoneEngineSafeUnsupported;
  if (text.startsWith('manifest:')) return appL10n.phoneEngineRuntimeIncomplete;
  return null;
}

/// Compact status chip: `● 本机 · 运行中`.
class EngineStatusChip extends StatelessWidget {
  const EngineStatusChip({super.key, required this.state, this.onTap, this.prefix});

  final LocalRuntimeState state;
  final VoidCallback? onTap;
  final String? prefix;

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final prefix = this.prefix ?? l10n.commonThisPhone;
    final view = EngineStatusView.of(state);
    final theme = Theme.of(context);
    return Semantics(
      button: onTap != null,
      label: l10n.phoneEngineStatusSemantics(prefix, view.label),
      child: ExcludeSemantics(
        child: GlassSurface(
          tier: GlassTier.pill,
          stadium: true,
          onTap: onTap,
          padding: const EdgeInsets.fromLTRB(10, 6, 12, 6),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              StatusDot(tone: view.tone, size: 7),
              const SizedBox(width: 7),
              Flexible(
                child: Text(
                  '$prefix · ${view.label}',
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: AppType.tabular(
                    theme.textTheme.labelMedium!.copyWith(color: theme.colorScheme.onSurfaceVariant),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

/// The engine page's status ring: a thin ring around the
/// DSH mark. Running: the primary colour, breathing slowly; starting / stopping:
/// a short arc going round; safe mode: amber; failed: red; stopped: a quiet
/// grey track. Colours glide between states; reduced motion holds still.
class EngineRing extends StatefulWidget {
  const EngineRing({super.key, required this.tone, this.size = 56, this.child});

  final StatusTone tone;
  final double size;

  /// The glyph in the middle; defaults to a chip icon.
  final Widget? child;

  /// Ring stroke width.
  static const stroke = 2.5;

  static Color colorFor(BuildContext context, StatusTone tone) {
    final colors = DshColors.of(context);
    final scheme = Theme.of(context).colorScheme;
    return switch (tone) {
      StatusTone.ok || StatusTone.busy => scheme.primary,
      StatusTone.warn => colors.warning,
      StatusTone.error => colors.danger,
      StatusTone.idle => scheme.outline,
    };
  }

  @override
  State<EngineRing> createState() => _EngineRingState();
}

class _EngineRingState extends State<EngineRing> with SingleTickerProviderStateMixin {
  late final AnimationController _loop = AnimationController(vsync: this);

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _sync();
  }

  @override
  void didUpdateWidget(EngineRing oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.tone != widget.tone) _sync();
  }

  void _sync() {
    final moving = widget.tone == StatusTone.ok || widget.tone == StatusTone.busy;
    if (!moving || AppMotion.reduced(context)) {
      _loop
        ..stop()
        ..value = 0;
      return;
    }
    if (widget.tone == StatusTone.busy) {
      _loop
        ..duration = const Duration(milliseconds: 1100)
        ..repeat();
    } else {
      _loop
        ..duration = AppMotion.breath
        ..repeat(reverse: true);
    }
  }

  @override
  void dispose() {
    _loop.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final scheme = Theme.of(context).colorScheme;
    final tone = widget.tone;
    return Semantics(
      excludeSemantics: true,
      child: SizedBox.square(
        dimension: widget.size,
        child: TweenAnimationBuilder<Color?>(
          tween: ColorTween(end: EngineRing.colorFor(context, tone)),
          duration: AppMotion.of(context, AppMotion.standard),
          curve: AppMotion.std,
          builder: (context, color, _) => AnimatedBuilder(
            animation: _loop,
            builder: (context, child) => CustomPaint(
              painter: _RingPainter(
                color: color ?? scheme.outline,
                track: (color ?? scheme.outline).withValues(alpha: 0.16),
                tone: tone,
                t: AppMotion.std.transform(_loop.value),
                raw: _loop.value,
              ),
              child: child,
            ),
            child: Center(
              child:
                  widget.child ??
                  Icon(
                    AppIcons.engine,
                    size: widget.size * 0.43,
                    color: tone == StatusTone.idle ? DshColors.of(context).textTertiary : color,
                  ),
            ),
          ),
        ),
      ),
    );
  }
}

class _RingPainter extends CustomPainter {
  _RingPainter({required this.color, required this.track, required this.tone, required this.t, required this.raw});

  final Color color;
  final Color track;
  final StatusTone tone;

  /// Eased breathing phase (0..1).
  final double t;

  /// Linear loop value (rotation for the busy arc).
  final double raw;

  @override
  void paint(Canvas canvas, Size size) {
    const stroke = EngineRing.stroke;
    final rect = (Offset.zero & size).deflate(stroke / 2);
    final paint = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = stroke
      ..strokeCap = StrokeCap.round;
    canvas.drawArc(rect, 0, 2 * math.pi, false, paint..color = track);
    switch (tone) {
      case StatusTone.idle:
        break;
      case StatusTone.busy:
        canvas.drawArc(rect, -math.pi / 2 + raw * 2 * math.pi, math.pi / 2, false, paint..color = color);
      case StatusTone.ok:
        // Breathes between 55% and full strength.
        canvas.drawArc(rect, 0, 2 * math.pi, false, paint..color = color.withValues(alpha: color.a * (1 - 0.45 * t)));
      case StatusTone.warn || StatusTone.error:
        canvas.drawArc(rect, 0, 2 * math.pi, false, paint..color = color);
    }
  }

  @override
  bool shouldRepaint(_RingPainter old) =>
      old.color != color || old.track != track || old.tone != tone || old.t != t || old.raw != raw;
}
