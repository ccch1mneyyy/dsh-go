// Which DSH events become "看一眼" alerts, independent of how they are shown
// (system notification or in-app banner).
//
// Event source: the Host-wide `$events` stream every client already holds
// (`DshClient.hostEvents`). It covers all sessions at once and costs nothing
// extra while idle:
// - `approval/request` / `user-questions/request` waterfalls: redelivered with
//   the same eventId to each new connection while pending; `cancel` once any
//   client answered or the request was withdrawn.
// - `api-session/status`: emitted only on idle ⇄ running edges; `running`
//   stays true across queued turns, so the falling edge is "all work done".
// The status edge doesn't say *how* the turn ended, so on each falling edge we
// read `session/projections` (non-activating; exact seq + title) and a one-
// message tail of `session/page` for the `turn/end` reason and the reply.
// `session/control` would carry the same per-session state but streams every
// projection change of every resident session (token counts per step), so it
// is far chattier for this purpose.

import 'dart:async';
import 'dart:convert';

import 'package:dsh_client/dsh_client.dart';

import '../l10n/l10n.dart';
import 'approval_reason.dart';
import '../state/hosts_state.dart';
import '../ui/chat/media/media_format.dart' show chatTitleShown;
import '../ui/chat/secret_mask.dart';
import '../ui/chat/widgets/turn_failure_text.dart';

/// What happened, in the order the settings page lists them.
enum AlertKind {
  /// A turn finished normally (or hit the output limit).
  done,

  /// A turn failed (model error, engine restart, blocked).
  failed,

  /// A turn was stopped.
  stopped,

  /// A tool call waits for approval.
  approval,

  /// `ask_user_question` waits for an answer.
  question;

  /// Waits on the person: the high-importance channel.
  bool get attention => this == approval || this == question;

  /// Lock-screen text: nothing from the conversation.
  String get publicText => switch (this) {
    done => appL10n.stateAlertPublicDone,
    failed => appL10n.stateAlertPublicFailed,
    stopped => appL10n.stateAlertPublicStopped,
    approval => appL10n.stateAlertPublicApproval,
    question => appL10n.stateAlertPublicQuestion,
  };
}

/// One thing worth telling the person about.
class ChatAlert {
  const ChatAlert({
    required this.host,
    required this.sessionId,
    required this.kind,
    required this.key,
    required this.title,
    required this.text,
    this.eventId,
    this.canApprove = false,
    this.fullText,
    this.turnEndKind,
    this.petText,
    this.petToken,
    this.choices,
    this.reply,
  });

  final HostRef host;

  /// The top-level conversation to open (a subagent's request opens its root).
  final String sessionId;
  final AlertKind kind;

  /// Identity within the conversation: [turnKey], or the request's eventId.
  final String key;

  /// The conversation's title.
  final String title;

  /// One line: what happened ("已完成 · 回复开头", "等你确认：运行命令").
  final String text;
  final String? eventId;

  /// An approval whose exact tool call is known: the notification offers 拒绝 / 允许本次.
  final bool canApprove;

  /// The expanded notification text (an approval's command up to its first blank line); null: [text].
  final String? fullText;

  /// Wire reason for turn-end alerts; keeps signal handling independent of UI text.
  final String? turnEndKind;

  /// What the floating pet's bubble shows of a request, whole: an approval's
  /// action when it may be answered there ([petApprovalText]), else a
  /// question's text. Null: the bubble only leads to the chat.
  final String? petText;

  /// A fresh request delivery; old overlay buttons cannot answer after reconnect.
  final int? petToken;

  /// A question's one-tap answers for the pet's bubble ([petChoices]).
  final List<String>? choices;

  /// A finished turn's reply, masked, on one line: 问一句's answer.
  final String? reply;

  @override
  String toString() => 'ChatAlert(${kind.name} $sessionId "$title" / "$text")';
}

/// Key of a conversation's turn-end alert: a newer turn replaces the older.
const turnKey = 'turn';

/// Shown when a conversation has no title yet (same as the sessions drawer).
String get untitledSession => appL10n.commonUntitledChat;

