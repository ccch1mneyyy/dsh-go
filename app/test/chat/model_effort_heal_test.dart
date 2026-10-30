// A provider model edit can remove every thinking level while a conversation
// still names one. The Host keeps the old selection, and DSH refuses even
// `off` as UNSUPPORTED_REASONING_EFFORT; the conversation heals its selection
// from the catalog instead of failing the next prompt.
import 'dart:io';

import 'package:dsh_app/state/chat_state.dart';
import 'package:dsh_app/state/connection_state.dart';
import 'package:dsh_app/state/models_state.dart';
import 'package:dsh_client/dsh_client.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../packages/dsh_client/test/support/fake_dsh.dart';
import 'support/session_sync_host.dart';

const _stale = ModelSelection(provider: 'custom-provider', model: 'some-model', reasoningEffort: 'off');

ModelCatalog _catalogWith(List<String> levels) => ModelCatalog(
  defaultSelection: const ModelSelection(provider: 'custom-provider', model: 'some-model'),
  routableProviders: const ['custom-provider'],
  groups: [
    ProviderGroup('custom-provider', 'Custom provider', [
      ModelInfo(
        provider: 'custom-provider',
        id: 'some-model',
        name: 'Example model',
        efforts: [for (final level in levels) ReasoningEffort(level, level, null)],
      ),
    ]),
  ],
  failures: const [],
);

ModelCatalog _catalog({required bool thinking}) => _catalogWith(thinking ? const ['off', 'high'] : const []);

