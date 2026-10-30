import 'dart:async';
import 'dart:math';

import 'package:dsh_client/dsh_client.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../l10n/l10n.dart';
import '../usage/usage_stats.dart';
import 'attachments.dart';
import 'chat_error_text.dart';
import 'connection_state.dart';
import 'hosts_state.dart';
import 'models_state.dart';
import 'notify_state.dart' show appForegroundProvider;
import 'run_pulse.dart';
import 'sessions_state.dart';

/// How a message sent while a turn is running reaches the agent.
enum SendMode {
  /// Idle session: starts a turn.
  now,

  /// Joins the running turn at its next step; the work goes on (DSH `steer`).
  steer,

  /// Waits for the running turn to finish (DSH `queue`).
  queue,

  /// Stops the running turn, then starts a new one with this message.
  interrupt,
}

/// Where the Host holds a prompt before it enters the transcript.
enum InboxSlot {
  /// `next-step`: picked up by the running turn at its next step.
  nextStep,

  /// `next-turn`: waits for the running turn to end.
  nextTurn,
}

/// `source.kind`s DSH (0.2.1-rc.4) puts in an agent inbox on its own, through
/// `agent.inject` / `steer` / `followup`: context for the model that the
/// next turn takes along. DSH Web leaves them out of the chat (it shows only
/// `user` interjections), and the transcript hides them once they land, so
/// they are not drawn while they wait either. `tool-jobs` is not one of them:
/// it has its own quiet row ([PendingPrompt.isBackgroundTask]). A source the
/// app does not know keeps the ordinary waiting bubble.
const engineNoteSources = {
  // dsh-user-approval: 「权限」 switched (ApprovalService.setPolicy).
  'user-approval',
  // dsh-plan-mode: plan mode switched on or off (form `notice`).
  'plan-mode',
  // dsh-working-directory: the working directory changed.
  'working-directory',
  // dsh-cordis-host-runner: a plugin run's outcome, or a failure after it.
  'cordis-host-runner',
  // dsh-subagent: a subagent finished (form `notice`).
  'subagent-settled',
  // dsh-subagent, agent team: a message from another agent (form `relay`);
  // `team-message` is the older team relay ([TeamMessage.fromEvent]).
  'agent-message',
  'team-message',
  // dsh-goal-round-driver: the next round toward a goal.
  'goal',
  // dsh-schedule: a reminder came due.
  'schedule',
  // dsh-user-questions: the answer to a question, shown on its card.
  'user-question-reply',
  // dsh-tool-goal, dsh-tools / dsh-spill-policy: context a tool call left
  // for the next step.
  'tool-goal',
  'ptc-mode',
};

/// A prompt the transcript has not echoed yet: sent from this device, or seen
/// waiting in the agent inbox (sent elsewhere, or before the app restarted).
///
/// DSH only writes `user/message` once the prompt leaves the Agent inbox, which
/// is immediate when idle but waits for the running turn when queued. The chat
/// shows these as optimistic bubbles until the matching [UserChatItem]
/// (same `requestId`) arrives.
class PendingPrompt {
  const PendingPrompt({
    required this.requestId,
    required this.text,
    required this.time,
    this.mode = SendMode.now,
    this.attachments = const [],
    this.inboxId,
    this.slot,
    this.resendable = true,
    this.sourceKind = 'user',
    this.sourceForm,
  });

  final String requestId;
  final String text;
  final DateTime time;
  final SendMode mode;

  /// What was attached, shown from local bytes until DSH echoes the message.
  final List<DraftAttachment> attachments;

  /// The inbox item id once the Host reports it (for `session/updateQueue`).
  final String? inboxId;

  /// Where the Host holds it now; null before the Host reports it.
  final InboxSlot? slot;

  /// Its whole content is at hand, so it can be taken out of the inbox and
  /// sent again (「立即发送」): sent from here, or plain text sent elsewhere.
  final bool resendable;

  /// Host producer metadata, independent of the message's role or text.
  /// Local optimistic prompts keep the human default; unknown Host sources
  /// retain their existing pending behavior.
  final String sourceKind;
  final String? sourceForm;

  bool get isBackgroundTask => sourceKind == 'tool-jobs';

  /// Context DSH put in the inbox for the model ([engineNoteSources]), not
  /// the person's words: it never shows in the chat and is never moved.
  bool get isEngineNote => engineNoteSources.contains(sourceKind);

  /// Written by DSH, not the person: nothing may send, steer or withdraw it.
  bool get isAutomatic => isBackgroundTask || isEngineNote;

  /// Waiting for the running turn to end.
  bool get queued => slot == InboxSlot.nextTurn || (slot == null && mode == SendMode.queue);

  PendingPrompt withMode(SendMode mode) => PendingPrompt(
    requestId: requestId,
    text: text,
    time: time,
    mode: mode,
    attachments: attachments,
    inboxId: inboxId,
    slot: slot,
    resendable: resendable,
    sourceKind: sourceKind,
    sourceForm: sourceForm,
  );

  PendingPrompt placed(String? inboxId, InboxSlot? slot, {MessageSource? source}) => PendingPrompt(
    requestId: requestId,
    text: text,
    time: time,
    mode: mode,
    attachments: attachments,
    inboxId: inboxId,
    slot: slot,
    resendable: resendable,
    sourceKind: source?.kind ?? sourceKind,
    sourceForm: source == null
        ? sourceForm
        : switch (source.raw['form']) {
            final String form => form,
            _ => null,
          },
  );
}

/// One slash command run in this session: the durable `command/run` +
/// `command/done` pair, or a local execution still waiting for them.
class CommandNotice {
  const CommandNotice({
    required this.id,
    required this.name,
    this.args,
    this.seq,
    this.done = false,
    this.success = true,
    this.text,
  });

  /// DSH `commandId`, or `local-N` until the Host answers.
  final String id;

  /// Registered command name without the slash (`compact`).
  final String name;

  /// Verbatim input after the name (may start with whitespace).
  final String? args;

  /// Seq of `command/run`; null while only known locally.
  final int? seq;
  final bool done;
  final bool success;

  /// The handler's result text (English from DSH's built-in commands).
  final String? text;

  String get key => 'cmd$id';

  /// `/name args` as typed.
  String get line {
    final rest = args?.trim() ?? '';
    return rest.isEmpty ? '/$name' : '/$name $rest';
  }

  CommandNotice copyWith({String? name, String? args, int? seq, bool? done, bool? success, String? text}) =>
      CommandNotice(
        id: id,
        name: name ?? this.name,
        args: args ?? this.args,
        seq: seq ?? this.seq,
        done: done ?? this.done,
        success: success ?? this.success,
        text: text ?? this.text,
      );
}

/// Render state for one session's conversation.
class ChatState {
  const ChatState({
    this.items = const [],
    this.running = false,
    this.streamLost = false,
    this.syncing = false,
    this.resyncing = false,
    this.stopping = false,
    this.title,
    this.approvals = const [],
    this.questions = const [],
    this.hasMoreHistory = false,
    this.loading = true,
    this.loadingOlder = false,
    this.error,
    this.notice,
    this.connection,
    this.model,
    this.pending = const [],
    this.autoApprove = false,
    this.autoAnswered = const {},
    this.commands = const [],
    this.turns = const [],
    this.todos,
    this.goal,
    this.clockSkew = Duration.zero,
  });

  final List<ChatItem> items;
  final bool running;

  /// The live stream ended with an error; what is shown stays until the next
  /// snapshot.
  final bool streamLost;

  /// Retained content is readable, but a current complete follow snapshot
  /// has not yet been applied. This is independent of mux connectivity.
  final bool syncing;
  final bool resyncing;
  bool get controlReady => !syncing && !streamLost;

  /// Stop was asked for and the turn has not ended yet.
  final bool stopping;
  final String? title;
  final List<ApprovalRequest> approvals;
  final List<UserQuestionRequest> questions;
  final bool hasMoreHistory;
  final bool loading;
  final bool loadingOlder;
  final String? error;

  /// Something worth knowing that isn't a failure (e.g. images went as files
  /// because the model reads text only). Shown like [error], in info colours.
  final String? notice;
  final DshConnectionState? connection;

  /// Model the next request uses (latest `model/selection`, else the
  /// session projection). Null until the session reports one.
  final ModelSelection? model;

  /// Prompts sent from here and not yet echoed by the transcript.
  final List<PendingPrompt> pending;

  /// "本对话都允许": this client answers every approval of the session with
  /// allow-once as soon as it arrives. In memory only (reset on app restart).
  final bool autoApprove;

  /// Approval event ids this client has auto-allowed and that are still
  /// pending on the Host; the UI hides their cards (the call simply runs).
  final Set<String> autoAnswered;

  /// Slash commands of this session, durable ones in seq order, then local.
  final List<CommandNotice> commands;

