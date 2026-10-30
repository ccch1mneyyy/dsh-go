// Custom providers (`llm-pi-ai` routes): request shapes match what the
// official Models page sends (`dsh-client-ui-settings-models` 0.2.1-rc.2),
// and the section reads back as typed profiles.

import 'dart:convert';

import 'package:dsh_client/dsh_client.dart';
import 'package:test/test.dart';

import 'support/fake_dsh.dart';

const fastMux = MuxOptions(readyTimeout: Duration(seconds: 2), retryCaps: [Duration(milliseconds: 20)]);

Map<String, Object?> ok(Object? value) => {'ok': true, 'value': value};

/// [spec] through JSON text and back, as the Host would store and return it.
ProviderModelSpec jsonRoundTrip(ProviderModelSpec spec) =>
    ProviderModelSpec.fromJson(jsonDecode(jsonEncode(spec.toJson())))!;

Map<String, Object?> fail(String code, String message) => {
  'ok': false,
  'error': {'code': code, 'message': message, 'details': <String, Object?>{}},
};

/// `settings/describe` → `llm-pi-ai` as a 0.2.1-rc.2 Host answers it: the
/// resolved value carries schema defaults, the user layer only what was set.
Map<String, Object?> _piAiView({int revision = 4}) => {
  'ns': 'llm-pi-ai',
  'autoGenerate': true,
  'applies': 'live',
  'secrets': <Object?>[],
  'schema': <String, Object?>{},
  'revision': revision,
  'value': {
    'providers': {
      'custom-mygw': {
        'displayName': 'My Gateway',
        'api': 'openai-completions',
        'baseURL': 'https://gw.example.com/v1',
        'apiKeyEnv': 'CUSTOM_MYGW_API_KEY',
        'models': [
          {
            'id': 'qwen3-coder',
            'name': 'Qwen3 Coder',
            'contextWindow': 262144,
            'maxTokens': 32768,
            'reasoningEfforts': {'off': null, 'high': 'high'},
          },
          {
            'id': 'glm-4.6',
            'input': <Object?>[],
            'compat': {'chatTemplateKwargs': <String, Object?>{}, 'chatTemplateArgs': <String, Object?>{}},
          },
          {'name': 'no id'},
        ],
        'headers': {'X-Team': 'ops', 'bad': 3},
        'defaultContextWindow': 262144,
        'defaultMaxTokens': 32768,
        'defaultInput': ['text'],
      },
      'openai': {'apiKeyEnv': 'OPENAI_API_KEY', 'defaultContextWindow': 262144},
      'acme': {'displayName': 'Acme', 'api': 'anthropic-messages', 'baseURL': 'https://acme.example'},
    },
  },
  'user': {
    'providers': {
      'custom-mygw': {'displayName': 'My Gateway'},
      'acme': {'displayName': 'Acme'},
    },
  },
  'base': {
    'providers': {
      'acme': {'displayName': 'Acme'},
    },
  },
};

