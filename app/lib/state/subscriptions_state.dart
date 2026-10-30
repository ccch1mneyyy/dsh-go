import 'dart:async';

import 'package:dsh_client/dsh_client.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../l10n/l10n.dart';
import 'connection_state.dart';
import 'models_state.dart';
import 'providers_state.dart';
import 'read_list_epoch.dart';

export 'package:dsh_client/dsh_client.dart' show LoginPhase, LoginStep, Subscription, SubscriptionStatus;

/// 订阅在界面上的名字。
String subscriptionLabel(Subscription s) => switch (s) {
  Subscription.chatgpt => 'ChatGPT',
  Subscription.claude => 'Claude',
  Subscription.grok => 'Grok',
};

/// One short line for a failure of the bridge itself (not of the provider's
/// own flow, whose `error` is shown as it comes).
String describeLoginError(Object error) {
  if (error is DshRemoteException) {
    final code = error.code;
    if (code.startsWith('gateway/') && code != 'gateway/internal') return appL10n.stateSubscriptionUnsupported;
    if (error.message.contains('could not reach') || error.message.contains('fetch failed')) {
      return appL10n.stateSubscriptionUnreachable;
    }
    return appL10n.stateSubscriptionSignInFailed;
  }
  if (error is DshTransportException || error is TimeoutException) return appL10n.stateSubscriptionTimeout;
  if (error is DshCarrierLostException || error is DshClosedException) return appL10n.stateSubscriptionDisconnected;
  return describeProviderError(error);
}

/// The sign-in bridge (`appAuth/*`) of one engine, as a seam the tests fake.
abstract class SubscriptionBackend {
  Future<List<SubscriptionStatus>> list();

  Future<String> begin(Subscription subscription);

  Future<LoginStep> poll(String attemptId);

  Future<void> answer(String attemptId, String value);

  Future<void> cancel(String attemptId);

  Future<void> signOut(Subscription subscription);
}

class ClientSubscriptionBackend implements SubscriptionBackend {
  ClientSubscriptionBackend(this.client);

  final DshClient client;

  @override
  Future<List<SubscriptionStatus>> list() => client.subscriptions();

  @override
  Future<String> begin(Subscription subscription) => client.beginLogin(subscription);

  @override
  Future<LoginStep> poll(String attemptId) => client.pollLogin(attemptId);

  @override
  Future<void> answer(String attemptId, String value) => client.answerLogin(attemptId, value);

  @override
  Future<void> cancel(String attemptId) => client.cancelLogin(attemptId);

  @override
  Future<void> signOut(Subscription subscription) => client.signOut(subscription);
}

/// The active engine's sign-in bridge; null while not connected.
final subscriptionBackendProvider = Provider<SubscriptionBackend?>((ref) {
  final conn = ref.watch(activeConnectionProvider).value;
  return conn == null ? null : ClientSubscriptionBackend(conn.client);
});

/// What the bridge reports. [available] is false when it does not answer
/// (an engine without the bridge): the rows are then left out.
class SubscriptionsSnapshot {
  const SubscriptionsSnapshot({required this.available, this.statuses = const []});

  final bool available;

  /// In the bridge's order.
  final List<SubscriptionStatus> statuses;

  SubscriptionStatus? of(Subscription s) {
    for (final status in statuses) {
      if (status.subscription == s) return status;
    }
    return null;
  }
}

/// Re-read on the same engine events as the custom providers (a sign-in
/// writes a credential record and declares a route). Null while not connected.
final subscriptionsProvider = FutureProvider.autoDispose<SubscriptionsSnapshot?>((ref) async {
  final backend = ref.watch(subscriptionBackendProvider);
  if (backend == null) return null;
  final changes = ref.watch(providerBackendProvider)?.changes;
  final sub = changes?.listen((_) => ref.invalidateSelf());
  ref.onDispose(() => unawaited(sub?.cancel()));
  try {
    return SubscriptionsSnapshot(available: true, statuses: await backend.list());
  } catch (_) {
    return const SubscriptionsSnapshot(available: false);
  }
});

/// After a sign-in or sign-out: the model list and both rows, now.
void refreshAfterSubscriptionChange(WidgetRef ref) {
  ref.read(readListCredentialEpochProvider.notifier).advance();
  ref.invalidate(subscriptionsProvider);
  ref.invalidate(customProvidersProvider);
  ref.invalidate(modelCatalogProvider);
}

/// One sign-in attempt, polled about once a second while its sheet is open.
///
/// ```
/// start → begin → poll … open | device | prompt … → done | failed | cancelled
/// ```
///
/// [close] stops polling and cancels an attempt that has not finished.
class LoginSession extends ChangeNotifier {
  LoginSession(this.backend, this.subscription, {this.interval = const Duration(seconds: 1)});

  final SubscriptionBackend backend;
  final Subscription subscription;
  final Duration interval;

  LoginStep _step = const LoginStep(phase: LoginPhase.starting);
  LoginStep get step => _step;

  String? _attemptId;
  Timer? _timer;
  bool _closed = false;
  bool _answering = false;
  int _misses = 0;

  /// An answer to a prompt is on its way.
  bool get answering => _answering;

  /// Polls that failed in a row before the attempt is given up.
  static const maxMisses = 3;

  void _set(LoginStep step) {
    if (_closed) return;
    _step = step;
    notifyListeners();
  }

  Future<void> start() async {
    _timer?.cancel();
    final previous = _attemptId;
    _attemptId = null;
    _misses = 0;
    if (previous != null && !_step.phase.finished) unawaited(backend.cancel(previous).catchError((_) {}));
    _set(const LoginStep(phase: LoginPhase.starting));
    try {
      final id = await backend.begin(subscription);
      if (_closed) {
        unawaited(backend.cancel(id).catchError((_) {}));
        return;
      }
      _attemptId = id;
    } catch (error) {
      _set(LoginStep(phase: LoginPhase.failed, error: describeLoginError(error)));
      return;
    }
    await _poll();
  }

  Future<void> _poll() async {
    final id = _attemptId;
    if (_closed || id == null) return;
    try {
      final next = await backend.poll(id);
      if (_closed || id != _attemptId) return;
      _misses = 0;
      _set(next);
      if (next.phase.finished) return;
    } catch (error) {
      if (_closed || id != _attemptId) return;
      if (++_misses >= maxMisses) {
        _set(LoginStep(phase: LoginPhase.failed, error: describeLoginError(error)));
        return;
      }
    }
    _timer = Timer(interval, () => unawaited(_poll()));
  }

  /// Replies to a [LoginPhase.prompt], then polls right away.
  Future<void> answer(String value) async {
    final id = _attemptId;
    if (id == null || _answering) return;
    _answering = true;
    notifyListeners();
    try {
      await backend.answer(id, value);
    } catch (error) {
      _answering = false;
      _set(LoginStep(phase: LoginPhase.failed, error: describeLoginError(error)));
      return;
    }
    _answering = false;
    if (_closed) return;
    notifyListeners();
    _timer?.cancel();
    await _poll();
  }

  /// Stops polling; an unfinished attempt is cancelled on the engine.
  void close() {
    if (_closed) return;
    _closed = true;
    _timer?.cancel();
    final id = _attemptId;
    if (id != null && !_step.phase.finished) unawaited(backend.cancel(id).catchError((_) {}));
  }

  @override
  void dispose() {
    close();
    super.dispose();
  }
}