  /// Where each loaded turn's time went (see [traceTurns]); the last one is
  /// open while a turn runs.
  final List<TurnTrace> turns;

  /// The session's todo list (the `todos` projection: the latest
  /// `todo/write`, cleared when the next turn starts), null when it has none.
  final List<TodoItem>? todos;

  /// The session's long-term goal (the `goal` projection), null when it has
  /// none.
  final GoalProjection? goal;

  /// Device clock minus Host clock, estimated from live events (zero on the
  /// on-device engine). Live timers subtract it from `DateTime.now()`.
  final Duration clockSkew;

  /// The running turn's trace; null when idle.
  TurnTrace? get runningTurn {
    final last = turns.isEmpty ? null : turns.last;
    return running && last != null && last.running ? last : null;
  }

  /// The first approval waiting on the person (auto-allowed ones run).
  ApprovalRequest? get openApproval => approvals.where((a) => !autoAnswered.contains(a.eventId)).firstOrNull;

  /// The open question when exactly one request asks exactly one: what is
  /// typed in the composer answers it.
  UserQuestionRequest? get singleQuestion => switch (questions) {
    [final request] when request.questions.length == 1 => request,
    _ => null,
  };

  ChatState copyWith({
    bool? streamLost,
    bool? syncing,
    bool? resyncing,
    bool? stopping,
    bool? loading,
    bool? loadingOlder,
    String? error,
    bool clearError = false,
    String? notice,
    bool clearNotice = false,
    ModelSelection? model,
    List<PendingPrompt>? pending,
    bool? autoApprove,
    Set<String>? autoAnswered,
    List<CommandNotice>? commands,
  }) => ChatState(
    items: items,
    running: running,
    streamLost: streamLost ?? this.streamLost,
    syncing: syncing ?? this.syncing,
    resyncing: resyncing ?? this.resyncing,
    stopping: stopping ?? this.stopping,
    title: title,
    approvals: approvals,
    questions: questions,
    hasMoreHistory: hasMoreHistory,
    loading: loading ?? this.loading,
    loadingOlder: loadingOlder ?? this.loadingOlder,
    error: clearError ? null : (error ?? this.error),
    notice: clearNotice ? null : (notice ?? this.notice),
    connection: connection,
    model: model ?? this.model,
    pending: pending ?? this.pending,
    autoApprove: autoApprove ?? this.autoApprove,
    autoAnswered: autoAnswered ?? this.autoAnswered,
    commands: commands ?? this.commands,
    turns: turns,
    todos: todos,
    goal: goal,
    clockSkew: clockSkew,
  );
}

/// Folds `DshClient.watch(sessionId)` into [ChatState] through [ChatTranscript].
class ChatController extends Notifier<ChatState> {
  final _interactions = <Object, bool Function()>{};

  /// Only conversation screens own interaction leases. Acquiring or regaining
  /// one never replaces the data follow or retires a first message's wait.
  void Function() beginInteraction(bool Function() allowed) {
    final token = Object();
    _interactions[token] = allowed;
    _activateInteraction();
    return () => _interactions.remove(token);
  }

  void _activateInteraction() {
    final client = _client;
    final epoch = _followEpoch;
    if (client == null || epoch == null || !_synchronized || !_activationAllowed) return;
    final listener = _listenOwner;
    unawaited(
      client.activateSessionForInteraction(
        sessionId,
        epoch: epoch,
        allowed: () =>
            ref.mounted && identical(listener, _listenOwner) && identical(client, _client) && _activationAllowed,
      ),
    );
  }

  bool get _activationAllowed => _interactions.values.any((allowed) => allowed());

  ChatController(this.sessionId);

  final String sessionId;
  final ChatTranscript _transcript = ChatTranscript();
  StreamSubscription<DshEvent>? _sub;
  StreamSubscription<DshConnectionState>? _states;
  Timer? _flush;
  Timer? _stopTimeout;
  _ChatOperation? _stoppingOperation;
  bool _dirty = false;
  ModelSelection? _model;
  Object? _modelChange;

  /// A model-selection repair for this session is already on the wire.
  bool _healingModel = false;
  Object? _historyRead;
  List<PendingPrompt> _pending = const [];

  /// Prompts removed elsewhere or consumed by a finished turn: dropped at
  /// the next publish unless they are back by then (「改为插话」 removes,
  /// then adds).
  final _withdrawn = <String>{};

  /// Observed inbox claims, keyed by request identity and durable sequence.
  /// A pre-step hook may consume input without writing a user/message echo.
  final _claimedAt = <String, int>{};

  /// Our prompts taken out of the inbox to be sent again ([_takeOut]): their
  /// bubbles stay, as 「发送中」, until they are back.
  final _moving = <String, _ChatOperation>{};
  var _stopAttempt = 0;
  Object _listenOwner = Object();
  Object _syncScope = Object();
  SessionFollowEpoch? _followEpoch;
  MuxGeneration? _snapshotGeneration;
  bool _synchronized = false;
  bool _watchEnded = false;
  Completer<bool> _syncReady = Completer<bool>();
  Future<bool>? _resyncFuture;
  Object? _resyncOwner;
  bool _autoApprove = false;
  Set<String> _autoAnswered = const {};
  HostRef? _approvalHost;
  Object _approvalScope = Object();
  final _commands = CommandLog();
  var _localCommands = 0;

  /// A send whose outcome is unknown (the connection dropped mid-call):
  /// sending the same content again reuses its request id, which DSH dedups.
  ({String content, String requestId})? _unsettled;

  /// Device minus Host clock; null until a live event was seen (and always
  /// null on the on-device engine, which shares the clock).
  Duration? _skew;
  bool _sameClock = false;

  DshClient? get _client => ref.read(activeConnectionProvider).value?.client;

  bool get _canControl =>
      _synchronized && (_followEpoch?.isCurrent ?? true) && identical(_snapshotGeneration, _client?.mux.generation);

  // A Notifier survives dependency rebuilds. The captured Ref expires even
  // after A → B → A; the mux identity also changes when one client reconnects.
  // A later stop supersedes an earlier stop even within the same generation.
  bool _currentOperation(_ChatOperation operation) =>
      operation.ref.mounted &&
      identical(_client, operation.client) &&
      identical(operation.generation, operation.client.mux.generation) &&
      identical(operation.syncScope, _syncScope) &&
      _canControl &&
      (operation.stopAttempt == null || operation.stopAttempt == _stopAttempt);

  void _requireCurrent(_ChatOperation operation) {
    if (!_currentOperation(operation)) throw const _ObsoleteChatOperation();
  }

  bool _isMoving(String requestId) {
    final operation = _moving[requestId];
    return operation != null && _currentOperation(operation);
  }

  void _finishMoving(_ChatOperation operation, String requestId) {
    if (identical(_moving[requestId], operation)) _moving.remove(requestId);
  }

  /// The loaded durable log and the session header (deliverables, artifacts:
  /// see `artifacts.dart`). [ChatState.turns] changes whenever the log does.
  Iterable<SessionLogEvent> get events => _transcript.events;
  SessionHeader? get header => _transcript.header;

  /// The last snapshot's projections (permission preset, plan mode: see
  /// `session_modes.dart`); later log events override them.
  SessionProjections get projections => _transcript.projections;

