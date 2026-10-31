// Switching the app's language reaches plugin texts at once: the locale the
// app sends follows the setting itself (not AppLocale, which switches only
// when the app's root rebuilds), and the contributions and the stream are
// asked again in it.

import 'package:dsh_app/l10n/l10n.dart';
import 'package:dsh_app/plugins/native/native_state.dart';
import 'package:dsh_app/state/locale_state.dart';
import 'package:dsh_client/dsh_client.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'support.dart';

final _answer = contributions([quickPlugin()]);

class _LocaleBridge extends FakeBridge {
  _LocaleBridge() : super(_answer);

  final asked = <String?>[];
  final streams = <String?>[];

  @override
  Future<DshGoContributions?> contributions(DshGoCaps caps, {DshGoContributions? previous}) {
    asked.add(caps.locale);
    return super.contributions(caps, previous: previous);
  }

  @override
  DshGoStream openStream({String? locale}) {
    streams.add(locale);
    return super.openStream(locale: locale);
  }
}

Future<void> _settle() async {
  for (var i = 0; i < 5; i++) {
    await Future<void>.delayed(Duration.zero);
  }
}

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  setUp(() => SharedPreferences.setMockInitialValues({}));
  tearDown(() => AppLocale.use(AppLocale.zhCN));

  test('switching to English: plugins hear it before the app has rebuilt', () async {
    final bridge = _LocaleBridge();
    final container = ProviderContainer(overrides: nativeOverrides(bridge));
    addTearDown(container.dispose);
    final contributions = container.listen(nativeRawContributionsProvider, (_, _) {});
    final stream = container.listen(nativeStreamProvider, (_, _) {});
    await container.read(nativeRawContributionsProvider.future);
    expect(container.read(nativeLocaleProvider), 'zh-CN');
    expect(bridge.asked.toSet(), {'zh-CN'});
    expect(bridge.streams, ['zh-CN']);

    await container.read(appLanguageProvider.notifier).set(AppLanguage.en);
    // The root hasn't rebuilt: AppLocale still says Chinese.
    expect(AppLocale.isEnglish, isFalse);
    expect(container.read(nativeLocaleProvider), 'en');
    expect(container.read(nativeCapsProvider).locale, 'en');
    await container.read(nativeRawContributionsProvider.future);
    await _settle();
    expect(bridge.asked.last, 'en');
    expect(container.read(nativeStreamProvider), isNotNull);
    expect(bridge.streams.last, 'en');

    await container.read(appLanguageProvider.notifier).set(AppLanguage.pt);
    await container.read(nativeRawContributionsProvider.future);
    await _settle();
    expect(container.read(nativeLocaleProvider), 'pt-BR');
    expect(bridge.asked.last, 'pt-BR');
    expect(bridge.streams.last, 'pt-BR');

    await container.read(appLanguageProvider.notifier).set(AppLanguage.zh);
    await container.read(nativeRawContributionsProvider.future);
    await _settle();
    expect(container.read(nativeLocaleProvider), 'zh-CN');
    expect(bridge.asked.last, 'zh-CN');
    contributions.close();
    stream.close();
  });

  test('following the system: a system language change is heard', () async {
    final binding = TestWidgetsFlutterBinding.instance;
    binding.platformDispatcher.localesTestValue = const [Locale('zh', 'CN')];
    addTearDown(binding.platformDispatcher.clearLocalesTestValue);
    final container = ProviderContainer(
      overrides: [appLanguageProvider.overrideWith(() => _Fixed(AppLanguage.system))],
    );
    addTearDown(container.dispose);
    final locale = container.listen(nativeLocaleProvider, (_, _) {});
    expect(locale.read(), 'zh-CN');
    binding.platformDispatcher.localesTestValue = const [Locale('en', 'US')];
    binding.handleLocaleChanged();
    await _settle();
    expect(locale.read(), 'en');
    locale.close();
  });
}

class _Fixed extends AppLanguageController {
  _Fixed(this.value);
  final AppLanguage value;

  @override
  AppLanguage build() => value;
}
