/// Custom model providers: hand-declared routes of the built-in `llm-pi-ai`
/// adapter (an OpenAI- or Anthropic-compatible endpoint, a key, a model list).
///
/// The adapter is mounted dormant by the base bundle and registers one route
/// per entry of its settings section's `providers` dict; the section is
/// runtime-editable (`volatile`), so a write takes effect on the next request
/// with no restart. This mirrors what the official web Models page does
/// (`@deepseek-ai/dsh-client-ui-settings-models`, `CustomProviderCard`):
///
/// * the profile goes through `settings/mutate` at `providers.<route>`, naming
///   its key by reference (`apiKeyEnv`), never by value;
/// * the key itself goes through `credentials/set` under that reference
///   ([DshClient.setProviderKey] with `ref:`);
/// * `llm/discoverModels` asks a draft endpoint for its models without
///   storing anything.
///
/// Verified against DSH 0.2.1-rc.2 (`dsh-llm-pi-ai` `Config`, `dsh-llm`
/// typert remote client, `dsh-api-settings-controller` typings).
library;

import 'background_session_read.dart';
import 'features_api.dart';
import 'json.dart';
import 'session_api.dart';

/// Settings namespace (Loader entry id) of the pi-ai adapter.
const String piAiSettingsNs = 'llm-pi-ai';

/// Wire protocols a hand-declared route may name (`supportedProtocols()` of
/// `dsh-llm-pi-ai`, most-reached first).
enum ProviderApi {
  openaiCompletions('openai-completions'),
  openaiResponses('openai-responses'),
  anthropicMessages('anthropic-messages');

  const ProviderApi(this.wire);

  final String wire;

  static ProviderApi? fromWire(String? wire) {
    for (final api in values) {
      if (api.wire == wire) return api;
    }
    return null;
  }
}

/// A route id usable both as a settings key and as the stem of a credential
/// reference (the official page's `ROUTE_PATTERN`): lower-case, starts with a
/// letter, single hyphens.
final RegExp providerRoutePattern = RegExp(r'^[a-z][a-z0-9]*(?:-[a-z0-9]+)*$');

/// The credential reference the official page derives for [route]
/// (`deriveKeyRef`): `custom-my-gw` → `CUSTOM_MY_GW_API_KEY`.
String deriveProviderKeyRef(String route) => '${route.toUpperCase().replaceAll(RegExp(r'[^A-Z0-9]+'), '_')}_API_KEY';

/// Context window the adapter assumes for a model nothing sizes
/// (`DEFAULT_CONTEXT_WINDOW`); a route may change it (`defaultContextWindow`).
const int piAiDefaultContextWindow = 262144;

/// Output capability the adapter assumes for a model nothing sizes
/// (`DEFAULT_MAX_TOKENS`); a route may change it (`defaultMaxTokens`).
const int piAiDefaultMaxTokens = 32768;

/// Every thinking level a model entry may offer, in escalation order
/// (`THINKING_LEVELS` of `dsh-llm-pi-ai`). They are also the effort ids the
/// model catalog (`session/modelCatalog`) lists for such a model.
const List<String> piAiThinkingLevels = ['off', 'minimal', 'low', 'medium', 'high', 'xhigh', 'max'];

/// One entry of a profile's `models` list. Fields this client does not model
/// (`compat`, …) ride along in [extra] so an edit writes them back untouched;
/// so does `reasoningEfforts`, read through [reasoningEfforts] and replaced
/// with [withReasoningEfforts].
class ProviderModelSpec {
  const ProviderModelSpec({
    required this.id,
    this.name,
    this.contextWindow,
    this.maxTokens,
    this.input,
    this.extra = const {},
  });