String alertTitle(String? title) {
  final t = title == null ? null : _masked(title).trim();
  // A generation request's header stays out, as in the drawer.
  return t == null || t.isEmpty ? untitledSession : chatTitleShown(t);
}

/// Keys and tokens masked as in the chat (the first eight characters stay), in a few dots.
String _masked(String text) => maskSecrets(text, mark: '•').replaceAll(RegExp('•{6,}'), '••••••');

/// How a turn ended, read back after the session went idle.
class TurnOutcome {
  const TurnOutcome({required this.seq, required this.reason, this.reply, this.title});

  /// Seq of the `turn/end` event (dedup across reconnects).
  final int seq;
  final TurnEndReason reason;

  /// The last assistant text of the turn, if any.
  final String? reply;

  /// Fresh title from the projections read.
  final String? title;

  AlertKind get kind => switch (reason.kind) {
    'completed' || 'max-tokens' => AlertKind.done,
    'aborted' => AlertKind.stopped,
    _ => AlertKind.failed,
  };

  /// The alert line, in the chat's own words (`NoticeRow`).
  String get text {
    switch (reason.kind) {
      case 'completed':
        final s = snippet(reply);
        return s == null ? appL10n.stateAlertTurnDone : appL10n.stateAlertCompletedReply(s);
      case 'max-tokens':
        return appL10n.stateAlertOutputLimit;
      case 'aborted':
        return appL10n.commonStopped;
      case 'blocked':
        return appL10n.stateAlertTurnBlocked;
      case 'interrupted':
        return appL10n.stateAlertEngineRestarted;
      default:
        // The chat's short line for the code; the model's own message stays out of notifications.
        final code = reason.error?.code;
        if (code == 'MISSING_CREDENTIAL') return appL10n.stateAlertMissingKey;
        final text = turnFailureText(code);
        return text == turnFailureText(null) ? appL10n.stateAlertTurnFailed : appL10n.stateAlertErrorDetail(text);
    }
  }
}

/// First [max] characters of [text] on one line, markdown markers dropped,
/// credentials masked (before cutting, so no tail of one shows).
String? snippet(String? text, {int max = 120}) {
  if (text == null) return null;
  final flat = _masked(text)
      .replaceAll(RegExp(r'```[a-zA-Z0-9_-]*'), ' ')
      .replaceAll(RegExp(r'^\s{0,3}(#{1,6}|>|[-*+]|\d+\.)\s+', multiLine: true), '')
      .replaceAll(RegExp(r'\*\*|__|`'), '')
      .replaceAll(RegExp(r'\s+'), ' ')
      .trim();
  if (flat.isEmpty) return null;
  final chars = flat.runes.toList();
  if (chars.length <= max) return flat;
  return '${String.fromCharCodes(chars.take(max)).trimRight()}…';
}

/// The approval line, with the same verbs as the approval card.
String approvalText(ApprovalRequest request) {
  final action = switch (request.toolName) {
    'bash' || 'pwsh' => appL10n.stateRunCommand,
    'write' => appL10n.stateWriteFile,
    'edit' || 'str_replace_editor' => appL10n.stateEditFile,
    'web_fetch' => appL10n.stateOpenPage,
    'web_search' => appL10n.stateWebSearch,
    final name => appL10n.stateAlertUseTool(name),
  };
  final reason = snippet(
    localizedApprovalReason(request.displayReason, AppLocale.current.languageCode) ?? request.reason,
    max: 90,
  );
  return reason == null ? appL10n.stateAlertApprovalAction(action) : appL10n.stateAlertApprovalReason(action, reason);
}

/// An approval's notification lines from its tool call: what runs, is written or
/// opened ("运行：git push"), and the first paragraph of it for the expanded view.
/// Null unless [call] is exactly the approved call with something to show; such an
/// approval gets no buttons.
({String text, String fullText})? approvalPreview(ApprovalRequest request, ToolCallPart? call) {
  if (call == null || request.callId != call.id || request.toolName != call.name) return null;
  final args = call.decodedArguments;
  if (args == null) return null;
  final (describe, raw) = switch (call.name) {
    'bash' || 'pwsh' => (appL10n.stateAlertPreviewRun, args['command']),
    'write' => (appL10n.stateAlertPreviewWrite, args['file_path'] ?? args['path']),
    'edit' || 'str_replace_editor' => (appL10n.stateAlertPreviewEdit, args['file_path'] ?? args['path']),
    'web_fetch' => (appL10n.stateAlertPreviewOpen, args['url']),
    _ => (appL10n.stateAlertPreviewUse, null),
  };
  if (raw is! String || raw.trim().isEmpty) return null;
  final first = raw.trim().split('\n').first;
  final paragraph = raw.trim().split(RegExp(r'\n\s*\n')).first;
  return (text: snippet(describe(first), max: 89)!, fullText: snippet(describe(paragraph), max: 4096)!);
}

