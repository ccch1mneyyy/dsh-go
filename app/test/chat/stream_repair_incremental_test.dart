import 'dart:math';

import 'package:dsh_app/ui/chat/render/markdown_body.dart';
import 'package:dsh_app/ui/chat/render/math_syntax.dart';
import 'package:dsh_app/ui/chat/render/stream_repair.dart';
import 'package:dsh_app/ui/chat/render/table_syntax.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:gpt_markdown/gpt_markdown.dart';

import 'support/harness.dart';
import 'support/markdown_samples.dart';

String _prepared(String text) => boldTableHeaders(normalizeMath(text, streaming: true));

void main() {
  test('every streamed prefix agrees with a fresh repair, including source rewrites', () {
    for (final text in [
      mathReply,
      headingsReply,
      listsReply,
      quotesReply,
      tableReply,
      codeReply,
      miscReply,
      'Before\n\n````dart\n```\n**literal\n````\n\n**after',
      '> ~~~text\n> **literal\n> ~~~\n>\n> ~~after',
      'Before\r\n\r\n```text\r\ncode\r\n```\r\n\r\n**after',
      'Before\n\n| one | two |\n|---|---|\n|a|b|\n\n**after',
      'Before\n\n[reference][label]\n\n[label]: https://example.com\n\n**after',
    ]) {
      final repair = StreamingMarkdownRepair();
      for (var end = 0; end <= text.length; end++) {
        final source = _prepared(text.substring(0, end));
        expect(repair.repair(source), repairStreamingMarkdown(source), reason: 'prefix $end of $text');
      }
    }
  });

  test('an unfinished fence closer or blank line is rescanned when extended', () {
    final repair = StreamingMarkdownRepair();
    for (final text in [
      '```text\n**literal\n```',
      '```text\n**literal\n```not a closer',
      '```text\n**literal\n```not a closer\n**still literal',
      '```text\n**literal\n```not a closer\n**still literal\n```\n\n**after',
      'paragraph\n   ',
      'paragraph\n   **tail',
      '> first\n>',
      '> first\n> **tail',
    ]) {
      expect(repair.repair(text), repairStreamingMarkdown(text), reason: text);
    }
    expect(repair.repair('> first\n> **tail'), '> first\n> **tail**');
  });

  test('replacement, truncation, empty input and varying chunk boundaries reset safely', () {
    final random = Random(41);
    final repair = StreamingMarkdownRepair();
    const pieces = ['abc', '\n', '\n\n', '```', '~~~~', '*', '**', '_', '`', '[', '](url', '|', '>', ' ', '\r', '中文🎉'];
    var text = '';
    for (var step = 0; step < 2000; step++) {
      switch (random.nextInt(8)) {
        case 0:
          text = text.substring(0, random.nextInt(text.length + 1));
        case 1:
          text = pieces[random.nextInt(pieces.length)];
        default:
          text += pieces[random.nextInt(pieces.length)];
      }
      expect(repair.repair(text), repairStreamingMarkdown(text), reason: 'step $step: $text');
    }
    expect(repair.repair(''), '');
    expect(repair.repair('**new'), '**new**');
  });

  testWidgets('a mounted Markdown body matches fresh preparation through stream transitions', (tester) async {
    usePhoneView(tester);
    final value = ValueNotifier((text: '', streaming: true));
    addTearDown(value.dispose);
    await tester.pumpWidget(
      testApp(
        Scaffold(
          body: SingleChildScrollView(
            child: ValueListenableBuilder(
              valueListenable: value,
              builder: (_, current, _) => MarkdownBody(text: current.text, streaming: current.streaming),
            ),
          ),
        ),
      ),
    );
    for (final current in [
      (text: 'Before\n\n```dart\nprint(1);\n```', streaming: true),
      (text: 'Before\n\n```dart\nprint(1);\n```\n\n**tail', streaming: true),
      (text: 'Before\n\n```dart\nprint(1);\n```\n\n**tail**', streaming: false),
      (text: '| a | b |\n|---|', streaming: true),
      (text: '| a | b |\n|---|---|\n|1|2|', streaming: true),
      (text: 'Formula:\n\n\$\$x^2', streaming: true),
      (text: 'Formula:\n\n\$\$x^2\$\$\n\n**tail', streaming: true),
      (text: 'Formula:\n\n\$\$x^2\$\$\n\n**tail', streaming: false),
      (text: '', streaming: false),
      (text: '> **new', streaming: true),
    ]) {
      value.value = current;
      await tester.pump();
      expect(
        tester.widget<GptMarkdown>(find.byType(GptMarkdown)).data,
        MarkdownBody.prepareSource(current.text, streaming: current.streaming),
      );
      expect(tester.takeException(), isNull);
    }
  });
}
