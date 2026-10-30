// 展开后的思考:正文任意处、以及展开区末尾的「收起」都能就地收回去 —— 读完
// 长思考的时候人已经在下面了,不必滚回标题行。

import 'package:dsh_app/ui/chat/render/markdown_body.dart';
import 'package:dsh_app/ui/chat/widgets/thinking_pill.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'support/harness.dart';

const _reasoning = '先跑一遍测试,看看失败的是哪一个用例。\n然后对照最近的改动定位原因';

Widget _pill() => testApp(const Scaffold(body: ThinkingPill(reasoning: _reasoning)));

void main() {
  setUpAll(loadTestFonts);

  testWidgets('open reasoning collapses from the body and from the footer', (tester) async {
    await tester.pumpWidget(_pill());
    await tester.pump();
    expect(find.byType(MarkdownBody), findsNothing);
    expect(find.text('收起'), findsNothing);

    await tester.tap(find.text('思考'));
    await pumpFrames(tester, 6);
    expect(find.byType(MarkdownBody), findsOneWidget);
    expect(find.text('收起'), findsOneWidget);

    // A:整段读完了,手指就停在正文上 —— 点正文就收回去。
    await tester.tap(find.byType(MarkdownBody));
    await pumpFrames(tester, 6);
    expect(find.byType(MarkdownBody), findsNothing);
    expect(find.text('收起'), findsNothing);

    // B:底部那一行「收起」,和标题行同一套点按区。
    await tester.tap(find.text('思考'));
    await pumpFrames(tester, 6);
    await tester.tap(find.text('收起'));
    await pumpFrames(tester, 6);
    expect(find.byType(MarkdownBody), findsNothing);
    expect(find.text('收起'), findsNothing);
    expect(find.text('思考'), findsOneWidget);
  });
}