String questionText(UserQuestionRequest request) {
  final first = request.questions.isEmpty ? null : snippet(request.questions.first.question, max: 90);
  if (first == null) return appL10n.stateAlertQuestion;
  return request.questions.length > 1
      ? appL10n.stateAlertQuestions(first, request.questions.length)
      : appL10n.stateAlertQuestionText(first);
}

/// The phone card must show the whole exact call, never a shortened command.
/// Oversize, secret-masked or unreadable calls open the full in-app approval.
String? phoneApprovalPreview(ApprovalRequest request, ToolCallPart? call) {
  if (call == null ||
      request.callId != call.id ||
      request.toolName != call.name ||
      !RegExp(r'^[A-Za-z0-9_.:-]{1,160}$').hasMatch(call.name) ||
      call.arguments.length > 3072) {
    return null;
  }
  final args = call.decodedArguments;
  if (args == null) return null;
  final raw = '${call.name}\n${jsonEncode(args)}';
  // Values recognized by the chat's secret mask stay out of the overlay.
  // A masked action is incomplete, so it is review-only instead.
  if (_masked(raw) != raw) return null;
  final text = raw.replaceAllMapped(
    RegExp('[\\u061c\\u200b-\\u200f\\u202a-\\u202e\\u2066-\\u2069]'),
    (m) => '\\u${m[0]!.codeUnitAt(0).toRadixString(16).padLeft(4, '0')}',
  );
  return text.length <= 4096 ? text : null;
}

/// Longest action the pet's bubble shows (it has four lines).
const petApprovalMax = 120;

/// An approval as the floating pet's bubble shows it, whole, on one line:
/// "运行：git push origin main". Null unless [call] is exactly the approved call,
/// of a tool the chat's card names (command, file, page), and all of it shows:
/// one line, nothing masked, no invisible direction marks, at most
/// [petApprovalMax] characters. Only then may the bubble answer it.
String? petApprovalText(ApprovalRequest request, ToolCallPart? call) {
  if (call == null || request.callId != call.id || request.toolName != call.name) return null;
  final args = call.decodedArguments;
  if (args == null) return null;
  // File contents, edit replacements, cwd and every other argument matter
  // just as much as the command/path. Never approve an abbreviated action.
  if (!const {'bash', 'pwsh', 'write', 'edit', 'str_replace_editor', 'web_fetch'}.contains(call.name)) return null;
  final text = '${call.name} ${jsonEncode(args)}';
  if (text.contains(RegExp('[\\u061c\\u200b-\\u200f\\u202a-\\u202e\\u2066-\\u2069]')) || _masked(text) != text) {
    return null;
  }
  return text.runes.length <= petApprovalMax ? text : null;
}

/// A question the pet's bubble takes with one tap: exactly one, single choice,
/// one to three short options, and nothing more to read first (no detail, no
/// plan to review). Null: 「去回答」 in the chat.
List<String>? petChoices(UserQuestionRequest request) {
  if (request.questions.length != 1) return null;
  final q = request.questions.single;
  if (q.question.trim().isEmpty ||
      q.question.runes.length > petApprovalMax ||
      _masked(q.question) != q.question ||
      q.question.contains(RegExp('[\\u061c\\u200b-\\u200f\\u202a-\\u202e\\u2066-\\u2069]'))) {
    return null;
  }
  if (q.multiSelect || q.intent != null || (q.detail?.trim().isNotEmpty ?? false)) return null;
  if (q.options.isEmpty || q.options.length > 3 || q.options.any((o) => o.description?.trim().isNotEmpty ?? false)) {
    return null;
  }
  final labels = [for (final o in q.options) o.label];
  final fits = labels.every(
    (l) =>
        l.isNotEmpty &&
        l.trim() == l &&
        !l.contains(RegExp('[\\r\\n\\t\\u061c\\u200b-\\u200f\\u202a-\\u202e\\u2066-\\u2069]')) &&
        _masked(l) == l &&
        l.runes.length <= 24,
  );
  return fits && labels.toSet().length == labels.length ? labels : null;
}

