import 'dart:async';

import 'package:dsh_client/dsh_client.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'read_list_cache.dart';
import 'read_list_identity.dart';
import 'settings_state.dart';

/// `session/modelCatalog` of the active host (null while disconnected).
///
/// DSH 0.2.1 lists no models until a provider credential exists, so the
/// catalog is re-read when the key saved in the app changes and again when
/// the Host confirms the credential (`credentials/reference-updated`) or its
/// adapters change (`llm/adapters-updated`): the app pushes the key to DSH
/// asynchronously, and the first re-read can beat it. A custom provider's
/// model edits (thinking levels, names) change no route, so the pi-ai
/// section's own update counts too.
final modelCatalogProvider = FutureProvider<ModelCatalog?>((ref) async {
  final conn = ref.watch(readListLiveConnectionProvider);
  if (conn == null) return null;
  final identity = ref.watch(readListIdentityProvider);
  final cache = ref.read(readListCacheProvider);
  ref.watch(settingsProvider.select((s) => s.apiKey));
  final sub = conn.client.hostEvents.listen((event) {
    final refresh = switch (event) {
      CredentialUpdatedEvent() || HostReadyEvent() => true,
      SettingsUpdatedEvent(:final namespace) => namespace == piAiSettingsNs,
      UnknownHostEvent(:final event) => event == 'llm/adapters-updated',
      _ => false,
    };
    if (refresh) ref.invalidateSelf();
  });
  ref.onDispose(() => unawaited(sub.cancel()));
  final catalog = await conn.client.listModels();
  if (ref.mounted) {
    cache.stamp(catalog, identity, conn.client);
    cache.put(readListKey(identity, ReadListKind.models), catalog, () => CachedModels(catalog));
  }
  return catalog;
});

/// A stale catalog is for browsing only; model selection still needs the
/// current provider's successful authoritative response.
final modelListViewProvider = Provider.autoDispose<ReadListView<ModelCatalog>>((ref) {
  final source = ref.watch(modelCatalogProvider);
  final identity = ref.watch(readListIdentityProvider);
  final connection = ref.watch(readListLiveConnectionProvider);
  final cache = ref.watch(readListCacheProvider);
  ref.watch(readListCacheChangesProvider);
  final raw = source.value;
  final status = source.hasError
      ? ReadListStatus.failed
      : connection == null
      ? ReadListStatus.offline
      : ReadListStatus.updating;
  if (raw != null && cache.current(raw, identity, connection?.client)) {
    final ready = !source.isLoading && !source.hasError;
    return ReadListView(value: raw, readOnly: !ready, status: ready ? ReadListStatus.current : status);
  }
  return ReadListView(
    value: cache.get<CachedModels>(readListKey(identity, ReadListKind.models))?.value,
    readOnly: true,
    status: status,
  );
});

/// Model picked on the new-chat screen before a session exists. Applied to the
/// session right after it is created, then cleared.
class PendingModelController extends Notifier<ModelSelection?> {
  @override
  ModelSelection? build() => null;

  void select(ModelSelection? selection) => state = selection;
}

final pendingModelProvider = NotifierProvider<PendingModelController, ModelSelection?>(PendingModelController.new);

/// Catalog entry for the exact provider/model route in [selection].
/// A same-named model on another provider is not the active selection.
ModelInfo? findModel(ModelCatalog? catalog, ModelSelection? selection) {
  if (catalog == null || selection == null) return null;
  for (final model in catalog.models) {
    if (model.provider == selection.provider && model.id == selection.model) {
      return model;
    }
  }
  return null;
}

/// [selection] with a reasoning effort the model does not offer dropped.
///
/// The Host keeps a session's selection when the provider edits that model
/// (for example, thinking switched off removes every level). DSH then refuses
/// the stale effort as `UNSUPPORTED_REASONING_EFFORT` — including `off`, which
/// is an explicit level, not "none" — because the model now lists no efforts
/// at all. A selection naming an unknown route is left alone: the Host decides
/// whether that pair is routable.
ModelSelection normalizeModelSelection(ModelCatalog? catalog, ModelSelection selection) {
  final model = findModel(catalog, selection);
  final effort = selection.reasoningEffort;
  if (model == null || effort == null || model.efforts.any((entry) => entry.id == effort)) {
    return selection;
  }
  return ModelSelection(provider: selection.provider, model: selection.model);
}

/// The effort [model] starts at when it is picked: the engine's own default
/// when the model names one (DeepSeek: 高), else 中, else its lowest level
/// that thinks, else the first. A custom provider's models name no default
/// (the adapter only knows a route-wide one), and the engine runs a selection
/// without an effort as not thinking: so picking one must say which.
String? startingEffort(ModelInfo model) {
  final ids = [for (final e in model.efforts) e.id];
  if (ids.isEmpty) return null;
  if (model.defaultEffort case final effort? when ids.contains(effort)) return effort;
  if (ids.contains('medium')) return 'medium';
  for (final id in ids) {
    if (id != 'off' && id != 'none') return id;
  }
  return ids.first;
}
