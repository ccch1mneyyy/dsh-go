// The model sheet: channel filter, model cards, the capsule effort selector.
// Behaviour, geometry (insets, equal cards, one dismissal handle) and goldens
// (light + dark). Regenerate with
// `flutter test --update-goldens test/chat/model_sheet_test.dart`.

import 'package:dsh_app/state/chat_state.dart';
import 'package:dsh_app/state/models_state.dart';
import 'package:dsh_app/state/settings_state.dart';
import 'package:dsh_app/ui/chat/chat_screen.dart';
import 'package:dsh_app/ui/chat/empty_state.dart';
import 'package:dsh_app/ui/chat/model_sheet.dart';
import 'package:dsh_app/ui/chat/widgets/whale_tail.dart';
import 'package:dsh_app/ui/common/app_sheet.dart';
import 'package:dsh_app/ui/common/segmented_pill.dart';
import 'package:dsh_app/ui/common/sheet_title_bar.dart';
import 'package:dsh_app/ui/theme/theme.dart';
import 'package:dsh_client/dsh_client.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';

import 'support/harness.dart';

const _off = ReasoningEffort('off', 'Off', null);
const _high = ReasoningEffort('high', 'High', null);

/// DeepSeek (two models with efforts) + OpenRouter (one without efforts).
final multiCatalog = ModelCatalog(
  defaultSelection: testCatalog.defaultSelection,
  routableProviders: const ['deepseek-official', 'openrouter'],
  groups: [
    ...testCatalog.groups,
    const ProviderGroup('openrouter', 'OpenRouter', [
      ModelInfo(provider: 'openrouter', id: 'moonshotai/kimi-k2', name: 'Kimi-K2', description: '长上下文，擅长写代码'),
      ModelInfo(
        provider: 'openrouter',
        id: 'z-ai/glm-4.6',
        name: 'GLM-4.6',
        description: '智谱的通用模型',
        efforts: [_off, _high],
        defaultEffort: 'high',
      ),
      ModelInfo(provider: 'openrouter', id: 'qwen/qwen3-coder', name: 'Qwen3-Coder', description: '阿里的代码模型'),
    ]),
  ],
  failures: const [],
);

const _low = ReasoningEffort('low', 'Low', null);
const _medium = ReasoningEffort('medium', 'Medium', null);
const _max = ReasoningEffort('max', 'Max', null);

/// DeepSeek + a custom provider whose models think but name no default
/// effort (what the pi-ai adapter lists for a hand-declared model).
final customCatalog = ModelCatalog(
  defaultSelection: testCatalog.defaultSelection,
  routableProviders: const ['deepseek-official', 'custom-mygw'],
  groups: [
    ...testCatalog.groups,
    const ProviderGroup('custom-mygw', 'My Gateway', [
      ModelInfo(provider: 'custom-mygw', id: 'qwen3-coder', name: 'Qwen3 Coder', efforts: [_off, _low, _medium, _high]),
      ModelInfo(provider: 'custom-mygw', id: 'glm-4.6', name: 'GLM 4.6', efforts: [_off, _high, _max]),
    ]),
  ],
  failures: const [],
);

/// More channels than one capsule row holds.
final crowdedCatalog = ModelCatalog(
  defaultSelection: testCatalog.defaultSelection,
  routableProviders: const [],
  groups: [
    ...multiCatalog.groups,
    for (final (id, name) in const [('siliconflow', 'SiliconFlow'), ('volcengine', '火山引擎方舟'), ('aliyun', '阿里云百炼')])
      ProviderGroup(id, name, [ModelInfo(provider: id, id: '$id-ds', name: 'DeepSeek-V4-Pro')]),
  ],
  failures: const [],
);

ChatHarness _harness(ModelCatalog catalog, {ModelSelection? model}) => ChatHarness(
  session: model == null ? null : 's1',
  states: {if (model != null) 's1': ChatState(loading: false, model: model)},
  catalog: catalog,
);

Future<ChatHarness> _openSheet(
  WidgetTester tester,
  ChatHarness harness, {
  Brightness brightness = Brightness.light,
}) async {
  usePhoneView(tester);
  mockClipboard(tester);
  await tester.pumpWidget(testApp(const ChatScreen(), brightness: brightness, overrides: harness.overrides));
  await pumpFrames(tester, 6);
  await tester.tap(find.byType(ModelChip));
  await pumpFrames(tester, 8);
  return harness;
}

Finder _card(String name) => find.ancestor(of: find.text(name), matching: find.byType(GlassSurface)).first;