// ── Per-host tracking ────────────────────────────────────────────────────────

/// What [HostAlertTracker] needs from a connected host.
abstract class AlertSource {
  /// `$events` items (broadcast; not replayed).
  Stream<HostEvent> get events;

  /// Requests delivered in the current generation and still pending.
  List<HostEvent> get pendingRequests;

  /// Whether a generation is ready right now.
  bool get connected;

  Future<List<SessionSummary>> listSessions();

  /// How the latest turn of [sessionId] ended; null when unreadable.
  Future<TurnOutcome?> lastTurn(String sessionId);

  /// The tool call [request] asks to approve; null when not found.
  Future<ToolCallPart?> approvalCall(ApprovalRequest request);
}

/// [AlertSource] over a [DshClient].
class DshAlertSource implements AlertSource {
  DshAlertSource(this.client);

  final DshClient client;

  @override
  Stream<HostEvent> get events => client.hostEvents;

  @override
  List<HostEvent> get pendingRequests => client.mux.pendingRequests;

  @override
  bool get connected => client.mux.generation != null;

  @override
  Future<List<SessionSummary>> listSessions() => client.listSessions();

  @override
  Future<ToolCallPart?> approvalCall(ApprovalRequest request) async {
    if (request.callId == null) return null;
    final projections = await client.projections(request.sessionId);
    if (projections == null || projections.asOfSeq < 0) return null;
    final page = await client.history(request.sessionId, throughSeq: projections.asOfSeq, maxMessages: 4);
    for (final event in page.events.reversed) {
      if (event is ToolCallEvent && event.callId == request.callId) {
        return ToolCallPart(id: event.callId, name: event.name, arguments: event.arguments);
      }
      if (event is AssistantMessageEvent) {
        for (final part in event.message.toolCalls) {
          if (part.id == request.callId) return part;
        }
      }
    }
    return null;
  }

  @override
  Future<TurnOutcome?> lastTurn(String sessionId) async {
    final projections = await client.projections(sessionId);
    if (projections == null || projections.asOfSeq < 0) return null;
    // One message back from the cut: the final reply (or the prompt, when
    // the turn failed before answering) and everything after it.
    final page = await client.history(sessionId, throughSeq: projections.asOfSeq, maxMessages: 1);
    return outcomeFromEvents(page.events, title: projections.title);
  }
}

/// The last `turn/end` in [events] with the reply that preceded it.
TurnOutcome? outcomeFromEvents(List<SessionLogEvent> events, {String? title}) {
  TurnEndedEvent? end;
  String? reply;
  for (final event in events) {
    switch (event) {
      case TurnEndedEvent():
        end = event;
      case AssistantMessageEvent(:final message) when message.text.trim().isNotEmpty:
        reply = message.text;
      case TurnStartedEvent():
        end = null;
        reply = null;
      default:
        break;
    }
  }
  if (end == null) return null;
  return TurnOutcome(seq: end.seq, reason: end.reason, reply: reply, title: title);
}

/// Turns one host's `$events` into [ChatAlert]s: dedups redelivered requests
/// and repeated turn ends, routes subagent requests to their conversation, and
/// withdraws what was answered elsewhere.
class _RequestScope {
  static int _next = 0;
  final int petToken = ++_next;
}

class HostAlertTracker {
  HostAlertTracker({
    required this.host,
    required this.source,
    required this.onAlert,
    required this.onWithdraw,
    required this.onSessionGone,
    this.skipApproval,
    this.onReannounce,
    this.onRequestEpochChanged,
    this.announceDelay = const Duration(milliseconds: 800),
    this.reconcileDelay = const Duration(seconds: 3),
  });

