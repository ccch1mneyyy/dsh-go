// Plays one pet animation: each frame for its own `ms`, cells cut from the
// sheet's grid and put back at their `box` on the canvas; pixel art is sampled
// nearest-neighbour at a whole number of device pixels per art pixel, so every
// art pixel is equally wide and edges stay hard. The cell-cutting follows the
// whale tail (whale_tail.dart).

import 'dart:async';
import 'dart:math' as math;
import 'dart:ui' as ui;

import 'package:flutter/widgets.dart';

import '../../pets/pet_pack.dart';
import '../../pets/pet_sheets.dart';
import '../../pets/pet_state.dart';
import '../theme/motion.dart';

/// Device pixels per art pixel for [size]: whole numbers, one apart at
/// least, so the three sizes always differ.
int petDevicePixels(PetPack pack, PetSize size, double devicePixelRatio) {
  int k(PetSize s) => math.max(1, (s.bodyHeight * devicePixelRatio / pack.contentBox.height).round());
  final small = k(PetSize.small);
  final medium = math.max(small + 1, k(PetSize.medium));
  final large = math.max(medium + 1, k(PetSize.large));
  return switch (size) {
    PetSize.small => small,
    PetSize.medium => medium,
    PetSize.large => large,
  };
}

/// Logical pixels per art pixel: whole device pixels for pixel art, the
/// target body height otherwise.
double petScale(PetPack pack, PetSize size, double devicePixelRatio) => pack.pixelArt
    ? petDevicePixels(pack, size, devicePixelRatio) / devicePixelRatio
    : size.bodyHeight / pack.contentBox.height;

/// One animation of [pack], as big as the canvas × [scale].
///
/// Loops when the animation loops; otherwise plays once, holds the last
/// frame and calls [onEnd]. With animations turned off in the system it
/// shows the first frame (and still calls [onEnd] after one pass's time).
/// Until a new animation's sheet is decoded the previous one keeps showing.
/// Playback freezes while the app has no visible view, including in the
/// background where Dart timers can outlive Flutter's frame scheduling.
class PetSprite extends StatefulWidget {
  const PetSprite({
    super.key,
    required this.pack,
    required this.anim,
    required this.scale,
    this.flip = false,
    this.onEnd,
    this.onShown,
    this.bundle,
    this.still = false,
    this.paused = false,
  });

  final PetPack pack;
  final PetAnimation anim;

  /// Logical pixels per art pixel ([petScale]).
  final double scale;

  /// Mirrored about the anchor's x.
  final bool flip;
  final VoidCallback? onEnd;

  /// A sheet is on screen (the first time after each new animation).
  final VoidCallback? onShown;

  /// Where the sheets come from; the [DefaultAssetBundle] when null.
  final AssetBundle? bundle;

  /// First frame only, no timers.
  final bool still;

  /// Freeze the current frame and its remaining delay while fully hidden.
  /// Unlike [still], this does not reset the frame or restart the animation.
  final bool paused;

  @override
  State<PetSprite> createState() => PetSpriteState();
}

class PetSpriteState extends State<PetSprite> with WidgetsBindingObserver {
  final _repaint = ValueNotifier<int>(0);
  ui.Image? _image;

  /// The animation [_image] belongs to (the previous one while the new
  /// sheet decodes).
  PetAnimation? _shown;
  int _frame = 0;
  Timer? _timer;
  final _clock = Stopwatch()..start();
  Duration? _due;
  Duration? _remaining;
  VoidCallback? _pending;
  bool _reduced = false;
  bool _ticking = true;
  bool _appVisible = true;
  bool _ended = false;
  int _generation = 0;

  /// Index into the animation's frames now showing.
  @visibleForTesting
  int get frame => _frame;

  /// The animation on screen (null until its sheet is decoded).
  @visibleForTesting
  PetAnimation? get shown => _shown;

  @override
  void initState() {
    super.initState();
    _appVisible = _visibleIn(WidgetsBinding.instance.lifecycleState);
    WidgetsBinding.instance.addObserver(this);
  }

