// Switching 设置 → 语言 in the running app: everything on screen follows at
// once, also text read through appL10n (no BuildContext dependency), and the
// choice is stored for the next launch and for the native side.

import 'package:dsh_app/app.dart';
import 'package:dsh_app/l10n/l10n.dart';
import 'package:dsh_app/state/appearance_state.dart';
import 'package:dsh_app/state/locale_state.dart';
import 'package:dsh_app/state/settings_state.dart';
import 'package:dsh_app/ui/settings/language_tile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../shell/golden_harness.dart' show FakeSettings;

class _NoWallpaper extends DynamicColorChannel {
  const _NoWallpaper();

  @override
  Future<Color?> wallpaperAccent() async => null;
}

/// Reads appL10n in build: nothing tells it the language changed.
class _Plain extends StatelessWidget {
  const _Plain();

  @override
  Widget build(BuildContext context) => Text('plain ${appL10n.commonCancel}');
}

class _Page extends StatelessWidget {
  const _Page();

  @override
  Widget build(BuildContext context) => Scaffold(
    body: Column(children: [Text('ctx ${context.l10n.commonCancel}'), const _Plain(), const LanguageSettingsTile()]),
  );
}

void main() {
  tearDown(() {
    AppLanguageController.initial = AppLanguage.zh;
    AppLocale.use(AppLocale.zhCN);
  });

  Future<ProviderContainer> pump(WidgetTester tester) async {
    final container = ProviderContainer(
      overrides: [
        settingsProvider.overrideWith(() => FakeSettings(const AppSettings(loaded: true))),
        dynamicColorChannelProvider.overrideWithValue(const _NoWallpaper()),
      ],
    );
    addTearDown(container.dispose);
    await tester.pumpWidget(
      UncontrolledProviderScope(
        container: container,
        child: const DshApp(home: _Page()),
      ),
    );
    await tester.pumpAndSettle();
    return container;
  }

  testWidgets('English takes over the whole screen at once and is stored', (tester) async {
    SharedPreferences.setMockInitialValues({});
    await pump(tester);
    expect(find.text('ctx 取消'), findsOneWidget);
    expect(find.text('plain 取消'), findsOneWidget);

    await tester.tap(find.text('English'));
    await tester.pumpAndSettle();
    expect(find.text('ctx Cancel'), findsOneWidget);
    expect(find.text('plain Cancel'), findsOneWidget);
    expect(find.text('Language'), findsOneWidget);
    expect(AppLocale.current, AppLocale.en);
    expect(Localizations.localeOf(tester.element(find.byType(_Page))), AppLocale.en);
    final prefs = await SharedPreferences.getInstance();
    expect(prefs.getString(AppLanguageController.prefsKey), 'en');

    await tester.tap(find.text('简体中文'));
    await tester.pumpAndSettle();
    expect(find.text('plain 取消'), findsOneWidget);
    expect(AppLocale.current, AppLocale.zhCN);
  });

  testWidgets('a stored choice is there from the first frame', (tester) async {
    SharedPreferences.setMockInitialValues({AppLanguageController.prefsKey: 'en'});
    await AppLanguageController.load();
    expect(AppLanguageController.initial, AppLanguage.en);
    await pump(tester);
    expect(find.text('ctx Cancel'), findsOneWidget);
  });

  testWidgets('Portuguese updates the whole screen and persists', (tester) async {
    SharedPreferences.setMockInitialValues({});
    tester.view.physicalSize = const Size(360, 800);
    tester.view.devicePixelRatio = 1;
    addTearDown(tester.view.resetPhysicalSize);
    addTearDown(tester.view.resetDevicePixelRatio);
    await pump(tester);
    await tester.tap(find.text('Português'));
    await tester.pumpAndSettle();
    expect(find.text('ctx Cancelar'), findsOneWidget);
    expect(find.text('plain Cancelar'), findsOneWidget);
    expect(find.text('Idioma'), findsOneWidget);
    expect(AppLocale.current, AppLocale.ptBR);
    final prefs = await SharedPreferences.getInstance();
    expect(prefs.getString(AppLanguageController.prefsKey), 'pt');
  });
}