  @override
  ChatState build() {
    // Session ids and consent belong to one selected Host. A dependency
    // rebuild may reuse this Notifier for an identically named session there.
    // Reconnecting to the same Host keeps the existing conversation consent.
    final host = ref.watch(activeHostProvider);
    if (_approvalHost != host) {
      // These requests belong to the previous Host, even if the new Host has
      // the same session id. A new watch replays its own mux's pending requests.
      // Retire only the local cards; do not answer or cancel the old Host's work.
      for (final id in [..._transcript.pendingApprovals.keys, ..._transcript.pendingQuestions.keys]) {
        _transcript.apply(HostRequestCancelledEvent(id));
      }
      _approvalHost = host;
      _approvalScope = Object();
      _autoApprove = false;
      _autoAnswered = const {};
    }
    // Async continuations from the previous build no longer own these marks.
    _modelChange = null;
    _historyRead = null;
    _moving.clear();
    _synchronized = false;
    _syncScope = Object();
    _resyncFuture = null;
    _resyncOwner = null;
    // Kept a minute after the last screen leaves (a quick switch back reuses
    // it), and as long as a turn, an unechoed prompt or auto-approve still
    // needs the stream.
    final link = ref.keepAlive();
    Timer? release;
    void releaseLater() {
      release?.cancel();
      release = Timer(const Duration(seconds: 60), () {
        if (_transcript.running || _pending.isNotEmpty || _autoApprove) {
          releaseLater();
        } else {
          link.close();
        }
      });
    }

    ref.onCancel(releaseLater);
    ref.onResume(() => release?.cancel());
    final client = ref.watch(activeConnectionProvider.select((c) => c.value?.client));
    ref.onDispose(() {
      // Invalidation runs before a lazy rebuild replaces the still-mounted Ref.
      _modelChange = null;
      _listenOwner = Object();
      _followEpoch?.retire();
      if (!_syncReady.isCompleted) _syncReady.complete(false);
      release?.cancel();
      _flush?.cancel();
      _flush = null;
      _stopTimeout?.cancel();
      _awayTimer?.cancel();
      unawaited(_sub?.cancel());
      unawaited(_states?.cancel());
    });
    // Not connected is a screen state (the composer explains it), not an
    // error. What was loaded stays until a new snapshot replaces it.
    if (client == null) return _retained(loading: false);
    _sameClock = ref.read(activeConnectionProvider).value!.isLocal;
    if (_sameClock) {
      _quiet = false;
    } else {
      _onScreen(ref.read(appForegroundProvider), building: true);
      ref.listen(appForegroundProvider, (_, onScreen) => _onScreen(onScreen));
    }
    // Token speed and compaction for the activity pill (see run_pulse.dart).
    final pulse = ref.watch(runPulseProvider(sessionId));
    _listen(client, pulse, building: true);
    // A model edit (thinking levels removed) can make this session's stored
    // selection invalid without touching the conversation; heal it when the
    // catalog catches up, not on the next refused prompt.
    ref.listen<AsyncValue<ModelCatalog?>>(modelCatalogProvider, (_, _) => scheduleMicrotask(_healModelSelection));
    // The stream gives up after a long outage: follow again once reconnected.
    final buildOwner = ref;
    _states = client.mux.states.listen((connection) {
      if (!buildOwner.mounted || !identical(client, _client)) return;
      if (connection != DshConnectionState.connected) _markSyncing();
      final stopping = _stoppingOperation;
      if (stopping != null && !_currentOperation(stopping)) _endStopping();
      if (connection == DshConnectionState.connected && _watchEnded) {
        _listen(client, pulse);
      }
    });
    return _retained(loading: _transcript.items.isEmpty);
  }

  /// How long the app may be out of sight before a running conversation on a
  /// remote host stops streaming tokens ([_quiet]).
  static const quietAfter = Duration(seconds: 30);
  Timer? _awayTimer;
  bool _awayLong = false;

  /// Remote hosts relay every streamed token as a frame of its own. While
  /// the app has been out of sight for [quietAfter], a running conversation
  /// follows without them (durable events, approvals and turn ends still
  /// arrive); back on screen it takes them up again from a fresh snapshot.
  bool _quiet = false;

  void _onScreen(bool onScreen, {bool building = false}) {
    _awayTimer?.cancel();
    _awayLong = false;
    if (!onScreen) {
      _awayTimer = Timer(quietAfter, () {
        _awayLong = true;
        _quietIfRunning();
      });
    } else if (_quiet) {
      _quiet = false;
      if (!building) _relisten();
    }
  }

  void _quietIfRunning() {
    if (!_awayLong || _quiet || !ref.mounted || !_transcript.running) return;
    _quiet = true;
    _relisten();
  }

  void _relisten() {
    final client = _client;
    if (client != null) _listen(client, ref.read(runPulseProvider(sessionId)));
  }

  /// The loaded conversation without its live parts (running, approvals,
  /// questions), across a new or a lost connection.
  ChatState _retained({required bool loading}) => ChatState(
    items: _transcript.items,
    title: _transcript.title,
    turns: _transcript.turns,
    todos: _transcript.todos,
    goal: _transcript.goal,
    hasMoreHistory: _transcript.hasMoreHistory,
    loading: loading,
    syncing: true,
    commands: _commandList(),
    model: _model,
    pending: _placePending(),
    autoApprove: _autoApprove,
    autoAnswered: _autoAnswered,
    clockSkew: _skew ?? Duration.zero,
  );

  void _markSyncing({SessionFollowEpoch? epoch, bool building = false}) {
    _followEpoch?.retire();
    _followEpoch = epoch;
    _syncScope = Object();
    _historyRead = null;
    _synchronized = false;
    if (_syncReady.isCompleted) _syncReady = Completer<bool>();
    _stopTimeout?.cancel();
    _stoppingOperation = null;
    if (!building) state = state.copyWith(syncing: true, stopping: false, loadingOlder: false);
  }

  /// A first prompt may arrive immediately after session/create. Wait for the
  /// real baseline with one bounded future; keep the caller's draft meanwhile.
  /// An interrupt is never queued this way (it would target an unseen turn).
  /// A retired page request must not publish a timeout notice for a newer one.
  Future<bool> waitForSync({bool Function()? isCurrent}) async {
    if (isCurrent?.call() == false) return false;
    if (_canControl) return true;
    final owner = ref;
    final client = _client;
    final listener = _listenOwner;
    if (client == null) return false;
    final ready = await _syncReady.future.timeout(const Duration(seconds: 10), onTimeout: () => false);
    if (!owner.mounted ||
        !identical(client, _client) ||
        !identical(listener, _listenOwner) ||
        isCurrent?.call() == false) {
      return false;
    }
    if (ready && _canControl) return true;
    state = state.copyWith(notice: appL10n.stateChatSyncRequired);
    return false;
  }

  /// Reopens the actual follow, even when the mux itself never disconnected.
  /// Deduplicated and bounded; only an applied fresh snapshot is success.
  Future<bool> resync() {
    if (_resyncFuture case final existing?) return existing;
    final client = _client;
    if (client == null) return Future.value(false);
    final owner = ref;
    final attempt = _resyncOwner = Object();
    state = state.copyWith(resyncing: true);
    _listen(client, ref.read(runPulseProvider(sessionId)));
    final listener = _listenOwner;
    if (client.mux.state != DshConnectionState.connected) client.mux.reconnect();
    final ready = _syncReady.future;
    return _resyncFuture = (() async {
      try {
        return await ready.timeout(
              const Duration(seconds: 10),
              onTimeout: () {
                if (owner.mounted && identical(client, _client) && identical(listener, _listenOwner)) {
                  _listenOwner = Object();
                  _watchEnded = true;
                  _markSyncing();
                  if (!_syncReady.isCompleted) _syncReady.complete(false);
                  unawaited(_sub?.cancel());
                  state = state.copyWith(streamLost: true, loading: false);
                }
                return false;
              },
            ) &&
            owner.mounted &&
            identical(client, _client) &&
            _canControl;
      } finally {
        if (identical(_resyncOwner, attempt)) {
          _resyncOwner = null;
          _resyncFuture = null;
          if (owner.mounted && identical(client, _client)) state = state.copyWith(resyncing: false);
        }
      }
    })();
  }

  void _listen(DshClient client, RunPulse pulse, {bool building = false}) {
    final owner = ref;
    final listener = _listenOwner = Object();
    _watchEnded = false;
    bool current() => owner.mounted && identical(listener, _listenOwner) && identical(client, _client);
    if (!_syncReady.isCompleted) _syncReady.complete(false);
    _syncReady = Completer<bool>();
    _markSyncing(building: building);
    unawaited(_sub?.cancel());
    _sub = client
        .watch(
          sessionId,
          options: WatchOptions(
            assistantStream: !_quiet,
            includeSyncEvents: true,
            activate: true,
            activationAllowed: () {
              if (!current()) return false;
              return _activationAllowed;
            },
          ),
        )
        .listen(
          (event) {
            if (!current()) return;
            if (event is SessionSyncEvent) {
              _markSyncing(epoch: event.epoch);
              return;
            }
            if (event is ConnectionStateEvent && event.state != DshConnectionState.connected) {
              _markSyncing();
            }
            if (event is SessionSnapshotEvent) {
              if (!identical(event.followEpoch, _followEpoch) || !(event.followEpoch?.isCurrent ?? true)) return;
              // Recheck at delivery, not only when watch() emitted the frame.
              // A queued old snapshot cannot adopt a newer (or null) mux.
              if (event.followEpoch case final epoch?) {
                final generation = client.mux.generation;
                if (generation == null || !identical(epoch.generation, generation)) return;
              }
            }
            _trackClock(event);
            pulse.observe(event, skew: _sameClock ? Duration.zero : _skew);
            _trackModel(event);
            _trackCommands(event);
            final reconcile =
                (event is InboxSplicedEvent && event.seq > _transcript.cursor) ||
                (event is SessionSnapshotEvent && event.isResync);
            final before = reconcile ? _inboxIds() : const <String>{};
            final changed = _transcript.apply(event);
            if (_awayLong && !_quiet && _transcript.running) scheduleMicrotask(_quietIfRunning);
            if (reconcile) {
              final removed = before.difference(_inboxIds());
              if (event is InboxSplicedEvent && !event.canceled) {
                for (final prompt in _pending) {
                  if (removed.contains(prompt.requestId)) _claimedAt[prompt.requestId] = event.seq;
                }
              } else {
                _withdrawn.addAll(removed);
              }
            }
            // Turns execute serially: a later durable end settles an observed
            // claim even when a plugin rejects the step without a user echo.
            // Older replayed endings must never settle a newer request.
            final endedThrough = switch (event) {
              TurnEndedEvent(:final seq) => seq,
              SessionSnapshotEvent(:final events) => events.whereType<TurnEndedEvent>().fold<int>(
                0,
                (last, end) => end.seq > last ? end.seq : last,
              ),
              _ => 0,
            };
            if (endedThrough > 0) {
              _claimedAt.removeWhere((requestId, seq) {
                if (seq >= endedThrough) return false;
                _withdrawn.add(requestId);
                return true;
              });
            }
            // The stopped turn is over, even when what waited in the inbox
            // starts the next one at once (running never reads false).
            if (event is TurnEndedEvent && state.stopping) _endStopping();
            _trackApprovals(event);
            if (event is SessionSnapshotEvent) {
              // A replacement transcript may have the same sequence bounds.
              _lookupKey = null;
              _snapshotGeneration = client.mux.generation;
              _synchronized = true;
              // One publication: no ready state containing the old inbox.
              _publish(freshSnapshot: true);
              if (!_syncReady.isCompleted) _syncReady.complete(true);
              _activateInteraction();
            } else if (changed) {
              _schedule();
            }
          },
          onError: (Object e) {
            if (!current()) return;
            _watchEnded = true;
            _markSyncing();
            if (!_syncReady.isCompleted) _syncReady.complete(false);
            // Deleted elsewhere: back to a new chat, nothing to report.
            if (e is DshRemoteException && e.code == 'session/not-found') {
              if (ref.read(currentSessionProvider) == sessionId) {
                ref.read(currentSessionProvider.notifier).select(null);
              }
              return;
            }
            state = state.copyWith(
              error: chatErrorText(e, action: appL10n.stateChatSyncInterrupted),
              streamLost: true,
              loading: false,
            );
          },
          onDone: () {
            if (!current()) return;
            _watchEnded = true;
            _markSyncing();
            if (!_syncReady.isCompleted) _syncReady.complete(false);
            state = state.copyWith(streamLost: true, loading: false);
          },
        );
  }

