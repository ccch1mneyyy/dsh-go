// The drawer's own organisation: how the list is cut into blocks, the
// per-host folder store, pending requests, unread and creation times.
//
//   flutter test test/drawer/drawer_state_test.dart

import 'dart:async';
import 'dart:convert';

import 'package:dsh_app/state/drawer_view_state.dart';
import 'package:dsh_app/state/hosts_state.dart';
import 'package:dsh_app/state/session_attention_state.dart';
import 'package:dsh_app/state/session_created_state.dart';
import 'package:dsh_app/state/sessions_state.dart';
import 'package:dsh_client/dsh_client.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:shared_preferences/shared_preferences.dart';

final _now = DateTime(2026, 10, 24, 15); // a Saturday

SessionSummary _s(String id, DateTime at, {bool running = false, String? parent}) => SessionSummary(
  sessionId: id,
  updatedAt: at,
  running: running,
  blank: false,
  agentAvailable: running,
  parentSessionId: parent,
  origin: parent == null ? null : 'subagent',
  projections: SessionProjections(1, {'title': id}),
);

List<SessionSummary> _sample() => [
  _s('a', _now.subtract(const Duration(minutes: 1)), running: true),
  _s('b', _now.subtract(const Duration(minutes: 5))),
  _s('c', _now.subtract(const Duration(days: 1))),
  _s('d', _now.subtract(const Duration(days: 3))),
  _s('e', _now.subtract(const Duration(days: 20))),
];

List<DrawerBlock> _blocks({
  List<SessionSummary>? sessions,
  List<String> pinned = const [],
  DrawerView view = const DrawerView(loaded: true),
  DrawerFilter filter = DrawerFilter.all,
  Map<String, PendingKind> pending = const {},
  Set<String> unread = const {},
  Map<String, DateTime> created = const {},
  bool scoped = false,
}) => drawerBlocks(
  sessions: sessions ?? _sample(),
  pinnedIds: pinned,
  view: view,
  filter: filter,
  pending: pending,
  unread: unread,
  createdAt: created,
  now: _now,
  scoped: scoped,
);

List<String> _ids(DrawerBlock b) => [for (final s in b.items) s.sessionId];

class _Sessions extends SessionsController {
  _Sessions(this.visible, [List<SessionSummary>? all]) : all = all ?? visible;

  List<SessionSummary> visible;
  List<SessionSummary> all;

  @override
  Future<List<SessionSummary>> build() async => visible;

  @override
  List<SessionSummary> get allSessions => all;

  void set(List<SessionSummary> next) {
    visible = next;
    all = next;
    state = AsyncData(next);
  }
}

Future<void> _settle() async {
  for (var i = 0; i < 6; i++) {
    await Future<void>.delayed(Duration.zero);
  }
}