  final HostRef host;
  final AlertSource source;
  final void Function(ChatAlert alert) onAlert;

  /// A request alert is moot: answered, withdrawn, or gone after a reconnect.
  final void Function(HostRef host, String sessionId, String key) onWithdraw;
  final void Function(HostRef host, String sessionId) onSessionGone;

  /// True when this device answers [sessionId]'s approvals by itself
  /// (「本对话都允许」): no alert for those.
  final bool Function(String sessionId)? skipApproval;

  /// A still-pending request redelivered on a new connection needs a fresh
  /// native card identity, without duplicating ordinary chat alerts.
  final void Function(ChatAlert alert)? onReannounce;
  final void Function(HostRef host)? onRequestEpochChanged;

  /// Requests wait this long before alerting, so one that is answered at once
  /// (auto-approve on this or another device) never pops up.
  final Duration announceDelay;

  /// After a reconnect the Host redelivers what is still pending; requests not
  /// redelivered within this window were settled while we were away.
  final Duration reconcileDelay;

  StreamSubscription<HostEvent>? _sub;
  Timer? _reconcile;
  bool _disposed = false;

  final Map<String, SessionSummary> _sessions = {};
  final Map<String, bool> _running = {};
  final Map<String, int> _statusRevision = {};
  final Set<String> _pendingIdle = {};
  int _revision = 0;
  int _generation = 0;

  /// Pending requests we know about: eventId → conversation it alerts in.
  final Map<String, String> _requests = {};

  /// Pending approvals alerted with buttons, by eventId.
  final Map<String, ApprovalRequest> _approvals = {};
  final Map<String, _RequestScope> _requestScopes = {};
  final Map<String, ({ApprovalRequest request, String text})> _phoneApprovals = {};
  final Map<String, ChatAlert> _requestAlerts = {};

  /// Pending approvals the pet's bubble showed whole ([petApprovalText]), by eventId.
  final Set<String> _petApprovals = {};

  /// Pending questions, by eventId.
  final Map<String, UserQuestionRequest> _questions = {};
  Set<String> _stale = const {};

  /// The pending approval [eventId] if its notification offered buttons.
  ApprovalRequest? approvalFor(String eventId) => requestScope(eventId) == null ? null : _approvals[eventId];

  /// The pending approval [eventId] if the pet's bubble could show all of it.
  ApprovalRequest? petApprovalFor(String eventId) => _petApprovals.contains(eventId) ? approvalFor(eventId) : null;

  /// The pending question [eventId].
  UserQuestionRequest? questionFor(String eventId) => requestScope(eventId) == null ? null : _questions[eventId];

  bool petRequestMatches(String eventId, String sessionId, int token) =>
      requestScope(eventId) != null && _requests[eventId] == sessionId && _requestScopes[eventId]?.petToken == token;

  Object? requestScope(String eventId) =>
      _disposed || !source.connected || _stale.contains(eventId) ? null : _requestScopes[eventId];

  ({ApprovalRequest request, String text})? phoneApprovalFor(String eventId) =>
      requestScope(eventId) == null ? null : _phoneApprovals[eventId];

  Iterable<ChatAlert> get pendingAlerts =>
      _requestAlerts.entries.where((entry) => requestScope(entry.key) != null).map((entry) => entry.value);

  /// `sessionId@seq` of turn ends already alerted.
  final Set<String> _turnsSeen = {};
  Future<void>? _listing;

  void start() {
    _sub = source.events.listen(_onEvent, onError: (_) {});
    for (final pending in source.pendingRequests) {
      _onEvent(pending);
    }
    if (source.connected) unawaited(_resync(seedOnly: true));
  }

  Future<void> dispose() async {
    _disposed = true;
    _reconcile?.cancel();
    await _sub?.cancel();
  }