  Set<String> _inboxIds() => {for (final q in _transcript.inbox) ?q.requestId};

  /// Estimates [ChatState.clockSkew] from live durable events: arrival time
  /// minus Host time is skew plus delivery delay, so the smallest sample is
  /// the best estimate. Snapshot history and replays only ever overestimate
  /// and lose to live samples; anything over an hour is ignored as replay.
  void _trackClock(DshEvent event) {
    if (_sameClock || event is! SessionLogEvent) return;
    final sample = DateTime.now().difference(event.time);
    if (sample.abs() > const Duration(hours: 1)) return;
    final skew = _skew;
    if (skew == null || sample < skew) _skew = sample;
  }

  /// Auto-allows new approvals in auto mode; forgets answered ones once the
  /// Host withdraws them. Redeliveries (same eventId after a reconnect) are
  /// answered once.
  void _trackApprovals(DshEvent event) {
    switch (event) {
      case ApprovalRequestedEvent(:final request) when _autoApprove:
        unawaited(_autoAllow(request));
      case HostRequestCancelledEvent(:final eventId) when _autoAnswered.contains(eventId):
        _autoAnswered = Set.unmodifiable({..._autoAnswered}..remove(eventId));
      default:
        break;
    }
  }

  Future<void> _autoAllow(ApprovalRequest request) async {
    final client = _client;
    if (client == null || _autoAnswered.contains(request.eventId)) return;
    // Same-host reconnects retain the pending answer; another host retires it.
    final scope = _approvalScope;
    _autoAnswered = Set.unmodifiable({..._autoAnswered, request.eventId});
    state = state.copyWith(autoAnswered: _autoAnswered);
    try {
      await client.respondApproval(request, ApprovalDecision.allowOnce);
    } catch (e) {
      if (!ref.mounted || !identical(scope, _approvalScope)) return;
      // Put the card back so the person can answer it by hand.
      _autoAnswered = Set.unmodifiable({..._autoAnswered}..remove(request.eventId));
      state = state.copyWith(
        autoAnswered: _autoAnswered,
        error: chatErrorText(e, action: appL10n.stateChatAutoApproveFailed),
      );
    }
  }

  /// "本对话都允许": allows [request] (and anything else pending) once, then
  /// keeps allowing every new approval of this conversation.
  Future<void> allowAll(ApprovalRequest request) async {
    setAutoApprove(true);
    await _autoAllow(request);
  }

  /// Turns auto-approve on (answering what is already pending) or off.
  void setAutoApprove(bool enabled) {
    _autoApprove = enabled;
    state = state.copyWith(autoApprove: enabled);
    if (!enabled) return;
    for (final pending in _transcript.pendingApprovals.values) {
      unawaited(_autoAllow(pending));
    }
  }

  void _trackCommands(DshEvent event) {
    switch (event) {
      case SessionSnapshotEvent(:final events, :final isResync):
        if (!isResync) _commands.removeWhere((_, c) => c.seq != null);
        events.forEach(_applyCommandEvent);
      case SessionLogEvent():
        _applyCommandEvent(event);
      default:
        break;
    }
  }

  void _applyCommandEvent(SessionLogEvent event) => _commands.apply(event);

  List<CommandNotice> _commandList() => _commands.view;

  /// Runs a slash command line (`/compact`, `/permission read-only`) through
  /// `commands/execute`; the result shows inline as a [CommandNotice].
  Future<bool> runCommand(String line) async {
    final owner = ref;
    final client = _client;
    final trimmed = line.trim();
    if (client == null || !trimmed.startsWith('/')) return false;
    final space = trimmed.indexOf(RegExp(r'\s'));
    final name = trimmed.substring(1, space < 0 ? trimmed.length : space);
    final args = space < 0 ? null : trimmed.substring(space);
    final localId = 'local-${_localCommands++}';
    // DSH logs command/run before executing, with its own commandId. The
    // execute response only returns that id after completion, so an optimistic
    // local row cannot be safely paired with a concurrent durable event.
    state = state.copyWith(clearError: true);
    try {
      final result = await client.executeCommand(sessionId, trimmed);
      if (!owner.mounted) return false;
      final id = result.commandId;
      if (id == null) {
        // Invalid syntax or an unknown name: DSH logs nothing.
        _commands[localId] = CommandNotice(
          id: localId,
          name: name,
          args: args,
          done: true,
          success: false,
          text: result.text ?? appL10n.stateCommandMissing,
        );
      } else {
        final durable = _commands[id];
        _commands[id] = CommandNotice(
          id: id,
          name: durable?.name ?? name,
          args: durable?.args ?? args,
          seq: durable?.seq,
          done: true,
          success: result.success,
          text: result.text ?? durable?.text,
        );
      }
      state = state.copyWith(commands: _commandList());
      return result.success;
    } catch (e) {
      if (!owner.mounted) return false;
      _commands[localId] = CommandNotice(
        id: localId,
        name: name,
        args: args,
        done: true,
        success: false,
        text: chatErrorText(e, action: appL10n.stateCommandFailed),
      );
      state = state.copyWith(commands: _commandList());
      return false;
    }
  }

  void _trackModel(DshEvent event) {
    switch (event) {
      case ModelSelectedEvent(:final selection?):
        _model = selection;
        scheduleMicrotask(_healModelSelection);
      case SessionSnapshotEvent(:final events, :final projections, :final isResync):
        ModelSelection? latest;
        for (final e in events) {
          if (e is ModelSelectedEvent && e.selection != null) {
            latest = e.selection;
          }
        }
        _model = latest ?? (isResync ? _model : null) ?? projections.nextModel ?? _model;
        scheduleMicrotask(_healModelSelection);
      default:
        break;
    }
  }

  /// The provider's model edit (thinking switched off) removes every
  /// `reasoningEfforts`; the Host keeps this session's old selection, and DSH
  /// refuses its effort — even `off` — as `UNSUPPORTED_REASONING_EFFORT` on
  /// the next request. Replace it with the same model and no effort.
  void _healModelSelection() {
    // A Host switch keeps [_model] until the new Host's snapshot replaces it;
    // never send the previous Host's selection to the same session id.
    if (!ref.mounted || !_synchronized || _healingModel) return;
    final wanted = _model;
    final catalog = ref.read(modelCatalogProvider).value;
    if (wanted == null || catalog == null) return;
    final normalized = normalizeModelSelection(catalog, wanted);
    if (identical(normalized, wanted)) return;
    _healingModel = true;
    unawaited(() async {
      await _repairModelSelection(normalized, wanted);
      _healingModel = false;
      // A selection chosen meanwhile (another device, the picker) deserves
      // its own check; the repair's reply no longer owns [_model].
      if (ref.mounted && !_sameSelection(_model, wanted)) scheduleMicrotask(_healModelSelection);
    }());
  }

