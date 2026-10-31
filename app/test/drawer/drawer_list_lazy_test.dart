import 'package:dsh_app/state/drawer_view_state.dart';
import 'package:dsh_app/state/session_attention_state.dart';
import 'package:dsh_app/state/sessions_state.dart';
import 'package:dsh_app/state/workspaces_state.dart';
import 'package:dsh_app/ui/common/expand_reveal.dart';
import 'package:dsh_app/ui/shell/drawer/drawer_list.dart';
import 'package:dsh_app/ui/shell/drawer/folder_header.dart';
import 'package:dsh_app/ui/shell/drawer/session_tile.dart';
import 'package:dsh_client/dsh_client.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../shell/golden_harness.dart';
import 'support.dart';

// Counting title reads catches eager tile construction, which counting mounted
// widgets would miss: ListView(children:) already mounts only nearby children.
class _Session extends SessionSummary {
  _Session(int index)
    : super(
        sessionId: 's$index',
        updatedAt: sampleNow.subtract(Duration(seconds: index)),
        running: false,
        blank: false,
        agentAvailable: false,
        projections: SessionProjections(1, {'title': 'Conversation $index'}),
      );

  int titleReads = 0;

  @override
  String? get title {
    titleReads++;
    return super.title;
  }
}

class _Workspaces extends WorkspacesController {
  @override
  WorkspacesState build() => const WorkspacesState(status: WorkspacesStatus.ready);

  void pin(String id) => state = state.copyWith(pinnedSessionIds: [id]);
}

Future<ProviderContainer> _pump(
  WidgetTester tester,
  List<SessionSummary> sessions, {
  DrawerView view = const DrawerView(loaded: true),
  _Workspaces? workspaces,
  Set<String> unread = const {},
  ValueChanged<String>? onOpen,
  ValueChanged<SessionSummary>? onLongPress,
  bool animations = false,
}) async {
  SharedPreferences.setMockInitialValues(storedView(view));
  await tester.pumpWidget(
    goldenApp(
      brightness: Brightness.light,
      overrides: [
        drawerScopeProvider.overrideWithValue(DrawerScope(sessions: sessions, bots: const [], scoped: false)),
        workspacesProvider.overrideWith(() => workspaces ?? _Workspaces()),
        currentSessionProvider.overrideWith(() => FakeCurrentSession(null)),
        pendingInteractionsProvider.overrideWith(() => FixedPending(const {})),
        unreadSessionIdsProvider.overrideWithValue(unread),
      ],
      home: Scaffold(
        body: Center(
          child: SizedBox(
            width: 320,
            height: 400,
            child: Builder(
              builder: (context) => MediaQuery(
                data: MediaQuery.of(context).copyWith(disableAnimations: !animations),
                child: Consumer(
                  builder: (context, ref, _) {
                    // The scope is overridden as already loaded. Wait for its
                    // stored folder fixture too, so the first measured frame
                    // does not temporarily render these sessions as unfiled.
                    if (!ref.watch(drawerViewProvider).loaded) return const SizedBox.shrink();
                    return DrawerConversationList(
                      now: sampleNow,
                      leading: const SizedBox(height: 44),
                      onOpen: onOpen ?? (_) {},
                      onLongPress: onLongPress ?? (_) {},
                    );
                  },
                ),
              ),
            ),
          ),
        ),
      ),
    ),
  );
  await tester.pump();
  await tester.pump(const Duration(milliseconds: 600));
  return ProviderScope.containerOf(tester.element(find.byType(DrawerConversationList)));
}

Finder get _scrollable => find.descendant(of: find.byType(DrawerConversationList), matching: find.byType(Scrollable));

Finder _tile(String id) => find.byKey(ValueKey('session-$id'));