  void _onEvent(HostEvent event) {
    if (_disposed) return;
    switch (event) {
      case HostReadyEvent():
        _generation++;
        _requestScopes.clear();
        _phoneApprovals.clear();
        _approvals.clear();
        _petApprovals.clear();
        _questions.clear();
        _requestAlerts.clear();
        onRequestEpochChanged?.call(host);
        // Whatever is still pending comes again right after `ready`.
        _stale = {..._requests.keys};
        _reconcile?.cancel();
        _reconcile = Timer(reconcileDelay, _dropStale);
        unawaited(_resync());
      case ApprovalRequestedEvent(:final request):
        _onRequest(request.eventId, request.sessionId, AlertKind.approval, approvalText(request), approval: request);
      case UserQuestionRequestedEvent(:final request):
        _onRequest(request.eventId, request.sessionId, AlertKind.question, questionText(request), question: request);
      case HostRequestCancelledEvent(:final eventId):
        _approvals.remove(eventId);
        _requestScopes.remove(eventId);
        _phoneApprovals.remove(eventId);
        _petApprovals.remove(eventId);
        _questions.remove(eventId);
        _requestAlerts.remove(eventId);
        final session = _requests.remove(eventId);
        if (session != null) onWithdraw(host, session, eventId);
      case SessionStatusEvent(:final sessionId, :final running):
        final was = _running[sessionId];
        _running[sessionId] = running;
        if (running || was != false) _statusRevision[sessionId] = ++_revision;
        if (running) _pendingIdle.remove(sessionId);
        if (!running && was != false) {
          _pendingIdle.add(sessionId);
          unawaited(_onIdle(sessionId));
        }
      case SessionAddedEvent(:final summary):
        _sessions[summary.sessionId] = summary;
      case SessionRemovedEvent(:final sessionId):
        _sessions.remove(sessionId);
        _running.remove(sessionId);
        _statusRevision[sessionId] = ++_revision;
        _pendingIdle.remove(sessionId);
        _requests.removeWhere((_, s) => s == sessionId);
        _approvals.removeWhere((id, _) => !_requests.containsKey(id));
        _requestScopes.removeWhere((id, _) => !_requests.containsKey(id));
        _phoneApprovals.removeWhere((id, _) => !_requests.containsKey(id));
        _petApprovals.removeWhere((id) => !_requests.containsKey(id));
        _questions.removeWhere((id, _) => !_requests.containsKey(id));
        _requestAlerts.removeWhere((id, _) => !_requests.containsKey(id));
        onSessionGone(host, sessionId);
      default:
        break;
    }
  }

  void _dropStale() {
    for (final id in _stale) {
      _approvals.remove(id);
      _requestScopes.remove(id);
      _phoneApprovals.remove(id);
      _petApprovals.remove(id);
      _questions.remove(id);
      _requestAlerts.remove(id);
      final session = _requests.remove(id);
      if (session != null) onWithdraw(host, session, id);
    }
    _stale = const {};
  }

  void _onRequest(
    String eventId,
    String agentId,
    AlertKind kind,
    String text, {
    ApprovalRequest? approval,
    UserQuestionRequest? question,
  }) {
    _stale = _stale.difference({eventId});
    if (_requestScopes.containsKey(eventId)) return;
    final reannounce = _requests.containsKey(eventId);
    final scope = _requestScopes[eventId] = _RequestScope();
    bool current() => !_disposed && identical(_requestScopes[eventId], scope);
    _requests[eventId] = agentId;
    unawaited(() async {
      if (announceDelay > Duration.zero) await Future<void>.delayed(announceDelay);
      final root = await _rootOf(agentId);
      if (!current()) return;
      if (kind == AlertKind.approval && (skipApproval?.call(agentId) ?? false)) return;
      _requests[eventId] = root;
      // Buttons only when the notification can say exactly what gets approved.
      ({String text, String fullText})? preview;
      String? petText;
      if (approval != null) {
        try {
          final call = await source.approvalCall(approval).timeout(const Duration(seconds: 3));
          if (!current()) return;
          preview = approvalPreview(approval, call);
          if (preview != null) petText = petApprovalText(approval, call);
          final phoneText = phoneApprovalPreview(approval, call);
          if (phoneText != null) _phoneApprovals[eventId] = (request: approval, text: phoneText);
        } catch (_) {
          // Unreadable: the notification still opens the conversation.
        }
        if (!current()) return;
        if (preview != null) _approvals[eventId] = approval;
        if (petText != null) _petApprovals.add(eventId);
      }
      List<String>? choices;
      if (question != null) {
        _questions[eventId] = question;
        final first = question.questions.firstOrNull?.question;
        petText = snippet(first, max: petApprovalMax);
        // Choices only under a question that shows whole.
        if (petText != null && petText == snippet(first, max: 1 << 20)) choices = petChoices(question);
      }
      final alert = ChatAlert(
        host: host,
        sessionId: root,
        kind: kind,
        key: eventId,
        title: alertTitle(_sessions[root]?.title),
        text: preview?.text ?? text,
        fullText: preview?.fullText,
        canApprove: preview != null,
        eventId: eventId,
        petText: petText,
        petToken: scope.petToken,
        choices: choices,
      );
      _requestAlerts[eventId] = alert;
      (reannounce ? onReannounce : onAlert)?.call(alert);
    }());
  }