  /// How many times a repair of one selection is tried: a transient carrier
  /// failure must not leave the stale effort for the next prompt to hit.
  static const _repairAttempts = 3;

  /// Posts [normalized], unless someone else replaced the model [wanted]
  /// meanwhile. Retries only while the selection is still [wanted] and the
  /// catalog still refuses its effort, so a rejection ends the repair.
  Future<void> _repairModelSelection(ModelSelection normalized, ModelSelection wanted) async {
    for (var attempt = 0; attempt < _repairAttempts; attempt++) {
      if (!_sameSelection(_model, wanted)) return;
      if (await _setModel(normalized, announceFailure: false)) return;
      if (!ref.mounted || !_sameSelection(_model, wanted)) return;
      final catalog = ref.read(modelCatalogProvider).value;
      if (catalog == null || identical(normalizeModelSelection(catalog, wanted), wanted)) return;
      await Future<void>.delayed(const Duration(seconds: 1));
    }
  }

  /// Two selections name the same model and the same effort.
  static bool _sameSelection(ModelSelection? a, ModelSelection? b) =>
      a?.provider == b?.provider && a?.model == b?.model && a?.reasoningEffort == b?.reasoningEffort;

  /// Coalesces streaming updates to roughly one rebuild per frame.
  void _schedule() {
    _dirty = true;
    _flush ??= Timer(const Duration(milliseconds: 32), () {
      _flush = null;
      if (_dirty) _publish();
    });
  }

  void _publish({bool freshSnapshot = false}) {
    _dirty = false;
    _moving.removeWhere((_, operation) => !_currentOperation(operation));
    final items = _transcript.items;
    final running = _transcript.running;
    if (!running) {
      _stopTimeout?.cancel();
      _stoppingOperation = null;
    }
    if (_pending.isNotEmpty) _dropEchoed(items);
    if (_withdrawn.isNotEmpty) {
      final inbox = _inboxIds();
      _pending = List.unmodifiable(
        _pending.where(
          (p) => !_withdrawn.contains(p.requestId) || inbox.contains(p.requestId) || _isMoving(p.requestId),
        ),
      );
      // A moving prompt's mark waits: if it never comes back, it goes then.
      _withdrawn.retainAll(_moving.keys.where(_isMoving));
    }
    if (_claimedAt.isNotEmpty) {
      final pendingIds = _pending.map((prompt) => prompt.requestId).toSet();
      _claimedAt.removeWhere((requestId, _) => !pendingIds.contains(requestId));
    }
    final pending = _placePending();
    state = ChatState(
      items: items,
      running: running,
      streamLost: freshSnapshot ? false : state.streamLost,
      syncing: !_canControl,
      resyncing: state.resyncing,
      stopping: running && state.stopping,
      title: _transcript.title,
      approvals: _transcript.pendingApprovals.values.toList(),
      questions: _transcript.pendingQuestions.values.toList(),
      hasMoreHistory: _transcript.hasMoreHistory,
      loading: false,
      loadingOlder: state.loadingOlder,
      error: freshSnapshot ? null : state.error,
      notice: freshSnapshot ? null : state.notice,
      connection: _transcript.connectionState,
      model: _model,
      pending: pending,
      autoApprove: _autoApprove,
      autoAnswered: _autoAnswered,
      commands: _commandList(),
      turns: _transcript.turns,
      todos: _transcript.todos,
      goal: _transcript.goal,
      clockSkew: _skew ?? Duration.zero,
    );
  }

  /// Our pending prompts with their inbox slot, plus prompts waiting in the
  /// inbox that this device didn't send (another client, or before a restart).
  /// What DSH put there itself for the model ([PendingPrompt.isEngineNote])
  /// is left out: it is not anyone's message waiting to be sent, and nothing
  /// here may move it.
  List<PendingPrompt> _placePending() {
    final inbox = _transcript.inbox;
    if (inbox.isEmpty && _moving.isEmpty) return _pending;
    final byRequest = {for (final q in inbox) ?q.requestId: q};
    final ours = {for (final p in _pending) p.requestId};
    InboxSlot slotOf(QueuedPrompt q) => q.steering ? InboxSlot.nextStep : InboxSlot.nextTurn;
    final placed = [
      for (final p in _pending)
        if (_isMoving(p.requestId))
          p.withMode(SendMode.now)
        else if (byRequest[p.requestId] case final q?)
          p.placed(q.id, slotOf(q), source: q.message.source)
        else
          p,
      for (final q in inbox)
        if (!ours.contains(q.requestId))
          PendingPrompt(
            requestId: q.requestId ?? q.id,
            text: q.text,
            time: DateTime.now(),
            mode: q.steering ? SendMode.steer : SendMode.queue,
            inboxId: q.id,
            slot: slotOf(q),
            // Attachments sent elsewhere have no bytes here to send again.
            resendable: q.message.source.isHuman && q.message.parts.every((p) => p is TextPart),
            sourceKind: q.message.source.kind,
            sourceForm: switch (q.message.source.raw['form']) {
              final String form => form,
              _ => null,
            },
          ),
    ];
    return List.unmodifiable(placed.where((p) => !p.isEngineNote));
  }

  /// What waits in the inbox, in the order the agent takes it: every
  /// interjection with the first queued prompt, then the rest of the queue
  /// one turn each.
  List<PendingPrompt> _waiting() {
    final placed = {for (final p in _placePending()) ?p.inboxId: p};
    return [for (final q in _transcript.inbox) ?placed[q.id]];
  }

  /// Removes optimistic bubbles whose `user/message` has landed.
  void _dropEchoed(List<ChatItem> items) {
    final echoed = <String>{};
    // Echoes are near the end; a bounded scan keeps this O(1) per frame.
    for (var i = items.length - 1, seen = 0; i >= 0 && seen < 12; i--) {
      final item = items[i];
      if (item is UserChatItem) {
        seen++;
        if (item.requestId case final id?) echoed.add(id);
      }
    }
    if (echoed.isEmpty) return;
    final rest = _pending.where((p) => !echoed.contains(p.requestId)).toList();
    if (rest.length != _pending.length) _pending = List.unmodifiable(rest);
  }

  /// Sends [text] with [attachments]; resolves to `false` when it could not be
  /// delivered. Files are staged first (`fileUploads/upload`), images go inline.
  ///
  /// While a turn runs, [mode] picks how the message reaches the agent; when
  /// idle every mode just starts a turn.
  Future<bool> send(String text, {List<DraftAttachment> attachments = const [], SendMode mode = SendMode.now}) async {
    final client = _client;
    final trimmed = text.trim();
    if (client == null || (trimmed.isEmpty && attachments.isEmpty)) {
      return false;
    }
    if (!_canControl && (mode == SendMode.interrupt || !await waitForSync())) return false;
    if (!ref.mounted || !identical(client, _client) || !_canControl) return false;
    final operation = _ChatOperation(ref, client, _syncScope);
    final content = _contentKey(trimmed, attachments);
    final requestId = _unsettled?.content == content ? _unsettled!.requestId : _requestId();
    _unsettled = null;
    final running = state.running;
    final effective = running ? (mode == SendMode.now ? SendMode.steer : mode) : SendMode.now;
    _pending = List.unmodifiable([
      ..._pending,
      PendingPrompt(
        requestId: requestId,
        text: trimmed,
        time: DateTime.now(),
        mode: effective,
        attachments: List.unmodifiable(attachments),
      ),
    ]);
    state = state.copyWith(
      pending: _placePending(),
      // A lost stream keeps saying so.
      clearError: !state.streamLost,
      clearNotice: true,
    );
    try {
      final receipts = await _stageFiles(operation, attachments);
      if (!_currentOperation(operation)) return false;
      var promptMode = effective == SendMode.steer ? PromptMode.steer : PromptMode.queue;
      String? stopFailed;
      // Interrupt stops first, then sends: DSH keeps the inbox across a stop
      // but only starts the next turn for a prompt that arrives after it (one
      // queued before the stop would wait for whatever is sent next).
      if (effective == SendMode.interrupt) {
        final stopped = await _stop(operation);
        // Retirement is not a failed cancel: it must never fall back to steer.
        if (!_currentOperation(operation)) return false;
        if (!stopped) {
          // The turn goes on: the message joins it instead.
          promptMode = PromptMode.steer;
          stopFailed = appL10n.stateChatStopSteered;
          _pending = List.unmodifiable([
            for (final p in _pending) p.requestId == requestId ? p.withMode(SendMode.steer) : p,
          ]);
          state = state.copyWith(pending: _placePending());
        }
      }
      final notice = await _deliver(operation, trimmed, attachments, receipts, requestId: requestId, mode: promptMode);
      _sent();
      if (!_currentOperation(operation)) return false;
      state = state.copyWith(error: stopFailed, notice: notice);
      return true;
    } catch (e) {
      if (!_currentOperation(operation)) return false;
      // Its echo already came: it got there.
      if (!_pending.any((p) => p.requestId == requestId)) {
        _sent();
        return true;
      }
      if (_outcomeUnknown(e)) {
        _unsettled = (content: content, requestId: requestId);
      }
      _pending = List.unmodifiable(_pending.where((p) => p.requestId != requestId));
      state = state.copyWith(pending: _placePending(), error: _sendFailure(e));
      return false;
    }
  }

