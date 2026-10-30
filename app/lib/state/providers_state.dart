import 'dart:async';
import 'dart:math';

import 'package:dsh_client/dsh_client.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../l10n/l10n.dart';
import 'read_list_cache.dart';
import 'read_list_identity.dart';
import 'read_list_epoch.dart';
import 'engine_error_text.dart';
import 'models_state.dart';
import 'provider_backend.dart';
import 'settings_state.dart';

export 'package:dsh_client/dsh_client.dart'
    show
        CredentialStatus,
        DiscoveredModel,
        ProviderApi,
        ProviderModelSpec,
        ProviderProfile,
        deriveProviderKeyRef,
        piAiDefaultContextWindow,
        piAiDefaultMaxTokens,
        piAiThinkingLevels;

export 'provider_backend.dart';

// ── Model ────────────────────────────────────────────────────────────────────

/// A bare catalog route is represented by its subscription row. Keep routes
/// with any additional configuration visible, including keyless custom routes.
bool isSubscriptionRoute(ProviderProfile profile, ProviderSettings settings) =>
    Subscription.fromWire(profile.route) != null && settings.displayNameOnlyRoutes.contains(profile.route);

/// 协议在界面上的名字。
String protocolLabel(ProviderApi api) => switch (api) {
  ProviderApi.openaiCompletions => appL10n.stateProviderOpenAi,
  ProviderApi.anthropicMessages => appL10n.stateProviderAnthropic,
  ProviderApi.openaiResponses => 'Responses',
};

/// A custom provider (自定义渠道) as the app shows it: one `llm-pi-ai` route
/// of the **active** engine. The engine's settings are the source of truth;
/// this is a read-back, rebuilt on every change.
class CustomProvider {
  const CustomProvider({
    required this.id,
    required this.displayName,
    this.api,
    this.baseUrl = '',
    this.models = const [],
    this.headers = const {},
    this.apiKeyEnv,
    this.editable = true,
    this.removable = true,
    this.defaults = const ModelDefaults(),
  });

  factory CustomProvider.fromProfile(ProviderProfile profile, {bool removable = true}) => CustomProvider(
    id: profile.route,
    displayName: profile.label,
    api: profile.protocol,
    baseUrl: profile.baseUrl ?? '',
    models: profile.models,
    headers: profile.headers,
    apiKeyEnv: profile.apiKeyEnv,
    editable: profile.handDeclared,
    removable: removable,
    defaults: ModelDefaults.of(profile),
  );

  /// Route id: `custom-<slug>` for the ones this app creates; any id for a
  /// route declared elsewhere (the web Models page, a settings file).
  final String id;
  final String displayName;
  final ProviderApi? api;
  final String baseUrl;
  final List<ProviderModelSpec> models;

  /// Extra request headers; kept as they are, not edited here.
  final Map<String, String> headers;

  /// Credential reference the key lives under; null for a keyless route.
  final String? apiKeyEnv;

  /// Endpoint, protocol and models are all declared in the profile, so the
  /// form can edit it. A catalog route narrowed in the web page is not.
  final bool editable;

  /// In the user layer only (a home patch would bring it back).
  final bool removable;

  /// What the engine assumes for a model that leaves a field empty.
  final ModelDefaults defaults;

  /// Where a newly typed key goes.
  String get keyRef => apiKeyEnv ?? deriveProviderKeyRef(id);

  /// `gw.example.com` from the Base URL.
  String get host => Uri.tryParse(baseUrl)?.host ?? baseUrl;
}

/// What a route assumes for a model entry that leaves a field empty: the
/// route's `defaultContextWindow` / `defaultMaxTokens` / `defaultInput`, else
/// the adapter's own (256K, 32K, text only).
class ModelDefaults {
  const ModelDefaults({
    this.contextWindow = piAiDefaultContextWindow,
    this.maxTokens = piAiDefaultMaxTokens,
    this.input = const ['text'],
  });

  factory ModelDefaults.of(ProviderProfile profile) => ModelDefaults(
    contextWindow: profile.defaultContextWindow ?? piAiDefaultContextWindow,
    maxTokens: profile.defaultMaxTokens ?? piAiDefaultMaxTokens,
    input: (profile.defaultInput?.isNotEmpty ?? false) ? profile.defaultInput! : const ['text'],
  );

