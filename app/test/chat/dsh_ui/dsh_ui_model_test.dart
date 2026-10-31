// Portions derived from DS Bot (https://github.com/Fei2411/DeepSeek-Bot), Apache-2.0, Copyright 2026 Fei2411 and the DS Bot contributors. See THIRD_PARTY_NOTICES.md.
// Modified: cases from `ds-bot/test/views.test.js` translated to Dart;
// expectations follow the app's lenient rules (unknown properties ignored, a
// broken child becomes a placeholder, limits truncate, only a broken root
// fails), its smaller catalog and limits; Chinese messages.

import 'dart:convert';

import 'package:dsh_app/ui/chat/dsh_ui/dsh_ui.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:dsh_app/l10n/l10n.dart';

Map<String, Object?> text([String value = 'hello']) => {'type': 'text', 'text': value};
Map<String, Object?> metric([String label = '进度', Object value = '70%']) => {
  'type': 'metric',
  'label': label,
  'value': value,
};
Map<String, Object?> options([String id = 'pick', Map<String, Object?> extra = const {}]) => {
  'type': 'options',
  'id': id,
  'options': [
    {'label': 'A'},
    {'label': 'B'},
    {'label': 'C', 'description': 'third'},
  ],
  ...extra,
};
Map<String, Object?> confirm([String id = 'go']) => {
  'type': 'confirm',
  'id': id,
  'confirmLabel': 'Ship',
  'cancelLabel': 'Wait',
};
Map<String, Object?> chart() => {
  'type': 'chart',
  'kind': 'bar',
  'categories': ['5月', '6月', '7月'],
  'series': [
    {
      'name': '支出',
      'values': [3800, 4100, 3650],
    },
  ],
  'unit': '元',
};
Map<String, Object?> stack(List<Object?> children) => {'type': 'stack', 'children': children};

DshUiParse parse(Object? json) => parseDshUiUncached(jsonEncode(json));

DshUiView ok(Object? json) {
  final parsed = parse(json);
  if (parsed is DshUiInvalid) fail('expected a view, got ${parsed.error}');
  return (parsed as DshUiParsed).view;
}

DshUiIssue invalid(Object? json) {
  final parsed = parse(json);
  if (parsed is DshUiParsed) fail('expected invalid, got a view');
  return (parsed as DshUiInvalid).error;
}

List<DshUiNode> children(DshUiView view) => (view.root as DshUiLayout).children;

/// `count` component nodes, packed under the 16-child cap.
Map<String, Object?> nodes(int count) {
  if (count == 1) return text('x');
  final rest = count - 1;
  final width = rest < 16 ? rest : 16;
  final base = rest ~/ width;
  final extra = rest % width;
  return stack([for (var i = 0; i < width; i++) nodes(base + (i < extra ? 1 : 0))]);
}

