// Header measurements must stay current when a retained header sees new text,
// typography, direction, scaling or a font loaded after its first layout.
import 'package:dsh_app/ui/chat/chat_header.dart';
import 'package:dsh_app/ui/chat/model_sheet.dart';
import 'package:dsh_app/ui/common/status_dot.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';

import 'support/harness.dart';

class _View {
  const _View({this.status = '本机', this.scale = 1, this.style = const TextStyle(), this.direction = TextDirection.ltr});

  final String status;
  final double scale;
  final TextStyle style;
  final TextDirection direction;
}

typedef _Controls = ({Key key, _View view});

Future<void> _mount(WidgetTester tester, ValueNotifier<_Controls> controls, {double width = 390}) async {
  tester.view.devicePixelRatio = 1;
  tester.view.physicalSize = Size(width, 800);
  addTearDown(tester.view.reset);
  await tester.pumpWidget(
    testApp(
      ValueListenableBuilder<_Controls>(
        valueListenable: controls,
        builder: (context, control, _) {
          final view = control.view;
          final theme = Theme.of(context);
          return Theme(
            data: theme.copyWith(
              textTheme: theme.textTheme.copyWith(labelSmall: theme.textTheme.labelSmall?.merge(view.style)),
            ),
            child: Directionality(
              textDirection: view.direction,
              child: MediaQuery(
                data: MediaQuery.of(context)
                    .copyWith(textScaler: TextScaler.linear(view.scale), disableAnimations: true),
                child: Scaffold(
                  body: Align(
                    alignment: Alignment.topCenter,
                    child: ChatHeader(
                      key: control.key,
                      title: '修复登录页重复提交并补上连点测试',
                      status: HeaderStatus(StatusTone.ok, view.status),
                      trailing: ModelChip(selection: testCatalog.defaultSelection, onSelected: (_) {}, grouped: true),
                      onOpenDrawer: () {},
                      onNewChat: () {},
                    ),
                  ),
                ),
              ),
            ),
          );
        },
      ),
      overrides: ChatHarness(session: null).overrides,
    ),
  );
  await pumpFrames(tester);
}

List<Rect> _geometry(WidgetTester tester) => [
  for (final key in ['chat-header-bar', 'chat-title-pill', 'chat-menu', 'chat-new-chat'])
    tester.getRect(find.byKey(ValueKey(key))),
  tester.getRect(find.byType(ModelChip)),
];

Future<void> _matchesFresh(WidgetTester tester, ValueNotifier<_Controls> controls) async {
  final retained = _geometry(tester);
  controls.value = (key: UniqueKey(), view: controls.value.view);
  await pumpFrames(tester);
  expect(_geometry(tester), retained, reason: 'retained measurements must match a newly mounted header');
  expect(tester.takeException(), isNull);
}

void main() {
  testWidgets('a retained header remeasures text, style, scaling and direction', (tester) async {
    final controls = ValueNotifier<_Controls>((key: UniqueKey(), view: const _View()));
    addTearDown(controls.dispose);
    await _mount(tester, controls);
    for (final view in const [
      _View(status: '远程服务器连接中'),
      _View(status: '服务器已连接', scale: 1.5),
      _View(
        status: 'WWWWWWWWW',
        style: TextStyle(fontFamily: 'JetBrainsMono', letterSpacing: 2, fontWeight: FontWeight.bold),
      ),
      _View(status: 'WWWWWWWWW', direction: TextDirection.rtl),
      _View(),
    ]) {
      final state = tester.state(find.byType(ChatHeader));
      controls.value = (key: controls.value.key, view: view);
      await pumpFrames(tester);
      expect(tester.state(find.byType(ChatHeader)), same(state));
      await _matchesFresh(tester, controls);
    }
    await tester.pumpWidget(const SizedBox.shrink());
  });

  testWidgets('font availability changes invalidate retained header measurements', (tester) async {
    const family = 'HeaderStatusLoadedLater';
    final controls = ValueNotifier<_Controls>((
      key: UniqueKey(),
      view: const _View(
        status: 'WWWWWWWWW',
        style: TextStyle(fontFamily: family),
      ),
    ));
    addTearDown(controls.dispose);
    await _mount(tester, controls, width: 360);
    final before = _geometry(tester);
    final state = tester.state(find.byType(ChatHeader));
    await tester.runAsync(() async {
      final loader = FontLoader(family)..addFont(rootBundle.load('assets/fonts/JetBrainsMono-Regular.ttf'));
      await loader.load();
    });
    await tester.binding.handleSystemMessage({'type': 'fontsChange'});
    await pumpFrames(tester);
    expect(tester.state(find.byType(ChatHeader)), same(state));
    expect(_geometry(tester), isNot(before), reason: 'the loaded font has different status-line metrics');
    await _matchesFresh(tester, controls);

    await tester.pumpWidget(const SizedBox.shrink());
    await tester.binding.handleSystemMessage({'type': 'fontsChange'});
    await tester.pump();
    expect(tester.takeException(), isNull, reason: 'disposed headers no longer listen for font changes');
  });
}
