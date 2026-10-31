// Parser, bindings and limits of plugin views
// (docs/design/native-plugins-views.md §2–§6).

import 'dart:convert';
import 'dart:typed_data';

import 'package:dsh_app/ui/chat/dsh_ui/dsh_ui.dart';
import 'package:dsh_app/l10n/l10n.dart';
import 'package:dsh_app/ui/plugins/view/plugin_view.dart';
import 'package:flutter_test/flutter_test.dart';

import 'fixtures.dart';

DshUiView parsed(Object? view, {Object? data, PluginViewBudget budget = PluginViewBudget.panel}) {
  final result = parseDshUiPluginUncached(view, data: data, profile: budget.profile);
  if (result is DshUiInvalid) fail('invalid: ${result.error}');
  return (result as DshUiParsed).view;
}

DshUiIssue invalid(Object? view, {PluginViewBudget budget = PluginViewBudget.panel}) {
  final result = parseDshUiPluginUncached(view, profile: budget.profile);
  if (result is! DshUiInvalid) {
    fail('expected invalid, got ${(result as DshUiParsed).view.root}');
  }
  return result.error;
}

T only<T extends DshUiNode>(DshUiView view) => view.nodes.whereType<T>().single;

Map<String, Object?> bind(String path) => {r'$': path};