  static ProviderModelSpec? fromJson(Object? json) {
    final map = asMap(json);
    final id = asString(map?['id'])?.trim();
    if (map == null || id == null || id.isEmpty) return null;
    final input = asList(map['input']);
    return ProviderModelSpec(
      id: id,
      name: asString(map['name']),
      contextWindow: asInt(map['contextWindow']),
      maxTokens: asInt(map['maxTokens']),
      input: input?.whereType<String>().toList(growable: false),
      extra: {
        for (final entry in map.entries)
          if (!_modelFields.contains(entry.key)) entry.key: entry.value,
      },
    );
  }

  static const _modelFields = {'id', 'name', 'contextWindow', 'maxTokens', 'input'};

  final String id;

  /// Picker label; the adapter falls back to [id].
  final String? name;
  final int? contextWindow;
  final int? maxTokens;

  /// `text` / `image`; absent means text only.
  final List<String>? input;
  final Map<String, Object?> extra;

  String get label => (name == null || name!.trim().isEmpty) ? id : name!;

  /// `reasoningEfforts`: each thinking level the model offers, with the value
  /// sent for it (the level's own name unless configured otherwise; null only
  /// for `off`, which sends nothing). Null when the entry offers none, i.e.
  /// the field is absent, `false` (a non-reasoning model) or unreadable: a
  /// hand-declared model then does not think.
  Map<String, String?>? get reasoningEfforts {
    final raw = extra['reasoningEfforts'];
    if (raw is! Map) return null;
    final levels = <String, String?>{};
    for (final MapEntry(:key, :value) in raw.entries) {
      if (key is! String || (value != null && value is! String)) return null;
      levels[key] = value as String?;
    }
    return levels;
  }

  /// The levels [reasoningEfforts] offers, in escalation order; empty when
  /// the model does not think. A level the adapter does not know is left out.
  List<String> get thinkingLevels {
    final efforts = reasoningEfforts;
    if (efforts == null) return const [];
    return [
      for (final level in piAiThinkingLevels)
        if (efforts.containsKey(level)) level,
    ];
  }

  /// Offers a thinking level beyond `off` (the adapter refuses a dict that
  /// does not).
  bool get thinks => thinkingLevels.any((level) => level != 'off');

  /// Whether the model takes images, given the route's `defaultInput` for an
  /// entry that declares no input (absent and empty mean the same).
  bool acceptsImages({List<String> routeDefault = const ['text']}) =>
      (input == null || input!.isEmpty ? routeDefault : input!).contains('image');

  /// This entry with [levels] as its `reasoningEfforts`, in escalation order.
  /// A level kept from before keeps its configured value; a new one sends
  /// its own name, `off` nothing. Empty or null declares no levels: the
  /// field is dropped (a hand-declared model then does not think) unless it
  /// was an explicit `false`, which stays.
  ProviderModelSpec withReasoningEfforts(Iterable<String>? levels) {
    final before = reasoningEfforts ?? const <String, String?>{};
    final wanted = {...?levels};
    final next = {...extra};
    if (wanted.isEmpty) {
      if (next['reasoningEfforts'] != false) next.remove('reasoningEfforts');
    } else {
      next['reasoningEfforts'] = <String, String?>{
        for (final level in piAiThinkingLevels)
          if (wanted.contains(level))
            level: before.containsKey(level) && (before[level] != null || level == 'off')
                ? before[level]
                : (level == 'off' ? null : level),
      };
    }
    return ProviderModelSpec(
      id: id,
      name: name,
      contextWindow: contextWindow,
      maxTokens: maxTokens,
      input: input,
      extra: next,
    );
  }

  Map<String, Object?> toJson() => {
    ...extra,
    'id': id,
    if (name != null && name!.isNotEmpty) 'name': name,
    'contextWindow': ?contextWindow,
    'maxTokens': ?maxTokens,
    'input': ?input,
  };
}

/// One `providers.<route>` profile of the pi-ai section.
class ProviderProfile {
  const ProviderProfile({
    required this.route,
    this.displayName,
    this.api,
    this.baseUrl,
    this.apiKeyEnv,
    this.models = const [],
    this.headers = const {},
    this.defaultContextWindow,
    this.defaultMaxTokens,
    this.defaultInput,
  });