  final int contextWindow;
  final int maxTokens;
  final List<String> input;
}

enum ProviderHealth {
  /// Registered, key stored.
  ready,

  /// The profile names a key the engine does not have.
  missingKey,

  /// The engine reports a configuration problem.
  misconfigured,

  /// Not registered (another adapter owns the route, or it is still loading).
  inactive,
}

/// The custom providers of the active engine, with what the engine knows
/// about each: stored key, registration, diagnostics.
class ProvidersSnapshot {
  const ProvidersSnapshot({
    required this.supported,
    this.writable = true,
    this.revision = 0,
    this.providers = const [],
    this.credentials = const {},
    this.registered,
    this.diagnostics = const {},
    this.local = true,
    this._hostLabel,
  });

  /// The engine mounts the pi-ai adapter.
  final bool supported;

  /// The engine's settings accept writes.
  final bool writable;

  /// Revision of the pi-ai section, sent back on edits.
  final int revision;
  final List<CustomProvider> providers;

  /// `credentials/describe` by reference.
  final Map<String, CredentialStatus> credentials;

  /// Registered routes; null when unknown.
  final Set<String>? registered;

  /// Configuration diagnostics by route.
  final Map<String, String> diagnostics;
  final bool local;
  final String? _hostLabel;
  String get hostLabel => _hostLabel ?? appL10n.commonThisPhone;

  CustomProvider? byId(String id) {
    for (final p in providers) {
      if (p.id == id) return p;
    }
    return null;
  }

  Set<String> get takenIds => {for (final p in providers) p.id};

  ProviderHealth healthOf(CustomProvider p) {
    if (diagnostics[p.id] != null) return ProviderHealth.misconfigured;
    final ref = p.apiKeyEnv;
    if (ref != null && credentials[ref]?.configured != true) return ProviderHealth.missingKey;
    final registered = this.registered;
    if (registered != null && !registered.contains(p.id)) return ProviderHealth.inactive;
    return ProviderHealth.ready;
  }

  bool keyStored(CustomProvider p) => p.apiKeyEnv != null && credentials[p.apiKeyEnv]?.configured == true;
}

/// What the add / edit form submits.
class ProviderDraft {
  const ProviderDraft({
    required this.name,
    required this.api,
    required this.baseUrl,
    this.apiKey = '',
    this.models = const [],
  });

  /// Empty: the Base URL's host is used.
  final String name;
  final ProviderApi api;

  /// Already normalized ([normalizeBaseUrl]).
  final String baseUrl;

  /// Empty when editing: keep the stored key.
  final String apiKey;
  final List<ProviderModelSpec> models;

  String get effectiveName {
    final trimmed = name.trim();
    if (trimmed.isNotEmpty) return trimmed;
    return Uri.tryParse(baseUrl)?.host ?? baseUrl;
  }
}

// ── Validation ───────────────────────────────────────────────────────────────

/// Trims, drops trailing slashes and, for Anthropic, a trailing `/v1`: the
/// Anthropic protocol appends `/v1/messages` itself, so `…/v1` would ask for
/// `/v1/v1/messages`. OpenAI-style endpoints keep their path (most need
/// `/v1`).
String normalizeBaseUrl(String raw, ProviderApi api) {
  var url = raw.trim().replaceFirst(RegExp(r'/+$'), '');
  if (api == ProviderApi.anthropicMessages) url = url.replaceFirst(RegExp(r'/v1$'), '');
  return url;
}

/// Field error for a Base URL, or null.
String? baseUrlError(String raw) {
  final url = raw.trim();
  if (url.isEmpty) return appL10n.stateProviderUrlRequired;
  final uri = Uri.tryParse(url);
  if (uri == null ||
      url.contains(RegExp(r'\s')) ||
      !(uri.isScheme('http') || uri.isScheme('https')) ||
      uri.host.isEmpty) {
    return appL10n.stateProviderUrlInvalid;
  }
  if (uri.hasQuery || uri.hasFragment) return appL10n.stateProviderUrlSuffix;
  return null;
}

/// Whitespace a paste may have picked up; keys never contain any.
String normalizeProviderKey(String raw) => raw.replaceAll(RegExp(r'\s'), '');