void main() {
  group('catalog', () {
    test('v2 extends the original 16 components', () {
      expect(dshUiPluginComponents, hasLength(42));
      expect(dshUiPluginComponents, containsAll(['list', 'keyValue', 'progress', 'table', 'actions', 'image']));
      expect(dshUiPluginComponents, containsAll(['emptyState', 'gallery']));
    });

    test('model cards keep the phase-one catalog', () {
      final model = parseDshUiUncached(jsonEncode({'type': 'list', 'items': []}));
      expect(model, isA<DshUiInvalid>());
      final plugin = parsePluginView(listView);
      expect(plugin, isA<DshUiParsed>());
    });

    test('weather card', () {
      final view = parsed(weatherCard, budget: PluginViewBudget.toolCard);
      expect(view.title, '东京 · 未来 3 天');
      expect(view.issues, isEmpty);
      final metrics = view.nodes.whereType<DshUiMetric>().toList();
      expect(metrics.map((m) => m.tone), [null, DshUiTone.info, DshUiTone.warn]);
      expect(only<DshUiChart>(view).kind, DshUiChartKind.line);
    });

    test('list', () {
      final list = only<DshUiList>(parsed(listView));
      expect(list.items.map((i) => i.title), ['单行', '两行', '可点']);
      expect(list.items[1].subtitle, '副标题');
      expect(list.items[1].tone, DshUiTone.warn);
      expect(list.items[0].icon, 'bolt');
      expect(list.items[2].action?.id, 'go');
      expect(list.items[0].action, isNull);
    });

    test('keyValue as pairs, objects and a map', () {
      expect(only<DshUiKeyValue>(parsed(keyValueView)).items.map((i) => '${i.label}=${i.value}'), [
        '模型=deepseek-v4',
        '输入=12,480 tokens',
        '状态=正常',
      ]);
      final map = only<DshUiKeyValue>(
        parsed({
          'type': 'keyValue',
          'items': {'版本': '0.9.1', '构建': 10252108},
        }),
      );
      expect(map.items.map((i) => i.value), ['0.9.1', '10,252,108']);
    });

    test('progress', () {
      final bars = parsed(progressView).nodes.whereType<DshUiProgress>().toList();
      expect(bars[0].fraction, closeTo(0.62, 1e-9));
      expect(bars[0].shown, '62%');
      expect(bars[1].shown, '91%');
      expect(bars[1].tone, DshUiTone.bad);
      expect(bars[2].shown, '3/12');
      final over = only<DshUiProgress>(parsed({'type': 'progress', 'value': 140}));
      expect(over.fraction, 1);
      final text = only<DshUiProgress>(parsed({'type': 'progress', 'value': '42%', 'max': '200'}));
      expect(text.fraction, closeTo(0.21, 1e-9));
      final badMax = parsed({'type': 'progress', 'value': 5, 'max': 0});
      expect(only<DshUiProgress>(badMax).max, 100);
      expect(badMax.issues.single.path, 'view.max');
    });

    test('table: numeric columns right-aligned, ragged rows padded', () {
      final table = only<DshUiTable>(parsed(tableView));
      expect(table.columns.map((c) => c.align), [DshUiAlign.start, DshUiAlign.start, DshUiAlign.end]);
      final ragged = only<DshUiTable>(
        parsed({
          'type': 'table',
          'columns': [
            'a',
            {'label': 'b', 'align': 'end'},
          ],
          'rows': [
            ['1'],
            ['2', 'x', 'extra'],
            [null, 3],
          ],
        }),
      );
      expect(ragged.rows, [
        ['1', ''],
        ['2', 'x'],
        ['', '3'],
      ]);
      expect(ragged.columns[1].align, DshUiAlign.end);
    });

    test('actions: one primary per view (confirm counts)', () {
      final view = parsed({
        'type': 'stack',
        'children': [
          {'type': 'confirm', 'id': 'go'},
          {
            'type': 'actions',
            'items': [
              {'label': 'A', 'style': 'primary', 'action': 'a'},
              {
                'label': 'B',
                'action': {
                  'id': 'b',
                  'args': {'n': 1},
                },
              },
            ],
          },
        ],
      });
      final actions = only<DshUiActions>(view);
      expect(actions.items.map((b) => b.primary), [false, false]);
      expect(actions.items[1].action.args, {'n': 1});
      expect(view.issues.map((i) => i.path), contains('view.children[1].items[0].style'));
    });

    test('options: values, selected and a bad id', () {
      final view = parsed(choiceView, data: {'range': '30d'});
      final options = only<DshUiOptions>(view);
      expect(options.id, 'range');
      expect(options.options.map((o) => o.key), ['7d', '30d', 'year']);
      expect(options.selected, ['30d']);
      final bad = parsed({
        'type': 'options',
        'id': 'has space',
        'options': ['A'],
      });
      expect(only<DshUiOptions>(bad).id, isEmpty);
      expect(bad.issues.single.path, 'view.id');
    });

    test('numeric option labels localize without changing plugin selection keys', () {
      final previous = AppLocale.current;
      AppLocale.use(AppLocale.ptBR);
      try {
        final view = parsed({
          'type': 'options',
          'id': 'choice',
          'options': [
            {'label': 1.5},
            {'label': 41800},
          ],
          'selected': ['1.5'],
        });
        final options = only<DshUiOptions>(view);
        expect(options.options.map((option) => option.label), ['1,5', '41.800']);
        expect(options.options.map((option) => option.key), ['1.5', '41800']);
        expect(options.selected, ['1.5']);
      } finally {
        AppLocale.use(previous);
      }
    });

    test('explicit plugin option values are preserved exactly', () {
      final longValue = List.filled(220, 'v').join();
      final view = parsed({
        'type': 'options',
        'id': 'choice',
        'options': [
          {'label': 'Empty value', 'value': ''},
          {'label': 'Long value', 'value': longValue},
        ],
        'selected': ['', longValue],
      });
      final options = only<DshUiOptions>(view);
      expect(options.options.map((option) => option.key), ['', longValue]);
      expect(options.options.map((option) => option.value), ['', longValue]);
      expect(options.selected, ['', longValue]);
    });

    test('text is restricted in plugin views only', () {
      final view = parsed(textView);
      expect(view.nodes.whereType<DshUiText>().every((t) => t.restricted), isTrue);
      final model = parseDshUiUncached(jsonEncode({'type': 'text', 'text': 'x'}));
      expect(((model as DshUiParsed).view.root as DshUiText).restricted, isFalse);
    });
  });

  group('bindings', () {
    final data = {
      'a': {
        'b': [
          {'c': 'deep'},
          7,
        ],
      },
      'n': 3.5,
      'zero': 0,
      'flag': true,
      'nil': null,
    };

    test('paths', () {
      expect(resolvePluginBinding(bind('data.a.b[0].c'), data), 'deep');
      expect(resolvePluginBinding(bind('data.a.b.0.c'), data), 'deep');
      expect(resolvePluginBinding(bind('data.a.b[1]'), data), 7);
      expect(resolvePluginBinding(bind('data.zero'), data), 0);
      expect(resolvePluginBinding(bind('data'), data), same(data));
      expect(resolvePluginBinding(bind('data.a.b[2]'), data), isNull);
      expect(resolvePluginBinding(bind('data.nil'), data), isNull);
      expect(resolvePluginBinding(bind('data.n.x'), data), isNull);
      expect(resolvePluginBinding(bind('window.x'), data), isNull);
      expect(resolvePluginBinding(bind('data..a'), data), isNull);
      expect(resolvePluginBinding(bind('data.${List.filled(17, 'x').join('.')}'), data), isNull);
      // Not a binding: two keys, or a non-string path.
      final two = {r'$': 'data.n', 'x': 1};
      expect(resolvePluginBinding(two, data), same(two));
      expect(resolvePluginBinding({r'$': 3}, data), {r'$': 3});
    });

    test('text', () {
      expect(pluginBindingText(bind('data.n'), data), '3.5');
      expect(pluginBindingText(bind('data.flag'), data), '是');
      expect(pluginBindingText(bind('data.none'), data), '—');
      expect(pluginBindingText('  two\n lines ', data), 'two lines');
      expect(pluginBindingText('x' * 30, data, max: 24), '${'x' * 24}…');
      expect(pluginBindingText(bind('data.a'), data), '—');
    });

    test('deep resolve', () {
      expect(
        resolvePluginBindings({
          'x': [bind('data.n'), bind('data.none')],
          'y': {'z': bind('data.a.b[1]')},
        }, data),
        {
          'x': [3.5, null],
          'y': {'z': 7},
        },
      );
    });

    test('values from data are not searched for more bindings', () {
      final view = parsed(
        {
          'type': 'stack',
          'children': [
            {'type': 'metric', 'label': 'x', 'value': bind('data.trap')},
            {'type': 'text', 'text': 'kept'},
          ],
        },
        data: {
          'trap': {r'$': 'data.secret'},
          'secret': 'no',
        },
      );
      expect(
        (view.root as DshUiLayout).children.first,
        isA<DshUiPlaceholder>().having((p) => p.type, 'type', 'metric'),
      );
    });

    test('missing values: em dash, gaps and empty states', () {
      final view = parsed(usagePanel, data: const {});
      final metrics = view.nodes.whereType<DshUiMetric>().toList();
      expect(metrics.map((m) => m.value), ['—', '—']);
      expect(only<DshUiProgress>(view).shown, '—');
      expect(view.nodes.whereType<DshUiEmpty>().single.type, 'list');
      expect(view.issues, isEmpty);
    });

    test('bound panel', () {
      final view = parsed(usagePanel, data: usageData);
      expect(view.nodes.whereType<DshUiMetric>().map((m) => m.value), ['¥0.42', '¥3.10']);
      expect(only<DshUiProgress>(view).fraction, closeTo(0.62, 1e-9));
      final list = only<DshUiList>(view);
      expect(list.items.first.action?.args, {'id': 's1'});
      expect(list.items.last.tone, DshUiTone.good);
    });

    test('a bound type is not allowed', () {
      final issue = invalid({'type': bind('data.t')}, budget: PluginViewBudget.panel);
      expect(issue.path, 'view.type');
    });

    test('whole children bound', () {
      final view = parsed(
        {'type': 'stack', 'children': bind('data.kids')},
        data: {
          'kids': [
            {'type': 'text', 'text': 'a'},
            {'type': 'metric', 'label': 'b', 'value': 1},
          ],
        },
      );
      expect((view.root as DshUiLayout).children, hasLength(2));
    });

    test('a literal [] is the same legal empty state (as the schema says)', () {
      for (final node in <Map<String, Object?>>[
        {'type': 'stack', 'children': []},
        {'type': 'row', 'children': []},
        {'type': 'chart', 'categories': [], 'series': []},
        {'type': 'compare', 'items': []},
        {'type': 'steps', 'items': []},
        {'type': 'options', 'id': 'o', 'options': []},
        {'type': 'actions', 'items': []},
        {'type': 'list', 'items': []},
        {'type': 'keyValue', 'items': []},
        {
          'type': 'table',
          'columns': ['a'],
          'rows': [],
        },
      ]) {
        final view = parsed(node);
        expect(view.root, isA<DshUiEmpty>(), reason: '$node');
        expect(view.issues, isEmpty, reason: '$node');
      }
      // Table columns are not data: none at all is an error.
      expect(
        invalid({
          'type': 'table',
          'columns': [],
          'rows': [
            ['x'],
          ],
        }).path,
        'view.columns',
      );
    });

    test('missing chart data is an empty state, not an error', () {
      final view = parsed({
        'type': 'chart',
        'categories': bind('data.days'),
        'series': [
          {'values': bind('data.cost')},
        ],
      });
      expect(view.root, isA<DshUiEmpty>());
    });
  });

  group('limits', () {
    test('tool card: 8 KiB', () {
      final big = {'type': 'text', 'text': 'x' * 8200};
      expect(invalid(big, budget: PluginViewBudget.toolCard).path, 'view');
      expect(parsePluginView(big), isA<DshUiParsed>());
    });

    test('nesting', () {
      Object deep = 1;
      for (var i = 0; i < 70; i++) {
        deep = [deep];
      }
      expect(invalid({'type': 'text', 'text': 'x', 'pad': deep}).message, contains('64'));
    });

    test('nodes: 40 for a tool card, 120 for a panel', () {
      final view = {
        'type': 'stack',
        'children': [
          for (var r = 0; r < 10; r++)
            {
              'type': 'row',
              'children': [
                for (var c = 0; c < 10; c++) {'type': 'metric', 'label': '$c', 'value': c},
              ],
            },
        ],
      };
      final card = parsed(view, budget: PluginViewBudget.toolCard);
      expect(card.nodes.length, lessThanOrEqualTo(40));
      expect(card.truncated, isTrue);
      final panel = parsed(view);
      expect(panel.nodes.length, 111);
      expect(panel.truncated, isFalse);
    });

    test('list, table, keyValue and actions truncate with a note', () {
      final view = parsed({
        'type': 'stack',
        'children': [
          {
            'type': 'list',
            'items': [
              for (var i = 0; i < 60; i++) {'title': '$i'},
            ],
          },
          {
            'type': 'table',
            'columns': [for (var c = 0; c < 10; c++) 'c$c'],
            'rows': [
              for (var r = 0; r < 70; r++) [for (var c = 0; c < 10; c++) '$r'],
            ],
          },
          {
            'type': 'keyValue',
            'items': {for (var i = 0; i < 30; i++) 'k$i': i},
          },
          {
            'type': 'actions',
            'items': [
              for (var i = 0; i < 6; i++) {'label': '$i', 'action': 'a$i'},
            ],
          },
        ],
      });
      final list = only<DshUiList>(view);
      expect(list.items, hasLength(50));
      expect(list.truncation, contains('10'));
      final table = only<DshUiTable>(view);
      expect(table.columns, hasLength(8));
      expect(table.rows, hasLength(50));
      expect(table.truncation, isNotNull);
      expect(only<DshUiKeyValue>(view).items, hasLength(24));
      expect(only<DshUiActions>(view).items, hasLength(4));
    });

    test('action args: 1 KiB', () {
      final view = parsed({
        'type': 'actions',
        'items': [
          {
            'label': 'big',
            'action': {
              'id': 'a',
              'args': {'x': 'y' * 1100},
            },
          },
          {'label': 'ok', 'action': 'b'},
        ],
      });
      expect(only<DshUiActions>(view).items.map((b) => b.label), ['ok']);
    });

    test('strip budget: 8 nodes', () {
      final view = parsed({
        'type': 'row',
        'children': [
          for (var i = 0; i < 12; i++) {'type': 'text', 'text': '$i'},
        ],
      }, budget: PluginViewBudget.strip);
      expect(view.nodes.length, lessThanOrEqualTo(8));
    });
  });

  group('images', () {
    test('data: PNG is sniffed', () {
      final image = only<DshUiImage>(parsed(imageView));
      final source = image.source as DshUiDataImage;
      expect((source.width, source.height), (192, 108));
      expect(image.alt, '黄昏的海面');
    });

    test('plugin assets only, no traversal, no web', () {
      DshUiImageSource? src(String s) => only<DshUiImage>(parsed({'type': 'image', 'src': s})).source;
      expect(src('asset:icons/a.png'), isA<DshUiAssetImage>().having((a) => a.src, 'src', 'asset:icons/a.png'));
      expect(src('asset:photo.JPEG'), isA<DshUiAssetImage>());
      expect(src('asset:../secret.png'), isNull);
      expect(src('asset:a/./b.png'), isNull);
      expect(src('asset:/etc/x.png'), isNull);
      expect(src('asset:a/.hidden/b.png'), isNull);
      expect(src('asset:icons/a.svg'), isNull);
      expect(src('/dsh-go/v1/assets/pkg/a.png'), isNull);
      expect(src('https://tracker.example/p.png'), isNull);
      expect(src('//tracker.example/p.png'), isNull);
      expect(src('data:image/svg+xml;base64,PHN2Zy8+'), isNull);
    });

    test('too big, bad bytes, pixel bombs', () {
      final huge = 'data:image/png;base64,${'A' * 70000}';
      // The view itself is capped (32 KiB), so a big image arrives as data.
      final viaData = parsed({'type': 'image', 'src': bind('data.src')}, data: {'src': huge});
      expect(only<DshUiImage>(viaData).source, isNull);
      expect(viaData.issues.single.message, contains('65536'));
      expect(only<DshUiImage>(parsed({'type': 'image', 'src': 'data:image/png;base64,!!!'})).source, isNull);
      // A valid PNG header claiming 20000 × 20000.
      final bomb = Uint8List.fromList([...duskBytes]);
      bomb.buffer.asByteData().setUint32(16, 20000);
      bomb.buffer.asByteData().setUint32(20, 20000);
      final view = parsed({'type': 'image', 'src': 'data:image/png;base64,${base64Encode(bomb)}'});
      expect(only<DshUiImage>(view).source, isNull);
      expect(view.issues.single.path, 'view.src');
    });

    test('header sniffing', () {
      expect(dshUiImageSize(duskBytes), (192, 108));
      final gif = Uint8List.fromList([...'GIF89a'.codeUnits, 0x40, 0x01, 0xF0, 0x00, 0, 0, 0]);
      expect(dshUiImageSize(gif), (320, 240));
      final jpeg = Uint8List.fromList([
        0xFF, 0xD8, // SOI
        0xFF, 0xE0, 0x00, 0x04, 0x00, 0x00, // APP0, length 4
        0xFF,
        0xC0,
        0x00,
        0x11,
        0x08,
        0x01,
        0xE0,
        0x02,
        0x80,
        0x03, // SOF0 480 × 640
        0, 0, 0, 0, 0, 0, 0, 0, 0,
      ]);
      expect(dshUiImageSize(jpeg), (640, 480));
      final webpX = Uint8List(30)
        ..setAll(0, 'RIFF'.codeUnits)
        ..setAll(8, 'WEBPVP8X'.codeUnits);
      webpX
        ..[24] = 99
        ..[27] = 49;
      expect(dshUiImageSize(webpX), (100, 50));
      final webpL = Uint8List(30)
        ..setAll(0, 'RIFF'.codeUnits)
        ..setAll(8, 'WEBPVP8L'.codeUnits)
        ..[20] = 0x2F;
      // width-1 = 63, height-1 = 31: bits = 63 | 31 << 14.
      final bits = 63 | (31 << 14);
      webpL
        ..[21] = bits & 0xFF
        ..[22] = (bits >> 8) & 0xFF
        ..[23] = (bits >> 16) & 0xFF;
      expect(dshUiImageSize(webpL), (64, 32));
      expect(dshUiImageSize(Uint8List.fromList([1, 2, 3])), isNull);
      expect(dshUiImageSize(Uint8List.fromList([0xFF, 0xD8, 0x00])), isNull);
    });
  });

  group('tolerance', () {
    test('broken children become placeholders, the rest draws', () {
      final view = parsed(partlyBroken, data: const {});
      final root = view.root as DshUiLayout;
      expect(root.children[0], isA<DshUiPlaceholder>());
      expect(root.children[1], isA<DshUiEmpty>());
      expect((root.children[2] as DshUiImage).source, isNull);
      expect((root.children[3] as DshUiMetric).value, '—');
      expect(view.issues.map((i) => i.path), containsAll(['view.children[0].type', 'view.children[2].src']));
    });

    test('a broken root fails the whole view', () {
      expect(invalid('not json {').path, 'view');
      expect(invalid([1, 2]).path, 'view');
      expect(invalid({'type': 'gauge'}).path, 'view.type');
      expect(invalid({'no': 'type'}).path, 'view.type');
      expect(
        invalid({
          'type': 'stack',
          'children': [
            {'type': 'x'},
            3,
          ],
        }).path,
        'view.children[0].type',
      );
    });

    test('unknown properties, tones and icons are ignored', () {
      final view = parsed({
        'type': 'list',
        'color': '#ff0000',
        'items': [
          {'title': 'a', 'tone': 'pink', 'icon': 'unicorn', 'font': 'Comic'},
        ],
      });
      final item = only<DshUiList>(view).items.single;
      expect(item.tone, isNull);
      expect(item.icon, '');
      expect(view.issues.map((i) => i.path), ['view.items[0].icon', 'view.items[0].tone']);
    });

    test('a JSON string view parses too (strict JSON)', () {
      expect(parsePluginView(jsonEncode(weatherCard)), isA<DshUiParsed>());
      expect(parsePluginView('{"type":"text","text":"a",}'), isA<DshUiInvalid>());
    });

    test('cache: same objects, same result', () {
      final a = parsePluginView(usagePanel, data: usageData);
      expect(identical(parsePluginView(usagePanel, data: usageData), a), isTrue);
      final b = parsePluginView(usagePanel, data: {...usageData});
      expect(identical(a, b), isFalse);
    });
  });
}
