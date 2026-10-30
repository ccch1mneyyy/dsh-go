/// Subscription sign-in (ChatGPT, Claude, Grok) through dsh-app's engine-side auth
/// bridge (`@dsh-app/auth`, service `appAuth`).
///
/// DSH 0.2.1 already carries both sign-in flows: the built-in `llm-pi-ai`
/// adapter registers one authorization flow per pi-ai provider that has a
/// login (`llm-pi-ai/openai-codex`, `llm-pi-ai/anthropic`) and stores the
/// grant in the local credential store. It does not expose "begin a sign-in"
/// to clients, so the bridge does that and turns the flow's interaction into
/// a small polled state machine:
///
/// ```
/// beginLogin → attemptId
/// pollLogin(attemptId) → starting → open | device | prompt → done | failed
///                                    (answerLogin for prompt)  cancelled
/// ```
///
/// Polling (not a stream) so it works the same over every carrier. Once an
/// attempt is `done`, the bridge has also declared the route
/// (`llm-pi-ai.providers.<id>`) so its models show up in the catalog;
/// [DshSubscriptions.signOut] deletes the grant and keeps the route settings.
library;

import 'json.dart';
import 'session_api.dart';

/// A subscription the bridge can sign in to.
enum Subscription {
  chatgpt('openai-codex'),
  claude('anthropic'),
  grok('xai');

  const Subscription(this.wire);

  /// The pi-ai provider id (and `llm-pi-ai` route id).
  final String wire;

  static Subscription? fromWire(String? wire) {
    for (final s in values) {
      if (s.wire == wire) return s;
    }
    return null;
  }
}

/// Sign-in state of one subscription.
class SubscriptionStatus {
  const SubscriptionStatus({required this.subscription, required this.signedIn, this.account});

  factory SubscriptionStatus.fromJson(Subscription subscription, Map<String, Object?> json) => SubscriptionStatus(
    subscription: subscription,
    signedIn: json['signedIn'] == true,
    account: asString(json['account']),
  );

  final Subscription subscription;
  final bool signedIn;

  /// Who is signed in (an email or plan name), when the grant says.
  final String? account;
}

/// Where a sign-in attempt is.
enum LoginPhase {
  /// The bridge is starting the flow.
  starting,

  /// Open [LoginStep.url] in a browser; the engine catches the callback.
  open,

  /// Show [LoginStep.userCode]; the person enters it at [LoginStep.url].
  device,

  /// The flow asks for text (a pasted code or redirect URL):
  /// [LoginStep.message], answered with [DshSubscriptions.answerLogin].
  prompt,
  done,
  failed,
  cancelled;

  static LoginPhase fromWire(String? wire) {
    for (final p in values) {
      if (p.name == wire) return p;
    }
    return LoginPhase.failed;
  }

  bool get finished => this == done || this == failed || this == cancelled;
}

/// One poll of a sign-in attempt.
class LoginStep {
  const LoginStep({required this.phase, this.url, this.userCode, this.message, this.placeholder, this.error});

  factory LoginStep.fromJson(Map<String, Object?> json) => LoginStep(
    phase: LoginPhase.fromWire(asString(json['phase'])),
    url: asString(json['url']),
    userCode: asString(json['userCode']),
    message: asString(json['message']),
    placeholder: asString(json['placeholder']),
    error: asString(json['error']),
  );

  final LoginPhase phase;
  final String? url;
  final String? userCode;
  final String? message;
  final String? placeholder;
  final String? error;
}

extension DshSubscriptions on DshClient {
  /// `appAuth/list`: every subscription the bridge knows, signed in or not.
  /// Throws `remote/unknown-method` (or similar) when the bridge is absent.
  Future<List<SubscriptionStatus>> subscriptions() async {
    final result = asMap(await rpc.call('appAuth/list')) ?? const {};
    return [
      for (final entry in asListOrEmpty(result['providers']))
        if (asMap(entry) case final map?)
          if (Subscription.fromWire(asString(map['id'])) case final s?) SubscriptionStatus.fromJson(s, map),
    ];
  }

  /// `appAuth/begin`: starts a sign-in; returns the attempt id to poll.
  Future<String> beginLogin(Subscription subscription) async {
    final result = asMap(await rpc.call('appAuth/begin', {'provider': subscription.wire})) ?? const {};
    final id = asString(result['attemptId']);
    if (id == null) throw const FormatException('appAuth/begin: no attemptId');
    return id;
  }

  /// `appAuth/poll`: the attempt's current step.
  Future<LoginStep> pollLogin(String attemptId) async =>
      LoginStep.fromJson(asMap(await rpc.call('appAuth/poll', {'attemptId': attemptId})) ?? const {});

  /// `appAuth/answer`: replies to a [LoginPhase.prompt].
  Future<void> answerLogin(String attemptId, String value) =>
      rpc.call('appAuth/answer', {'attemptId': attemptId, 'value': value});

  /// `appAuth/cancel`: abandons an attempt (no-op once finished).
  Future<void> cancelLogin(String attemptId) => rpc.call('appAuth/cancel', {'attemptId': attemptId});

  /// `appAuth/signOut`: deletes the grant, preserving the route settings.
  Future<void> signOut(Subscription subscription) => rpc.call('appAuth/signOut', {'provider': subscription.wire});
}