/// Field error for an already normalized key, or null. Mirrors the official
/// page's checks: printable ASCII only, not a `NAME=value` line, not quoted.
String? providerKeyError(String key, {required bool required}) {
  if (key.isEmpty) return required ? appL10n.stateProviderKeyRequired : null;
  if (RegExp(r'^[A-Z][A-Z0-9_]*=[^=]').hasMatch(key)) return appL10n.stateProviderKeyOnly;
  final first = key[0];
  if ((first == '"' || first == "'" || first == '`') && key.length > 1 && key.endsWith(first)) {
    return appL10n.stateProviderKeyQuotes;
  }
  if (!RegExp(r'^[\x21-\x7E]+$').hasMatch(key)) return appL10n.stateProviderKeyInvalid;
  return null;
}

/// Field error for a model id typed by hand, or null.
String? modelIdError(String raw, Iterable<String> taken) {
  final id = raw.trim();
  if (id.isEmpty) return appL10n.stateProviderModelRequired;
  if (id.contains(RegExp(r'\s'))) return appL10n.stateProviderModelSpaces;
  if (taken.contains(id)) return appL10n.stateProviderAlreadyAdded;
  return null;
}

/// Lower-case ASCII letters and digits of [text], runs joined by `-`, at most
/// [max] characters: `My GW (测试) 2` → `my-gw-2`; all-Chinese text → ``.
String providerSlug(String text, {int max = 24}) {
  final words = RegExp(r'[a-z0-9]+').allMatches(text.toLowerCase()).map((m) => m.group(0)!);
  var slug = words.join('-');
  if (slug.length > max) slug = slug.substring(0, max).replaceFirst(RegExp(r'-+$'), '');
  return slug;
}

/// A fresh route id `custom-<slug>`: from the name, else the Base URL's host
/// (without `api.` / `www.` and the top-level domain), else four random
/// characters; `-2`, `-3` … when taken. Always matches
/// [providerRoutePattern].
String newProviderId({required String name, required String baseUrl, required Set<String> taken, Random? random}) {
  var slug = providerSlug(name);
  if (slug.isEmpty) {
    final host = Uri.tryParse(baseUrl)?.host ?? '';
    final labels = host.split('.').where((l) => l.isNotEmpty).toList();
    if (labels.length > 1 && !RegExp(r'^\d+$').hasMatch(labels.last)) labels.removeLast();
    if (labels.length > 1 && (labels.first == 'api' || labels.first == 'www')) labels.removeAt(0);
    slug = providerSlug(labels.join('-'));
  }
  if (slug.isEmpty) {
    final rng = random ?? Random.secure();
    const letters = 'abcdefghijkmnpqrstuvwxyz23456789';
    slug = List.generate(4, (_) => letters[rng.nextInt(letters.length)]).join();
  }
  final base = 'custom-$slug';
  var id = base;
  for (var n = 2; taken.contains(id); n++) {
    id = '$base-$n';
  }
  return id;
}

/// A token count as typed: `131072`, `128K`, `1.5M`, `200k` (K is 1000, M a
/// million, as model capacities are quoted; separators and spaces ignored).
/// Null when empty, not a count, or not a whole positive number.
int? parseTokenCount(String raw) {
  final text = raw.replaceAll(RegExp(r'[\s,_]'), '');
  final match = RegExp(r'^(\d+(?:\.\d+)?)([kKmM])?$').firstMatch(text);
  if (match == null) return null;
  final scale = switch (match.group(2)?.toLowerCase()) {
    'k' => 1000,
    'm' => 1000000,
    _ => 1,
  };
  final scaled = double.parse(match.group(1)!) * scale;
  final rounded = scaled.round();
  if ((scaled - rounded).abs() > 1e-6 || rounded <= 0) return null;
  return rounded;
}

/// Field error for a token count, or null (empty is fine: the default).
String? tokenCountError(String raw) {
  if (raw.trim().isEmpty) return null;
  return parseTokenCount(raw) == null ? appL10n.stateProviderTokenCountInvalid : null;
}

