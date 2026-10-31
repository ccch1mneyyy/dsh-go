import 'package:dsh_app/state/artifacts.dart';
import 'package:dsh_app/state/chat_state.dart';
import 'package:dsh_app/ui/chat/chat_rows.dart';
import 'package:dsh_app/ui/chat/chat_rows_cache.dart';
import 'package:dsh_client/dsh_client.dart';
import 'package:flutter_test/flutter_test.dart';

import 'support/sample_chat.dart';

// Compare the complete projection, including nested folded rows, to the
// uncached implementation. This is a work-count contract, not an FPS claim.
Object shape(ChatRow row) => switch (row) {
  UserRow(:final item) => (row.key, item),
  PendingRow(:final prompt) => (row.key, prompt),
  AssistantRow(:final item, :final showActions, :final footnote) => (
    row.key,
    item.id,
    item.seq,
    item.time,
    item.text,
    item.reasoning,
    item.streaming,
    item.interrupted,
    item.usage,
    item.model,
    showActions,
    footnote,
  ),
  ToolCallRow(:final item, :final card) => (row.key, item, card),
  ToolGroupRow(:final tools, :final live) => [row.key, tools, live],
  NoticeRowData(:final item) => (row.key, item),
  ApprovalRow(:final request) => (row.key, request),
  QuestionRow(:final request) => (row.key, request),
  ChangeCardRow(:final files) => [
    row.key,
    for (final f in files) (f.path, f.created, f.added, f.removed, f.edits, f.patch, f.lastCallId),
  ],
  ArtifactCardRow(:final group) => (row.key, group),
  TurnProcessRow(:final trace, :final rows, :final toolCalls, :final messages, :final cut) => [
    row.key,
    trace,
    toolCalls,
    messages,
    cut,
    rows.map(shape).toList(),
  ],
  TurnFootnoteRow(:final trace) => (row.key, trace),
  CommandNoticeRow(:final notice) => (row.key, notice),
};

List<ChatRow> check(
  ChatRowsCache cache,
  ChatState state, {
  bool foldTurns = false,
  Set<int> openTurns = const {},
  List<TurnArtifacts> artifacts = const [],
}) {
  final actual = cache.update(state, foldTurns: foldTurns, openTurns: openTurns, artifacts: artifacts);
  final expected = deriveRows(
    items: state.items,
    approvals: state.approvals,
    questions: state.questions,
    pending: state.pending,
    running: state.running,
    autoAnswered: state.autoAnswered,
    commands: state.commands,
    turns: state.turns,
    foldTurns: foldTurns,
    openTurns: openTurns,
    artifacts: artifacts,
  );
  expect(actual.map(shape).toList(), expected.map(shape).toList());
  expect(cache.index, {for (var i = 0; i < actual.length; i++) actual[i].key: i});
  return actual;
}