void main() {
  group('ported from views.test.js', () {
    test('accepts every component and reports whether the card can be answered', () {
      for (final json in [text(), metric(), chart()]) {
        expect(ok(json).interactive, isFalse, reason: '${json['type']}');
      }
      for (final json in [options(), confirm()]) {
        expect(ok(json).interactive, isTrue, reason: '${json['type']}');
      }
      final card = ok(stack([text(), metric('进度', 70), chart(), options(), confirm('ship')]));
      expect(card.interactive, isTrue);
      expect(card.issues, isEmpty);
      final metricNode = children(card)[1] as DshUiMetric;
      expect(metricNode.value, '70');
      final toned = ok({'type': 'metric', 'label': 'n', 'value': 70, 'tone': 'good'});
      expect((toned.root as DshUiMetric).tone, DshUiTone.good);
    });

    test('normalize unwraps XML-style arrays and coerces numeric strings', () {
      final wrapped = {
        'type': 'stack',
        'children': {
          'item': [
            text(),
            {
              'type': 'options',
              'id': 'env',
              'options': {
                'item': [
                  {'label': 'staging'},
                  {'label': 'prod'},
                ],
              },
            },
          ],
        },
      };
      final unwrapped = normalizeDshUi(wrapped) as Map<String, Object?>;
      expect(unwrapped['children'], isA<List<Object?>>());
      final second = (unwrapped['children'] as List)[1] as Map;
      expect(second['options'], isA<List<Object?>>());
      expect(ok(wrapped).interactive, isTrue);
      // Numeric strings land only on the numeric fields, never on labels or text.
      expect(normalizeDshUi({'type': 'progress', 'label': '70', 'percent': '70'}), {
        'type': 'progress',
        'label': '70',
        'percent': 70,
      });
      expect(normalizeDshUi({'type': 'metric', 'label': '70', 'value': '70'}), {
        'type': 'metric',
        'label': '70',
        'value': 70,
      });
      expect(normalizeDshUi(text('70')), text('70'), reason: 'text stays a string');
      expect(normalizeDshUi(metric('进度', '70%')), metric('进度', '70%'), reason: 'a non-numeric string stays a string');
      expect(normalizeDshUi({'value': 'NaN'}), {'value': 'NaN'});
      // Input is not mutated.
      expect(wrapped['children'], isA<Map<String, Object?>>());
      // A provider may nest the wrapper: { item: { item: [...] } } collapses too.
      final nested = ok({
        'type': 'stack',
        'children': {
          'item': {
            'item': [text()],
          },
        },
      });
      expect(children(nested).single, isA<DshUiText>());
    });

    test('an unknown component is a placeholder with the path and the catalog', () {
      final view = ok(
        stack([
          text(),
          metric(),
          {
            'type': 'gauge',
            'data': [1],
          },
        ]),
      );
      final placeholder = children(view)[2] as DshUiPlaceholder;
      expect(placeholder.issue.path, 'view.children[2].type');
      expect(
        placeholder.issue.message,
        '未知组件 "gauge"；可用：stack, row, text, metric, chart, compare, steps, callout, options, confirm',
      );
      expect(view.issues, contains(placeholder.issue));
      // The other children still draw.
      expect(children(view)[0], isA<DshUiText>());
      expect(children(view)[1], isA<DshUiMetric>());

      // A broken root fails the whole block.
      expect(invalid(null).toString(), 'view：应该是一个组件对象');
      expect(invalid(<Object?>[]).path, 'view.children');
      expect(invalid({'type': 'text'}).toString(), 'view.text：应该是字符串');
      expect(invalid({'type': 'stack'}).path, 'view.children');
      expect(invalid({'type': 'stack', 'children': <Object?>[]}).message, contains('1 到 16'));
      expect(invalid({'type': 'nope'}).path, 'view.type');

      // Lenient where DS Bot is strict: unknown properties and tones.
      expect(ok({'type': 'text', 'text': 'hi', 'style': 'red'}).issues, isEmpty);
      final toned = ok({'type': 'metric', 'label': 'n', 'value': '1', 'tone': 'nope'});
      expect((toned.root as DshUiMetric).tone, isNull);
      expect(toned.issues.single.path, 'view.tone');

      // Too long a text is clipped and marked, not rejected.
      final long = ok({'type': 'text', 'text': 'x' * 2001});
      expect((long.root as DshUiText).text.length, 2001); // 2000 + '…'
      expect(long.root.truncation, '已截断：文字过长');
      expect(long.issues.single.message, '2001 个字符，超过上限 2000');
    });

    test('options, depth, node and child limits truncate instead of rejecting', () {
      final tooMany = ok(
        options('pick', {
          'options': [
            for (var i = 0; i < 9; i++) {'label': 'o$i'},
          ],
        }),
      );
      expect((tooMany.root as DshUiOptions).options, hasLength(8));
      expect(tooMany.root.truncation, '已截断：只显示前 8 个选项');

      expect(invalid(options('pick', {'options': <Object?>[]})).path, 'view.options');
      final dup = ok(
        options('pick', {
          'options': [
            {'label': 'A'},
            {'label': 'A'},
          ],
        }),
      );
      expect((dup.root as DshUiOptions).labels, ['A']);
      expect(dup.issues.single.message, contains('重复的 label "A"'));

      // Six levels draw; the seventh becomes a placeholder.
      Map<String, Object?> deep = text();
      for (var level = 1; level < 6; level++) {
        deep = stack([deep]);
      }
      expect(ok(deep).nodes.whereType<DshUiPlaceholder>(), isEmpty);
      final tooDeep = ok(stack([deep]));
      final leaf = tooDeep.nodes.whereType<DshUiPlaceholder>().single;
      expect(leaf.issue.message, '第 7 层，超过上限 6 层');

      expect(ok(nodes(40)).nodes, hasLength(40));
      final over = ok(nodes(41));
      expect(over.nodes, hasLength(40));
      expect(over.truncated, isTrue);
      expect(over.issues.map((i) => i.message), contains(contains('超过 40 个组件')));

      // Ids are not checked: the reply carries labels, not ids.
      expect(ok(stack([options('same'), confirm('same')])).interactive, isTrue);

      final many = ok(stack([for (var i = 0; i < 17; i++) text()]));
      expect(children(many), hasLength(16));
      expect(many.root.truncation, '已截断：还有 1 项没有显示');
    });

    test('a "__proto__" key is plain data', () {
      // No prototype to pollute in Dart: the key is just an unknown property.
      expect(
        parseDshUiUncached('{"__proto__": {"type": "options", "id": "x", "options": [{"label": "A"}]}}'),
        isA<DshUiInvalid>(),
      );
      final typed = parseDshUiUncached('{"type": "text", "text": "hi", "__proto__": {"polluted": true}}');
      expect(((typed as DshUiParsed).view.root as DshUiText).text, 'hi');
    });

    test('the size is measured on the source as sent', () {
      // A wrapped document cannot shrink under the limit...
      Object? wrappedChildren = [text()];
      while (utf8.encode(jsonEncode({'type': 'stack', 'children': wrappedChildren})).length <= 16384) {
        wrappedChildren = {'item': wrappedChildren};
      }
      final big = invalid({'type': 'stack', 'children': wrappedChildren});
      expect(big.message, matches(RegExp(r'^视图有 \d+ 字节，超过上限 16384 字节$')));
      // ...while the same card wrapped a little fits and validates.
      final small = ok({
        'type': 'stack',
        'title': 'Pick',
        'children': {
          'item': {
            'item': [options()],
          },
        },
      });
      expect(small.title, 'Pick');
      expect(small.interactive, isTrue);
      // A view needs no title; a blank one is none.
      expect(ok({...text(), 'title': '  '}).title, isNull);
      expect(ok({...text(), 'title': '  Status  '}).title, 'Status');
      expect(ok(text()).title, isNull);
    });

    test('bytes count the source in UTF-8', () {
      final source = jsonEncode({...text('a'), 'title': '测'});
      final view = (parseDshUiUncached(source) as DshUiParsed).view;
      expect(view.bytes, utf8.encode(source).length);
      expect(view.bytes, greaterThan(source.length));
    });

    test('the summary keeps a short list of component values', () {
      final view = ok(stack([metric(), options(), text(' ${'word ' * 30}')]));
      final summary = dshUiSummary(view);
      expect(summary, startsWith('[视图] '));
      final parts = summary.substring('[视图] '.length).split('；');
      expect(parts[0], '进度=70%');
      expect(parts[1], '选项：A/B/C');
      expect(parts[2].length, lessThanOrEqualTo(40));
      expect(parts[2], startsWith('文字：word word'));
      final many = ok(stack([for (var i = 0; i < 9; i++) metric('m$i', '1')]));
      expect(dshUiSummary(many).split('；'), hasLength(8));
      expect(dshUiSummary(ok(stack([text('a')]))), '[视图] 文字：a');
      final titled = ok({
        ...stack([chart()]),
        'title': '近 3 个月支出',
      });
      expect(dshUiSummary(titled), '[视图] 近 3 个月支出：图表：5月=3,800 元, 6月=4,100 元, 7月=3,650 元');
    });

    test('an answer keeps the question-card selection rules', () {
      final view = ok(
        stack([
          options('pick'),
          options('many', {'multi': true, 'id': 'many'}),
          confirm('go'),
        ]),
      );
      // DS Bot keeps the first label in the order sent; a reply we build has
      // one label for a single choice, so ours keeps the first in option order.
      final single = dshUiAnswerFor(view, const DshUiReply(kind: DshUiReplyKind.choice, value: 'Z、B、A'));
      expect(single!.selected, ['A']);
      expect(single.nodePath, 'view.children[0]');
      final none = dshUiAnswerFor(view, const DshUiReply(kind: DshUiReplyKind.choice, value: 'nope'));
      expect(none, isNull);
      final empty = dshUiAnswerFor(view, const DshUiReply(kind: DshUiReplyKind.choice));
      expect(empty, isNull);
      final yes = dshUiAnswerFor(view, const DshUiReply(kind: DshUiReplyKind.confirm));
      expect(yes!.confirmed, isTrue);
      expect(yes.nodePath, 'view.children[2]');
      final no = dshUiAnswerFor(view, const DshUiReply(kind: DshUiReplyKind.cancel));
      expect(no!.confirmed, isFalse);

      final multi = ok(options('many', {'multi': true}));
      final picked = dshUiAnswerFor(multi, const DshUiReply(kind: DshUiReplyKind.choice, value: 'A、A、C、nope'));
      expect(picked!.selected, ['A', 'C']);
    });
  });

  group('lenient parsing', () {
    test('broken JSON fails with a readable message and a resend text', () {
      final parsed = parseDshUiUncached('{"type": "text", "text": ');
      expect(parsed, isA<DshUiInvalid>());
      final error = (parsed as DshUiInvalid).error;
      expect(error.path, 'view');
      expect(error.message, startsWith('不是合法的 JSON'));
      expect(parsed.resendText, startsWith('上一个 dsh-ui 视图无法显示：view：不是合法的 JSON'));
      expect(parsed.resendText, endsWith('。请修正后重发。'));
      expect(parseDshUiUncached('   '), isA<DshUiInvalid>());
    });

    test('comments and trailing commas are forgiven', () {
      final parsed = parseDshUiUncached('''
{
  // 标题
  "type": "text", /* 正文 */
  "text": "a, b // not a comment",
}''');
      final view = (parsed as DshUiParsed).view;
      expect((view.root as DshUiText).text, 'a, b // not a comment');
      expect(view.issues.single.message, '含注释或尾逗号，已忽略');
      final list = parseDshUiUncached('{"type":"steps","items":["a","b",],}');
      expect(((list as DshUiParsed).view.root as DshUiSteps).items, hasLength(2));
    });

    test('a top-level array is a stack', () {
      final view = ok([text(), metric()]);
      expect(view.root, isA<DshUiLayout>());
      expect(children(view), hasLength(2));
    });

    test('charts pad, clip and clean their data', () {
      // 1e400 decodes to infinity: not finite, so the point is empty.
      final view = (parseDshUiUncached(
        '{"type":"chart","kind":"pie","categories":["a","b","c"],'
        '"series":[{"values":["3,800","x",1e400]},{"values":[1,2,3]}]}',
      ) as DshUiParsed).view;
      final chartNode = view.root as DshUiChart;
      expect(chartNode.kind, DshUiChartKind.donut);
      expect(chartNode.series, hasLength(1));
      expect(chartNode.series.single.values, [3800, null, null]);
      expect(chartNode.truncation, '已截断：只画第一组数据');

      final short =
          ok({
                'type': 'chart',
                'categories': ['a', 'b', 'c'],
                'series': [
                  {
                    'values': [1],
                  },
                ],
              }).root
              as DshUiChart;
      expect(short.kind, DshUiChartKind.bar);
      expect(short.series.single.values, [1, null, null]);

      final wide = ok({
        'type': 'chart',
        'kind': 'radar',
        'categories': [for (var i = 0; i < 70; i++) '$i'],
        'series': [
          for (var s = 0; s < 8; s++)
            {
              'values': [for (var i = 0; i < 70; i++) i * s],
            },
        ],
      });
      final w = wide.root as DshUiChart;
      expect(w.kind, DshUiChartKind.bar);
      expect(w.categories, hasLength(60));
      expect(w.series, hasLength(6));
      expect(w.series.first.values, hasLength(60));
      expect(w.truncation, '已截断：只显示前 60 个点，只显示前 6 组数据');
      expect(wide.issues.first.message, contains('按柱状图画'));

      // A flat list of numbers is one series; values on the chart too.
      final flat =
          ok({
                'type': 'chart',
                'kind': 'line',
                'categories': ['a', 'b'],
                'series': [1, '2'],
              }).root
              as DshUiChart;
      expect(flat.series.single.values, [1, 2]);
      final loose =
          ok({
                'type': 'chart',
                'categories': ['a', 'b'],
                'values': [3, 4],
              }).root
              as DshUiChart;
      expect(loose.series.single.values, [3, 4]);

      // Nothing finite to draw: the chart is a placeholder.
      expect(
        invalid({
          'type': 'chart',
          'categories': ['a'],
          'series': [
            {
              'values': ['x'],
            },
          ],
        }).message,
        '没有一个有限的数值',
      );
    });

    test('metric values must be finite; numbers are formatted', () {
      final infinite = parseDshUiUncached('{"type":"metric","label":"n","value":1e400}');
      expect((infinite as DshUiInvalid).error.message, '应该是有限的数');
      expect((ok(metric('n', 41800)).root as DshUiMetric).value, '41,800');
      expect((ok(metric('n', 2024)).root as DshUiMetric).value, '2024');
      expect((ok(metric('n', 0.126)).root as DshUiMetric).value, '0.13');
      expect((ok(metric('n', true)).root as DshUiMetric).value, '是');
    });

    test('compare, steps and callout accept loose shapes', () {
      final compare = ok({
        'type': 'compare',
        'items': [
          {
            'title': '方案 A',
            'badge': '推荐',
            'rows': {'月供': '¥4,200', '总利息': '¥31.2 万'},
          },
          {
            'title': '方案 B',
            'rows': [
              ['月供', '¥5,100'],
              {'label': '总利息', 'value': '¥22.8 万'},
              'bad',
            ],
          },
          {'rows': <Object?>[]},
          for (var i = 0; i < 3; i++) {'title': 'X$i'},
        ],
      });
      final c = compare.root as DshUiCompare;
      expect(c.items.map((i) => i.title), ['方案 A', '方案 B', 'X0', 'X1']);
      expect(c.items[0].rows, [('月供', '¥4,200'), ('总利息', '¥31.2 万')]);
      expect(c.items[1].rows, [('月供', '¥5,100'), ('总利息', '¥22.8 万')]);
      expect(c.truncation, '已截断：只显示前 4 项');

      final steps = ok({
        'type': 'steps',
        'items': [
          {'label': 'a', 'status': 'completed'},
          {'label': 'b', 'status': 'in_progress'},
          'c',
          {'label': 'd', 'status': 'blocked', 'detail': '缺少权限'},
          {'label': 'e', 'status': 'later'},
        ],
      });
      expect((steps.root as DshUiSteps).items.map((i) => i.status), [
        DshUiStepStatus.done,
        DshUiStepStatus.current,
        DshUiStepStatus.todo,
        DshUiStepStatus.failed,
        DshUiStepStatus.todo,
      ]);
      expect(steps.issues.single.path, 'view.items[4].status');

      final callout = ok({'type': 'callout', 'text': '注意', 'tone': 'warning'});
      expect((callout.root as DshUiCallout).tone, DshUiCalloutTone.warn);
    });

    test('options take bare strings; confirm needs nothing', () {
      final view = ok({
        'type': 'options',
        'options': [
          '甲',
          ' 乙 ',
          '',
          {'label': '丙', 'description': '第三个'},
        ],
        'multi': 'true',
      });
      final node = view.root as DshUiOptions;
      expect(node.labels, ['甲', '乙', '丙']);
      expect(node.multi, isTrue);
      expect(node.id, 'options');
      final c = ok({'type': 'confirm'}).root as DshUiConfirm;
      expect(c.confirmText, '确认');
      expect(c.cancelText, '取消');
    });

    test('parses are cached by source', () {
      final source = jsonEncode(stack([text('cached')]));
      expect(identical(parseDshUi(source), parseDshUi(source)), isTrue);
    });
  });

  group('plain text for copy and export', () {
    test('replaces dsh-ui blocks with their summary', () {
      final block = jsonEncode({
        ...stack([metric('月均', '¥4,180')]),
        'title': '支出',
      });
      final markdown = '结论在这里。\n\n```dsh-ui\n$block\n```\n\n后记';
      expect(dshUiPlainText(markdown), '结论在这里。\n\n[视图] 支出：月均=¥4,180\n\n后记');
    });

    test('leaves other fences alone, even ones that mention dsh-ui', () {
      const markdown = '````markdown\n```dsh-ui\n{}\n```\n````\n```json\n{}\n```';
      expect(dshUiPlainText(markdown), markdown);
    });

    test('an unclosed or broken block still becomes one line', () {
      expect(dshUiPlainText('前文\n```dsh-ui\n{"type":"te'), '前文\n[视图]（格式有误，未能显示）');
      expect(dshUiPlainText('没有视图'), '没有视图');
    });
  });

  group('number formatting', () {
    test('chart numbers', () {
      expect(formatDshUiNumber(3800), '3,800');
      expect(formatDshUiNumber(12.345), '12.3');
      expect(formatDshUiNumber(1.5), '1.5');
      expect(formatDshUiNumber(-0.001), '0');
      expect(formatDshUiNumber(double.nan), '—');
      expect(formatDshUiNumber(1e20), '1.0e+20');
    });

    test('uses Brazilian separators in Portuguese', () {
      final previous = AppLocale.current;
      AppLocale.use(AppLocale.ptBR);
      try {
        expect(formatDshUiNumber(3800), '3.800');
        expect(formatDshUiNumber(12.345), '12,3');
        expect(formatDshUiValue(1.5), '1,5');
        expect(formatDshUiValue(41800), '41.800');
        expect(formatDshUiCompact(1500), '1,5K');
      } finally {
        AppLocale.use(previous);
      }
    });

    test('compact ticks use 万 and 亿', () {
      expect(formatDshUiCompact(999), '999');
      expect(formatDshUiCompact(1500), '1,500');
      expect(formatDshUiCompact(12000), '1.2万');
      expect(formatDshUiCompact(320000000), '3.2亿');
      expect(formatDshUiCompact(-20000), '-2万');
    });
  });
}