/// `262144` → `256K`, `1000000` → `1M`.
String formatTokens(int value) {
  if (value >= 1000000 && value % 1000000 == 0) return '${value ~/ 1000000}M';
  if (value >= 1048576 && value % 1048576 == 0) return '${value ~/ 1048576}M';
  if (value >= 1024 && value % 1024 == 0) return '${value ~/ 1024}K';
  if (value >= 1000 && value % 1000 == 0) return '${value ~/ 1000}K';
  return '$value';
}

// ── Errors ───────────────────────────────────────────────────────────────────

/// A failure already worded for the user.
class ProviderFailure implements Exception {
  const ProviderFailure(this.message, {this.savedId});

  final String message;

  /// The profile was written but the key was not: the form switches to
  /// editing this provider so "保存" retries just the key.
  final String? savedId;

  @override
  String toString() => message;
}

/// One short Chinese sentence for an error from the engine or the endpoint
/// behind it (`llm/discoverModels` names the URL and the HTTP status).
String describeProviderError(Object error) {
  if (error is ProviderFailure) return error.message;
  if (error is DshRemoteException) {
    final message = error.message;
    final code = error.code;
    if (code == 'settings/conflict') return appL10n.stateProviderConflict;
    if (code == 'credential/rejected') return appL10n.stateCredentialFromEnvironment;
    if (code.startsWith('gateway/') && code != 'gateway/internal') return appL10n.stateProviderUnsupported;
    final status = RegExp(r'answered (\d{3})').firstMatch(message)?.group(1);
    if (status != null) {
      return switch (int.parse(status)) {
        401 || 403 => appL10n.stateProviderKeyRejected,
        404 => appL10n.stateProviderModelsMissing,
        429 => appL10n.stateProviderRateLimited,
        >= 500 => appL10n.stateProviderServiceUnavailable(int.parse(status)),
        _ => appL10n.stateProviderServiceStatus(int.parse(status)),
      };
    }
    if (message.contains('answered with more than')) return appL10n.stateProviderResponseTooLarge;
    if (message.contains('could not reach')) return appL10n.stateProviderUnreachable;
    if (message.contains('did not answer with JSON') || message.contains('neither a "data" array')) {
      return appL10n.stateProviderModelsUnreadable;
    }
    if (message.contains('has no model listing')) return appL10n.stateProviderManualModels;
    if (message.contains('API key is blank') || message.contains('no HTTP header can carry')) {
      return appL10n.stateProviderKeyInvalid;
    }
    if (message.contains('aborted')) return appL10n.commonCancelled;
    if (message.contains('llm-pi-ai:')) return appL10n.stateProviderConfigRejected;
    return appL10n.commonFailedTryAgain;
  }
  if (engineUnreachable(error)) return appL10n.commonEngineUnreachable;
  if (error is DshHttpException) return appL10n.stateEngineHttpRejected(error.statusCode);
  return appL10n.commonFailedTryAgain;
}

// ── Providers ────────────────────────────────────────────────────────────────

/// The active engine as a [ProviderBackend]; null while not connected.
final providerBackendProvider = Provider<ProviderBackend?>((ref) {
  final conn = ref.watch(readListLiveConnectionProvider);
  if (conn == null) return null;
  return ClientProviderBackend(conn.client, isLocal: conn.isLocal, hostLabel: conn.label);
});