ModelSelection? _picked(WidgetTester tester, ChatHarness harness) {
  final container = ProviderScope.containerOf(tester.element(find.byType(ChatScreen)));
  return harness.session == null ? container.read(pendingModelProvider) : harness.controllers['s1']!.models.lastOrNull;
}

void main() {
  setUpAll(() async {
    await loadTestFonts();
    await WhaleSprites.load();
    chatClock = () => DateTime(2026, 10, 23, 15, 20);
  });

  testWidgets('narrow model chip keeps complete actionable speech', (tester) async {
    tester.view.devicePixelRatio = 1;
    tester.view.physicalSize = const Size(360, 800);
    addTearDown(tester.view.reset);
    final semantics = tester.ensureSemantics();
    // A long title: the chip gives up its depth before the title is cut.
    final harness = ChatHarness(
      session: 's1',
      states: {'s1': const ChatState(loading: false, title: '修复登录页重复提交并补上连点测试')},
    );
    await tester.pumpWidget(testApp(const ChatScreen(), overrides: harness.overrides));
    await pumpFrames(tester);
    expect(find.text('V4 Pro'), findsOneWidget);
    expect(find.text('V4 Pro · 高'), findsNothing);
    expect(
      tester.getSemantics(find.bySemanticsLabel('模型：V4 Pro，思考深度高')),
      isSemantics(isButton: true, hasTapAction: true),
    );
    semantics.dispose();
  });

  test('starting effort: the model\'s default, else 中, else the lowest that thinks', () {
    ModelInfo model(List<ReasoningEffort> efforts, {String? defaultEffort}) =>
        ModelInfo(provider: 'p', id: 'm', name: 'M', efforts: efforts, defaultEffort: defaultEffort);
    expect(startingEffort(model(const [])), isNull);
    expect(startingEffort(model(const [_off, _low, _high, _max], defaultEffort: 'high')), 'high');
    expect(startingEffort(model(const [_off, _low, _medium, _high])), 'medium');
    expect(startingEffort(model(const [_off, _high, _max])), 'high');
    expect(startingEffort(model(const [_low, _high])), 'low');
    expect(startingEffort(model(const [_off])), 'off');
    expect(
      startingEffort(model(const [_off, _medium], defaultEffort: 'max')),
      'medium',
      reason: 'a default the model does not list is ignored',
    );
  });

  test('short names drop the DeepSeek prefix', () {
    expect(shortModelName('DeepSeek-V4-Pro'), 'V4 Pro');
    expect(shortModelName('deepseek_v41_flash'), 'V41 Flash');
    expect(shortModelName('GLM-4.6'), 'GLM 4.6');
    expect(shortModelName('DeepSeek'), 'DeepSeek');
  });

  group('behaviour', () {
    testWidgets('one channel: a label, no filter; cards and efforts', (tester) async {
      await _openSheet(tester, _harness(testCatalog));
      expect(find.text('选择模型'), findsOneWidget);
      expect(find.text('DeepSeek'), findsOneWidget);
      expect(find.text('V4 Pro'), findsOneWidget);
      expect(find.text('V41 Flash'), findsOneWidget);
      expect(find.text('思考深度'), findsOneWidget);
      // Only the effort selector is a segmented pill.
      expect(find.byType(SegmentedPill<String>), findsOneWidget);
      for (final label in ['不思考', '低', '高', '最高']) {
        expect(find.text(label), findsOneWidget);
      }
    });

    testWidgets('the filter opens on the current channel and only filters', (tester) async {
      final harness = await _openSheet(
        tester,
        _harness(
          multiCatalog,
          model: const ModelSelection(provider: 'openrouter', model: 'z-ai/glm-4.6', reasoningEffort: 'off'),
        ),
      );
      expect(find.byType(SegmentedPill<String>), findsNWidgets(2));
      expect(find.text('GLM 4.6'), findsOneWidget);
      expect(find.text('V4 Pro'), findsNothing);

      await tester.tap(find.text('DeepSeek'));
      await pumpFrames(tester, 4);
      expect(find.text('V4 Pro'), findsOneWidget);
      expect(find.text('GLM 4.6'), findsNothing);
      expect(harness.controllers['s1']!.models, isEmpty, reason: 'filter');
      // The selected model's efforts stay on screen while browsing.
      expect(find.text('思考深度'), findsOneWidget);

      await tester.tap(find.text('V41 Flash'));
      await pumpFrames(tester, 4);
      final picked = _picked(tester, harness)!;
      expect(picked.provider, 'deepseek-official');
      expect(picked.model, 'deepseek-flash');
      expect(picked.reasoningEffort, 'off', reason: 'supported: kept');
      expect(find.text('选择模型'), findsOneWidget, reason: 'stays open');
    });

    testWidgets('a model without efforts folds the effort selector away', (tester) async {
      final harness = await _openSheet(tester, _harness(multiCatalog));
      await tester.tap(find.text('OpenRouter'));
      await pumpFrames(tester, 4);
      await tester.tap(find.text('Kimi K2'));
      await pumpFrames(tester, 6);
      final picked = _picked(tester, harness)!;
      expect(picked.model, 'moonshotai/kimi-k2');
      expect(picked.reasoningEffort, isNull);
      expect(find.text('思考深度'), findsNothing);

      // Back to a model with efforts: its default comes in.
      await tester.tap(find.text('GLM 4.6'));
      await pumpFrames(tester, 6);
      expect(find.text('思考深度'), findsOneWidget);
      expect(_picked(tester, harness)!.reasoningEffort, 'high');
    });

    testWidgets('a custom model with no default starts at 中, else its lowest thinking level', (tester) async {
      final harness = await _openSheet(
        tester,
        _harness(
          customCatalog,
          model: const ModelSelection(provider: 'deepseek-official', model: 'deepseek-v4-pro', reasoningEffort: 'max'),
        ),
      );
      await tester.tap(find.text('My Gateway'));
      await pumpFrames(tester, 4);
      await tester.tap(find.text('Qwen3 Coder'));
      await pumpFrames(tester, 6);
      expect(_picked(tester, harness)!.reasoningEffort, 'medium', reason: 'not 不思考');
      expect(tester.widget<SegmentedPill<String>>(find.byType(SegmentedPill<String>).last).selected, 'medium');

      await tester.tap(find.text('GLM 4.6'));
      await pumpFrames(tester, 6);
      expect(_picked(tester, harness)!.reasoningEffort, 'high', reason: 'no 中: the lowest that thinks');
    });

    testWidgets('an effort applies at once, then the sheet closes', (tester) async {
      final harness = await _openSheet(tester, _harness(testCatalog));
      await tester.tap(find.text('最高'));
      await tester.pump();
      expect(_picked(tester, harness)!.reasoningEffort, 'max');
      expect(find.text('思考深度'), findsOneWidget, reason: 'thumb first');
      await pumpFrames(tester, 8);
      expect(find.text('思考深度'), findsNothing);
      expect(find.text('V4 Pro · 最高'), findsOneWidget);
    });

    testWidgets('cards read as selectable buttons to a screen reader', (tester) async {
      final semantics = tester.ensureSemantics();
      final harness = await _openSheet(tester, _harness(testCatalog));
      expect(
        tester.getSemantics(find.bySemanticsLabel('V4 Pro，更强的推理与编码')),
        isSemantics(isButton: true, isSelected: true, hasTapAction: true),
      );
      final flash = find.bySemanticsLabel('V41 Flash，更快、更省');
      expect(tester.getSemantics(flash), isSemantics(isButton: true, isSelected: false, hasTapAction: true));
      tester.semantics.tap(find.semantics.byLabel('V41 Flash，更快、更省'));
      await pumpFrames(tester, 2);
      expect(_picked(tester, harness)!.model, 'deepseek-flash');
      semantics.dispose();
    });

    testWidgets('crowded channels scroll sideways instead of squeezing', (tester) async {
      await _openSheet(tester, _harness(crowdedCatalog));
      expect(find.byType(SegmentedPill<String>), findsOneWidget);
      expect(find.byType(ListView), findsOneWidget);
      await tester.tap(find.text('OpenRouter'));
      await pumpFrames(tester, 4);
      expect(find.text('Kimi K2'), findsOneWidget);
      expect(tester.takeException(), isNull);
    });

    testWidgets('no key: one line and one button', (tester) async {
      await _openSheet(
        tester,
        ChatHarness(
          settings: const AppSettings(loaded: true),
          catalog: ModelCatalog.fromJson(const {'groups': <Object?>[]}),
        ),
      );
      expect(find.text('需要 API Key'), findsOneWidget);
      expect(find.widgetWithText(FilledButton, '填写 API Key'), findsOneWidget);
      // The other way in: a provider with its own Base URL and key.
      expect(find.widgetWithText(TextButton, '添加其他渠道'), findsOneWidget);
    });

    testWidgets('set up but empty: one way to the channels page', (tester) async {
      await _openSheet(
        tester,
        ChatHarness(
          settings: const AppSettings(loaded: true, customProviderIds: {'custom-mygw'}),
          catalog: ModelCatalog.fromJson(const {'groups': <Object?>[]}),
        ),
      );
      expect(find.text('暂无可用模型'), findsOneWidget);
      expect(find.widgetWithText(FilledButton, '管理渠道'), findsOneWidget);
      expect(find.text('添加其他渠道'), findsNothing);
    });
  });

  testWidgets('a long model name wraps instead of truncating', (tester) async {
    const longName = 'DeepSeek-V4-Pro-Extra-Long-Reasoning-Edition-With-Many-More-Words';
    final catalog = ModelCatalog(
      defaultSelection: testCatalog.defaultSelection,
      routableProviders: const ['deepseek'],
      failures: const [],
      groups: const [
        ProviderGroup('deepseek', 'DeepSeek', [
          ModelInfo(provider: 'deepseek', id: 'short', name: 'V4 Pro'),
          ModelInfo(provider: 'deepseek', id: 'long', name: longName),
        ]),
      ],
    );
    await _openSheet(tester, _harness(catalog));

    final shortCard = tester.getRect(_card('V4 Pro'));
    final longCard = tester.getRect(_card(shortModelName(longName)));
    // The wrapped name takes extra lines, so its card grows taller.
    expect(longCard.height, greaterThan(shortCard.height));
    expect(tester.takeException(), isNull);
  });

  group('geometry', () {
    for (final scale in [1.0, 1.3]) {
      testWidgets('20 in from both sides, stacked full-width cards (text ×$scale)', (tester) async {
        tester.platformDispatcher.textScaleFactorTestValue = scale;
        addTearDown(tester.platformDispatcher.clearTextScaleFactorTestValue);
        await _openSheet(tester, _harness(multiCatalog));
        final width = tester.view.physicalSize.width / tester.view.devicePixelRatio;

        final pro = tester.getRect(_card('V4 Pro'));
        final flash = tester.getRect(_card('V41 Flash'));
        // Single column: every card spans the full sheet width.
        expect(pro.left, moreOrLessEquals(SheetTitleBar.inset, epsilon: 0.5));
        expect(width - pro.right, moreOrLessEquals(SheetTitleBar.inset, epsilon: 0.5));
        expect(flash.left, moreOrLessEquals(pro.left, epsilon: 0.5));
        expect(flash.right, moreOrLessEquals(pro.right, epsilon: 0.5));
        expect(pro.width, moreOrLessEquals(flash.width, epsilon: 0.5));
        expect(flash.top - pro.bottom, moreOrLessEquals(12, epsilon: 0.5));

        // Filter and effort pill span exactly the cards' width.
        final pills = find.byType(SegmentedPill<String>);
        for (var i = 0; i < pills.evaluate().length; i++) {
          final pill = tester.getRect(pills.at(i));
          expect(pill.left, moreOrLessEquals(pro.left, epsilon: 0.5));
          expect(pill.right, moreOrLessEquals(pro.right, epsilon: 0.5));
        }

        // Removing the close key must also reclaim its column and gutter.
        final title = tester.getRect(find.text('选择模型'));
        expect(find.byType(SheetDragHandle), findsOneWidget);
        expect(find.byTooltip('关闭'), findsNothing);
        expect(title.left, moreOrLessEquals(SheetTitleBar.inset, epsilon: 0.5));
        expect(width - title.right, moreOrLessEquals(SheetTitleBar.inset, epsilon: 0.5));
        expect(tester.takeException(), isNull);
      });
    }
  });

  for (final brightness in Brightness.values) {
    final suffix = brightness == Brightness.dark ? 'dark' : 'light';

    group('goldens ($suffix)', () {
      testWidgets('two channels, effort shown', (tester) async {
        await _openSheet(
          tester,
          _harness(
            multiCatalog,
            model: const ModelSelection(provider: 'openrouter', model: 'z-ai/glm-4.6', reasoningEffort: 'high'),
          ),
          brightness: brightness,
        );
        await expectLater(find.byType(MaterialApp), matchesGoldenFile('goldens/model_sheet_channels_$suffix.png'));
      });

      testWidgets('a model without efforts', (tester) async {
        await _openSheet(
          tester,
          _harness(
            multiCatalog,
            model: const ModelSelection(provider: 'openrouter', model: 'moonshotai/kimi-k2'),
          ),
          brightness: brightness,
        );
        await expectLater(find.byType(MaterialApp), matchesGoldenFile('goldens/model_sheet_no_effort_$suffix.png'));
      });

      testWidgets('crowded channels', (tester) async {
        await _openSheet(tester, _harness(crowdedCatalog), brightness: brightness);
        await expectLater(find.byType(MaterialApp), matchesGoldenFile('goldens/model_sheet_crowded_$suffix.png'));
      });
    });
  }
}
