// Taps in plugin views become invokes (docs/design/native-plugins-views.md
// §4); read-only views draw no buttons; the pieces are measured, not eyed.

import 'dart:async';
import 'dart:convert';

import 'package:dsh_app/ui/chat/dsh_ui/dsh_ui_blocks.dart';
import 'package:dsh_app/ui/chat/dsh_ui/dsh_ui_widgets.dart' show DshUiOptionRow;
import 'package:dsh_app/ui/chat/render/markdown_body.dart';
import 'package:dsh_app/ui/plugins/view/plugin_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'fixtures.dart';
import 'support.dart';

class _Recorder {
  final calls = <PluginAction>[];
  Completer<bool>? pending;
  bool answer = true;

  Future<bool> call(PluginAction action) {
    calls.add(action);
    final c = pending;
    return c == null ? Future.value(answer) : c.future;
  }
}

Future<void> pumpView(
  WidgetTester tester,
  Object view, {
  Object? data,
  PluginActionHandler? onAction,
  PluginImageResolver? images,
  bool frame = true,
}) async {
  usePhoneView(tester);
  final body = PluginView(view: view, data: data, onAction: onAction, imageResolver: images);
  await tester.pumpWidget(
    testApp(
      Scaffold(
        body: SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          child: frame ? PluginFrame(pluginName: '测试', child: body) : body,
        ),
      ),
    ),
  );
  await pumpFrames(tester);
}

