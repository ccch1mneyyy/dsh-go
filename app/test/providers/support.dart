// Fakes and sample data for the 模型渠道 (custom provider) tests.

import 'dart:async';

import 'package:dsh_app/runtime/runtime_state.dart';
import 'package:dsh_app/state/account_state.dart';
import 'package:dsh_app/state/connection_state.dart';
import 'package:dsh_app/state/provider_keys.dart';
import 'package:dsh_app/state/providers_state.dart';
import 'package:dsh_app/state/settings_state.dart';
import 'package:dsh_app/state/subscriptions_state.dart';
import 'package:dsh_client/dsh_client.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod/misc.dart' show Override;
import 'package:flutter_test/flutter_test.dart';

import '../account/support.dart' show FixedAccount, sampleProfile;
import '../shell/golden_harness.dart' show FakeRuntime, FakeSettings, goldenApp, loadGoldenFonts, runningStatus;

/// In-memory secure storage for provider keys.
class MemoryProviderKeyVault implements ProviderKeyVault {
  MemoryProviderKeyVault([Map<String, String>? initial]) : data = {...?initial};

  final Map<String, String> data;

  @override
  Future<Map<String, String>> readAll() async => {...data};

  @override
  Future<void> write(String id, String key) async => data[id] = key;

  @override
  Future<void> delete(String id) async => data.remove(id);
}

/// An engine's pi-ai section and credential store in memory. Every call is
/// logged in [calls] with its arguments, in order.
class FakeProviderBackend implements ProviderBackend {
  FakeProviderBackend({
    this.isLocal = true,
    this.hostLabel = '本机',
    List<ProviderProfile> profiles = const [],
    Map<String, String>? credentials,
    this.supported = true,
    this.writable = true,
    this.diagnosticsByRoute = const {},
    this.discoverResult = const [],
    this.displayNameOnlyRoutes = const {},
  }) : profiles = [...profiles],
       stored = {...?credentials};

  @override
  final bool isLocal;

  @override
  final String hostLabel;

  final List<ProviderProfile> profiles;
  final Set<String> displayNameOnlyRoutes;

  /// Credential store: ref → key.
  final Map<String, String> stored;
  bool supported;
  bool writable;
  Map<String, String> diagnosticsByRoute;
  int revision = 3;

  /// Answer of [discover]; [discoverError] wins when set. [discoverFor] picks
  /// an answer per Base URL.
  List<DiscoveredModel> discoverResult;
  Object? discoverError;
  Object? Function(String? baseUrl)? discoverFor;
  Object? storeKeyError;

  final calls = <(String, Map<String, Object?>)>[];
  final _changes = StreamController<void>.broadcast();

  void notifyChanged() => _changes.add(null);

  Iterable<String> get callNames => calls.map((c) => c.$1);

  @override
  Stream<void> get changes => _changes.stream;

  ProviderSettings get _settings => ProviderSettings(
    profiles: [...profiles],
    revision: revision,
    writable: writable,
    userRoutes: {for (final p in profiles) p.route},
    displayNameOnlyRoutes: displayNameOnlyRoutes,
  );

  @override
  Future<ProviderSettings?> read() async {
    calls.add(('read', const {}));
    return supported ? _settings : null;
  }

  @override
  Future<Map<String, CredentialStatus>> credentials(List<String> refs) async => {
    for (final ref in refs) ref: CredentialStatus(configured: stored.containsKey(ref), writable: true),
  };

  @override
  Future<Set<String>> registeredRoutes() async => {for (final p in profiles) p.route};

  @override
  Future<Map<String, String>> diagnostics() async => diagnosticsByRoute;

  @override
  Future<ProviderSettings> create(ProviderProfile profile) async {
    calls.add(('create', profile.toJson()..['route'] = profile.route));
    profiles
      ..removeWhere((p) => p.route == profile.route)
      ..add(profile);
    revision++;
    return _settings;
  }

  @override
  Future<ProviderSettings> update(
    String id, {
    String? displayName,
    ProviderApi? api,
    String? baseUrl,
    String? apiKeyEnv,
    List<ProviderModelSpec>? models,
    int? expectedRevision,
  }) async {
    calls.add((
      'update',
      {
        'id': id,
        'displayName': ?displayName,
        'api': ?api?.wire,
        'baseURL': ?baseUrl,
        'apiKeyEnv': ?apiKeyEnv,
        if (models != null) 'models': [for (final m in models) m.toJson()],
        'expectedRevision': ?expectedRevision,
      },
    ));
    final i = profiles.indexWhere((p) => p.route == id);
    final old = profiles[i];
    profiles[i] = ProviderProfile(
      route: id,
      displayName: displayName ?? old.displayName,
      api: api?.wire ?? old.api,
      baseUrl: baseUrl ?? old.baseUrl,
      apiKeyEnv: apiKeyEnv ?? old.apiKeyEnv,
      models: models ?? old.models,
      headers: old.headers,
    );
    revision++;
    return _settings;
  }