  /// A message went out: one more turn in the usage statistics (only how
  /// many).
  void _sent() {
    if (ref.mounted) ref.read(usageStatsProvider.notifier).count(UsageCount.turns);
  }

  /// What a send is matched on when it is tried again ([_unsettled]).
  static String _contentKey(String text, List<DraftAttachment> attachments) =>
      [text, for (final a in attachments) a.name].join('\n');

  /// Stages the files among [attachments] (`fileUploads/upload`); images go
  /// inline with the prompt instead, unless [images] asks for them.
  Future<List<String>> _stageFiles(
    _ChatOperation operation,
    List<DraftAttachment> attachments, {
    bool images = false,
  }) async {
    final receipts = <String>[];
    for (final attachment in attachments) {
      if (attachment.isImage != images) continue;
      _requireCurrent(operation);
      receipts.add(await _upload(operation.client, attachment));
      _requireCurrent(operation);
    }
    return receipts;
  }

  Future<String> _upload(DshClient client, DraftAttachment attachment) async {
    try {
      final receipt = await client.uploadFile(sessionId, attachment.bytes, name: attachment.name);
      return receipt.receiptId;
    } catch (e) {
      throw _UploadFailed(e);
    }
  }

  /// `session/prompt` with the images of [attachments] inline and [receipts]
  /// for its staged files. A model that reads text only (V4 Pro) refuses
  /// images at admission, recording nothing: the same request goes again
  /// with them staged as files, so the message still lands and tools can
  /// open them, and the returned notice says so. DSH Remote stages no files,
  /// so there the refusal stands.
  Future<String?> _deliver(
    _ChatOperation operation,
    String text,
    List<DraftAttachment> attachments,
    List<String> receipts, {
    required String requestId,
    required PromptMode mode,
  }) async {
    final client = operation.client;
    final images = [
      for (final a in attachments)
        if (a.isImage) PromptImage.fromBytes(a.bytes, mediaType: a.mediaType!, name: a.name),
    ];
    Future<void> prompt(List<PromptImage> images, List<String> receipts) {
      _requireCurrent(operation);
      return client.prompt(
        sessionId,
        text,
        images: images,
        fileReceiptIds: receipts,
        requestId: requestId,
        mode: mode,
        // No clientTimeZone: DSH needs an IANA name, which Dart can't provide; the
        // local process already runs with TZ set from the device (RuntimeController).
      );
    }

    try {
      await prompt(images, receipts);
      return null;
    } on DshRemoteException catch (e) {
      if (images.isEmpty || !_imagesRefused(e) || !client.supportsEndpoint('fileUploads/upload')) {
        rethrow;
      }
      _requireCurrent(operation);
      await prompt(const [], [...receipts, ...await _stageFiles(operation, attachments, images: true)]);
      return appL10n.stateChatTextOnlyModel;
    }
  }

  static bool _imagesRefused(Object e) =>
      e is DshRemoteException && e.details['reason'] == 'MODEL_DOES_NOT_SUPPORT_IMAGES';

  /// The banner for a send that did not go through.
  static String _sendFailure(Object e) => switch (e) {
    _UploadFailed(:final cause) => chatErrorText(cause, action: appL10n.stateAttachmentUploadFailed),
    // DSH Remote: the images cannot go as files either.
    _ when _imagesRefused(e) => appL10n.stateChatImageModelRequired,
    _ => chatErrorText(e, action: appL10n.stateSendFailed),
  };

  /// The connection dropped mid-call: the prompt may have landed.
  static bool _outcomeUnknown(Object e) => switch (e is _UploadFailed ? e.cause : e) {
    DshTransportException() || DshCarrierLostException() => true,
    _ => false,
  };

  void dismissNotice() => state = state.copyWith(clearNotice: true);

  /// 「正在停止」 until the turn ends; a turn still going after 10 s gets its
  /// stop key back.
  void _beginStopping(_ChatOperation operation) {
    operation.stopAttempt = ++_stopAttempt;
    _stoppingOperation = operation;
    state = state.copyWith(stopping: true);
    _stopTimeout?.cancel();
    _stopTimeout = Timer(const Duration(seconds: 10), () {
      // The timeout only releases this attempt's button. It does not make a
      // late reply current again after the user has started another stop.
      if (operation.ref.mounted && identical(_client, operation.client) && operation.stopAttempt == _stopAttempt) {
        _stoppingOperation = null;
        state = state.copyWith(stopping: false);
      }
    });
  }

  /// 「正在停止」 is over: the turn ended, or the stop failed ([error]).
  void _endStopping([String? error]) {
    _stopTimeout?.cancel();
    _stoppingOperation = null;
    state = state.copyWith(stopping: false, error: error);
  }

  /// `session/cancel` behind 「正在停止」; false, with the stop key back and
  /// [failure] in the banner, when it did not go through.
  Future<bool> _stop(_ChatOperation operation, {String? failure}) async {
    if (!_currentOperation(operation)) return false;
    _beginStopping(operation);
    try {
      await operation.client.cancel(sessionId);
      return _currentOperation(operation);
    } catch (_) {
      if (_currentOperation(operation)) _endStopping(failure);
      return false;
    }
  }

  /// The stop key. What waits in the inbox then goes right away, as if the
  /// turn had ended: DSH keeps the inbox across a stop but starts no turn
  /// for it, so the last waiting prompt is taken out and put back, which
  /// wakes it with the order unchanged. Resolves to what could not be put
  /// back (the screen returns it to the composer).
  Future<List<PendingPrompt>> cancel() async {
    final client = _client;
    if (client == null || !_canControl || !state.running || state.stopping) return const [];
    final operation = _ChatOperation(ref, client, _syncScope);
    if (!await _stop(operation, failure: appL10n.stateChatStopFailed) || !_currentOperation(operation)) {
      return const [];
    }
    final last = _waiting().lastOrNull;
    if (last == null || !last.resendable || !await _takeOut(operation, last) || !_currentOperation(operation)) {
      return const [];
    }
    return _putBack(operation, [last]);
  }

  /// 「立即发送」: stops the running turn so [prompt] goes right away, in its
  /// place among what else waits (「发送」 does the same for a prompt left
  /// waiting with no turn running). It is taken out of the inbox first: gone
  /// already means the agent has read it, and nothing is stopped. After the
  /// stop it goes back, which starts the next turn, and prompts queued
  /// behind it go back after it, or they would overtake it. Resolves to what
  /// could not be put back (the screen returns it to the composer).
  Future<List<PendingPrompt>> sendNow(PendingPrompt prompt) async {
    final client = _client;
    if (client == null ||
        !_canControl ||
        prompt.isAutomatic ||
        prompt.inboxId == null ||
        !prompt.resendable) {
      return const [];
    }
    final operation = _ChatOperation(ref, client, _syncScope);
    final behind = [
      for (final p in _waiting().skipWhile((p) => p.requestId != prompt.requestId).skip(1))
        if (p.slot == InboxSlot.nextTurn && p.resendable) p,
    ];
    if (!await _takeOut(operation, prompt) || !_currentOperation(operation)) return const [];
    // Stopped or not, it goes back: a turn that goes on takes it as before.
    if (state.running) {
      await _stop(operation, failure: appL10n.stateChatStopFailed);
      if (!_currentOperation(operation)) return const [];
    }
    final moved = [prompt];
    for (final p in behind) {
      if (!_currentOperation(operation)) return const [];
      if (await _takeOut(operation, p)) moved.add(p);
    }
    if (!_currentOperation(operation)) return const [];
    return _putBack(operation, moved);
  }

  /// Takes [prompt] out of the inbox to send it again ([_putBack]); its
  /// bubble stays, as one of ours if it was sent elsewhere. False when it
  /// was gone already (read by the agent, or withdrawn elsewhere) or the
  /// call failed.
  Future<bool> _takeOut(_ChatOperation operation, PendingPrompt prompt) async {
    if (prompt.isAutomatic || !_currentOperation(operation)) return false;
    if (!_pending.any((p) => p.requestId == prompt.requestId)) {
      _pending = List.unmodifiable([
        ..._pending,
        PendingPrompt(
          requestId: prompt.requestId,
          text: prompt.text,
          time: prompt.time,
          mode: prompt.mode,
          sourceKind: prompt.sourceKind,
          sourceForm: prompt.sourceForm,
        ),
      ]);
    }
    _moving[prompt.requestId] = operation;
    state = state.copyWith(pending: _placePending());
    try {
      await operation.client.updateQueue(sessionId, prompt.inboxId!, remove: true);
      return _currentOperation(operation);
    } catch (e) {
      if (!_currentOperation(operation)) return false;
      _finishMoving(operation, prompt.requestId);
      if (e is! DshRemoteException || e.code != 'session/queue-item-not-found') {
        state = state.copyWith(error: chatErrorText(e, action: appL10n.stateSendFailed));
      }
      _publish();
      return false;
    }
  }