  factory ProviderProfile.fromJson(String route, Object? json) {
    final map = asMapOrEmpty(json);
    final headers = asMapOrEmpty(map['headers']);
    return ProviderProfile(
      route: route,
      displayName: asString(map['displayName']),
      api: asString(map['api']),
      baseUrl: asString(map['baseURL']),
      apiKeyEnv: asString(map['apiKeyEnv']),
      models: [for (final m in asListOrEmpty(map['models'])) ?ProviderModelSpec.fromJson(m)],
      headers: {
        for (final entry in headers.entries)
          if (entry.value is String) entry.key: entry.value as String,
      },
      defaultContextWindow: asInt(map['defaultContextWindow']),
      defaultMaxTokens: asInt(map['defaultMaxTokens']),
      defaultInput: asList(map['defaultInput'])?.whereType<String>().toList(growable: false),
    );
  }

  final String route;
  final String? displayName;

  /// Raw wire protocol; see [protocol].
  final String? api;
  final String? baseUrl;

  /// Credential reference the key is stored under (a name, not the key).
  final String? apiKeyEnv;
  final List<ProviderModelSpec> models;
  final Map<String, String> headers;

  /// What the route assumes for a model that does not say (read back with
  /// the schema's defaults filled in; null on a profile built here). Not
  /// edited by this client.
  final int? defaultContextWindow;
  final int? defaultMaxTokens;
  final List<String>? defaultInput;

  ProviderApi? get protocol => ProviderApi.fromWire(api);

  String get label => (displayName == null || displayName!.trim().isEmpty) ? route : displayName!;

  /// Endpoint, protocol and models are all declared here (the shape a route
  /// pi-ai ships nothing about must have), so a form can edit it whole.
  bool get handDeclared => protocol != null && (baseUrl?.isNotEmpty ?? false) && models.isNotEmpty;

  /// The whole profile, for a create. Edits go field by field
  /// ([ProvidersApi.updateProvider]) so fields this client does not model
  /// survive.
  Map<String, Object?> toJson() => {
    if (displayName != null && displayName!.isNotEmpty) 'displayName': displayName,
    'api': ?api,
    'baseURL': ?baseUrl,
    'apiKeyEnv': ?apiKeyEnv,
    'models': [for (final m in models) m.toJson()],
    if (headers.isNotEmpty) 'headers': headers,
    'defaultContextWindow': ?defaultContextWindow,
    'defaultMaxTokens': ?defaultMaxTokens,
    'defaultInput': ?defaultInput,
  };
}

/// The pi-ai section as read back from the Host.
class ProviderSettings {
  const ProviderSettings({
    required this.profiles,
    required this.revision,
    this.writable = true,
    this.userRoutes = const {},
    this.baseRoutes = const {},
    this.displayNameOnlyRoutes = const {},
  });

  factory ProviderSettings.fromSection(SettingsSection section) {
    Set<String> routes(Map<String, Object?>? layer) => asMapOrEmpty(layer?['providers']).keys.toSet();
    final providers = asMapOrEmpty(section.value['providers']);
    bool displayNameOnly(String route) {
      final base = asMap(asMapOrEmpty(section.base?['providers'])[route]);
      final user = asMap(asMapOrEmpty(section.user?['providers'])[route]);
      return (base != null || user != null) &&
          {...?base?.keys, ...?user?.keys}.every((field) => field == 'displayName');
    }

    return ProviderSettings(
      profiles: [for (final entry in providers.entries) ProviderProfile.fromJson(entry.key, entry.value)],
      revision: section.revision,
      writable: section.writable,
      userRoutes: routes(section.user),
      baseRoutes: routes(section.base),
      displayNameOnlyRoutes: {
        for (final route in providers.keys)
          if (displayNameOnly(route)) route,
      },
    );
  }