void main() {
  test('1000 historical rows and the key index survive each streaming update', () {
    final history = [for (var i = 0; i < 1000; i++) assistant(i, 'History $i')];
    final queued = PendingPrompt(requestId: 'queued', text: 'Next', time: DateTime(2026));
    ChatState snapshot(int token) => ChatState(
      loading: false,
      running: true,
      items: [
        ...history,
        assistant(1001, token.isEven ? '' : 'Token $token', reasoning: '$token', streaming: true),
      ],
      // ChatController publishes fresh list containers, even without changes.
      approvals: [approval],
      questions: [],
      commands: [],
      pending: [queued],
    );
    final cache = ChatRowsCache();
    final first = check(cache, snapshot(0));
    final index = cache.index;
    for (var token = 1; token <= 20; token++) {
      final rows = check(cache, snapshot(token));
      for (var i = 0; i < rows.length; i++) {
        if (i == 1000) continue;
        expect(identical(rows[i], first[i]), isTrue, reason: 'only the live draft changes');
      }
      expect(identical(cache.index, index), isTrue);
      expect((first[1000] as AssistantRow).item.reasoning, '0', reason: 'previous results stay immutable');
    }
  });

  test('equal input containers reuse the projection without retaining removed rows', () {
    final items = [user(1, 'Question'), assistant(2, 'Answer')];
    final cache = ChatRowsCache();
    final rows = check(cache, ChatState(items: items));
    expect(identical(check(cache, ChatState(items: [...items], approvals: [], commands: [])), rows), isTrue);
    final empty = check(cache, const ChatState());
    expect(empty, isEmpty);
    expect(cache.index, isEmpty);
  });

  test('same-key draft commit and turn completion use the full projection', () {
    final cache = ChatRowsCache();
    final prompt = user(1, 'Question');
    final start = DateTime(2026);
    final runningTurn = TurnTrace(turn: 1, startSeq: 2, start: start, spans: const []);
    final draft = assistant(3, 'Draft', rowKey: 'm1.1', streaming: true);
    check(cache, ChatState(items: [prompt, draft], running: true, turns: [runningTurn]));
    final committed = assistant(4, 'Final', rowKey: 'm1.1');
    check(cache, ChatState(items: [prompt, committed], running: true, turns: [runningTurn]));
    final finished = TurnTrace(
      turn: 1,
      startSeq: 2,
      start: start,
      spans: const [],
      endSeq: 5,
      end: start.add(const Duration(seconds: 1)),
      endReason: const TurnEndReason('completed'),
    );
    final rows = check(cache, ChatState(items: [prompt, committed], turns: [finished]));
    expect((rows.last as AssistantRow).showActions, isTrue);
    expect((rows.last as AssistantRow).footnote, same(finished));
  });

  test('history edit, prepend, removal, tools and multiple drafts invalidate reuse', () {
    final cache = ChatRowsCache();
    final prompt = user(1, 'Question');
    final original = assistant(2, 'Old');
    final edited = assistant(2, 'Edited');
    final draft = assistant(3, 'Draft', streaming: true);
    final next = assistant(3, 'Next', streaming: true);
    final cases = <List<ChatItem>>[
      [prompt, original, draft],
      [prompt, edited, next],
      [user(0, 'Older'), prompt, edited, next],
      [prompt, next],
      [
        prompt,
        next,
        tool('t', 'read', {'path': 'a'}, status: ToolStatus.running),
      ],
      [
        prompt,
        next,
        tool('t', 'read', {'path': 'a'}, result: 'done'),
      ],
      [prompt, next, assistant(4, 'Another attempt', streaming: true)],
      [prompt, assistant(3, 'Changed earlier draft', streaming: true), assistant(4, 'Next', streaming: true)],
      [
        prompt,
        assistant(3, 'Stopped', interrupted: true),
        const NoticeChatItem(seq: 4, kind: 'aborted', text: 'Stopped'),
      ],
    ];
    for (final items in cases) {
      check(cache, ChatState(items: items, running: true));
    }
  });

  test('approval, question, queue, command and turn changes are never hidden by a text update', () {
    final cache = ChatRowsCache();
    final prompt = user(1, 'Question');
    final items = [prompt, assistant(3, 'Draft', streaming: true)];
    final pending = PendingPrompt(requestId: 'p', text: 'Queue', time: DateTime(2026));
    const question = UserQuestionRequest(eventId: 'q', sessionId: 's1', questions: []);
    const command = CommandNotice(id: 'c', name: 'help');
    final cases = [
      ChatState(items: items, running: true),
      ChatState(items: items, running: true, approvals: [approval]),
      ChatState(items: items, running: true, approvals: [approval], autoAnswered: {approval.eventId}),
      ChatState(items: items, running: true, questions: const [question]),
      ChatState(items: items, running: true, pending: [pending]),
      ChatState(
        items: items,
        running: true,
        pending: [PendingPrompt(requestId: 'p', text: 'Edited queue', time: pending.time)],
      ),
      ChatState(items: items, running: true, commands: const [command]),
      ChatState(
        items: items,
        running: true,
        commands: [command.copyWith(done: true, text: 'Done')],
      ),
      ChatState(
        items: items,
        running: true,
        turns: [TurnTrace(turn: 1, startSeq: 2, start: DateTime(2026), spans: const [])],
      ),
      ChatState(items: items),
    ];
    for (final state in cases) {
      check(cache, state);
    }
  });

  test('fold preferences, open turns and artifacts invalidate historical rows', () {
    final cache = ChatRowsCache();
    final turn = TurnTrace(
      turn: 1,
      startSeq: 2,
      start: DateTime(2026),
      spans: const [],
      endSeq: 8,
      end: DateTime(2026, 1, 1, 0, 0, 1),
      endReason: const TurnEndReason('completed'),
    );
    final state = ChatState(
      running: true,
      items: [
        user(1, 'First'),
        assistant(3, 'Step'),
        tool('t', 'read', {'path': 'a'}),
        assistant(7, 'Answer', reasoning: 'Thought'),
        user(9, 'Next'),
        assistant(10, 'Draft', streaming: true),
      ],
      turns: [turn],
    );
    check(cache, state);
    final folded = check(cache, state, foldTurns: true);
    expect(folded.whereType<TurnProcessRow>(), isNotEmpty);
    check(cache, state, foldTurns: true, openTurns: {2});
    const artifact = TurnArtifacts(turn: 1, endSeq: 8, files: []);
    check(cache, state, foldTurns: true, artifacts: const [artifact]);
    check(cache, state, foldTurns: true);
  });
}