void main() {
  testWidgets('1347 conversations only prepare nearby titles, including after selection changes', (tester) async {
    final sessions = List.generate(1347, _Session.new);
    final container = await _pump(tester, sessions);

    expect(sessions.first.titleReads, greaterThan(0));
    expect(sessions.last.titleReads, 0);
    expect(sessions.where((s) => s.titleReads > 0).length, lessThan(30));

    for (final s in sessions) {
      s.titleReads = 0;
    }
    container.read(drawerSelectionProvider.notifier).start('s0');
    await tester.pump();
    expect(sessions.where((s) => s.titleReads > 0).length, lessThan(30));
    expect(sessions.last.titleReads, 0);

    // A large jump must still construct and expose the end of the list.
    for (var i = 0; i < 3; i++) {
      final position = tester.state<ScrollableState>(_scrollable).position;
      position.jumpTo(position.maxScrollExtent);
      await tester.pump();
    }
    expect(_tile('s1346'), findsOneWidget);
    expect(sessions.last.titleReads, greaterThan(0));
    expect(tester.takeException(), isNull);
  });

  testWidgets('selection keeps the scroll offset and the row callbacks target the current session', (tester) async {
    final opened = <String>[];
    final held = <String>[];
    final container = await _pump(
      tester,
      List.generate(50, _Session.new),
      onOpen: opened.add,
      onLongPress: (s) => held.add(s.sessionId),
    );
    final position = tester.state<ScrollableState>(_scrollable).position;
    position.jumpTo(500);
    await tester.pump();
    container.read(drawerSelectionProvider.notifier).start('s0');
    await tester.pump();
    expect(position.pixels, 500);

    await tester.tap(_tile('s15'));
    await tester.pump();
    await tester.longPress(_tile('s16'));
    await tester.pump();
    expect(container.read(drawerSelectionProvider), {'s0', 's15', 's16'});
    expect(opened, isEmpty);
    expect(held, isEmpty);

    container.read(drawerSelectionProvider.notifier).end();
    await tester.pump();
    await tester.tap(_tile('s15'));
    await tester.longPress(_tile('s16'));
    expect(opened, ['s15']);
    expect(held, ['s16']);
  });

  testWidgets('filter changes reset to the top without keeping a second list alive', (tester) async {
    final container = await _pump(tester, List.generate(50, _Session.new), unread: const {'s40'}, animations: true);
    tester.state<ScrollableState>(_scrollable).position.jumpTo(700);
    await tester.pump();
    container.read(drawerFilterProvider.notifier).set(DrawerFilter.unread);
    await tester.pump();
    expect(_scrollable, findsOneWidget);
    expect(tester.state<ScrollableState>(_scrollable).position.pixels, 0);
    expect(_tile('s40'), findsOneWidget);
    expect(find.byType(SessionTile), findsOneWidget);

    container.read(drawerFilterProvider.notifier).set(DrawerFilter.pending);
    await tester.pump();
    expect(_scrollable, findsOneWidget);
    expect(find.byType(SessionTile), findsNothing);
    container.read(drawerFilterProvider.notifier).set(DrawerFilter.all);
    await tester.pump();
    expect(tester.state<ScrollableState>(_scrollable).position.pixels, 0);
    expect(_tile('s0'), findsOneWidget);
  });

  testWidgets('pinning preserves the mounted keyed row when its list index changes', (tester) async {
    final workspaces = _Workspaces();
    await _pump(tester, List.generate(10, _Session.new), workspaces: workspaces);
    final element = tester.element(_tile('s2'));
    workspaces.pin('s2');
    await tester.pump();
    expect(tester.element(_tile('s2')), same(element));
    expect(tester.getTopLeft(_tile('s2')).dy, lessThan(tester.getTopLeft(_tile('s0')).dy));
  });

  testWidgets('a collapsed folder does not even prepare its 1347 member titles', (tester) async {
    final sessions = List.generate(1347, _Session.new);
    final container = await _pump(
      tester,
      sessions,
      view: DrawerView(
        loaded: true,
        folders: [
          DrawerFolder(id: 'f', name: 'Archive', collapsed: true, sessionIds: [for (final s in sessions) s.sessionId]),
        ],
      ),
    );
    expect(find.widgetWithText(DrawerFolderHeader, 'Archive'), findsOneWidget);
    expect(sessions.every((s) => s.titleReads == 0), isTrue);
    container.read(drawerSelectionProvider.notifier).start();
    await tester.pump();
    expect(sessions.every((s) => s.titleReads == 0), isTrue);
  });

  testWidgets('folder reveal state survives index changes and renaming during collapse', (tester) async {
    final container = await _pump(
      tester,
      List.generate(4, _Session.new),
      view: const DrawerView(
        loaded: true,
        folders: [
          DrawerFolder(id: 'f', name: 'Folder', sessionIds: ['s1', 's2']),
        ],
      ),
      animations: true,
    );
    final body = find.byKey(const ValueKey('folder-body-f'));
    final reveal = find.descendant(of: body, matching: find.byType(ExpandReveal));
    final state = tester.state(reveal);
    container.read(drawerSelectionProvider.notifier).start(); // Removes leading.
    await tester.pump();
    expect(tester.state(reveal), same(state));

    await tester.tap(find.widgetWithText(DrawerFolderHeader, 'Folder'));
    await tester.pump();
    await tester.pump(const Duration(milliseconds: 100));
    final partialHeight = tester.getSize(body).height;
    expect(partialHeight, greaterThan(0));
    expect(partialHeight, lessThan(2 * SessionTile.height));
    await container.read(drawerViewProvider.notifier).updateFolder('f', name: 'Renamed');
    await tester.pump();
    expect(tester.state(reveal), same(state));
    expect(tester.getSize(body).height, closeTo(partialHeight, 0.01));
    await tester.pump(const Duration(milliseconds: 300));
    expect(_tile('s1'), findsNothing);

    await tester.tap(find.widgetWithText(DrawerFolderHeader, 'Renamed'));
    await tester.pump();
    await tester.pump(const Duration(milliseconds: 300));
    expect(_tile('s1'), findsOneWidget);
    expect(tester.getSize(body).height, 2 * SessionTile.height);
    expect(tester.takeException(), isNull);
  });
}