  final List<ProviderProfile> profiles;
  final int revision;
  final bool writable;

  /// Routes the user layer declares.
  final Set<String> userRoutes;

  /// Routes the composition base declares (a home patch): removing the user
  /// layer brings those back.
  final Set<String> baseRoutes;

  /// Routes with no declared settings beyond a display name. Inspect both
  /// layers so schema defaults and unmodelled custom fields do not mislead UI.
  /// This describes configuration shape, not who created the route.
  final Set<String> displayNameOnlyRoutes;

  ProviderProfile? byRoute(String route) {
    for (final p in profiles) {
      if (p.route == route) return p;
    }
    return null;
  }

  /// Deleting [route] actually removes it (the official page's `removable`).
  bool removable(String route) => userRoutes.contains(route) && !baseRoutes.contains(route);
}

/// One `llm/discoverModels` candidate: metadata the endpoint advertised, for
/// the user to adopt. Nothing is stored.
class DiscoveredModel {
  const DiscoveredModel({required this.id, this.name, this.contextWindow, this.maxTokens, this.inputModalities});

  static DiscoveredModel? fromJson(Object? json) {
    final map = asMap(json);
    final id = asString(map?['id']);
    if (map == null || id == null || id.isEmpty) return null;
    final input = asList(map['inputModalities']);
    return DiscoveredModel(
      id: id,
      name: asString(map['name']),
      contextWindow: asInt(map['contextWindow']),
      maxTokens: asInt(map['maxTokens']),
      inputModalities: input?.whereType<String>().toList(growable: false),
    );
  }

  final String id;
  final String? name;
  final int? contextWindow;
  final int? maxTokens;
  final List<String>? inputModalities;

  /// As a `models` entry (the official page's `adopt`). A name equal to the
  /// id adds nothing and is dropped.
  ProviderModelSpec toSpec() => ProviderModelSpec(
    id: id,
    name: name == null || name == id ? null : name,
    contextWindow: contextWindow,
    maxTokens: maxTokens,
    input: inputModalities,
  );
}

/// One `llm/listConfigurableProviders` entry.
class ConfigurableProvider {
  const ConfigurableProvider({
    required this.provider,
    required this.displayName,
    required this.settingsNs,
    this.settingsPath = const [],
    this.declared,
    this.defaultBaseUrl,
    this.error,
  });

  static ConfigurableProvider? fromJson(Object? json) {
    final map = asMap(json);
    final provider = asString(map?['provider']);
    if (map == null || provider == null) return null;
    return ConfigurableProvider(
      provider: provider,
      displayName: asString(map['displayName']) ?? provider,
      settingsNs: asString(map['settingsNs']) ?? '',
      settingsPath: asStringList(map['settingsPath']),
      declared: asBool(map['declared']),
      defaultBaseUrl: asString(map['defaultBaseURL']),
      error: asString(map['error']),
    );
  }

  final String provider;
  final String displayName;
  final String settingsNs;
  final List<String> settingsPath;

  /// The adapter knows this route only because configuration declared it.
  final bool? declared;
  final String? defaultBaseUrl;

  /// Configuration diagnostic for repair (the route may still serve some
  /// models).
  final String? error;
}

extension ProvidersApi on DshClient {
  /// The pi-ai section (`settings/describe`); null when the Host does not
  /// mount the adapter.
  Future<ProviderSettings?> providerSettings() async {
    final read = tryBackgroundListRead(BackgroundListKind.providerSettings);
    if (read != null) return (await read) as ProviderSettings?;
    final section = await settingsSection(piAiSettingsNs);
    return section == null ? null : ProviderSettings.fromSection(section);
  }

