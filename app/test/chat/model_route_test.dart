import 'package:dsh_app/state/models_state.dart';
import 'package:dsh_app/ui/chat/model_sheet.dart';
import 'package:dsh_client/dsh_client.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'support/harness.dart';

const official = ModelSelection(provider: 'deepseek-official', model: 'deepseek-flash');
const custom = ModelInfo(provider: 'custom-gateway', id: 'deepseek-flash', name: 'Gateway Flash');
final customOnly = ModelCatalog(
  defaultSelection: official,
  routableProviders: const ['custom-gateway'],
  groups: const [
    ProviderGroup('custom-gateway', 'Gateway', [custom]),
  ],
  failures: const [],
);

void main() {
  test('a missing official route does not resolve to a same-named custom model', () {
    expect(findModel(customOnly, official), isNull);
    expect(modelShortName(official, customOnly), 'Flash');
    expect(
      findModel(customOnly, const ModelSelection(provider: 'custom-gateway', model: 'deepseek-flash')),
      same(custom),
    );
    expect(findModel(customOnly, null), isNull);
    expect(findModel(null, official), isNull);
  });

  test('same model ids retain their distinct providers', () {
    const builtin = ModelInfo(provider: 'deepseek-official', id: 'deepseek-flash', name: 'Official Flash');
    final both = ModelCatalog(
      defaultSelection: official,
      routableProviders: const ['custom-gateway', 'deepseek-official'],
      groups: const [
        ProviderGroup('custom-gateway', 'Gateway', [custom]),
        ProviderGroup('deepseek-official', 'DeepSeek', [builtin]),
      ],
      failures: const [],
    );
    expect(findModel(both, official), same(builtin));
    expect(findModel(both, const ModelSelection(provider: 'custom-gateway', model: 'deepseek-flash')), same(custom));
  });

  test('an effort the model no longer lists is dropped', () {
    const stale = ModelSelection(provider: 'custom-gateway', model: 'deepseek-flash', reasoningEffort: 'off');
    final normalized = normalizeModelSelection(customOnly, stale);
    expect(normalized.provider, 'custom-gateway');
    expect(normalized.model, 'deepseek-flash');
    expect(normalized.reasoningEffort, isNull);

    final withEffort = ModelCatalog(
      defaultSelection: official,
      routableProviders: const ['custom-gateway'],
      groups: const [
        ProviderGroup('custom-gateway', 'Gateway', [
          ModelInfo(
            provider: 'custom-gateway',
            id: 'deepseek-flash',
            name: 'Gateway Flash',
            efforts: [ReasoningEffort('off', 'Off', null), ReasoningEffort('high', 'High', null)],
          ),
        ]),
      ],
      failures: const [],
    );
    expect(normalizeModelSelection(withEffort, stale).reasoningEffort, 'off');
    expect(
      normalizeModelSelection(
        withEffort,
        const ModelSelection(provider: 'custom-gateway', model: 'deepseek-flash', reasoningEffort: 'max'),
      ).reasoningEffort,
      isNull,
    );

    // An unknown route is the Host's call, not this normalization's.
    const unknown = ModelSelection(provider: 'elsewhere', model: 'm', reasoningEffort: 'off');
    expect(normalizeModelSelection(customOnly, unknown).reasoningEffort, 'off');
  });

  testWidgets('unavailable official route leaves custom card unselected until explicitly picked', (tester) async {
    ModelSelection? picked;
    await tester.pumpWidget(
      testApp(
        Builder(
          builder: (context) => Scaffold(
            body: TextButton(
              onPressed: () =>
                  showModelSheet(context, current: official, onSelected: (selection) => picked = selection),
              child: const Text('Open'),
            ),
          ),
        ),
        overrides: [modelCatalogProvider.overrideWith((ref) async => customOnly)],
      ),
    );
    await tester.tap(find.text('Open'));
    await tester.pumpAndSettle();
    Semantics card() => tester.widget<Semantics>(
      find.byWidgetPredicate((widget) => widget is Semantics && widget.properties.label == 'Gateway Flash'),
    );
    expect(card().properties.selected, isFalse);
    expect(picked, isNull);
    await tester.tap(find.text('Gateway Flash'));
    await tester.pumpAndSettle();
    expect(picked?.provider, 'custom-gateway');
    expect(picked?.model, 'deepseek-flash');
    expect(card().properties.selected, isTrue);
  });
}
