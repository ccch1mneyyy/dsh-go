import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'l10n/l10n.dart';
import 'performance/performance_state.dart';
import 'state/app_info.dart';
import 'state/appearance_state.dart';
import 'state/locale_state.dart';
import 'state/settings_state.dart';
import 'state/star_prompt.dart' show starPromptGateProvider, starPromptProvider;
import 'state/tile_style_state.dart';
import 'ui/chat/dsh_ui/dsh_ui_model.dart' show DshUiAppAccent;
import 'ui/common/side_insets.dart';
import 'ui/launch/launch_overlay.dart';
import 'ui/shell/root_gate.dart';
import 'ui/theme/theme.dart';
import 'usage/usage_stats.dart';

class DshApp extends ConsumerStatefulWidget {
  const DshApp({super.key, this.home});

  /// Replaces the root gate (widget tests).
  final Widget? home;

  @override
  ConsumerState<DshApp> createState() => _DshAppState();
}

class _DshAppState extends ConsumerState<DshApp> with WidgetsBindingObserver {
  /// Themes of the palette last built: rebuilt only when the palette or the
  /// language changes.
  AppAccent? _accent;
  bool? _english;
  bool? _glassBlur;
  late ThemeData _light;
  late ThemeData _dark;

  /// The language last shown; a change after the first frame rebuilds the
  /// whole tree (text read through `appL10n` has no dependency to notify).
  Locale? _shown;

  /// The stored palette arrives a moment after launch; that first switch
  /// lands without a cross-fade, later ones fade (切换配色).
  bool _settled = false;

  @override
  void initState() {
    super.initState();
    // Start loading the stored tile style now, so 全部功能 opens in it rather
    // than flashing the default first.
    ref.read(tileStyleProvider);
    // Anonymous usage statistics live as long as the app, in either 界面
    // (release builds: today is noted, and earlier days go out).
    ref.read(usageStatsProvider);
    // 公测版: the star prompt counts time in front from launch, in either 界面.
    if (ref.read(starPromptGateProvider)) ref.read(starPromptProvider);
    WidgetsBinding.instance.addObserver(this);
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  /// 跟随系统: the system language changed while the app was open.
  @override
  void didChangeLocales(List<Locale>? locales) {
    if (ref.read(appLanguageProvider) == AppLanguage.system) setState(() {});
  }

  void _themesFor(AppAccent accent, bool english, bool glassBlur) {
    if (accent == _accent && english == _english && glassBlur == _glassBlur) return;
    _accent = accent;
    _english = english;
    _glassBlur = glassBlur;
    // Plugin views that ask for `accent: "app"` follow the palette.
    DshUiAppAccent.set(accent.seed.toARGB32());
    // English UI still shows Chinese content: keep its glyphs Chinese.
    final glyphs = english ? AppLocale.zhCN : null;
    _light = buildLightTheme(accent: accent, glyphLocale: glyphs, glassBlur: glassBlur);
    _dark = buildDarkTheme(accent: accent, glyphLocale: glyphs, glassBlur: glassBlur);
  }

  Locale _resolveLocale() {
    final locale = AppLocale.resolve(
      ref.watch(appLanguageProvider).locale,
      WidgetsBinding.instance.platformDispatcher.locales,
    );
    if (locale != _shown) {
      final first = _shown == null;
      _shown = locale;
      AppLocale.use(locale);
      if (!first) WidgetsBinding.instance.addPostFrameCallback((_) => _rebuildAll());
    }
    return locale;
  }

  void _rebuildAll() {
    void mark(Element e) {
      e.markNeedsBuild();
      e.visitChildren(mark);
    }

    if (mounted) (context as Element).visitChildren(mark);
  }

  @override
  Widget build(BuildContext context) {
    final themeMode = ref.watch(settingsProvider.select((s) => s.themeMode));
    final appearance = ref.watch(appearanceProvider);
    final waiting =
        !appearance.loaded ||
        (appearance.source == AccentSource.wallpaper && ref.watch(wallpaperAccentProvider).isLoading);
    final locale = _resolveLocale();
    final performance = ref.watch(performanceDefaultsProvider);
    _themesFor(ref.watch(accentProvider), locale.languageCode != 'zh', performance.blur);
    if (!waiting && !_settled) {
      WidgetsBinding.instance.addPostFrameCallback((_) => _settled = true);
    }
    final reduced =
        performance.reduceMotion || WidgetsBinding.instance.platformDispatcher.accessibilityFeatures.disableAnimations;
    return MaterialApp(
      title: AppInfo.name,
      debugShowCheckedModeBanner: false,
      theme: _light,
      darkTheme: _dark,
      themeMode: themeMode,
      // Palette and light / dark changes cross-fade the whole app (AppMotion).
      themeAnimationStyle: _settled && !reduced
          ? AnimationStyle(duration: AppMotion.standard, curve: AppMotion.std)
          : AnimationStyle.noAnimation,
      // zh_CN, not bare zh: otherwise CJK falls back to Japanese glyph shapes
      // on non-Chinese system locales. English keeps Chinese glyphs through
      // the theme's text locale (_themesFor).
      locale: locale,
      supportedLocales: AppLocale.supported,
      localizationsDelegates: const [L10n.delegate, ...GlobalMaterialLocalizations.delegates],
      // A phone on its side: the cutout's inset on both sides (side_insets). Over everything,
      // the launch screen of a cold start (启动画面).
      builder: (context, child) {
        final media = MediaQuery.of(context);
        return MediaQuery(
          data: media.copyWith(disableAnimations: media.disableAnimations || performance.reduceMotion),
          child: Stack(
            fit: StackFit.expand,
            children: [
              MirroredSideInsets(child: child!),
              const LaunchLayer(),
            ],
          ),
        );
      },
      home: widget.home ?? const RootGate(),
    );
  }
}