Map<String, Object?> _selected(Map request) => {'provider': request['provider'], 'model': request['model']};

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  test('removing a model\'s thinking levels heals the stored selection', () async {
    var catalog = _catalog(thinking: true);
    await HttpOverrides.runWithHttpOverrides(() async {
      final h = await SyncHarness.start(overrides: [modelCatalogProvider.overrideWith((ref) async => catalog)]);
      final requests = <Map<String, Object?>>[];
      h.host.handlers['session/selectModel'] = (args) {
        final request = Map<String, Object?>.from(args['request']! as Map);
        requests.add(request);
        return {
          'ok': true,
          'value': {'selected': _selected(request)},
        };
      };
      try {
        // The conversation still names the level the provider has since removed.
        final snapshot = syncSnapshot(1);
        (snapshot['projections']! as Map)['values'] = {
          ...((snapshot['projections']! as Map)['values']! as Map),
          'modelSelection': {'next': _stale.toJson()},
        };
        h.follows.last.socket.item(h.follows.last.id, snapshot);
        await waitSync(() => h.state.model?.reasoningEffort == 'off', 'the stored selection');

        // Provider model edited: thinking switched off.
        catalog = _catalog(thinking: false);
        h.container.invalidate(modelCatalogProvider);

        await waitSync(() => requests.isNotEmpty && h.state.model?.reasoningEffort == null, 'the healed selection');
        expect(requests, hasLength(1));
        expect(requests.single['reasoningEffort'], isNull);
        expect(h.state.model!.provider, 'custom-provider');
        expect(h.state.model!.model, 'some-model');
        expect(h.state.model!.reasoningEffort, isNull);
        expect(h.state.error, isNull, reason: 'the repair is silent');
      } finally {
        await h.close();
      }
    }, RealSyncHttp());
  });

  test('a level the model still offers is kept', () async {
    await HttpOverrides.runWithHttpOverrides(() async {
      final h = await SyncHarness.start(
        overrides: [modelCatalogProvider.overrideWith((ref) async => _catalog(thinking: true))],
      );
      final requests = <Map<String, Object?>>[];
      h.host.handlers['session/selectModel'] = (args) {
        final request = Map<String, Object?>.from(args['request']! as Map);
        requests.add(request);
        return {
          'ok': true,
          'value': {'selected': _selected(request)},
        };
      };
      try {
        final snapshot = syncSnapshot(1);
        (snapshot['projections']! as Map)['values'] = {
          ...((snapshot['projections']! as Map)['values']! as Map),
          'modelSelection': {'next': _stale.toJson()},
        };
        h.follows.last.socket.item(h.follows.last.id, snapshot);
        await waitSync(() => h.state.model?.reasoningEffort == 'off', 'the stored selection');
        // Give a would-be heal time to reach the Host.
        await Future<void>.delayed(const Duration(milliseconds: 80));
        expect(requests, isEmpty);
        expect(h.state.model!.reasoningEffort, 'off');
      } finally {
        await h.close();
      }
    }, RealSyncHttp());
  });

  test('a repair that fails is tried again, then gives up', () async {
    var failures = 2;
    await HttpOverrides.runWithHttpOverrides(() async {
      final h = await SyncHarness.start(
        overrides: [modelCatalogProvider.overrideWith((ref) async => _catalog(thinking: false))],
      );
      var calls = 0;
      h.host.handlers['session/selectModel'] = (args) {
        calls++;
        if (failures-- > 0) {
          return {
            'ok': false,
            'error': {'code': 'gateway/internal', 'message': 'Transient carrier failure', 'details': {}},
          };
        }
        final request = Map<String, Object?>.from(args['request']! as Map);
        return {
          'ok': true,
          'value': {'selected': _selected(request)},
        };
      };
      try {
        final snapshot = syncSnapshot(1);
        (snapshot['projections']! as Map)['values'] = {
          ...((snapshot['projections']! as Map)['values']! as Map),
          'modelSelection': {'next': _stale.toJson()},
        };
        h.follows.last.socket.item(h.follows.last.id, snapshot);

        await waitSync(() => h.state.model?.reasoningEffort == null, 'the repaired selection');
        expect(calls, 3, reason: 'two failures, then the repair lands');
        expect(h.state.error, isNull, reason: 'the repair stays silent');
      } finally {
        await h.close();
      }
    }, RealSyncHttp());
  });

  test('a newer choice from the Host is not overwritten by a repair', () async {
    const newer = ModelSelection(provider: 'custom-provider', model: 'some-model', reasoningEffort: 'high');
    await HttpOverrides.runWithHttpOverrides(() async {
      final h = await SyncHarness.start(
        overrides: [
          modelCatalogProvider.overrideWith((ref) async => _catalogWith(const ['high'])),
        ],
      );
      final hold = ReplyHold();
      final connection = DshConnection(h.host.baseUri);
      await connection.login(FakeDsh.token);
      final client = DshClient.withCarrier(
        HeldReplyCarrier(DshHttpCarrier(connection), hold),
        muxOptions: const MuxOptions(readyTimeout: Duration(seconds: 2)),
      );
      await client.mux.ready();
      h.container.updateOverrides([
        activeConnectionProvider.overrideWithValue(AsyncData(HostConnection(client: client, isLocal: true))),
      ]);
      h.container.read(chatProvider('S'));
      h.container.listen(chatProvider('S'), (_, _) {});
      await waitSync(() => h.follows.length >= 2, 'the follow of the held client');
      h.host.handlers['session/selectModel'] = (args) {
        final request = Map<String, Object?>.from(args['request']! as Map);
        return {
          'ok': true,
          'value': {'selected': _selected(request)},
        };
      };
      hold.arm('session/selectModel');
      try {
        // The stale selection heals (held), and the Host then reports that
        // this conversation was switched to another level from elsewhere.
        final snapshot = syncSnapshot(1);
        (snapshot['projections']! as Map)['values'] = {
          ...((snapshot['projections']! as Map)['values']! as Map),
          'modelSelection': {'next': _stale.toJson()},
        };
        h.follows.last.socket.item(h.follows.last.id, snapshot);
        await waitSync(() => hold.received?.isCompleted == true, 'the repair on the wire');

        final switched = syncSnapshot(1);
        (switched['projections']! as Map)['values'] = {
          ...((switched['projections']! as Map)['values']! as Map),
          'modelSelection': {'next': newer.toJson()},
        };
        h.follows.last.socket.item(h.follows.last.id, switched);
        await waitSync(() => h.state.model?.reasoningEffort == 'high', 'the newer selection');
        hold.finish();
        await Future<void>.delayed(const Duration(milliseconds: 80));
        expect(h.state.model!.reasoningEffort, 'high', reason: 'the repair reply must not win');
      } finally {
        hold.finish();
        await client.close();
        await h.close();
      }
    }, RealSyncHttp());
  });

  test('setModel drops an effort the catalog no longer lists', () async {
    await HttpOverrides.runWithHttpOverrides(() async {
      final h = await SyncHarness.start(
        overrides: [modelCatalogProvider.overrideWith((ref) async => _catalog(thinking: false))],
      );
      final requests = <Map<String, Object?>>[];
      h.host.handlers['session/selectModel'] = (args) {
        final request = Map<String, Object?>.from(args['request']! as Map);
        requests.add(request);
        return {
          'ok': true,
          'value': {'selected': _selected(request)},
        };
      };
      try {
        expect(await h.chat.setModel(_stale), isTrue);
        expect(requests, hasLength(1));
        expect(requests.single['reasoningEffort'], isNull);
        expect(h.state.model!.reasoningEffort, isNull);
        expect(h.state.error, isNull);
      } finally {
        await h.close();
      }
    }, RealSyncHttp());
  });
}