  @override
  Future<ProviderSettings> remove(String id, {int? expectedRevision}) async {
    calls.add(('remove', {'id': id, 'expectedRevision': ?expectedRevision}));
    profiles.removeWhere((p) => p.route == id);
    revision++;
    return _settings;
  }

  @override
  Future<void> storeKey(String ref, String key) async {
    calls.add(('storeKey', {'ref': ref, 'key': key}));
    if (storeKeyError case final error?) throw error;
    stored[ref] = key;
  }

  @override
  Future<void> clearKey(String ref) async {
    calls.add(('clearKey', {'ref': ref}));
    stored.remove(ref);
  }

  @override
  Future<List<DiscoveredModel>> discover({String? provider, String? baseUrl, ProviderApi? api, String? apiKey}) async {
    calls.add(('discover', {'provider': ?provider, 'baseURL': ?baseUrl, 'api': ?api?.wire, 'apiKey': ?apiKey}));
    if (discoverFor case final pick?) {
      final answer = pick(baseUrl);
      if (answer is List<DiscoveredModel>) return answer;
      throw answer!;
    }
    if (discoverError case final error?) throw error;
    return discoverResult;
  }
}

/// `answered <status>` as `llm/discoverModels` words a refused listing.
DshRemoteException listingRefused(String url, int status) =>
    DshRemoteException('gateway/internal', '$url/models answered $status${status == 401 ? '; check the API key' : ''}');

// ── Sample data ──────────────────────────────────────────────────────────────

const gateway = ProviderProfile(
  route: 'custom-mygw',
  displayName: 'My Gateway',
  api: 'openai-completions',
  baseUrl: 'https://gw.example.com/v1',
  apiKeyEnv: 'CUSTOM_MYGW_API_KEY',
  models: [
    ProviderModelSpec(
      id: 'qwen3-coder',
      name: 'Qwen3 Coder',
      contextWindow: 262144,
      maxTokens: 65536,
      extra: {
        'reasoningEfforts': {'off': null, 'high': 'high'},
      },
    ),
    ProviderModelSpec(id: 'glm-4.6', contextWindow: 200000),
    ProviderModelSpec(id: 'kimi-k2-0905'),
  ],
);

const claudeRelay = ProviderProfile(
  route: 'custom-claude-relay',
  displayName: 'Claude 中转',
  api: 'anthropic-messages',
  baseUrl: 'https://relay.example.cn',
  apiKeyEnv: 'CUSTOM_CLAUDE_RELAY_API_KEY',
  models: [ProviderModelSpec(id: 'claude-sonnet-4-5', name: 'Claude Sonnet 4.5', contextWindow: 200000)],
);

const brokenLocal = ProviderProfile(
  route: 'custom-lan',
  displayName: '家里的 vLLM',
  api: 'openai-completions',
  baseUrl: 'http://192.168.1.20:8000/v1',
  apiKeyEnv: 'CUSTOM_LAN_API_KEY',
  models: [ProviderModelSpec(id: 'qwen3-32b')],
);

const discovered = [
  DiscoveredModel(id: 'deepseek-v4-pro', name: 'DeepSeek V4 Pro', contextWindow: 1048576),
  DiscoveredModel(id: 'qwen3-coder', name: 'Qwen3 Coder', contextWindow: 262144, maxTokens: 65536),
  DiscoveredModel(id: 'glm-4.6', name: 'glm-4.6', contextWindow: 200000),
];

/// Three providers in three states: ready, missing key, misconfigured.
FakeProviderBackend sampleBackend({bool isLocal = true}) => FakeProviderBackend(
  isLocal: isLocal,
  hostLabel: isLocal ? '本机' : '电脑 · SSH',
  profiles: const [gateway, claudeRelay, brokenLocal],
  credentials: const {'CUSTOM_MYGW_API_KEY': 'sk-gw', 'CUSTOM_LAN_API_KEY': 'x'},
  diagnosticsByRoute: const {'custom-lan': 'llm-pi-ai: provider "custom-lan" model "qwen3-32b" names api …'},
);

/// The sign-in bridge in memory. [steps] are answered by successive polls
/// (the last one repeats); every call is logged in [calls].
class FakeSubscriptionBackend implements SubscriptionBackend {
  FakeSubscriptionBackend({this.available = true, List<SubscriptionStatus>? statuses, List<LoginStep>? steps})
    : statuses =
          statuses ?? [for (final s in Subscription.values) SubscriptionStatus(subscription: s, signedIn: false)],
      steps = steps ?? const [LoginStep(phase: LoginPhase.starting)];