/// The active engine's custom providers, re-read whenever the engine says
/// the pi-ai section, a credential or the route set changed. Null while not
/// connected.
final customProvidersProvider = FutureProvider.autoDispose<ProvidersSnapshot?>((ref) async {
  final backend = ref.watch(providerBackendProvider);
  if (backend == null) return null;
  final identity = ref.watch(readListIdentityProvider);
  final cache = ref.read(readListCacheProvider);
  ProvidersSnapshot finish(ProvidersSnapshot value) {
    if (ref.mounted) {
      cache.stamp(value, identity, backend is ClientProviderBackend ? backend.client : backend);
      cache.put(readListKey(identity, ReadListKind.providers), value, () => CachedProviders(value));
    }
    return value;
  }

  final sub = backend.changes.listen((_) => ref.invalidateSelf());
  ref.onDispose(() => unawaited(sub.cancel()));

  final settings = await backend.read();
  if (settings == null) {
    return finish(ProvidersSnapshot(supported: false, local: backend.isLocal, hostLabel: backend.hostLabel));
  }
  final refs = {
    for (final p in settings.profiles)
      if (p.apiKeyEnv case final ref? when ref.isNotEmpty) ref,
  }.toList();
  // Best effort: the list still shows without them.
  final (credentials, registered, diagnostics) = await (
    refs.isEmpty
        ? Future.value(const <String, CredentialStatus>{})
        : backend.credentials(refs).catchError((Object _) => const <String, CredentialStatus>{}),
    backend.registeredRoutes().then<Set<String>?>((r) => r).catchError((Object _) => null),
    backend.diagnostics().catchError((Object _) => const <String, String>{}),
  ).wait;
  return finish(
    ProvidersSnapshot(
      supported: true,
      writable: settings.writable,
      revision: settings.revision,
      providers: [
        for (final p in settings.profiles)
          if (!isSubscriptionRoute(p, settings)) CustomProvider.fromProfile(p, removable: settings.removable(p.route)),
      ],
      credentials: credentials,
      registered: registered,
      diagnostics: diagnostics,
      local: backend.isLocal,
      hostLabel: backend.hostLabel,
    ),
  );
});

/// Display DTOs have no headers, URLs, key references or write revision.
/// The current raw snapshot remains the only edit/add authority.
final providerListViewProvider = Provider.autoDispose<ReadListView<CachedProviders>>((ref) {
  final source = ref.watch(customProvidersProvider);
  final identity = ref.watch(readListIdentityProvider);
  final backend = ref.watch(providerBackendProvider);
  final connection = ref.watch(readListLiveConnectionProvider);
  final client = backend is ClientProviderBackend ? connection?.client : backend;
  final cache = ref.watch(readListCacheProvider);
  ref.watch(readListCacheChangesProvider);
  final raw = source.value;
  final current = raw != null && cache.current(raw, identity, client);
  final ready = current && !source.isLoading && !source.hasError;
  final status = source.hasError
      ? ReadListStatus.failed
      : client == null
      ? ReadListStatus.offline
      : ReadListStatus.updating;
  // Live rows have no cache admission limits; the page uses the raw snapshot.
  if (current) {
    return ReadListView(authoritative: true, readOnly: !ready, status: ready ? ReadListStatus.current : status);
  }
  return ReadListView(
    value: cache.get<CachedProviders>(readListKey(identity, ReadListKind.providers)),
    readOnly: true,
    status: status,
  );
});

/// Writes go to the active engine (wherever the chat is pointed). Keys typed
/// while the local engine is active are also kept on the phone for
/// self-heal; keys for a remote host stay on that host only.
class ProviderActions {
  ProviderActions(this._ref);

  final Ref _ref;

  ProviderBackend get _backend =>
      _ref.read(providerBackendProvider) ?? (throw ProviderFailure(appL10n.stateProviderOffline));

  ProvidersSnapshot? get _snapshot => _ref.read(customProvidersProvider).value;

  /// Asks the endpoint for its models. An OpenAI-style Base URL without a
  /// path that answers 404 is tried once more with `/v1` appended; the URL
  /// that worked comes back with the models.
  Future<({List<DiscoveredModel> models, String baseUrl})> discover({
    required ProviderApi api,
    required String baseUrl,
    String apiKey = '',
    String? existingId,
  }) async {
    final backend = _backend;
    Future<List<DiscoveredModel>> ask(String url) =>
        backend.discover(provider: existingId, baseUrl: url, api: api, apiKey: apiKey.isEmpty ? null : apiKey);
    try {
      return (models: await ask(baseUrl), baseUrl: baseUrl);
    } on DshRemoteException catch (error) {
      final uri = Uri.tryParse(baseUrl);
      final bare = uri != null && (uri.path.isEmpty || uri.path == '/');
      final notFound = RegExp(r'answered 404').hasMatch(error.message);
      if (api == ProviderApi.anthropicMessages || !bare || !notFound) rethrow;
      final withV1 = '$baseUrl/v1';
      try {
        return (models: await ask(withV1), baseUrl: withV1);
      } catch (_) {
        throw error;
      }
    }
  }

