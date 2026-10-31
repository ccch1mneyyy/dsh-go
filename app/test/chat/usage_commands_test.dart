// Slash-command catalog parsing and filtering, session usage from captured
// `session/control` frames, and the DeepSeek balance state.

import 'dart:convert';
import 'dart:io';

import 'package:dsh_app/state/balance_state.dart';
import 'package:dsh_app/state/commands_state.dart';
import 'package:dsh_app/state/settings_state.dart';
import 'package:dsh_app/state/usage_state.dart';
import 'package:dsh_app/ui/chat/balance_widgets.dart';
import 'package:dsh_app/ui/chat/slash_palette.dart';
import 'package:dsh_app/ui/chat/usage_sheet.dart';
import 'package:dsh_app/l10n/l10n.dart';
import 'package:dsh_client/dsh_client.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'support/harness.dart';

void main() {
  group('slash commands', () {
    final all = mergeSlashCommands(testHostCommands);

    test('catalog: Chinese faces by definitionId, Web-only /export hidden', () {
      expect(testHostCommands.map((c) => c.name), ['goal', 'plan', 'feedback', 'compact', 'permission']);
      final compact = testHostCommands.firstWhere((c) => c.name == 'compact');
      expect(compact.label, '压缩');
      expect(compact.takesInput, isFalse);
      final permission = testHostCommands.firstWhere((c) => c.name == 'permission');
      expect(permission.hint, '<预设名>');
      expect(permission.takesInput, isTrue);
    });

    test('a same-name plugin override keeps its own copy', () {
      final parsed = parseCommandList([
        {'definitionId': 'my-plugin#compact', 'name': 'compact', 'description': 'Mine'},
        {
          'name': 'deploy',
          'description': 'Ship it',
          'input': {'hint': '<env>'},
        },
        {'description': 'no name'},
      ]);
      expect(parsed.map((c) => (c.name, c.label, c.description, c.hint)), [
        ('compact', 'compact', 'Mine', null),
        ('deploy', 'deploy', 'Ship it', '<env>'),
      ]);
    });

    test('palette order: app commands, first-party, then the rest', () {
      final withPlugin = mergeSlashCommands([
        ...parseCommandList([
          {'name': 'deploy', 'description': 'Ship it'},
        ]),
        ...testHostCommands,
      ]);
      expect(withPlugin.map((c) => c.name), [
        'new',
        'model',
        'compact',
        'permission',
        'plan',
        'goal',
        'feedback',
        'export',
        'features',
        'deploy',
      ]);
    });

    test('filter: name prefix, title, substring, subsequence', () {
      List<String> names(String q) => filterSlashCommands(all, q).map((c) => c.name).toList();
      expect(names(''), hasLength(all.length));
      expect(names('p'), ['permission', 'plan', 'compact', 'export']);
      expect(names('压'), ['compact']);
      expect(names('cpt'), ['compact']);
      expect(names('MOD'), ['model']);
      expect(names('zzz'), isEmpty);
    });

    test('parse and resolve a command line', () {
      expect(parseSlashInput('hello /compact'), isNull);
      final partial = parseSlashInput('/per')!;
      expect((partial.token, partial.hasArgs), ('per', false));
      final full = parseSlashInput('/permission read-only')!;
      expect((full.token, full.rest), ('permission', ' read-only'));
      expect(resolveSlashCommand(all, '压缩')?.name, 'compact');
      expect(resolveSlashCommand(all, 'perm'), isNull);
    });

    test('palette content: matches while typing, a hint once input starts', () {
      expect(PaletteContent.of(all, 'hi'), isNull);
      expect(PaletteContent.of(all, '/'), isA<PaletteMatches>());
      final hint = PaletteContent.of(all, '/permission ');
      expect(hint, isA<PaletteHint>());
      expect((hint! as PaletteHint).command.name, 'permission');
      expect(PaletteContent.of(all, '/compact now'), isNull);
      expect(PaletteContent.of(all, '/sdcard/a.txt 看看'), isNull);
    });
  });

  group('session usage', () {
    test('folds captured session/control frames', () {
      final lines = File('../packages/dsh_client/test/fixtures/control_reply_ok.jsonl')
          .readAsLinesSync()
          .where((l) => l.trim().isNotEmpty);
      var values = <String, Object?>{};
      String? session;
      for (final line in lines) {
        final frame = jsonDecode(line) as Map<String, Object?>;
        if (frame['type'] == 'baseline') {
          final projections = (frame['value']! as Map)['projections'] as Map<String, Object?>;
          session ??= projections.keys.first;
          values = {...((projections[session]! as Map)['values'] as Map<String, Object?>)};
        } else if (frame['sessionId'] == session) {
          values[frame['key']! as String] = frame['value'];
        }
      }
      final usage = SessionUsage.fromProjections(values);
      expect(usage.uncachedInput, 10129);
      expect(usage.output, 2);
      expect(usage.input, 10129);
      expect(usage.cacheHitRate, 0);
      expect(usage.contextWindow, 1000000);
      expect(usage.pressureTokens, 10129);
      expect(usage.contextFraction, closeTo(0.0101, 0.0001));
      expect(usage.systemTokens, 1467);
      expect(usage.toolsTokens, 5157);
      expect(usage.turns, 1);
      expect(formatPercent(usage.contextFraction!), '1%');
    });

    test('empty projections: no window, no hit rate', () {
      final usage = SessionUsage.fromProjections(const {});
      expect(usage.contextFraction, isNull);
      expect(usage.cacheHitRate, isNull);
      expect(usage.hasTokens, isFalse);
    });

    test('cache hit rate and cost need real numbers', () {
      const usage = SessionUsage(uncachedInput: 2000, cacheRead: 6000, output: 500);
      expect(usage.cacheHitRate, 0.75);
      expect(knownPricing, isEmpty, reason: 'no prices are made up');
      const pricing = TokenPricing(currency: 'CNY', inputPerMillion: 2, cacheHitPerMillion: 0.5, outputPerMillion: 8);
      expect(estimateCost(usage, pricing), closeTo(0.011, 1e-9));
    });

    test('token and percent formatting', () {
      expect(formatTokens(0), '0');
      expect(formatTokens(8421), '8,421');
      expect(formatTokens(15000), '1.5 万');
      expect(formatTokens(1000000), '100 万');
      expect(formatTokens(150000000), '1.5 亿');
      expect(formatPercent(0.004), '<1%');
      expect(formatPercent(0), '0%');
      expect(formatPercent(0.876), '88%');
    });

    test('token formatting follows the Portuguese locale', () {
      final previous = AppLocale.current;
      AppLocale.use(AppLocale.ptBR);
      try {
        expect(formatTokens(8421), '8.421');
        expect(formatTokens(15500), '15,5K');
      } finally {
        AppLocale.use(previous);
      }
    });
  });

  group('balance', () {
    test('parses /user/balance, preferring CNY', () {
      const body =
          '{"is_available":true,"balance_infos":['
          '{"currency":"USD","total_balance":"1.00","granted_balance":"0.00","topped_up_balance":"1.00"},'
          '{"currency":"CNY","total_balance":"110.00","granted_balance":"10.00","topped_up_balance":"100.00"}]}';
      final result = balanceResultOf(200, body);
      expect(result, isA<BalanceOk>());
      final b = (result as BalanceOk).balance;
      expect((b.currency, b.total, b.granted, b.toppedUp), ('CNY', 110.0, 10.0, 100.0));
      expect(formatMoney(b), '¥110.00');
      expect(formatThreshold(5), '¥5');
    });

    test('401 is an invalid key; anything else is quietly unavailable', () {
      expect(balanceResultOf(401, '{"error":{}}'), isA<BalanceInvalidKey>());
      expect(balanceResultOf(500, ''), isA<BalanceUnavailable>());
      expect(balanceResultOf(200, 'not json'), isA<BalanceUnavailable>());
      expect(balanceResultOf(200, '{"balance_infos":[]}'), isA<BalanceUnavailable>());
    });

    group('controller', () {
      late DateTime clock;
      late List<String> requests;
      late BalanceResult answer;

      setUp(() {
        SharedPreferences.setMockInitialValues({});
        clock = DateTime(2026, 10, 23, 12);
        BalanceController.now = () => clock;
        requests = [];
        answer = healthyBalance;
      });
      tearDown(() => BalanceController.now = DateTime.now);

      ProviderContainer container([String key = testKey]) {
        final c = ProviderContainer(
          overrides: [
            settingsProvider.overrideWith(() => TestSettings(AppSettings(loaded: true, apiKey: key))),
            balanceFetcherProvider.overrideWithValue((k) async {
              requests.add(k);
              return answer;
            }),
            accountWalletBalanceProvider.overrideWithValue(null),
          ],
        );
        addTearDown(c.dispose);
        c.listen(balanceProvider, (_, _) {});
        return c;
      }

      Future<void> settle() => Future<void>.delayed(Duration.zero);

      test('asks on first read, then at most once a minute', () async {
        final c = container();
        await settle();
        expect(requests, [testKey]);
        expect(c.read(balanceProvider).status, BalanceStatus.ok);
        expect(c.read(balanceProvider).balance?.total, 110);

        await c.read(balanceProvider.notifier).refresh();
        expect(requests, hasLength(1), reason: 'throttled');
        clock = clock.add(const Duration(seconds: 61));
        await c.read(balanceProvider.notifier).refresh();
        expect(requests, hasLength(2));
      });

      test('a key change asks again right away', () async {
        final c = container();
        await settle();
        await c.read(settingsProvider.notifier).setApiKey('sk-other-key-000000000000');
        await settle();
        expect(requests, [testKey, 'sk-other-key-000000000000']);
      });

      test('no key: nothing is requested', () async {
        final c = container('');
        await settle();
        expect(requests, isEmpty);
        expect(c.read(balanceProvider).status, BalanceStatus.noKey);
        expect(c.read(balanceProvider).isLow, isFalse);
      });

      test('low balance shows the banner until dismissed; 0 = never', () async {
        answer = lowBalance;
        final c = container();
        await settle();
        expect(c.read(balanceProvider).isLow, isTrue);
        expect(c.read(balanceProvider).showBanner, isTrue);
        c.read(balanceProvider.notifier).dismissBanner();
        expect(c.read(balanceProvider).showBanner, isFalse);
        await c.read(balanceProvider.notifier).setThreshold(0);
        expect(c.read(balanceProvider).isLow, isFalse);
        expect(c.read(balanceProvider).showBanner, isFalse);
        await c.read(balanceProvider.notifier).setThreshold(10);
        expect(c.read(balanceProvider).showBanner, isTrue);
        final prefs = await SharedPreferences.getInstance();
        expect(prefs.getDouble('low_balance_threshold'), 10);
      });

      test('「不提醒」 also silences a balance that can no longer pay', () async {
        answer = const BalanceOk(DeepSeekBalance(currency: 'CNY', total: 0, available: false));
        final c = container();
        await settle();
        expect(c.read(balanceProvider).isLow, isTrue);
        expect(c.read(balanceProvider).showBanner, isTrue);
        await c.read(balanceProvider.notifier).setThreshold(0);
        expect(c.read(balanceProvider).isLow, isTrue);
        expect(c.read(balanceProvider).showBanner, isFalse);
      });

      test('invalid key and offline are told apart, quietly', () async {
        answer = const BalanceInvalidKey();
        final c = container();
        await settle();
        expect(c.read(balanceProvider).status, BalanceStatus.invalidKey);

        answer = healthyBalance;
        clock = clock.add(const Duration(minutes: 2));
        await c.read(balanceProvider.notifier).refresh();
        answer = const BalanceUnavailable();
        clock = clock.add(const Duration(minutes: 2));
        await c.read(balanceProvider.notifier).refresh();
        final state = c.read(balanceProvider);
        expect(state.status, BalanceStatus.unavailable);
        expect(state.balance?.total, 110, reason: 'keeps the last good value');
      });
    });
  });

  test('ModelCatalog from 0.2.1 without a key is empty', () {
    final catalog = ModelCatalog.fromJson({
      'default': null,
      'routableProviders': <Object?>[],
      'groups': <Object?>[],
      'failures': <Object?>[],
    });
    expect(catalog.models, isEmpty);
  });
}