  // Inactive views can still be visible (split screen, a system dialog).
  // Null is the period before the platform sends its first lifecycle event.
  static bool _visibleIn(AppLifecycleState? state) => switch (state) {
    null || AppLifecycleState.resumed || AppLifecycleState.inactive => true,
    _ => false,
  };

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    final wasPaused = _paused;
    _appVisible = _visibleIn(state);
    if (_paused != wasPaused) _pauseChanged();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    final reduced = AppMotion.reduced(context);
    final ticking = TickerMode.valuesOf(context).enabled;
    final first = _shown == null && _generation == 0;
    if (first || reduced != _reduced || ticking != _ticking) {
      _reduced = reduced;
      _ticking = ticking;
      if (first) {
        _start();
      } else {
        _schedule();
      }
    }
  }

  @override
  void didUpdateWidget(PetSprite oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.anim != widget.anim || oldWidget.pack != widget.pack || oldWidget.still != widget.still) {
      _start();
    } else if (oldWidget.paused != widget.paused) {
      _pauseChanged();
    }
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    _cancelTimer();
    _clock.stop();
    _image?.dispose();
    _repaint.dispose();
    super.dispose();
  }

  void _start() {
    final generation = ++_generation;
    _cancelTimer();
    _ended = false;
    final pack = widget.pack;
    final anim = widget.anim;
    final ready = PetSheets.instance.peek(pack, anim);
    if (ready != null) {
      _show(anim, ready);
      return;
    }
    final bundle = widget.bundle ?? DefaultAssetBundle.of(context);
    PetSheets.instance.load(pack, anim, bundle).then((image) {
      if (!mounted || generation != _generation) {
        image.dispose();
        return;
      }
      _show(anim, image);
    }, onError: (Object _) {});
  }

  void _show(PetAnimation anim, ui.Image image) {
    _image?.dispose();
    _image = image;
    _shown = anim;
    _frame = 0;
    _repaint.value++;
    _schedule();
    widget.onShown?.call();
  }

  bool get _still => widget.still || _reduced || !_ticking;
  bool get _paused => widget.paused || !_appVisible;

  void _schedule() {
    _cancelTimer();
    final anim = _shown;
    if (anim == null || anim != widget.anim || _ended) return;
    if (_still) {
      if (_frame != 0) {
        _frame = 0;
        _repaint.value++;
      }
      // One-off plays still end after one pass, unless explicitly paused.
      if (!anim.loop && !widget.still) {
        _arm(Duration(milliseconds: anim.durationMs), _end);
      }
      return;
    }
    _arm(Duration(milliseconds: anim.frames[_frame].ms), _advance);
  }

  void _cancelTimer() {
    _timer?.cancel();
    _timer = null;
    _due = null;
    _remaining = null;
    _pending = null;
  }

  void _arm(Duration delay, VoidCallback callback) {
    _remaining = delay;
    _pending = callback;
    if (_paused) return;
    _due = _clock.elapsed + delay;
    _timer = Timer(delay, () {
      _timer = null;
      _due = null;
      _remaining = null;
      _pending = null;
      callback();
    });
  }

  void _pauseChanged() {
    if (_paused) {
      final due = _due;
      if (due != null) {
        final left = due - _clock.elapsed;
        _remaining = left.isNegative ? Duration.zero : left;
      }
      _timer?.cancel();
      _timer = null;
      _due = null;
    } else {
      final delay = _remaining;
      final callback = _pending;
      if (delay != null && callback != null) _arm(delay, callback);
    }
  }

  void _advance() {
    final anim = _shown;
    if (anim == null || !mounted) return;
    final previousCell = anim.frames[_frame].i;
    if (_frame + 1 >= anim.frames.length) {
      if (!anim.loop) {
        _end();
        return;
      }
      _frame = 0;
    } else {
      _frame++;
    }
    // Repeated cells still advance on their original clock, without repainting.
    if (anim.frames[_frame].i != previousCell) _repaint.value++;
    _schedule();
  }

  void _end() {
    if (_ended) return;
    _ended = true;
    widget.onEnd?.call();
  }

  @override
  Widget build(BuildContext context) {
    final pack = widget.pack;
    final size = Size(pack.canvas.width * widget.scale, pack.canvas.height * widget.scale);
    return ExcludeSemantics(
      child: SizedBox.fromSize(
        size: size,
        child: CustomPaint(
          painter: _SpritePainter(state: this, pack: pack, scale: widget.scale, flip: widget.flip, repaint: _repaint),
        ),
      ),
    );
  }
}

class _SpritePainter extends CustomPainter {
  _SpritePainter({
    required this.state,
    required this.pack,
    required this.scale,
    required this.flip,
    required Listenable repaint,
  }) : super(repaint: repaint);

  final PetSpriteState state;
  final PetPack pack;
  final double scale;
  final bool flip;

  @override
  void paint(Canvas canvas, Size size) {
    final image = state._image;
    final anim = state._shown;
    if (image == null || anim == null) return;
    final frame = anim.frames[state._frame.clamp(0, anim.frames.length - 1)];
    final box = anim.box;
    final dst = Rect.fromLTWH(box.left * scale, box.top * scale, box.width * scale, box.height * scale);
    if (flip) {
      canvas.save();
      canvas.translate(2 * pack.anchorX * scale, 0);
      canvas.scale(-1, 1);
    }
    canvas.drawImageRect(
      image,
      anim.sourceRect(frame.i),
      dst,
      Paint()
        ..isAntiAlias = false
        ..filterQuality = pack.pixelArt ? FilterQuality.none : FilterQuality.medium,
    );
    if (flip) canvas.restore();
  }

  @override
  bool shouldRepaint(_SpritePainter old) =>
      old.state != state || old.pack != pack || old.scale != scale || old.flip != flip;
}