  /// False: `appAuth/list` fails as on an engine without the bridge.
  bool available;
  List<SubscriptionStatus> statuses;
  List<LoginStep> steps;
  Object? beginError;
  int _attempts = 0;
  int _polled = 0;
  final calls = <String>[];

  int get polls => calls.where((c) => c.startsWith('poll')).length;

  @override
  Future<List<SubscriptionStatus>> list() async {
    calls.add('list');
    if (!available) throw const DshRemoteException('gateway/not-found', 'no method appAuth/list');
    return statuses;
  }

  @override
  Future<String> begin(Subscription subscription) async {
    calls.add('begin:${subscription.wire}');
    if (beginError case final error?) throw error;
    _polled = 0;
    return 'att-${++_attempts}';
  }

  @override
  Future<LoginStep> poll(String attemptId) async {
    calls.add('poll:$attemptId');
    final step = steps[_polled < steps.length ? _polled : steps.length - 1];
    _polled++;
    return step;
  }

  @override
  Future<void> answer(String attemptId, String value) async => calls.add('answer:$attemptId:$value');

  @override
  Future<void> cancel(String attemptId) async => calls.add('cancel:$attemptId');

  @override
  Future<void> signOut(Subscription subscription) async {
    calls.add('signOut:${subscription.wire}');
    statuses = [
      for (final s in statuses)
        s.subscription == subscription ? SubscriptionStatus(subscription: subscription, signedIn: false) : s,
    ];
  }
}

/// Everything a provider page needs, with [backend] as the active engine.
List<Override> providerOverrides(
  FakeProviderBackend? backend, {
  FakeSubscriptionBackend? subscriptions,
  MemoryProviderKeyVault? vault,
  AppSettings settings = const AppSettings(loaded: true, apiKey: 'sk-0123456789abcdef7a3f'),
  AccountState account = const AccountState(phase: AccountPhase.signedOut, connected: true),
}) => [
  providerBackendProvider.overrideWithValue(backend),
  subscriptionBackendProvider.overrideWithValue(
    backend == null ? null : (subscriptions ?? FakeSubscriptionBackend(available: false)),
  ),
  providerKeyVaultProvider.overrideWithValue(vault ?? MemoryProviderKeyVault()),
  settingsProvider.overrideWith(() => FakeSettings(settings)),
  accountProvider.overrideWith(() => FixedAccount(account)),
  localRuntimeProvider.overrideWith(() => FakeRuntime(const LocalRuntimeState(loaded: true, status: runningStatus))),
  activeConnectionProvider.overrideWithValue(
    AsyncData(
      backend == null
          ? null
          : HostConnection(
              client: DshClient(DshConnection(Uri.parse('http://127.0.0.1:9'))),
              label: backend.hostLabel,
              isLocal: backend.isLocal,
            ),
    ),
  ),
];

const signedInAccount = AccountState(phase: AccountPhase.signedIn, connected: true, profile: sampleProfile);

// ── Rendering ────────────────────────────────────────────────────────────────

/// Like the shell's `goldenBoth`, on a phone 390 wide and [height] tall so a
/// whole form page fits without scrolling (status bar 32, gesture bar 24).
void goldenTall(
  String name,
  Widget Function() home, {
  required List<Override> Function() overrides,
  Future<void> Function(WidgetTester tester)? before,
  double height = 844,
}) {
  for (final brightness in Brightness.values) {
    final mode = brightness == Brightness.dark ? 'dark' : 'light';
    testWidgets('$name ($mode)', (tester) async {
      await tester.runAsync(loadGoldenFonts);
      tester.view.devicePixelRatio = 2;
      tester.view.physicalSize = Size(390 * 2, height * 2);
      tester.view.padding = const FakeViewPadding(top: 32 * 2, bottom: 24 * 2);
      tester.view.viewPadding = const FakeViewPadding(top: 32 * 2, bottom: 24 * 2);
      addTearDown(tester.view.reset);
      await tester.pumpWidget(goldenApp(home: home(), brightness: brightness, overrides: overrides()));
      await tester.pump();
      await tester.pump(const Duration(milliseconds: 600));
      if (before != null) await before(tester);
      await expectLater(find.byType(MaterialApp), matchesGoldenFile('goldens/${name}_$mode.png'));
    });
  }
}

/// A few frames: state changes land, then their transitions run to the end.
Future<void> settle(WidgetTester tester) async {
  await tester.pump();
  await tester.pump(const Duration(milliseconds: 400));
  await tester.pump(const Duration(milliseconds: 400));
}