void main() {
  setUp(() => SharedPreferences.setMockInitialValues({}));

  group('drawerBlocks', () {
    test('no folders: pinned, then days by activity', () {
      final blocks = _blocks(pinned: ['b']);
      expect(blocks.map((b) => b.runtimeType), [PinnedBlock, DayBlock, DayBlock, DayBlock, DayBlock]);
      expect(_ids(blocks[0]), ['b']);
      expect(
        [for (final b in blocks.whereType<DayBlock>()) b.day],
        [SessionDay.today, SessionDay.yesterday, SessionDay.thisWeek, SessionDay.earlier],
      );
      expect(_ids(blocks[1]), ['a']);
      expect(_ids(blocks[3]), ['d']);
    });

    test('a conversation shows once: its folder wins over 置顶 and its day', () {
      const view = DrawerView(
        loaded: true,
        folders: [
          DrawerFolder(id: 'f1', name: '工作', sessionIds: ['b', 'd']),
          DrawerFolder(id: 'f2', name: '空的'),
        ],
      );
      final blocks = _blocks(view: view, pinned: ['d', 'e']);
      final all = [for (final b in blocks) ..._ids(b)];
      expect(all.toSet().length, all.length);
      expect(all.toSet(), {'a', 'b', 'c', 'd', 'e'});
      final pinned = blocks.whereType<PinnedBlock>().single;
      expect(_ids(pinned), ['e']);
      final folders = blocks.whereType<FolderBlock>().toList();
      expect(folders.map((f) => f.folder.id), ['f1', 'f2']);
      // Pinned members first, then by the sort key.
      expect(_ids(folders[0]), ['d', 'b']);
      expect(folders[1].items, isEmpty);
    });

    test('inside a workspace, folders without members there are hidden', () {
      const view = DrawerView(
        loaded: true,
        folders: [
          DrawerFolder(id: 'f1', name: '工作', sessionIds: ['b']),
          DrawerFolder(id: 'f2', name: '别处', sessionIds: ['zz']),
        ],
      );
      final blocks = _blocks(view: view, scoped: true);
      expect(blocks.whereType<FolderBlock>().map((f) => f.folder.id), ['f1']);
    });

    test('folder buckets retain tie order, pin priority and the last assignment', () {
      const view = DrawerView(
        loaded: true,
        folders: [
          DrawerFolder(id: 'f1', name: 'First', sessionIds: ['a', 'b', 'c']),
          // As folderOf specifies, the last assignment owns a duplicate.
          DrawerFolder(id: 'f2', name: 'Second', sessionIds: ['d', 'c']),
          DrawerFolder(id: 'f3', name: 'Empty', sessionIds: ['missing']),
        ],
      );
      final blocks = _blocks(
        sessions: [
          for (final id in ['e', 'd', 'c', 'b', 'a']) _s(id, _now),
        ],
        view: view,
        pinned: ['d', 'e', 'b', 'c', 'missing'],
      );
      expect(_ids(blocks.whereType<PinnedBlock>().single), ['e']);
      final folders = blocks.whereType<FolderBlock>().toList();
      expect(folders.map((f) => f.folder.id), ['f1', 'f2', 'f3']);
      expect(_ids(folders[0]), ['b', 'a']);
      expect(_ids(folders[1]), ['c', 'd']);
      expect(folders[2].items, isEmpty);
      expect([for (final block in blocks) ..._ids(block)], ['e', 'b', 'a', 'c', 'd']);
    });

    test('filters give one flat block', () {
      expect(_ids(_blocks(filter: DrawerFilter.running).single), ['a']);
      expect(_ids(_blocks(filter: DrawerFilter.pending, pending: {'c': PendingKind.approval}).single), ['c']);
      expect(_ids(_blocks(filter: DrawerFilter.unread, unread: {'e', 'b'}).single), ['b', 'e']);
      final empty = _blocks(filter: DrawerFilter.pending).single;
      expect(empty, isA<FilteredBlock>());
      expect(empty.items, isEmpty);
    });

    test('创建时间 sorts and groups by creation, falling back to activity', () {
      final blocks = _blocks(
        view: const DrawerView(loaded: true, sort: DrawerSort.created),
        created: {'a': _now.subtract(const Duration(days: 30)), 'e': _now.subtract(const Duration(minutes: 2))},
      );
      final order = [for (final b in blocks) ..._ids(b)];
      // e (made 2 min ago) before b (no time yet: its activity, 5 min ago).
      expect(order, ['e', 'b', 'c', 'd', 'a']);
      expect((blocks.first as DayBlock).day, SessionDay.today);
      expect((blocks.last as DayBlock).day, SessionDay.earlier);
    });

    test('全选 skips members of a collapsed folder', () {
      const view = DrawerView(
        loaded: true,
        folders: [
          DrawerFolder(id: 'f1', name: '工作', collapsed: true, sessionIds: ['b', 'c']),
        ],
      );
      expect(drawerSelectableIds(_blocks(view: view)), ['a', 'd', 'e']);
    });
  });

  group('DrawerView store', () {
    ProviderContainer container() {
      final c = ProviderContainer();
      addTearDown(c.dispose);
      return c;
    }

    test('create, move, undo, collapse, reorder, delete and restore persist per host', () async {
      final c = container();
      final view = c.read(drawerViewProvider.notifier);
      await view.ready();
      final work = await view.createFolder('  工作  ', tint: 2, sessionIds: ['a', 'b']);
      final read = await view.createFolder('阅读', emoji: '📚');
      var state = c.read(drawerViewProvider);
      expect(state.folders.map((f) => f.name), ['阅读', '工作']);
      expect(state.byId(work)!.tint, 2);
      expect(state.folderOf, {'a': work, 'b': work});

      final previous = await view.moveSessions(['b', 'c'], read);
      expect(previous, {'b': work, 'c': null});
      state = c.read(drawerViewProvider);
      expect(state.byId(read)!.sessionIds, ['b', 'c']);
      expect(state.byId(work)!.sessionIds, ['a']);
      await view.restoreAssignments(previous);
      state = c.read(drawerViewProvider);
      expect(state.byId(work)!.sessionIds.toSet(), {'a', 'b'});
      expect(state.byId(read)!.sessionIds, isEmpty);

      await view.toggleCollapsed(work);
      await view.reorderFolders(0, 1);
      state = c.read(drawerViewProvider);
      expect(state.folders.map((f) => f.id), [work, read]);
      expect(state.byId(work)!.collapsed, isTrue);

      final removed = await view.deleteFolder(work);
      expect(c.read(drawerViewProvider).folders.map((f) => f.id), [read]);
      // Filed elsewhere meanwhile: stays there.
      await view.moveSessions(['a'], read);
      await view.restoreFolder(removed!.$1, removed.$2);
      state = c.read(drawerViewProvider);
      expect(state.folders.map((f) => f.id), [work, read]);
      expect(state.byId(work)!.sessionIds, ['b']);

      await view.setSort(DrawerSort.created);
      final prefs = await SharedPreferences.getInstance();
      final stored = DrawerView.fromJson(jsonDecode(prefs.getString('drawer.view.local.local')!));
      expect(stored.sort, DrawerSort.created);
      expect(stored.folders.map((f) => f.name), ['工作', '阅读']);
      expect(stored.byId(read)!.emoji, '📚');

      // Another host starts empty; coming back finds the folders again.
      c.read(activeHostProvider.notifier).select(const HostRef.ssh('pc'));
      await c.read(drawerViewProvider.notifier).ready();
      expect(c.read(drawerViewProvider).folders, isEmpty);
      c.read(activeHostProvider.notifier).select(HostRef.local);
      await c.read(drawerViewProvider.notifier).ready();
      expect(c.read(drawerViewProvider).folders.map((f) => f.name), ['工作', '阅读']);
    });

    test('a damaged entry starts empty; forgetMissing prunes members', () async {
      SharedPreferences.setMockInitialValues({'drawer.view.local.local': '{"folders": [{"id": 1}, '});
      final c = container();
      final view = c.read(drawerViewProvider.notifier);
      await view.ready();
      expect(c.read(drawerViewProvider).loaded, isTrue);
      final id = await view.createFolder('工作', sessionIds: ['a', 'gone']);
      await view.forgetMissing({'a', 'b'});
      expect(c.read(drawerViewProvider).byId(id)!.sessionIds, ['a']);
    });

    test('selection: start, toggle, select all, end', () {
      final c = container();
      final selection = c.read(drawerSelectionProvider.notifier);
      expect(c.read(drawerSelectionProvider), isNull);
      selection.start('a');
      selection.toggle('b');
      selection.toggle('a');
      expect(c.read(drawerSelectionProvider), {'b'});
      selection.setAll(['c', 'd']);
      expect(c.read(drawerSelectionProvider), {'c', 'd'});
      selection.end();
      expect(c.read(drawerSelectionProvider), isNull);
    });
  });

  group('pending', () {
    test('marks the top-level conversation once a request settles; clears on answer', () async {
      final events = StreamController<HostEvent>.broadcast();
      addTearDown(events.close);
      final pending = <HostEvent>[];
      final sessions = _Sessions([_s('root', _now)], [_s('root', _now), _s('child', _now, parent: 'root')]);
      final c = ProviderContainer(
        overrides: [
          pendingSourceProvider.overrideWithValue((events: events.stream, pending: () => pending)),
          pendingSettleProvider.overrideWithValue(const Duration(milliseconds: 20)),
          sessionsProvider.overrideWith(() => sessions),
        ],
      );
      addTearDown(c.dispose);
      c.listen(pendingInteractionsProvider, (_, _) {});
      await c.read(sessionsProvider.future);

      final approval = ApprovalRequestedEvent(
        const ApprovalRequest(eventId: 'e1', sessionId: 'child', toolName: 'bash'),
      );
      pending.add(approval);
      events.add(approval);
      await _settle();
      expect(c.read(pendingInteractionsProvider), isEmpty, reason: 'not before it settles');
      await Future<void>.delayed(const Duration(milliseconds: 40));
      expect(c.read(pendingInteractionsProvider), {'root': PendingKind.approval});

      final question = UserQuestionRequestedEvent(
        UserQuestionRequest.fromWaterfall('e2', 'root', {
          'questions': [
            {
              'id': 'q',
              'question': '执行这个计划？',
              'options': const [],
              'intent': {'kind': 'plan-review'},
            },
          ],
        }),
      );
      pending.add(question);
      events.add(question);
      await Future<void>.delayed(const Duration(milliseconds: 40));
      // Approval outranks the plan review.
      expect(c.read(pendingInteractionsProvider), {'root': PendingKind.approval});

      pending.remove(approval);
      events.add(const HostRequestCancelledEvent('e1'));
      await _settle();
      expect(c.read(pendingInteractionsProvider), {'root': PendingKind.plan});

      pending.clear();
      events.add(const HostRequestCancelledEvent('e2'));
      await _settle();
      expect(c.read(pendingInteractionsProvider), isEmpty);
    });

    test('a request answered at once never shows', () async {
      final events = StreamController<HostEvent>.broadcast();
      addTearDown(events.close);
      final pending = <HostEvent>[];
      final c = ProviderContainer(
        overrides: [
          pendingSourceProvider.overrideWithValue((events: events.stream, pending: () => pending)),
          pendingSettleProvider.overrideWithValue(const Duration(milliseconds: 30)),
          sessionsProvider.overrideWith(() => _Sessions([_s('a', _now)])),
        ],
      );
      addTearDown(c.dispose);
      final seen = <Map<String, PendingKind>>[];
      c.listen(pendingInteractionsProvider, (_, next) => seen.add(next));
      final approval = ApprovalRequestedEvent(const ApprovalRequest(eventId: 'e1', sessionId: 'a', toolName: 'bash'));
      pending.add(approval);
      events.add(approval);
      await _settle();
      pending.clear();
      events.add(const HostRequestCancelledEvent('e1'));
      await Future<void>.delayed(const Duration(milliseconds: 60));
      expect(seen.where((m) => m.isNotEmpty), isEmpty);
    });
  });

  group('unread', () {
    test('what moved on since it was last seen, never the open one', () async {
      final t0 = _now.subtract(const Duration(hours: 1));
      final sessions = _Sessions([_s('a', t0), _s('b', t0.add(const Duration(minutes: 1)))]);
      final c = ProviderContainer(overrides: [sessionsProvider.overrideWith(() => sessions)]);
      addTearDown(c.dispose);
      c.listen(drawerSeenProvider, (_, _) {});
      c.listen(unreadSessionIdsProvider, (_, _) {});
      await c.read(sessionsProvider.future);
      await _settle();
      sessions.set([...sessions.visible]);
      await _settle();
      expect(c.read(drawerSeenProvider).baseline, isNotNull);
      expect(c.read(unreadSessionIdsProvider), isEmpty);

      // b answers while nobody looks.
      sessions.set([_s('a', t0), _s('b', t0.add(const Duration(minutes: 9)))]);
      await _settle();
      expect(c.read(unreadSessionIdsProvider), {'b'});

      // Open b: not unread; leave it for a: still seen.
      c.read(currentSessionProvider.notifier).select('b');
      await _settle();
      expect(c.read(unreadSessionIdsProvider), isEmpty);
      c.read(currentSessionProvider.notifier).select('a');
      await _settle();
      expect(c.read(unreadSessionIdsProvider), isEmpty);

      // A running turn is not unread; once it ends it is.
      sessions.set([_s('a', t0), _s('b', t0.add(const Duration(minutes: 12)), running: true)]);
      await _settle();
      expect(c.read(unreadSessionIdsProvider), isEmpty);
      sessions.set([_s('a', t0), _s('b', t0.add(const Duration(minutes: 15)))]);
      await _settle();
      expect(c.read(unreadSessionIdsProvider), {'b'});

      final prefs = await SharedPreferences.getInstance();
      expect(prefs.getString('drawer.seen.local.local'), contains('"b"'));
    });
  });

  group('creation times', () {
    test('fetched once each, two at a time, kept per host', () async {
      final asked = <String>[];
      var inFlight = 0;
      var peak = 0;
      final c = ProviderContainer(
        overrides: [
          sessionCreatedFetcherProvider.overrideWithValue((id) async {
            asked.add(id);
            inFlight++;
            peak = inFlight > peak ? inFlight : peak;
            await Future<void>.delayed(const Duration(milliseconds: 5));
            inFlight--;
            if (id == 'bad') throw const DshRemoteException('session/not-found', 'gone');
            return DateTime.fromMillisecondsSinceEpoch(1000 * id.codeUnitAt(0));
          }),
        ],
      );
      addTearDown(c.dispose);
      c.listen(sessionCreatedProvider, (_, _) {});
      final created = c.read(sessionCreatedProvider.notifier);
      created.ensure(['a', 'b', 'c', 'bad']);
      created.ensure(['a', 'b']);
      await Future<void>.delayed(const Duration(milliseconds: 60));
      expect(asked.toSet(), {'a', 'b', 'c', 'bad'});
      expect(asked.length, 4);
      expect(peak, lessThanOrEqualTo(SessionCreatedController.parallel));
      expect(c.read(sessionCreatedProvider).keys.toSet(), {'a', 'b', 'c'});
      // A failure isn't retried in this run.
      created.ensure(['bad']);
      await Future<void>.delayed(const Duration(milliseconds: 20));
      expect(asked.where((id) => id == 'bad'), hasLength(1));
      await Future<void>.delayed(const Duration(milliseconds: 500));
      final prefs = await SharedPreferences.getInstance();
      expect(jsonDecode(prefs.getString('drawer.created.local.local')!), containsPair('a', 97000));
    });
  });
}