  Future<void> _onIdle(String sessionId) async {
    final revision = _statusRevision[sessionId];
    final generation = _generation;
    bool current() =>
        !_disposed &&
        source.connected &&
        _generation == generation &&
        _running[sessionId] == false &&
        _statusRevision[sessionId] == revision;
    final info = await _info(sessionId);
    if (!current()) return;
    if (info?.isSubagent ?? false) {
      _pendingIdle.remove(sessionId);
      return;
    }
    TurnOutcome? outcome;
    try {
      outcome = await source.lastTurn(sessionId);
    } catch (_) {
      // Host gone mid-read: nothing reliable to say.
    }
    // History and reconnect snapshots are asynchronous. A newer running edge
    // (even followed by another idle edge) invalidates this turn-end read.
    if (!current()) return;
    _pendingIdle.remove(sessionId);
    if (outcome == null) return;
    if (!_turnsSeen.add('$sessionId@${outcome.seq}')) return;
    final title = alertTitle(outcome.title ?? info?.title);
    onAlert(
      ChatAlert(
        host: host,
        sessionId: sessionId,
        kind: outcome.kind,
        key: turnKey,
        title: title,
        text: outcome.text,
        turnEndKind: outcome.reason.kind,
        reply: outcome.kind == AlertKind.done ? snippet(outcome.reply, max: 200) : null,
      ),
    );
  }

  /// Refreshes the session list; turns that ended while we were disconnected
  /// (running before, idle now) alert like a live falling edge.
  Future<void> _resync({bool seedOnly = false}) async {
    final revision = _revision;
    final generation = _generation;
    final List<SessionSummary> list;
    try {
      list = await source.listSessions();
    } catch (_) {
      return;
    }
    if (_disposed || generation != _generation) return;
    final missed = <String>[];
    for (final s in list) {
      // Live events received while listing are newer than this snapshot.
      if ((_statusRevision[s.sessionId] ?? 0) > revision) continue;
      _sessions[s.sessionId] = s;
      if (!seedOnly && !s.running && (_running[s.sessionId] == true || _pendingIdle.contains(s.sessionId))) {
        missed.add(s.sessionId);
      }
      _running[s.sessionId] = s.running;
      _statusRevision[s.sessionId] = ++_revision;
      if (s.running) _pendingIdle.remove(s.sessionId);
    }
    for (final id in missed) {
      _pendingIdle.add(id);
      unawaited(_onIdle(id));
    }
  }

  /// The summary of [sessionId], listing the sessions once when unknown.
  Future<SessionSummary?> _info(String sessionId) async {
    final known = _sessions[sessionId];
    if (known != null) return known;
    _listing ??= () async {
      try {
        for (final s in await source.listSessions()) {
          _sessions[s.sessionId] = s;
          _running.putIfAbsent(s.sessionId, () => s.running);
        }
      } catch (_) {
        // Unknown stays unknown: treated as a top-level session.
      }
    }();
    await _listing;
    _listing = null;
    return _sessions[sessionId];
  }

  /// The top-level conversation a (sub)agent belongs to.
  Future<String> _rootOf(String sessionId) async {
    var id = sessionId;
    for (var depth = 0; depth < 8; depth++) {
      final info = await _info(id);
      final parent = info?.parentSessionId;
      if (info == null || !info.isSubagent || parent == null || parent.isEmpty) return id;
      id = parent;
    }
    return id;
  }
}
