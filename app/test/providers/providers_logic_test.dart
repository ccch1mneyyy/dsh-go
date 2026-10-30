// 模型渠道 logic: id / slug rules, field validation, error copy, the
// read-back snapshot, writes against the active engine, and the local-only
// key self-heal.

import 'dart:async';
import 'dart:math';

import 'package:dsh_app/state/provider_keys.dart';
import 'package:dsh_app/state/providers_state.dart';
import 'package:dsh_app/state/settings_state.dart';
import 'package:dsh_client/dsh_client.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'support.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  group('ids', () {
    test('slug keeps ASCII words, joins with single hyphens, caps the length', () {
      expect(providerSlug('My Gateway'), 'my-gateway');
      expect(providerSlug('  OpenRouter (备用) 2 '), 'openrouter-2');
      expect(providerSlug('火山方舟'), '');
      expect(providerSlug('a_b.c--d'), 'a-b-c-d');
      expect(providerSlug('x' * 40), 'x' * 24);
      expect(providerSlug('${'a' * 23}-bcd'), 'a' * 23, reason: 'no trailing hyphen after the cut');
    });

    test('new ids are custom-<slug>, unique, and valid routes', () {
      final rng = Random(7);
      final cases = {
        newProviderId(name: 'My Gateway', baseUrl: 'https://gw.example.com/v1', taken: {}): 'custom-my-gateway',
        newProviderId(name: '火山方舟', baseUrl: 'https://ark.cn-beijing.volces.com/api/v3', taken: {}):
            'custom-ark-cn-beijing-volces',
        newProviderId(name: '', baseUrl: 'https://api.siliconflow.cn/v1', taken: {}): 'custom-siliconflow',
        newProviderId(name: '', baseUrl: 'http://192.168.1.20:8000/v1', taken: {}): 'custom-192-168-1-20',
        newProviderId(name: 'My Gateway', baseUrl: '', taken: {'custom-my-gateway', 'custom-my-gateway-2'}):
            'custom-my-gateway-3',
      };
      cases.forEach((actual, expected) => expect(actual, expected));
      final random = newProviderId(name: '测试', baseUrl: 'not a url', taken: {}, random: rng);
      expect(random, matches(RegExp(r'^custom-[a-z2-9]{4}$')));
      for (final id in [...cases.keys, random]) {
        expect(providerRoutePattern.hasMatch(id), isTrue, reason: id);
      }
      expect(deriveProviderKeyRef('custom-my-gateway-3'), 'CUSTOM_MY_GATEWAY_3_API_KEY');
    });
  });

  group('validation', () {
    test('Base URL: trimmed, no trailing slash; Anthropic drops a trailing /v1', () {
      expect(
        normalizeBaseUrl(' https://gw.example.com/v1/// ', ProviderApi.openaiCompletions),
        'https://gw.example.com/v1',
      );
      expect(normalizeBaseUrl('https://gw.example.com/v1/', ProviderApi.anthropicMessages), 'https://gw.example.com');
      expect(
        normalizeBaseUrl('https://gw.example.com/api/v1', ProviderApi.openaiResponses),
        'https://gw.example.com/api/v1',
      );
    });

    test('Base URL errors', () {
      expect(baseUrlError(''), '填写 Base URL');
      expect(baseUrlError('gw.example.com/v1'), '以 http:// 或 https:// 开头的完整地址');
      expect(baseUrlError('ftp://gw.example.com'), '以 http:// 或 https:// 开头的完整地址');
      expect(baseUrlError('https://gw example.com'), '以 http:// 或 https:// 开头的完整地址');
      expect(baseUrlError('https:///v1'), '以 http:// 或 https:// 开头的完整地址');
      expect(baseUrlError('https://gw.example.com/v1?x=1'), '去掉 ? 或 # 之后的部分');
      expect(baseUrlError(' http://192.168.1.20:8000/v1 '), isNull);
      expect(baseUrlError('https://gw.example.com'), isNull);
    });

    test('keys: whitespace stripped; env lines, quotes and non-ASCII refused', () {
      expect(normalizeProviderKey(' sk-abc\n123 \t'), 'sk-abc123');
      expect(providerKeyError('', required: true), '填写 API Key');
      expect(providerKeyError('', required: false), isNull);
      expect(providerKeyError('OPENAI_API_KEY=sk-1', required: true), '只粘贴 Key 本身，不带变量名');
      expect(providerKeyError('ABCD==', required: true), isNull, reason: 'base64 padding is not an assignment');
      expect(providerKeyError('"sk-1"', required: true), '去掉两边的引号');
      expect(providerKeyError('sk-密钥', required: true), 'Key 含有无效字符');
      expect(providerKeyError('sk-or-v1-0123', required: true), isNull);
    });

    test('model ids typed by hand', () {
      expect(modelIdError('  ', const []), '填写模型 ID');
      expect(modelIdError('qwen 3', const []), '模型 ID 不能有空格');
      expect(modelIdError(' glm-4.6 ', const ['glm-4.6']), '已经添加过');
      expect(modelIdError('moonshotai/kimi-k2', const ['glm-4.6']), isNull);
    });

    test('token counts read short', () {
      expect(formatTokens(262144), '256K');
      expect(formatTokens(200000), '200K');
      expect(formatTokens(1048576), '1M');
      expect(formatTokens(1000000), '1M');
      expect(formatTokens(32000), '32K');
      expect(formatTokens(4097), '4097');
    });

    test('a draft without a name takes the host', () {
      const draft = ProviderDraft(name: '  ', api: ProviderApi.openaiCompletions, baseUrl: 'https://gw.example.com/v1');
      expect(draft.effectiveName, 'gw.example.com');
    });
  });

  group('error copy', () {
    String copy(String message, [String code = 'gateway/internal']) =>
        describeProviderError(DshRemoteException(code, message));

    test('discovery failures name what to fix, in Chinese', () {
      expect(copy('https://gw.example.com/v1/models answered 401; check the API key'), 'API Key 无效或没有权限');
      expect(copy('https://gw.example.com/models answered 404'), '找不到模型列表，检查 Base URL');
      expect(copy('https://gw.example.com/v1/models answered 429'), '请求太频繁，稍后再试');
      expect(copy('https://gw.example.com/v1/models answered 502'), '服务暂时不可用（502）');
      expect(copy('https://gw.example.com/v1/models answered 418'), '服务返回了 418');
      expect(copy('could not reach https://gw.example.com/v1/models'), '连不上这个地址，检查 Base URL 和网络');
      expect(copy('https://gw.example.com/models did not answer with JSON'), '没有读到模型列表，检查 Base URL');
      expect(
        copy('pi-ai protocol "openai-responses" has no model listing this build can read; enter …'),
        '这个协议不能获取模型，请手动添加',
      );
      expect(copy('stale', 'settings/conflict'), '渠道刚被改过，返回后重试');
      expect(copy('shadowed', 'credential/rejected'), '引擎的启动环境已提供这个 Key，无法在这里修改');
      expect(copy('no such method', 'gateway/not-found'), '当前引擎版本不支持这个操作');
      expect(copy('llm-pi-ai: provider "x" names api "y"'), '引擎拒绝了这个配置，检查协议和模型');
    });

    test('pipe failures', () {
      expect(describeProviderError(const DshTransportException('timeout')), '没能连上引擎');
      expect(describeProviderError(const DshHttpException(403, 'fence')), '引擎拒绝了请求（403）');
      expect(describeProviderError(const ProviderFailure('原样')), '原样');
    });
  });

  group('snapshot', () {
    Future<ProvidersSnapshot> read(FakeProviderBackend backend) async {
      final container = ProviderContainer(overrides: [providerBackendProvider.overrideWithValue(backend)]);
      addTearDown(container.dispose);
      final sub = container.listen(customProvidersProvider, (_, _) {});
      addTearDown(sub.close);
      final snapshot = await container.read(customProvidersProvider.future);
      return snapshot!;
    }

    test('joins profiles with keys, registration and diagnostics', () async {
      final snapshot = await read(sampleBackend());
      expect(snapshot.supported, isTrue);
      expect(snapshot.revision, 3);
      expect(snapshot.providers.map((p) => p.id), ['custom-mygw', 'custom-claude-relay', 'custom-lan']);
      final health = {for (final p in snapshot.providers) p.id: snapshot.healthOf(p)};
      expect(health, {
        'custom-mygw': ProviderHealth.ready,
        'custom-claude-relay': ProviderHealth.missingKey,
        'custom-lan': ProviderHealth.misconfigured,
      });
      final gw = snapshot.byId('custom-mygw')!;
      expect(gw.editable, isTrue);
      expect(gw.host, 'gw.example.com');
      expect(gw.keyRef, 'CUSTOM_MYGW_API_KEY');
      expect(snapshot.keyStored(gw), isTrue);
    });

    test('keyless custom xai stays visible alongside bare subscription routes', () async {
      final snapshot = await read(
        FakeProviderBackend(
          profiles: const [
            ProviderProfile(route: 'openai-codex', displayName: 'ChatGPT'),
            ProviderProfile(route: 'anthropic', displayName: 'Claude'),
            ProviderProfile(route: 'xai', displayName: 'My xAI', baseUrl: 'https://example.invalid/v1'),
          ],
          displayNameOnlyRoutes: const {'openai-codex', 'anthropic'},
        ),
      );
      expect(snapshot.providers.map((p) => p.id), ['xai']);
      expect(snapshot.providers.single.baseUrl, 'https://example.invalid/v1');
    });

    test('an engine without the adapter reads as unsupported', () async {
      final snapshot = await read(FakeProviderBackend(supported: false));
      expect(snapshot.supported, isFalse);
      expect(snapshot.providers, isEmpty);
    });

    test('a catalog route set up in the web page is listed but not editable', () async {
      final snapshot = await read(
        FakeProviderBackend(
          profiles: const [ProviderProfile(route: 'openai', apiKeyEnv: 'OPENAI_API_KEY')],
        ),
      );
      final openai = snapshot.providers.single;
      expect(openai.editable, isFalse);
      expect(openai.displayName, 'openai');
      expect(snapshot.healthOf(openai), ProviderHealth.missingKey);
    });

    test('re-reads when the engine reports a change', () async {
      final backend = sampleBackend();
      final container = ProviderContainer(overrides: [providerBackendProvider.overrideWithValue(backend)]);
      addTearDown(container.dispose);
      final sub = container.listen(customProvidersProvider, (_, _) {});
      addTearDown(sub.close);
      await container.read(customProvidersProvider.future);
      backend.profiles.removeLast();
      backend.notifyChanged();
      await Future<void>.delayed(Duration.zero);
      final next = await container.read(customProvidersProvider.future);
      expect(next!.providers, hasLength(2));
    });
  });

  group('writes', () {
    late FakeProviderBackend backend;
    late MemoryProviderKeyVault vault;
    late ProviderContainer container;

    ProviderContainer start(FakeProviderBackend b) {
      backend = b;
      vault = MemoryProviderKeyVault();
      final c = ProviderContainer(
        overrides: [
          providerBackendProvider.overrideWithValue(b),
          providerKeyVaultProvider.overrideWithValue(vault),
          settingsProvider.overrideWith(_LoadedSettings.new),
        ],
      );
      addTearDown(c.dispose);
      final sub = c.listen(customProvidersProvider, (_, _) {});
      addTearDown(sub.close);
      return c;
    }

    const draft = ProviderDraft(
      name: 'My Gateway',
      api: ProviderApi.openaiCompletions,
      baseUrl: 'https://gw.example.com/v1',
      apiKey: 'sk-gw-new',
      models: [ProviderModelSpec(id: 'qwen3-coder', name: 'Qwen3 Coder', contextWindow: 262144)],
    );

    test('create on 本机: profile, then key; the key is also kept on the phone', () async {
      container = start(FakeProviderBackend(profiles: const [gateway]));
      await container.read(customProvidersProvider.future);
      final id = await container.read(providerActionsProvider).save(draft);
      expect(id, 'custom-my-gateway', reason: 'custom-mygw is a different id; no clash');
      expect(backend.callNames.where((c) => c != 'read'), ['create', 'storeKey']);
      expect(backend.calls.firstWhere((c) => c.$1 == 'create').$2, {
        'displayName': 'My Gateway',
        'api': 'openai-completions',
        'baseURL': 'https://gw.example.com/v1',
        'apiKeyEnv': 'CUSTOM_MY_GATEWAY_API_KEY',
        'models': [
          {'id': 'qwen3-coder', 'name': 'Qwen3 Coder', 'contextWindow': 262144},
        ],
        'route': 'custom-my-gateway',
      });
      expect(backend.stored['CUSTOM_MY_GATEWAY_API_KEY'], 'sk-gw-new');
      expect(vault.data, {'custom-my-gateway': 'sk-gw-new'});
      expect(container.read(settingsProvider).customProviderIds, {'custom-my-gateway'});
      expect(container.read(settingsProvider).hasModelAccess, isTrue);
    });

    test('create avoids an id already on the engine', () async {
      container = start(
        FakeProviderBackend(
          profiles: const [ProviderProfile(route: 'custom-my-gateway', displayName: 'Old')],
        ),
      );
      await container.read(customProvidersProvider.future);
      expect(await container.read(providerActionsProvider).save(draft), 'custom-my-gateway-2');
    });

    test('create on a remote host keeps the key on that host only', () async {
      container = start(FakeProviderBackend(isLocal: false, hostLabel: '电脑 · SSH'));
      await container.read(customProvidersProvider.future);
      await container.read(providerActionsProvider).save(draft);
      expect(backend.stored, {'CUSTOM_MY_GATEWAY_API_KEY': 'sk-gw-new'});
      expect(vault.data, isEmpty);
      expect(container.read(settingsProvider).customProviderIds, isEmpty);
    });

    test('a failed key write reports the id that was saved', () async {
      container = start(FakeProviderBackend()..storeKeyError = const DshRemoteException('credential/rejected', 'x'));
      await container.read(customProvidersProvider.future);
      await expectLater(
        container.read(providerActionsProvider).save(draft),
        throwsA(
          isA<ProviderFailure>()
              .having((f) => f.savedId, 'savedId', 'custom-my-gateway')
              .having((f) => f.message, 'message', contains('Key 没有存上')),
        ),
      );
      expect(vault.data, isEmpty);
    });

    test('edit writes fields with the revision; an empty key keeps the stored one', () async {
      container = start(sampleBackend());
      final snapshot = (await container.read(customProvidersProvider.future))!;
      final gw = snapshot.byId('custom-mygw')!;
      await container
          .read(providerActionsProvider)
          .save(
            ProviderDraft(
              name: 'Gateway',
              api: ProviderApi.openaiCompletions,
              baseUrl: gw.baseUrl,
              models: gw.models.take(1).toList(),
            ),
            existing: gw,
          );
      expect(backend.callNames.where((c) => c != 'read'), ['update']);
      expect(backend.calls.firstWhere((c) => c.$1 == 'update').$2, {
        'id': 'custom-mygw',
        'displayName': 'Gateway',
        'api': 'openai-completions',
        'baseURL': 'https://gw.example.com/v1',
        'models': [
          {
            'reasoningEfforts': {'off': null, 'high': 'high'},
            'id': 'qwen3-coder',
            'name': 'Qwen3 Coder',
            'contextWindow': 262144,
            'maxTokens': 65536,
          },
        ],
        'expectedRevision': 3,
      }, reason: 'a kept model keeps the fields the form does not show');
      expect(vault.data, isEmpty);
    });

    test('edit with a new key stores it under the profile reference', () async {
      container = start(sampleBackend());
      final gw = (await container.read(customProvidersProvider.future))!.byId('custom-mygw')!;
      await container
          .read(providerActionsProvider)
          .save(
            ProviderDraft(
              name: gw.displayName,
              api: gw.api!,
              baseUrl: gw.baseUrl,
              apiKey: 'sk-rotated',
              models: gw.models,
            ),
            existing: gw,
          );
      expect(backend.stored['CUSTOM_MYGW_API_KEY'], 'sk-rotated');
      expect(vault.data, {'custom-mygw': 'sk-rotated'});
    });

    test('delete removes the route, its key, and the phone copy', () async {
      container = start(sampleBackend());
      final gw = (await container.read(customProvidersProvider.future))!.byId('custom-mygw')!;
      await vault.write('custom-mygw', 'sk-gw');
      await container.read(providerActionsProvider).delete(gw);
      expect(backend.callNames.where((c) => c != 'read'), ['remove', 'clearKey']);
      expect(backend.calls.firstWhere((c) => c.$1 == 'remove').$2, {'id': 'custom-mygw', 'expectedRevision': 3});
      expect(backend.stored.containsKey('CUSTOM_MYGW_API_KEY'), isFalse);
      expect(vault.data, isEmpty);
    });

    test('delete keeps a key another route still uses', () async {
      container = start(
        FakeProviderBackend(
          profiles: const [
            gateway,
            ProviderProfile(
              route: 'custom-mygw-backup',
              api: 'openai-completions',
              baseUrl: 'https://b.example.com/v1',
              apiKeyEnv: 'CUSTOM_MYGW_API_KEY',
              models: [ProviderModelSpec(id: 'm')],
            ),
          ],
          credentials: const {'CUSTOM_MYGW_API_KEY': 'sk'},
        ),
      );
      final gw = (await container.read(customProvidersProvider.future))!.byId('custom-mygw')!;
      await container.read(providerActionsProvider).delete(gw);
      expect(backend.callNames, isNot(contains('clearKey')));
    });

    test('discover retries a bare OpenAI-style URL with /v1 after a 404', () async {
      container = start(
        FakeProviderBackend()
          ..discoverFor = (url) =>
              url == 'https://gw.example.com/v1' ? discovered : listingRefused('https://gw.example.com', 404),
      );
      final result = await container
          .read(providerActionsProvider)
          .discover(api: ProviderApi.openaiCompletions, baseUrl: 'https://gw.example.com', apiKey: 'sk');
      expect(result.baseUrl, 'https://gw.example.com/v1');
      expect(result.models, hasLength(3));
      expect(backend.calls.where((c) => c.$1 == 'discover').map((c) => c.$2['baseURL']), [
        'https://gw.example.com',
        'https://gw.example.com/v1',
      ]);
    });

    test('discover does not guess for paths, Anthropic, or other failures', () async {
      container = start(FakeProviderBackend()..discoverError = listingRefused('https://gw.example.com/api', 404));
      final actions = container.read(providerActionsProvider);
      await expectLater(
        actions.discover(api: ProviderApi.openaiCompletions, baseUrl: 'https://gw.example.com/api'),
        throwsA(isA<DshRemoteException>()),
      );
      await expectLater(
        actions.discover(api: ProviderApi.anthropicMessages, baseUrl: 'https://gw.example.com'),
        throwsA(isA<DshRemoteException>()),
      );
      backend.discoverError = listingRefused('https://gw.example.com', 401);
      await expectLater(
        actions.discover(api: ProviderApi.openaiCompletions, baseUrl: 'https://gw.example.com', apiKey: 'bad'),
        throwsA(isA<DshRemoteException>()),
      );
      expect(backend.calls.where((c) => c.$1 == 'discover'), hasLength(3));
    });

    test('test() lists with the stored key (no apiKey sent)', () async {
      container = start(sampleBackend()..discoverResult = discovered);
      final gw = (await container.read(customProvidersProvider.future))!.byId('custom-mygw')!;
      expect(await container.read(providerActionsProvider).test(gw), 3);
      expect(backend.calls.last.$1, 'discover');
      expect(backend.calls.last.$2, {
        'provider': 'custom-mygw',
        'baseURL': 'https://gw.example.com/v1',
        'api': 'openai-completions',
      });
    });

    test('without a connection, writes fail with a worded error', () async {
      final c = ProviderContainer(overrides: [providerBackendProvider.overrideWithValue(null)]);
      addTearDown(c.dispose);
      await expectLater(
        c.read(providerActionsProvider).save(draft),
        throwsA(isA<ProviderFailure>().having((f) => f.message, 'message', '没有连上引擎')),
      );
    });
  });

  group('self-heal (本机 only)', () {
    test('pushes saved keys the engine lost, and only those', () async {
      final backend = FakeProviderBackend(
        profiles: const [gateway, claudeRelay, brokenLocal],
        credentials: const {'CUSTOM_LAN_API_KEY': 'already-there'},
      );
      final vault = MemoryProviderKeyVault({
        'custom-mygw': 'sk-gw',
        'custom-lan': 'stale-copy',
        'custom-gone': 'sk-orphan',
      });
      final written = await healProviderKeys(backend, vault);
      expect(written, ['CUSTOM_MYGW_API_KEY']);
      expect(backend.stored, {'CUSTOM_LAN_API_KEY': 'already-there', 'CUSTOM_MYGW_API_KEY': 'sk-gw'});
    });

    test('nothing saved, nothing read', () async {
      final backend = FakeProviderBackend(profiles: const [gateway]);
      expect(await healProviderKeys(backend, MemoryProviderKeyVault()), isEmpty);
      expect(backend.calls, isEmpty);
    });

    test('an engine without the adapter is left alone', () async {
      final backend = FakeProviderBackend(supported: false);
      expect(await healProviderKeys(backend, MemoryProviderKeyVault({'custom-mygw': 'k'})), isEmpty);
      expect(backend.callNames, ['read']);
    });
  });

  group('settings', () {
    test('custom provider ids load from the vault and count as model access', () async {
      SharedPreferences.setMockInitialValues({});
      final container = ProviderContainer(
        overrides: [
          providerKeyVaultProvider.overrideWithValue(MemoryProviderKeyVault({'custom-mygw': 'k'})),
        ],
      );
      addTearDown(container.dispose);
      final loaded = Completer<AppSettings>();
      final sub = container.listen(settingsProvider, (_, next) {
        if (next.loaded && !loaded.isCompleted) loaded.complete(next);
      }, fireImmediately: true);
      addTearDown(sub.close);
      final settings = await loaded.future.timeout(const Duration(seconds: 5));
      expect(settings.customProviderIds, {'custom-mygw'});
      expect(settings.hasApiKey, isFalse);
      expect(settings.hasModelAccess, isTrue);
      expect(const AppSettings().hasModelAccess, isFalse);
    });
  });
}

/// Settings that are loaded and touch nothing but the vault.
class _LoadedSettings extends SettingsController {
  @override
  AppSettings build() => const AppSettings(loaded: true);
}