void main() {
  late FakeDsh host;

  setUp(() async => host = await FakeDsh.start());
  tearDown(() async => host.close());

  Future<DshClient> connect() async {
    final client = await DshClient.connect(baseUri: host.baseUri, token: FakeDsh.token, muxOptions: fastMux);
    addTearDown(client.close);
    return client;
  }

  group('route and key reference rules', () {
    test('route pattern and derived reference follow the official page', () {
      for (final good in ['custom-mygw', 'custom-my-gw-2', 'a', 'acme1']) {
        expect(providerRoutePattern.hasMatch(good), isTrue, reason: good);
      }
      for (final bad in ['', '1abc', 'Custom', 'my--gw', 'gw-', '-gw', 'my_gw', 'my gw']) {
        expect(providerRoutePattern.hasMatch(bad), isFalse, reason: bad);
      }
      expect(deriveProviderKeyRef('custom-mygw'), 'CUSTOM_MYGW_API_KEY');
      expect(deriveProviderKeyRef('custom-my-gw-2'), 'CUSTOM_MY_GW_2_API_KEY');
    });

    test('protocols round-trip their wire names', () {
      expect(ProviderApi.values.map((a) => a.wire), ['openai-completions', 'openai-responses', 'anthropic-messages']);
      expect(ProviderApi.fromWire('anthropic-messages'), ProviderApi.anthropicMessages);
      expect(ProviderApi.fromWire('bedrock'), isNull);
    });
  });

  group('read', () {
    test('bare catalog routes ignore resolved defaults but retain custom settings from either layer', () {
      for (final subscription in Subscription.values) {
        final route = subscription.wire;
        ProviderSettings read(Map<String, Object?>? user, {Map<String, Object?>? base}) => ProviderSettings.fromSection(
          SettingsSection(
            ns: piAiSettingsNs,
            revision: 1,
            value: {
              'providers': {
                route: {
                  'displayName': 'Subscription',
                  'defaultContextWindow': 262144,
                  'streamIdleTimeoutMs': 60000,
                  ...?base,
                  ...?user,
                },
              },
            },
            user: user == null
                ? null
                : {
                    'providers': {route: user},
                  },
            base: base == null
                ? null
                : {
                    'providers': {route: base},
                  },
          ),
        );

        expect(read({'displayName': 'Subscription'}).displayNameOnlyRoutes, {route});
        expect(read(null).displayNameOnlyRoutes, isEmpty, reason: 'unknown source stays visible');
        for (final custom in <Map<String, Object?>>[
          {'baseURL': 'https://example.invalid/v1'},
          {
            'models': [
              {'id': 'custom-model'},
            ],
          },
          {
            'modelOverrides': {
              'catalog-model': {'maxTokens': 1024},
            },
          },
          {
            'headers': {'X-Team': 'custom'},
          },
          {'apiKeyEnv': 'MY_KEY'},
          {'futureOption': true},
        ]) {
          expect(read(custom).displayNameOnlyRoutes, isEmpty, reason: '$route: $custom');
          expect(
            read({'displayName': 'Subscription'}, base: custom).displayNameOnlyRoutes,
            isEmpty,
            reason: 'base configuration also stays visible: $route: $custom',
          );
        }
      }
    });

    test('providerSettings reads profiles, layers and writability', () async {
      host.handlers['settings/describe'] = (_) => ok({
        'writable': true,
        'namespaces': [
          {'ns': 'permission', 'value': <String, Object?>{}, 'revision': 1},
          _piAiView(),
        ],
      });
      final settings = (await (await connect()).providerSettings())!;
      expect(settings.revision, 4);
      expect(settings.writable, isTrue);
      expect(settings.profiles.map((p) => p.route), ['custom-mygw', 'openai', 'acme']);

      final gw = settings.byRoute('custom-mygw')!;
      expect(gw.label, 'My Gateway');
      expect(gw.protocol, ProviderApi.openaiCompletions);
      expect(gw.baseUrl, 'https://gw.example.com/v1');
      expect(gw.apiKeyEnv, 'CUSTOM_MYGW_API_KEY');
      expect(gw.models.map((m) => m.id), ['qwen3-coder', 'glm-4.6'], reason: 'entries without an id are skipped');
      expect(gw.models.first.label, 'Qwen3 Coder');
      expect(gw.models.last.label, 'glm-4.6');
      expect(gw.models.first.extra, {
        'reasoningEfforts': {'off': null, 'high': 'high'},
      }, reason: 'unmodelled fields ride along');
      expect(gw.headers, {'X-Team': 'ops'});
      expect(gw.handDeclared, isTrue);
      expect(gw.models.first.reasoningEfforts, {'off': null, 'high': 'high'});
      expect(gw.models.first.thinkingLevels, ['off', 'high']);
      expect(gw.models.first.thinks, isTrue);
      expect(gw.models.last.thinks, isFalse);
      expect(gw.defaultContextWindow, 262144, reason: 'the read-back carries the schema defaults');
      expect(gw.defaultMaxTokens, 32768);
      expect(gw.defaultInput, ['text']);

      final openai = settings.byRoute('openai')!;
      expect(openai.handDeclared, isFalse, reason: 'a catalog route narrowed by settings');
      expect(openai.label, 'openai');
      expect(settings.byRoute('acme')!.handDeclared, isFalse, reason: 'no models');

      expect(settings.removable('custom-mygw'), isTrue);
      expect(settings.removable('acme'), isFalse, reason: 'the home patch brings it back');
      expect(settings.removable('openai'), isFalse, reason: 'not in the user layer');
    });

    test('null when the Host does not mount the adapter', () async {
      host.handlers['settings/describe'] = (_) => ok({'writable': true, 'namespaces': <Object?>[]});
      expect(await (await connect()).providerSettings(), isNull);
    });
  });

  group('write', () {
    late List<Map<String, Object?>> mutations;

    setUp(() {
      mutations = [];
      host.handlers['settings/mutate'] = (args) {
        mutations.add(args);
        return ok(_piAiView(revision: 5));
      };
    });

    test('saveProvider sets the whole profile at providers.<route>', () async {
      final client = await connect();
      final result = await client.saveProvider(
        const ProviderProfile(
          route: 'custom-mygw',
          displayName: 'My Gateway',
          api: 'openai-completions',
          baseUrl: 'https://gw.example.com/v1',
          apiKeyEnv: 'CUSTOM_MYGW_API_KEY',
          models: [
            ProviderModelSpec(id: 'qwen3-coder', name: 'Qwen3 Coder', contextWindow: 262144, maxTokens: 32768),
            ProviderModelSpec(id: 'glm-4.6', input: ['text', 'image']),
          ],
        ),
        expectedRevision: 4,
      );
      expect(mutations.single, {
        'ns': 'llm-pi-ai',
        'ops': [
          {
            'op': 'set',
            'path': ['providers', 'custom-mygw'],
            'value': {
              'displayName': 'My Gateway',
              'api': 'openai-completions',
              'baseURL': 'https://gw.example.com/v1',
              'apiKeyEnv': 'CUSTOM_MYGW_API_KEY',
              'models': [
                {'id': 'qwen3-coder', 'name': 'Qwen3 Coder', 'contextWindow': 262144, 'maxTokens': 32768},
                {
                  'id': 'glm-4.6',
                  'input': ['text', 'image'],
                },
              ],
            },
          },
        ],
        'expectedRevision': 4,
      });
      expect(result.revision, 5);
      expect(result.byRoute('custom-mygw'), isNotNull);
    });

    test('updateProvider writes only the given fields, in one mutate', () async {
      final client = await connect();
      await client.updateProvider(
        'custom-mygw',
        displayName: 'Gateway',
        api: ProviderApi.anthropicMessages,
        baseUrl: 'https://gw.example.com',
        models: const [
          ProviderModelSpec(
            id: 'qwen3-coder',
            extra: {
              'reasoningEfforts': {'off': null, 'high': 'high'},
            },
          ),
        ],
      );
      expect(mutations.single, {
        'ns': 'llm-pi-ai',
        'ops': [
          {
            'op': 'set',
            'path': ['providers', 'custom-mygw', 'displayName'],
            'value': 'Gateway',
          },
          {
            'op': 'set',
            'path': ['providers', 'custom-mygw', 'api'],
            'value': 'anthropic-messages',
          },
          {
            'op': 'set',
            'path': ['providers', 'custom-mygw', 'baseURL'],
            'value': 'https://gw.example.com',
          },
          {
            'op': 'set',
            'path': ['providers', 'custom-mygw', 'models'],
            'value': [
              {
                'reasoningEfforts': {'off': null, 'high': 'high'},
                'id': 'qwen3-coder',
              },
            ],
          },
        ],
      });
      expect(() => client.updateProvider('custom-mygw'), throwsArgumentError);
    });

    test('removeProvider unsets the route', () async {
      await (await connect()).removeProvider('custom-mygw', expectedRevision: 4);
      expect(mutations.single, {
        'ns': 'llm-pi-ai',
        'ops': [
          {
            'op': 'unset',
            'path': ['providers', 'custom-mygw'],
          },
        ],
        'expectedRevision': 4,
      });
    });

    test('invalid routes never reach the wire', () async {
      final client = await connect();
      expect(() => client.saveProvider(const ProviderProfile(route: 'My GW')), throwsArgumentError);
      expect(() => client.removeProvider('1x'), throwsArgumentError);
      expect(mutations, isEmpty);
    });

    test('a refused write surfaces the Host code', () async {
      host.handlers['settings/mutate'] = (_) => fail('settings/conflict', 'stale revision');
      final client = await connect();
      await expectLater(
        client.removeProvider('custom-mygw', expectedRevision: 1),
        throwsA(isA<DshRemoteException>().having((e) => e.code, 'code', 'settings/conflict')),
      );
    });

    test('the key goes to credentials/set under the profile reference', () async {
      Map<String, Object?>? stored;
      host.handlers['credentials/set'] = (args) {
        stored = args;
        return ok(null);
      };
      await (await connect()).setProviderKey('sk-gw-123', ref: deriveProviderKeyRef('custom-mygw'));
      expect(stored, {'ref': 'CUSTOM_MYGW_API_KEY', 'value': 'sk-gw-123'});
    });
  });

  group('model entries', () {
    const plain = ProviderModelSpec(
      id: 'glm-4.6',
      contextWindow: 200000,
      extra: {
        'compat': {'supportsStore': false},
      },
    );

    test('thinking levels write in escalation order, each sending its own name, off nothing', () {
      final spec = plain.withReasoningEfforts(['high', 'off', 'low', 'max']);
      expect(spec.toJson(), {
        'compat': {'supportsStore': false},
        'reasoningEfforts': {'off': null, 'low': 'low', 'high': 'high', 'max': 'max'},
        'id': 'glm-4.6',
        'contextWindow': 200000,
      });
      expect(spec.thinkingLevels, ['off', 'low', 'high', 'max']);
      expect(spec.thinks, isTrue);
      expect(jsonRoundTrip(spec).reasoningEfforts, {
        'off': null,
        'low': 'low',
        'high': 'high',
        'max': 'max',
      }, reason: 'read back as written');
    });

    test('a level kept keeps the value configured for it; one dropped is gone', () {
      const custom = ProviderModelSpec(
        id: 'gpt-5.2',
        extra: {
          'reasoningEfforts': {'off': 'none', 'medium': 'medium', 'max': 'xhigh'},
        },
      );
      expect(custom.withReasoningEfforts(['off', 'max', 'high']).toJson()['reasoningEfforts'], {
        'off': 'none',
        'high': 'high',
        'max': 'xhigh',
      });
    });

    test('no levels drops the field, but an explicit false stays', () {
      final thinking = plain.withReasoningEfforts(['off', 'high']);
      expect(thinking.withReasoningEfforts(const []).toJson(), plain.toJson());
      expect(thinking.withReasoningEfforts(null).toJson().containsKey('reasoningEfforts'), isFalse);

      const nonReasoning = ProviderModelSpec(id: 'kimi', extra: {'reasoningEfforts': false});
      expect(nonReasoning.reasoningEfforts, isNull);
      expect(nonReasoning.thinks, isFalse);
      expect(nonReasoning.withReasoningEfforts(null).toJson(), {'reasoningEfforts': false, 'id': 'kimi'});
      expect(nonReasoning.withReasoningEfforts(['low']).toJson(), {
        'reasoningEfforts': {'low': 'low'},
        'id': 'kimi',
      });
      expect(nonReasoning.withReasoningEfforts(['low']).withReasoningEfforts(null).toJson(), {
        'id': 'kimi',
      }, reason: 'the false was replaced by the dict, so turning thinking off again drops the field');
    });

    test('only off is not thinking; an unreadable dict reads as none and still rides along', () {
      expect(plain.withReasoningEfforts(['off']).thinks, isFalse);
      const odd = ProviderModelSpec(
        id: 'x',
        extra: {
          'reasoningEfforts': {'high': 3},
        },
      );
      expect(odd.reasoningEfforts, isNull);
      expect(odd.toJson()['reasoningEfforts'], {'high': 3});
    });

    test('images: the entry\'s own input, else the route default', () {
      expect(const ProviderModelSpec(id: 'a').acceptsImages(), isFalse);
      expect(const ProviderModelSpec(id: 'a', input: []).acceptsImages(routeDefault: ['text', 'image']), isTrue);
      expect(const ProviderModelSpec(id: 'a', input: ['text']).acceptsImages(routeDefault: ['text', 'image']), isFalse);
      expect(const ProviderModelSpec(id: 'a', input: ['text', 'image']).acceptsImages(), isTrue);
    });

    test('a profile built here writes no route defaults; one read back keeps them', () {
      const built = ProviderProfile(route: 'custom-a', api: 'openai-completions', baseUrl: 'https://a.example/v1');
      expect(built.toJson().keys, isNot(contains('defaultContextWindow')));
      final read = ProviderProfile.fromJson('custom-a', {
        'api': 'openai-completions',
        'defaultContextWindow': 131072,
        'defaultMaxTokens': 8192,
        'defaultInput': ['text', 'image'],
      });
      expect(read.defaultContextWindow, 131072);
      expect(read.defaultMaxTokens, 8192);
      expect(read.defaultInput, ['text', 'image']);
      expect(read.toJson()['defaultInput'], ['text', 'image']);
    });

    test('thinking levels are the adapter\'s, in its order', () {
      expect(piAiThinkingLevels, ['off', 'minimal', 'low', 'medium', 'high', 'xhigh', 'max']);
      expect(piAiDefaultContextWindow, 262144);
      expect(piAiDefaultMaxTokens, 32768);
    });
  });

  group('discovery', () {
    test('a draft sends settingsNs and the probe request', () async {
      Map<String, Object?>? sent;
      host.handlers['llm/discoverModels'] = (args) {
        sent = args;
        return ok([
          {'id': 'qwen3-coder', 'name': 'Qwen3 Coder', 'contextWindow': 262144, 'maxTokens': 65536},
          {
            'id': 'glm-4.6',
            'name': 'glm-4.6',
            'inputModalities': ['text', 'image'],
          },
          {'name': 'no id'},
        ]);
      };
      final models = await (await connect()).discoverModels(
        baseUrl: 'https://gw.example.com/v1',
        api: ProviderApi.openaiCompletions,
        apiKey: 'sk-draft',
      );
      expect(sent, {
        'settingsNs': 'llm-pi-ai',
        'request': {'baseURL': 'https://gw.example.com/v1', 'api': 'openai-completions', 'apiKey': 'sk-draft'},
      });
      expect(models.map((m) => m.id), ['qwen3-coder', 'glm-4.6']);
      expect(models.first.toSpec().toJson(), {
        'id': 'qwen3-coder',
        'name': 'Qwen3 Coder',
        'contextWindow': 262144,
        'maxTokens': 65536,
      });
      expect(models.last.toSpec().toJson(), {
        'id': 'glm-4.6',
        'input': ['text', 'image'],
      }, reason: 'a name equal to the id is dropped');
    });

    test('a configured route sends only what the draft has (stored key)', () async {
      Map<String, Object?>? sent;
      host.handlers['llm/discoverModels'] = (args) {
        sent = args;
        return ok(<Object?>[]);
      };
      await (await connect()).discoverModels(provider: 'custom-mygw', baseUrl: 'https://gw.example.com/v1');
      expect(sent, {
        'settingsNs': 'llm-pi-ai',
        'request': {'provider': 'custom-mygw', 'baseURL': 'https://gw.example.com/v1'},
      });
    });

    test('listConfigurableProviders keeps diagnostics', () async {
      host.handlers['llm/listConfigurableProviders'] = (_) => ok([
        {
          'provider': 'custom-mygw',
          'displayName': 'My Gateway',
          'settingsNs': 'llm-pi-ai',
          'settingsPath': ['providers', 'custom-mygw'],
          'declared': true,
          'error': 'llm-pi-ai: provider "custom-mygw" model "x" …',
        },
        {'displayName': 'no provider'},
      ]);
      final list = await (await connect()).listConfigurableProviders();
      expect(list.single.provider, 'custom-mygw');
      expect(list.single.settingsPath, ['providers', 'custom-mygw']);
      expect(list.single.declared, isTrue);
      expect(list.single.error, contains('custom-mygw'));
    });
  });
}
