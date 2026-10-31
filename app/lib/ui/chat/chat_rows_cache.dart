import 'package:dsh_client/dsh_client.dart';
import 'package:flutter/foundation.dart';

import '../../state/artifacts.dart';
import '../../state/chat_state.dart';
import 'chat_rows.dart';

/// Keeps historical row objects and their key index during text-only streaming.
/// Structural changes still go through [deriveRows], including a draft commit,
/// tool update, history page, turn completion, or changed pending cards.
class ChatRowsCache {
  ChatState? _state;
  bool _foldTurns = false;
  Set<int> _openTurns = const {};
  List<TurnArtifacts> _artifacts = const [];
  List<ChatRow> _rows = const [];
  Map<String, int> _index = const {};

  Map<String, int> get index => _index;

  List<ChatRow> update(
    ChatState state, {
    required bool foldTurns,
    required Set<int> openTurns,
    List<TurnArtifacts> artifacts = const [],
  }) {
    final previous = _state;
    List<ChatRow>? reused;
    if (previous != null &&
        foldTurns == _foldTurns &&
        setEquals(openTurns, _openTurns) &&
        listEquals(artifacts, _artifacts) &&
        state.running == previous.running &&
        listEquals(state.approvals, previous.approvals) &&
        listEquals(state.questions, previous.questions) &&
        listEquals(state.pending, previous.pending) &&
        setEquals(state.autoAnswered, previous.autoAnswered) &&
        listEquals(state.commands, previous.commands) &&
        listEquals(state.turns, previous.turns)) {
      reused = _reuseTail(previous.items, state.items, running: state.running);
    }
    _state = state;
    _foldTurns = foldTurns;
    _openTurns = openTurns;
    _artifacts = artifacts;
    if (reused != null) {
      _rows = reused;
    } else {
      _rows = deriveRows(
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
      _index = {for (var i = 0; i < _rows.length; i++) _rows[i].key: i};
    }
    return _rows;
  }

  List<ChatRow>? _reuseTail(List<ChatItem> previous, List<ChatItem> items, {required bool running}) {
    if (identical(previous, items)) return _rows;
    if (previous.length != items.length) return null;
    if (items.isEmpty) return _rows;
    // The transcript reuses durable ChatItems across deltas. Check every
    // earlier item: a matching last key alone cannot detect a history edit.
    for (var i = 0; i < items.length - 1; i++) {
      if (!identical(previous[i], items[i])) return null;
    }
    final before = previous.last;
    final after = items.last;
    if (identical(before, after)) return _rows;
    if (!running ||
        before is! AssistantChatItem ||
        after is! AssistantChatItem ||
        !before.streaming ||
        !after.streaming ||
        before.seq != null ||
        after.seq != null ||
        before.key != after.key) {
      return null;
    }
    final at = _index[before.key];
    if (at == null) return null;
    final row = _rows[at];
    if (row is! AssistantRow || !identical(row.item, before) || row.showActions || row.footnote != null) return null;
    // Running drafts are not folded or given a copy action. Updating the
    // final draft cannot change earlier groups or trailing pending cards.
    return [..._rows]..[at] = AssistantRow(after);
  }
}