  /// Creates (no [existing]) or updates a provider on the active engine and
  /// stores its key. The profile is written first, then the key, as the
  /// official page does; if only the key fails, the [ProviderFailure] carries
  /// the new id.
  Future<String> save(ProviderDraft draft, {CustomProvider? existing}) async {
    final backend = _backend;
    final before = _snapshot;
    _ref.read(readListCredentialEpochProvider.notifier).advance();
    final name = draft.effectiveName;
    final String id;
    final String keyRef;
    if (existing == null) {
      // Read back first: the id must not land on a route someone just added.
      final current = await backend.read();
      id = newProviderId(
        name: draft.name,
        baseUrl: draft.baseUrl,
        taken: {...?current?.profiles.map((p) => p.route), ...?before?.takenIds},
      );
      keyRef = deriveProviderKeyRef(id);
      await backend.create(
        ProviderProfile(
          route: id,
          displayName: name,
          api: draft.api.wire,
          baseUrl: draft.baseUrl,
          apiKeyEnv: draft.apiKey.isEmpty ? null : keyRef,
          models: draft.models,
        ),
      );
    } else {
      id = existing.id;
      keyRef = existing.keyRef;
      await backend.update(
        id,
        displayName: name,
        api: draft.api,
        baseUrl: draft.baseUrl,
        // A keyless route gets its reference once a key is typed.
        apiKeyEnv: existing.apiKeyEnv == null && draft.apiKey.isNotEmpty ? keyRef : null,
        models: draft.models,
        expectedRevision: before?.revision,
      );
    }
    if (draft.apiKey.isNotEmpty) {
      try {
        await backend.storeKey(keyRef, draft.apiKey);
      } catch (error) {
        throw ProviderFailure(appL10n.stateProviderKeySaveFailed(describeProviderError(error)), savedId: id);
      }
      if (backend.isLocal) {
        try {
          await _ref.read(settingsProvider.notifier).saveProviderKey(id, draft.apiKey);
        } catch (_) {
          // Only the self-heal copy is missing; the engine has the key.
        }
      }
    }
    _ref
      ..invalidate(customProvidersProvider)
      // Model edits keep the route set as it was, so the engine announces no
      // adapter change; the picker re-reads its thinking levels now.
      ..invalidate(modelCatalogProvider);
    return id;
  }

  /// Replaces one model of [provider] (matched by id) with [model]: only the
  /// `models` list is written, so nothing else of the profile changes.
  Future<void> saveModel(CustomProvider provider, ProviderModelSpec model) async {
    final backend = _backend;
    final current = _snapshot?.byId(provider.id) ?? provider;
    final revision = _snapshot?.revision;
    _ref.read(readListCredentialEpochProvider.notifier).advance();
    await backend.update(
      provider.id,
      models: [for (final m in current.models) m.id == model.id ? model : m],
      expectedRevision: revision,
    );
    _ref
      ..invalidate(customProvidersProvider)
      ..invalidate(modelCatalogProvider);
  }

  /// Removes the route and, when no other route shares it, the key it named
  /// (the official page does the same for keys it manages).
  Future<void> delete(CustomProvider provider) async {
    final backend = _backend;
    final snapshot = _snapshot;
    _ref.read(readListCredentialEpochProvider.notifier).advance();
    await backend.remove(provider.id, expectedRevision: snapshot?.revision);
    final ref = provider.apiKeyEnv;
    final shared = snapshot?.providers.any((p) => p.id != provider.id && p.apiKeyEnv == ref) ?? false;
    if (ref != null && !shared && snapshot?.credentials[ref]?.writable != false) {
      try {
        await backend.clearKey(ref);
      } catch (_) {
        // The route is gone; a leftover credential is harmless.
      }
    }
    if (backend.isLocal) {
      try {
        await _ref.read(settingsProvider.notifier).removeProviderKey(provider.id);
      } catch (_) {}
    }
    _ref
      ..invalidate(customProvidersProvider)
      ..invalidate(modelCatalogProvider);
  }

  /// A cheap health check: the endpoint's model listing with the stored key
  /// (`GET /models`, no tokens spent). Returns how many models it lists.
  Future<int> test(CustomProvider provider) async {
    final models = await _backend.discover(provider: provider.id, baseUrl: provider.baseUrl, api: provider.api);
    return models.length;
  }
}

final providerActionsProvider = Provider<ProviderActions>(ProviderActions.new);