  /// Sends [prompts] again, in order, after [_takeOut]: each under its own
  /// request id (DSH dedups those against the inbox and the log only, so the
  /// echo still lands on its bubble), files staged anew (taking a prompt out
  /// retired their receipts), an interjection as one again. The first to
  /// arrive after a stop starts the next turn. Resolves to the ones that did
  /// not make it back; their bubbles go and the banner says why.
  Future<List<PendingPrompt>> _putBack(_ChatOperation operation, List<PendingPrompt> prompts) async {
    final lost = <PendingPrompt>[];
    Object? failure;
    for (final prompt in prompts) {
      if (!_currentOperation(operation)) return const [];
      try {
        await _deliver(
          operation,
          prompt.text,
          prompt.attachments,
          await _stageFiles(operation, prompt.attachments),
          requestId: prompt.requestId,
          mode: prompt.slot == InboxSlot.nextStep ? PromptMode.steer : PromptMode.queue,
        );
        if (!_currentOperation(operation)) return const [];
        // Back in the inbox: taking it out does not withdraw it.
        _withdrawn.remove(prompt.requestId);
      } catch (e) {
        if (!_currentOperation(operation)) return const [];
        // Its echo already came: it got there.
        if (!_pending.any((p) => p.requestId == prompt.requestId)) continue;
        lost.add(prompt);
        failure = e;
        if (_outcomeUnknown(e)) {
          _unsettled = (content: _contentKey(prompt.text, prompt.attachments), requestId: prompt.requestId);
        }
      } finally {
        if (_currentOperation(operation)) _finishMoving(operation, prompt.requestId);
      }
    }
    // Never return a retired Host's content into the replacement composer.
    if (!_currentOperation(operation)) return const [];
    if (failure != null) {
      final gone = {for (final p in lost) p.requestId};
      _pending = List.unmodifiable(_pending.where((p) => !gone.contains(p.requestId)));
      state = state.copyWith(error: _sendFailure(failure));
    }
    _publish();
    return lost;
  }

  /// Moves a queued prompt into the running turn (`session/updateQueue` steer).
  Future<bool> steerQueued(PendingPrompt prompt) async {
    final id = prompt.inboxId;
    final client = _client;
    if (prompt.isAutomatic || id == null || client == null || !_canControl) return false;
    final operation = _ChatOperation(ref, client, _syncScope);
    try {
      await client.updateQueue(sessionId, id, steer: true);
      return _currentOperation(operation);
    } on DshRemoteException catch (e) {
      if (!_currentOperation(operation)) return false;
      state = state.copyWith(
        error: e.code == 'session/steer-unavailable'
            ? appL10n.stateChatTurnEnded
            : chatErrorText(e, action: appL10n.stateChatSteerFailed),
      );
      return false;
    } catch (e) {
      if (!_currentOperation(operation)) return false;
      state = state.copyWith(error: chatErrorText(e, action: appL10n.stateChatSteerFailed));
      return false;
    }
  }

  /// Takes a prompt back out of the inbox before the agent reads it; the
  /// caller puts its text and attachments back into the composer.
  Future<bool> withdrawQueued(PendingPrompt prompt) async {
    final id = prompt.inboxId;
    final client = _client;
    if (prompt.isAutomatic || id == null || client == null || !_canControl) return false;
    final operation = _ChatOperation(ref, client, _syncScope);
    try {
      await client.updateQueue(sessionId, id, remove: true);
    } on DshRemoteException catch (e) {
      if (!_currentOperation(operation)) return false;
      state = state.copyWith(
        error: e.code == 'session/queue-item-not-found'
            ? appL10n.stateChatUndoTooLate
            : chatErrorText(e, action: appL10n.stateChatUndoFailed),
      );
      return false;
    } catch (e) {
      if (!_currentOperation(operation)) return false;
      state = state.copyWith(error: chatErrorText(e, action: appL10n.stateChatUndoFailed));
      return false;
    }
    if (!_currentOperation(operation)) return false;
    _pending = List.unmodifiable(_pending.where((p) => p.requestId != prompt.requestId));
    _publish();
    return true;
  }

  Future<void> respond(ApprovalRequest request, ApprovalDecision decision) async {
    try {
      await _client?.respondApproval(request, decision);
    } catch (e) {
      if (!ref.mounted) return;
      state = state.copyWith(error: chatErrorText(e, action: appL10n.stateChatApprovalFailed));
    }
  }

  Future<bool> answer(UserQuestionRequest request, List<QuestionAnswer> answers) async {
    try {
      await _client?.answerQuestion(request, answers);
      return true;
    } catch (e) {
      if (!ref.mounted) return false;
      state = state.copyWith(error: chatErrorText(e, action: appL10n.stateChatAnswerFailed));
      return false;
    }
  }

  /// Settles the pending Host waterfall as rejected. Keep the card until the
  /// Host/client cancellation event removes it; an RPC failure leaves it retryable.
  Future<bool> rejectQuestion(UserQuestionRequest request) async {
    final client = _client;
    if (client == null) return false;
    try {
      await client.rejectQuestion(
        request,
        code: 'ASK_CANCELLED',
        message: 'The user declined to answer this question.',
      );
      return true;
    } catch (e) {
      if (ref.mounted) state = state.copyWith(error: chatErrorText(e, action: appL10n.stateChatAnswerFailed));
      return false;
    }
  }

  /// Switches the model for this session (takes effect on the next request).
  ///
  /// `session/selectModel` also saves the pair as the default for new
  /// conversations. A repair ([_healModelSelection]) therefore runs only when
  /// a whole turn would otherwise be refused, and never replaces a newer
  /// choice: the latest request wins over ones still on the wire.
  Future<bool> setModel(ModelSelection selection) => _setModel(selection, announceFailure: true);

  Future<bool> _setModel(ModelSelection selection, {required bool announceFailure}) async {
    final owner = ref;
    if (!owner.mounted) return false;
    selection = normalizeModelSelection(ref.read(modelCatalogProvider).value, selection);
    final client = _client;
    if (client == null) return false;
    final generation = client.mux.generation;
    final attempt = Object();
    _modelChange = attempt;
    // Model selection is valid before the first follow snapshot. Its owner
    // is the build/client/mux and latest choice, not the send/stop sync gate.
    bool current() =>
        owner.mounted &&
        identical(ref, owner) &&
        identical(_client, client) &&
        identical(client.mux.generation, generation) &&
        identical(_modelChange, attempt);
    final previous = _model;
    _model = selection;
    state = state.copyWith(model: selection);
    try {
      if (!current()) return false;
      final applied = await client.setModel(
        sessionId,
        provider: selection.provider,
        model: selection.model,
        reasoningEffort: selection.reasoningEffort,
      );
      if (!current()) return false;
      // A newer choice (another device, the picker) owns the state now.
      if (!_sameSelection(_model, selection)) return false;
      _model = applied;
      state = state.copyWith(model: applied);
      return current();
    } catch (e) {
      if (!current()) return false;
      // Never roll back a newer choice with this request's failure.
      if (!_sameSelection(_model, selection)) return false;
      _model = previous;
      state = ChatState(
        items: state.items,
        running: state.running,
        streamLost: state.streamLost,
        syncing: state.syncing,
        resyncing: state.resyncing,
        stopping: state.stopping,
        title: state.title,
        approvals: state.approvals,
        questions: state.questions,
        hasMoreHistory: state.hasMoreHistory,
        loading: state.loading,
        loadingOlder: state.loadingOlder,
        error: announceFailure ? chatErrorText(e, action: appL10n.stateChatModelSwitchFailed) : state.error,
        connection: state.connection,
        model: previous,
        pending: state.pending,
        autoApprove: state.autoApprove,
        autoAnswered: state.autoAnswered,
        commands: state.commands,
        turns: state.turns,
        todos: state.todos,
        goal: state.goal,
        clockSkew: state.clockSkew,
      );
      return false;
    } finally {
      if (identical(_modelChange, attempt)) _modelChange = null;
    }
  }