void main() {
  setUpAll(loadTestFonts);

  group('invoke', () {
    testWidgets('buttons send their id and args', (tester) async {
      final r = _Recorder();
      await pumpView(tester, usagePanel, data: usageData, onAction: r.call);
      await tester.tap(find.text('刷新'));
      await tester.tap(find.text('查看明细'));
      await pumpFrames(tester);
      expect(r.calls.map((a) => '${a.id} ${jsonEncode(a.args)} ${a.source.name}'), [
        'refresh {} button',
        'open {"page":"detail"} button',
      ]);
      expect(r.calls.first.path, 'view.children[3].items[0]');
    });

    testWidgets('list rows with an action are tappable, with a spinner while waiting', (tester) async {
      final r = _Recorder()..pending = Completer<bool>();
      await pumpView(tester, usagePanel, data: usageData, onAction: r.call);
      await tester.tap(find.text('周报整理'));
      await tester.pump();
      expect(r.calls, isEmpty, reason: 'rows without an action do nothing');
      await tester.tap(find.text('重构登录流程'));
      await tester.pump();
      expect(r.calls.single.id, 'openSession');
      expect(r.calls.single.args, {'id': 's1'});
      expect(r.calls.single.source, PluginActionSource.row);
      expect(find.byType(CircularProgressIndicator), findsOneWidget);
      // A second tap while waiting is ignored.
      await tester.tap(find.text('重构登录流程'));
      await tester.pump();
      expect(r.calls, hasLength(1));
      r.pending!.complete(true);
      await pumpFrames(tester);
      expect(find.byType(CircularProgressIndicator), findsNothing);
    });

    testWidgets('options: value, optimistic, reverted on failure', (tester) async {
      final r = _Recorder()..answer = false;
      await pumpView(tester, choiceView, data: {'range': '30d'}, onAction: r.call);
      bool picked(String label) => tester
          .widget<DshUiOptionRow>(find.ancestor(of: find.text(label), matching: find.byType(DshUiOptionRow)))
          .selected;
      expect(picked('近 30 天'), isTrue);
      await tester.tap(find.text('今年'));
      await pumpFrames(tester);
      expect(r.calls.single.args, {'value': 'year'});
      expect(r.calls.single.source, PluginActionSource.option);
      // The plugin said no: back to what it last pushed.
      expect(picked('近 30 天'), isTrue);
      expect(picked('今年'), isFalse);
    });

    testWidgets('multi options send the whole selection', (tester) async {
      final r = _Recorder();
      await pumpView(tester, {
        'type': 'options',
        'id': 'tags',
        'multi': true,
        'options': ['工作', '生活', '学习'],
        'selected': ['生活'],
      }, onAction: r.call);
      await tester.tap(find.text('工作'));
      await pumpFrames(tester);
      await tester.tap(find.text('生活'));
      await pumpFrames(tester);
      expect(r.calls.map((a) => a.args), [
        {
          'values': ['工作', '生活'],
        },
        {
          'values': ['工作'],
        },
      ]);
    });

    for (final multi in [false, true]) {
      testWidgets('option invoke enforces the serialized 4 KiB boundary (${multi ? 'multi' : 'single'})', (
        tester,
      ) async {
        final r = _Recorder();
        String keyFor(int length) => List.filled(length, 'x').join();
        Map<String, Object> argsFor(String key) => multi
            ? {
                'values': [key],
              }
            : {'value': key};
        var exact = '';
        for (var length = 0; length <= 4096; length++) {
          final candidate = keyFor(length);
          if (utf8.encode(jsonEncode(argsFor(candidate))).length == 4096) {
            exact = candidate;
            break;
          }
        }
        expect(exact, isNotEmpty);

        Map<String, Object> view(String key) => {
          'type': 'options',
          'id': 'boundary',
          'multi': multi,
          'options': [
            {'label': 'Limite', 'value': key},
          ],
        };

        await pumpView(tester, view(exact), onAction: r.call);
        await tester.tap(find.text('Limite'));
        await pumpFrames(tester);
        expect(r.calls, hasLength(1));
        expect(utf8.encode(jsonEncode(r.calls.single.args)), hasLength(4096));

        final tooLarge = '$exact x';
        await pumpView(tester, {
          ...view(tooLarge),
          'options': [
            {'label': 'Manter', 'value': 'keep'},
            {'label': 'Limite', 'value': tooLarge},
          ],
          'selected': ['keep'],
        }, onAction: r.call);
        await tester.tap(find.text('Limite'));
        await pumpFrames(tester);
        expect(r.calls, hasLength(1), reason: 'oversized selection must not be dispatched');
        final kept = tester.widget<DshUiOptionRow>(
          find.ancestor(of: find.text('Manter'), matching: find.byType(DshUiOptionRow)),
        );
        final rejected = tester.widget<DshUiOptionRow>(
          find.ancestor(of: find.text('Limite'), matching: find.byType(DshUiOptionRow)),
        );
        expect(kept.selected, isTrue);
        expect(rejected.selected, isFalse);
      });
    }

    testWidgets('option invoke uses actual JSON bytes for escaped strings', (tester) async {
      final r = _Recorder();
      final newlineValue = List.filled(2042, '\n').join();
      await pumpView(tester, {
        'type': 'options',
        'id': 'escaped',
        'options': [
          {'label': 'Newlines', 'value': newlineValue},
        ],
      }, onAction: r.call);
      await tester.tap(find.text('Newlines'));
      await pumpFrames(tester);
      expect(utf8.encode(jsonEncode(r.calls.single.args)).length, 4096);

      final unpairedSurrogates = List.filled(700, String.fromCharCode(0xd800)).join();
      await pumpView(tester, {
        'type': 'options',
        'id': 'escaped',
        'options': [
          {'label': 'Surrogates', 'value': unpairedSurrogates},
        ],
      }, onAction: r.call);
      await tester.tap(find.text('Surrogates'));
      await pumpFrames(tester);
      expect(r.calls, hasLength(1), reason: 'JSON-escaped surrogate payload is over the byte limit');
    });

    testWidgets('confirm sends confirmed: true / false', (tester) async {
      final r = _Recorder();
      await pumpView(tester, choiceView, data: const {}, onAction: r.call);
      await tester.tap(find.text('保留'));
      await pumpFrames(tester);
      await tester.tap(find.text('重置'));
      await pumpFrames(tester);
      expect(r.calls.map((a) => '${a.id} ${jsonEncode(a.args)}'), [
        'reset {"confirmed":false}',
        'reset {"confirmed":true}',
      ]);
    });

    testWidgets('a throwing handler counts as a failure', (tester) async {
      await pumpView(tester, actionsView, onAction: (_) => throw StateError('x'));
      await tester.tap(find.text('续费'));
      await pumpFrames(tester);
      expect(tester.takeException(), isNull);
      expect(find.byType(CircularProgressIndicator), findsNothing);
    });
  });

  testWidgets('an empty button group draws nothing and leaves no gap', (tester) async {
    await pumpView(
      tester,
      {
        'type': 'stack',
        'children': [
          {'type': 'text', 'text': '上'},
          {
            'type': 'actions',
            'items': {r'$': 'data.buttons'},
          },
          {'type': 'text', 'text': '下'},
        ],
      },
      data: {'buttons': []},
      onAction: (_) async => true,
      frame: false,
    );
    expect(find.text('暂无数据'), findsNothing);
    final top = tester.getRect(find.text('上'));
    final bottom = tester.getRect(find.text('下'));
    // One gap (16) between the two texts, as if the group were not there.
    expect(bottom.top - top.bottom, lessThan(24));
  });

  group('read-only', () {
    testWidgets('no buttons, no confirm, options ticked only, rows inert', (tester) async {
      await pumpView(
        tester,
        {
          'type': 'stack',
          'children': [actionsView, choiceView, listView],
        },
        data: {'range': '7d'},
      );
      expect(find.text('续费'), findsNothing);
      expect(find.text('重置'), findsNothing);
      expect(find.text('近 7 天'), findsOneWidget);
      final taps = find.byType(InkWell).evaluate().map((e) => e.widget as InkWell);
      expect(taps.where((w) => w.onTap != null), isEmpty);
    });
  });

  group('text, images', () {
    testWidgets('restricted text: no links, no images, no Markdown engine', (tester) async {
      await pumpView(tester, textView);
      expect(find.byType(MarkdownBody), findsNothing);
      final shown = tester.widgetList<RichText>(find.byType(RichText)).map((t) => t.text.toPlainText()).join('\n');
      expect(shown, contains('已同步'));
      expect(shown, contains('详情见 设置 图。'));
      expect(shown, isNot(contains('https://')));
      expect(shown, isNot(contains('**')));
    });

    testWidgets('asset images go through the resolver; others never load', (tester) async {
      final semantics = tester.ensureSemantics();
      final asked = <String>{};
      await pumpView(
        tester,
        {
          'type': 'stack',
          'children': [
            {'type': 'image', 'src': 'asset:photos/a.png', 'aspect': 2},
            {'type': 'image', 'src': 'https://tracker.example/p.png'},
            imageView,
          ],
        },
        images: (src) {
          asked.add(src);
          return MemoryImage(duskBytes);
        },
      );
      await tester.runAsync(() => Future<void>.delayed(const Duration(milliseconds: 100)));
      await pumpFrames(tester);
      expect(asked, {'asset:photos/a.png'});
      expect(find.text('图片无法显示'), findsOneWidget);
      expect(find.bySemanticsLabel('黄昏的海面'), findsOneWidget);
      semantics.dispose();
    });

    testWidgets('no resolver: an asset image is a placeholder', (tester) async {
      await pumpView(tester, {'type': 'image', 'src': 'asset:photos/a.png'});
      expect(find.text('图片无法显示'), findsOneWidget);
    });
  });

  testWidgets('360 wide at 1.3× text: nothing overflows', (tester) async {
    usePhoneView(tester);
    tester.view.physicalSize = const Size(720, 3600);
    await tester.pumpWidget(
      testApp(
        MediaQuery.withClampedTextScaling(
          minScaleFactor: 1.3,
          maxScaleFactor: 1.3,
          child: Scaffold(
            body: SingleChildScrollView(
              padding: const EdgeInsets.all(16),
              child: Column(
                children: [
                  for (final (view, data) in [
                    (listView, null),
                    (keyValueView, null),
                    (progressView, null),
                    (tableView, null),
                    (actionsView, null),
                    (imageView, null),
                    (usagePanel, usageData),
                    (choiceView, {'range': '7d'}),
                    (textView, null),
                    (weatherCard, null),
                  ])
                    PluginFrame(
                      pluginName: '一个名字相当长的插件，长到放不下',
                      trailing: const SizedBox.square(dimension: 24),
                      child: PluginView(view: view, data: data, onAction: (_) async => true),
                    ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
    await pumpFrames(tester);
    expect(tester.takeException(), isNull);
  });

  group('geometry', () {
    testWidgets('two buttons: equal widths, mirrored edges', (tester) async {
      await pumpView(tester, actionsView, onAction: (_) async => true, frame: false);
      final block = tester.getRect(find.byType(DshUiActionsBlock).first);
      final a = tester.getRect(find.byType(DshUiActionButton).at(0));
      final b = tester.getRect(find.byType(DshUiActionButton).at(1));
      expect(a.width, moreOrLessEquals(b.width, epsilon: 0.01));
      expect(a.height, DshUiActionsBlock.height);
      expect(a.left - block.left, moreOrLessEquals(block.right - b.right, epsilon: 0.01));
      expect(b.left - a.right, moreOrLessEquals(12, epsilon: 0.01));
      expect(a.top, b.top);
      // Three or more: stacked, full width, 8 apart.
      final rows = find.byType(DshUiActionButton);
      final c = tester.getRect(rows.at(2));
      final d = tester.getRect(rows.at(3));
      final stack = tester.getRect(find.byType(DshUiActionsBlock).last);
      expect(c.width, stack.width);
      expect(d.top - c.bottom, moreOrLessEquals(8, epsilon: 0.01));
    });

    testWidgets('list rows: 52 single, 64 two lines; icons and titles in columns', (tester) async {
      await pumpView(tester, listView, onAction: (_) async => true, frame: false);
      final well = tester.getRect(find.byType(DshUiListBlock));
      final single = tester.getRect(find.ancestor(of: find.text('单行'), matching: find.byType(ConstrainedBox)).first);
      final twoLine = tester.getRect(find.ancestor(of: find.text('两行'), matching: find.byType(ConstrainedBox)).first);
      expect(single.height, DshUiListBlock.rowHeight);
      expect(twoLine.height, DshUiListBlock.twoLineHeight);
      expect(well.height, DshUiListBlock.rowHeight * 2 + DshUiListBlock.twoLineHeight);
      final titles = ['单行', '两行', '可点'].map((t) => tester.getRect(find.text(t)).left).toSet();
      expect(titles, hasLength(1), reason: 'a row without an icon keeps the title column');
      final icon = tester.getRect(find.byType(Icon).first);
      expect(icon.left - well.left, 12);
      final chevron = tester.getRect(find.byType(Icon).last);
      expect(well.right - chevron.right, 12);
    });

    testWidgets('frame: the mark and the name share a centre line', (tester) async {
      await pumpView(tester, keyValueView);
      final mark = tester.getRect(find.byType(PluginMark));
      final name = tester.getRect(find.text('测试'));
      expect(mark.size, const Size.square(PluginFrame.markSize));
      expect(mark.center.dy, moreOrLessEquals(name.center.dy, epsilon: 0.75));
      final card = tester.getRect(find.byType(PluginFrame));
      expect(mark.left - card.left, 16);
    });

    testWidgets('progress: a 6-high bar the width of the block', (tester) async {
      await pumpView(tester, progressView, frame: false);
      final block = tester.getRect(find.byType(DshUiProgressBlock).first);
      final bar = tester.getRect(
        find.descendant(of: find.byType(DshUiProgressBlock).first, matching: find.byType(DecoratedBox)).first,
      );
      expect(bar.height, DshUiProgressBlock.barHeight);
      expect(bar.width, block.width);
    });
  });
}