  /// Writes the whole [profile] at `providers.<route>` (create or replace).
  /// The Host validates a new or changed profile before persisting it: a
  /// route pi-ai does not ship needs `api`, `baseURL` and at least one model.
  Future<ProviderSettings> saveProvider(ProviderProfile profile, {int? expectedRevision}) async {
    _checkRoute(profile.route);
    final section = await mutateSettings(piAiSettingsNs, [
      SettingsOp.set(['providers', profile.route], profile.toJson()),
    ], expectedRevision: expectedRevision);
    return ProviderSettings.fromSection(section);
  }

  /// Sets only the given fields of an existing profile, in one atomic write,
  /// so fields this client does not model (`compat`, `headers`, retry policy)
  /// stay as they are. [models] replaces the whole list.
  Future<ProviderSettings> updateProvider(
    String route, {
    String? displayName,
    ProviderApi? api,
    String? baseUrl,
    String? apiKeyEnv,
    List<ProviderModelSpec>? models,
    int? expectedRevision,
  }) async {
    _checkRoute(route);
    List<String> at(String field) => ['providers', route, field];
    final ops = [
      if (displayName != null) SettingsOp.set(at('displayName'), displayName),
      if (api != null) SettingsOp.set(at('api'), api.wire),
      if (baseUrl != null) SettingsOp.set(at('baseURL'), baseUrl),
      if (apiKeyEnv != null) SettingsOp.set(at('apiKeyEnv'), apiKeyEnv),
      if (models != null) SettingsOp.set(at('models'), [for (final m in models) m.toJson()]),
    ];
    if (ops.isEmpty) throw ArgumentError('nothing to update');
    final section = await mutateSettings(piAiSettingsNs, ops, expectedRevision: expectedRevision);
    return ProviderSettings.fromSection(section);
  }

  /// Removes `providers.<route>`; the route unregisters on the next request.
  /// The credential it named stays (see [DshClient.clearProviderKey]).
  Future<ProviderSettings> removeProvider(String route, {int? expectedRevision}) async {
    _checkRoute(route);
    final section = await mutateSettings(piAiSettingsNs, [
      SettingsOp.unset(['providers', route]),
    ], expectedRevision: expectedRevision);
    return ProviderSettings.fromSection(section);
  }

  /// `llm/discoverModels`: the models an endpoint advertises, in its order.
  ///
  /// For a draft, pass [baseUrl], [api] and the typed [apiKey] (used for this
  /// request only). For a configured route, pass [provider] and leave
  /// [apiKey] out: the Host then uses the stored credential and the profile's
  /// headers. OpenAI-style protocols read `GET {baseURL}/models`, Anthropic
  /// `GET /v1/models` (with or without a trailing `/v1`). Fails with a
  /// [DshRemoteException] whose message names the URL and the HTTP status.
  Future<List<DiscoveredModel>> discoverModels({
    String settingsNs = piAiSettingsNs,
    String? provider,
    String? baseUrl,
    ProviderApi? api,
    String? apiKey,
    Duration timeout = const Duration(seconds: 30),
  }) async {
    final value = await rpc.call('llm/discoverModels', {
      'settingsNs': settingsNs,
      'request': {'provider': ?provider, 'baseURL': ?baseUrl, 'api': ?api?.wire, 'apiKey': ?apiKey},
    }, timeout);
    return [for (final m in asListOrEmpty(value)) ?DiscoveredModel.fromJson(m)];
  }

  /// `llm/listConfigurableProviders`: every declared provider, registered or
  /// dormant, with configuration diagnostics.
  Future<List<ConfigurableProvider>> listConfigurableProviders() async {
    final read = tryBackgroundListRead(BackgroundListKind.configurableProviders);
    if (read != null) return (await read) as List<ConfigurableProvider>;
    return [
      for (final p in asListOrEmpty(await rpc.call('llm/listConfigurableProviders'))) ?ConfigurableProvider.fromJson(p),
    ];
  }

  static void _checkRoute(String route) {
    if (!providerRoutePattern.hasMatch(route)) {
      throw ArgumentError.value(
        route,
        'route',
        'lower-case letters, digits and single hyphens, starting with a letter',
      );
    }
  }
}