  Future<void> loadOlder() async {
    final client = _client;
    final oldest = _transcript.oldestSeq;
    if (client == null || oldest == null || !_transcript.hasMoreHistory || state.loadingOlder) {
      return;
    }
    final owner = ref;
    final generation = client.mux.generation;
    final request = _historyRead = Object();
    bool current() =>
        owner.mounted &&
        identical(_historyRead, request) &&
        identical(_client, client) &&
        identical(client.mux.generation, generation);
    state = state.copyWith(loadingOlder: true);
    try {
      // Same window as the official web client: back to a turn start (at
      // least 50 messages, two turns), so the oldest loaded turn keeps its
      // `turn/start` (footnote, fold); 500 caps one giant turn.
      final page = await client.history(
        sessionId,
        throughSeq: _transcript.newestSeq ?? oldest,
        beforeSeq: oldest,
        maxMessages: 500,
        turnWindow: const TurnWindow(50, 2),
      );
      if (!current()) return;
      _transcript.prependHistory(page);
      // A done event may have arrived before its run was loaded. Fold the
      // merged log in seq order so paging cannot resurrect a finished command.
      _transcript.events.forEach(_applyCommandEvent);
      _historyRead = null;
      state = state.copyWith(loadingOlder: false);
      _publish();
    } catch (e) {
      if (!current()) return;
      _historyRead = null;
      state = state.copyWith(loadingOlder: false, error: chatErrorText(e, action: appL10n.stateChatHistoryFailed));
    }
  }

  void dismissError() => state = state.copyWith(clearError: true);

  // ---------------------------------------------------------------------------
  // Message actions. DSH 0.2.1 cannot edit, regenerate or rewind a session in
  // place (the log is append-only); branching is `session/fork` at an exact
  // event prefix, and the fork opens as a new conversation.

  /// Shows [message] in the error banner (failures of message actions that
  /// live outside this controller, e.g. feedback).
  void reportError(String message) => state = state.copyWith(error: message);

  /// Per-reply lookups over the loaded log, valid until it changes.
  (int?, int?)? _lookupKey;
  final Map<int, int?> _branchPoints = {};
  final Map<int, String?> _replyIds = {};

  void _checkLookups() {
    final key = (_transcript.oldestSeq, _transcript.newestSeq);
    if (key == _lookupKey) return;
    _lookupKey = key;
    _branchPoints.clear();
    _replyIds.clear();
  }

  /// Where "从这里分叉" cuts for [item]: the `turn/end` of the turn it
  /// closes; null when it is not the last thing of a finished turn (the
  /// official web client's rule).
  int? branchPointAfter(AssistantChatItem item) {
    final seq = item.seq;
    if (seq == null || item.streaming) return null;
    _checkLookups();
    return _branchPoints.putIfAbsent(seq, () => forkPointAfterReply(_transcript.events, seq));
  }

  /// DSH `message.id` of the durable reply [item] (the feedback target).
  String? replyMessageId(AssistantChatItem item) {
    final seq = item.seq;
    if (seq == null || item.streaming) return null;
    _checkLookups();
    return _replyIds.putIfAbsent(seq, () {
      for (final event in _transcript.events) {
        if (event.seq == seq) {
          final id = event is AssistantMessageEvent ? event.message.id : '';
          return id.isEmpty ? null : id;
        }
        if (event.seq > seq) break;
      }
      return null;
    });
  }

  /// "从这里分叉": a new conversation with everything through [item]'s turn.
  /// Null on failure (the reason is in [ChatState.error]).
  Future<ForkOutcome?> branchAfter(AssistantChatItem item) async {
    final cut = branchPointAfter(item);
    if (cut == null) {
      state = state.copyWith(error: appL10n.stateChatBranchLastReply);
      return null;
    }
    return _forkAt(cut);
  }

  /// "编辑后重发": a new conversation with everything before [item], so the
  /// prompt can be rewritten and sent again there (「重新回答」 sends it
  /// again as it was). Null on failure; [action] names what failed in the
  /// error banner.
  Future<ForkOutcome?> forkBeforePrompt(UserChatItem item, {String? action}) async {
    final client = _client;
    if (client == null) return null;
    final operation = _ChatOperation(ref, client, _syncScope);
    if (!_currentOperation(operation)) return null;
    var cut = forkPointBeforePrompt(_transcript.events, item.seq);
    if (cut == null && item.seq > 0) {
      // The prompt opens the loaded window: read what came right before it.
      try {
        final page = await client.history(sessionId, throughSeq: item.seq - 1, turnWindow: const TurnWindow(4, 2));
        if (!_currentOperation(operation)) return null;
        cut = forkPointBeforePrompt(page.events, item.seq);
      } catch (e) {
        if (!_currentOperation(operation)) return null;
        state = state.copyWith(error: chatErrorText(e, action: appL10n.stateChatEarlierHistoryFailed));
        return null;
      }
    }
    if (cut == null) {
      state = state.copyWith(error: appL10n.stateChatNoEarlierHistory);
      return null;
    }
    return _forkAt(cut, action: action, operation: operation);
  }

  Future<ForkOutcome?> _forkAt(int cut, {String? action, _ChatOperation? operation}) async {
    final client = operation?.client ?? _client;
    if (client == null) return null;
    final owner = operation ?? _ChatOperation(ref, client, _syncScope);
    if (!_currentOperation(owner)) return null;
    try {
      final outcome = await client.forkAt(sessionId, cut, sourceTitle: state.title);
      return _currentOperation(owner) ? outcome : null;
    } catch (e) {
      if (!_currentOperation(owner)) return null;
      state = state.copyWith(error: chatErrorText(e, action: action ?? appL10n.stateChatBranchFailed));
    }
    return null;
  }
}

/// Slash commands of one session by id: folds the log-only `command/run` /
/// `command/done` pairs and holds local failures without a durable id. The
/// sorted [view] is rebuilt only after a change (the chat list compares its
/// inputs by identity).
class CommandLog {
  final _byId = <String, CommandNotice>{};
  List<CommandNotice>? _view;

  CommandNotice? operator [](String id) => _byId[id];

  void operator []=(String id, CommandNotice notice) {
    _byId[id] = notice;
    _view = null;
  }

  void remove(String id) {
    if (_byId.remove(id) != null) _view = null;
  }

  void removeWhere(bool Function(String id, CommandNotice notice) test) {
    final before = _byId.length;
    _byId.removeWhere(test);
    if (_byId.length != before) _view = null;
  }

  /// Folds one durable event; other event types are ignored.
  void apply(SessionLogEvent event) {
    final id = event.data['commandId'];
    if (id is! String) return;
    switch (event.type) {
      case 'command/run':
        final name = event.data['name'];
        final args = event.data['args'];
        final existing = _byId[id];
        this[id] = existing == null
            ? CommandNotice(
                id: id,
                name: name is String ? name : '',
                args: args is String ? args : null,
                seq: event.seq,
              )
            : existing.copyWith(name: name is String ? name : null, args: args is String ? args : null, seq: event.seq);
      case 'command/done':
        final existing = _byId[id];
        if (existing == null) return; // its run is outside the loaded window
        final text = event.data['text'];
        this[id] = existing.copyWith(
          done: true,
          success: event.data['kind'] == 'success',
          text: text is String ? text : null,
        );
    }
  }

  /// Durable commands in seq order, then local ones in insertion order.
  List<CommandNotice> get view {
    if (_view case final view?) return view;
    if (_byId.isEmpty) return _view = const [];
    final durable = [
      for (final c in _byId.values)
        if (c.seq != null) c,
    ]..sort((a, b) => a.seq!.compareTo(b.seq!));
    return _view = List.unmodifiable([
      ...durable,
      for (final c in _byId.values)
        if (c.seq == null) c,
    ]);
  }
}

/// Ownership of one asynchronous send/stop/fork transaction. A superseded stop
/// cannot remove or replay an inbox belonging to its successor.
class _ChatOperation {
  _ChatOperation(this.ref, this.client, this.syncScope) : generation = client.mux.generation;

  final Ref ref;
  final DshClient client;
  final MuxGeneration? generation;
  final Object syncScope;
  int? stopAttempt;
}

class _ObsoleteChatOperation implements Exception {
  const _ObsoleteChatOperation();
}

/// A file of the prompt could not be staged.
class _UploadFailed implements Exception {
  const _UploadFailed(this.cause);
  final Object cause;
}

final _random = Random.secure();

/// RFC 4122 v4 id for `session/prompt` (lets the echo be matched to the
/// optimistic bubble; retries with the same id are idempotent on DSH).
String _requestId() {
  final bytes = List<int>.generate(16, (_) => _random.nextInt(256));
  bytes[6] = (bytes[6] & 0x0f) | 0x40;
  bytes[8] = (bytes[8] & 0x3f) | 0x80;
  final hex = bytes.map((b) => b.toRadixString(16).padLeft(2, '0')).join();
  return '${hex.substring(0, 8)}-${hex.substring(8, 12)}-${hex.substring(12, 16)}-'
      '${hex.substring(16, 20)}-${hex.substring(20)}';
}

final chatProvider = NotifierProvider.autoDispose.family<ChatController, ChatState, String>(ChatController.new);
