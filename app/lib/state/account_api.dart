/// Thin client for the Host-owned DeepSeek account service (`account/*` Remote
/// namespace, `@deepseek-ai/dsh-api-account-controller`, DSH 0.2.1-rc.2).
///
/// The Host owns PKCE, the `/oauth/callback` route on its webserver, the
/// credential store and the `deepseek-account` model route. This client only
/// starts/cancels attempts, follows the state stream and reads display-safe
/// profile and wallet data; tokens never reach the app.
///
/// Wire (unary `POST /api/account/<method>`, stream on `/api/remote.mux`):
/// ```text
/// account/getState                                  -> AccountView
/// account/watch            (stream, args {})        -> AccountView, AccountView, ...
/// account/startSignIn      {client, callbackOrigin, loginSource} -> AccountView
/// account/cancelSignIn     {attemptId}              -> AccountView
/// account/signOut          {client}                 -> AccountView
/// account/getProfile       {client}                 -> {status:'ready', value:{id,name,contact,avatarUrl}} | {status:'failed'} | null
/// account/getBalance       {client}                 -> {status:'ready', value:[wallet], bonusWallets:[wallet]} | {status:'failed'} | null
/// account/hasRunningAccountTasks                    -> bool
/// session/initializeDefaultModel                    -> void
/// ```
library;

import 'dart:async';

import 'package:dsh_client/dsh_client.dart';

import '../l10n/l10n.dart';
import 'app_info.dart';

// ── Wire values ──────────────────────────────────────────────────────────────

/// `AccountView.status`: a stored grant is not a claim the server still accepts it.
enum AccountStatus { signedOut, credentialStored }

/// `SignInAttemptView.phase`.
enum SignInPhase {
  initializing,
  waitingBrowser,
  exchanging,
  committing,
  succeeded,
  cancelled,
  expired,
  failed;

  static SignInPhase? fromWire(String? value) => switch (value) {
    'initializing' => initializing,
    'waiting-browser' => waitingBrowser,
    'exchanging' => exchanging,
    'committing' => committing,
    'succeeded' => succeeded,
    'cancelled' => cancelled,
    'expired' => expired,
    'failed' => failed,
    _ => null,
  };

  bool get isActive => this == initializing || this == waitingBrowser || this == exchanging || this == committing;
}

/// `SignInErrorCode`: `no-response` = fetch got no Response (offline, DNS,
/// timeout); `network` = HTTP failure; `protocol` = invalid response or a
/// business refusal; `expired` = attempt deadline; `storage` = local credential store.
enum SignInErrorCode {
  noResponse,
  network,
  protocol,
  expired,
  storage,
  unknown;

  static SignInErrorCode? fromWire(String? value) => switch (value) {
    null => null,
    'no-response' => noResponse,
    'network' => network,
    'protocol' => protocol,
    'expired' => expired,
    'storage' => storage,
    _ => unknown,
  };
}

/// Which client started the attempt. The Host appends it to Platform's
/// completion URL and uses it for the failed-exchange response: `web` renders a
/// short "sign-in failed, close this tab" page in the browser tab, `desktop`
/// answers an empty 204. A phone's Custom Tab needs the visible page, and the
/// app is not a desktop client, so the app always reports `web`.
enum LoginSource {
  web('web'),
  desktop('desktop');

  const LoginSource(this.wire);
  final String wire;
}

class SignInAttempt {
  const SignInAttempt({required this.id, required this.phase, this.authorizeUrl, this.expiresAt, this.errorCode});

  final String id;
  final SignInPhase phase;

  /// Platform authorization page; present while waiting for the browser.
  final String? authorizeUrl;
  final DateTime? expiresAt;
  final SignInErrorCode? errorCode;

  static SignInAttempt? fromJson(Object? json) {
    final map = _asMap(json);
    final id = _asString(map?['id']);
    final phase = SignInPhase.fromWire(_asString(map?['phase']));
    if (map == null || id == null || id.isEmpty || phase == null) return null;
    final expires = map['expiresAt'];
    return SignInAttempt(
      id: id,
      phase: phase,
      authorizeUrl: _asString(map['authorizeUrl']),
      expiresAt: expires is num ? DateTime.fromMillisecondsSinceEpoch(expires.toInt()) : null,
      errorCode: SignInErrorCode.fromWire(_asString(map['errorCode'])),
    );
  }
}

/// Browser destinations derived from the Host's `platformOrigin`; never carry tokens.
class AccountLinks {
  const AccountLinks({required this.usageUrl, required this.topUpUrl});

  final String usageUrl;
  final String topUpUrl;

  static AccountLinks? fromJson(Object? json) {
    final map = _asMap(json);
    final usage = _asString(map?['usageUrl']);
    final topUp = _asString(map?['topUpUrl']);
    if (usage == null || topUp == null) return null;
    return AccountLinks(usageUrl: usage, topUpUrl: topUp);
  }
}

class AccountView {
  const AccountView({required this.status, this.links, this.attempt});

  final AccountStatus status;
  final AccountLinks? links;

  /// Latest attempt, including its terminal outcome until the next attempt.
  final SignInAttempt? attempt;

  bool get signedIn => status == AccountStatus.credentialStored;

  static AccountView fromJson(Object? json) {
    final map = _asMap(json);
    if (map == null) throw const DshProtocolException('account view is not an object');
    final status = switch (_asString(map['status'])) {
      'credential-stored' => AccountStatus.credentialStored,
      'signed-out' => AccountStatus.signedOut,
      final other => throw DshProtocolException('unknown account status $other'),
    };
    return AccountView(
      status: status,
      links: AccountLinks.fromJson(map['links']),
      attempt: SignInAttempt.fromJson(map['attempt']),
    );
  }
}

/// Display identity; [contact] keeps Platform's masking (`138****5678`, `a***@x.com`).
class AccountProfile {
  const AccountProfile({this.id, this.name, this.contact, this.avatarUrl});

  final String? id;
  final String? name;
  final String? contact;
  final String? avatarUrl;

  /// Name, else the masked contact, else a neutral label (same order as DSH's sidebar).
  String get displayName {
    final n = name?.trim() ?? '';
    if (n.isNotEmpty) return n;
    final c = contact?.trim() ?? '';
    return c.isNotEmpty ? c : appL10n.stateDeepSeekAccount;
  }

  static AccountProfile fromJson(Object? json) {
    final map = _asMapOrEmpty(json);
    String? text(String key) {
      final v = _asString(map[key])?.trim();
      return v == null || v.isEmpty ? null : v;
    }

    return AccountProfile(id: text('id'), name: text('name'), contact: text('contact'), avatarUrl: text('avatarUrl'));
  }
}

/// One wallet; [balance] is Platform's decimal string, kept verbatim (`0E-16`, `5.0000000000000000`).
class AccountWallet {
  const AccountWallet({required this.currency, required this.balance});

  final String currency;
  final String balance;

  static AccountWallet? fromJson(Object? json) {
    final map = _asMap(json);
    final currency = _asString(map?['currency']);
    final balance = _asString(map?['balance']);
    if (currency == null || balance == null) return null;
    return AccountWallet(currency: currency, balance: balance);
  }
}

/// Recharge (`normal_wallets`) and bonus (`bonus_wallets`) balances, kept apart.
class AccountBalance {
  const AccountBalance({this.recharge = const [], this.bonus = const []});

  final List<AccountWallet> recharge;
  final List<AccountWallet> bonus;
}

/// Platform could not answer a profile or balance query (the grant is kept).
class AccountQueryFailed implements Exception {
  const AccountQueryFailed(this.field);
  final String field;

  @override
  String toString() => 'AccountQueryFailed($field)';
}

/// Identity of the calling UI for one Platform-bound operation; the Host derives
/// the `x-client-version`, `x-client-locale` and `x-client-timezone-offset`
/// headers from it (`x-client-platform` is the Host's own: `web` outside DSH Desktop).
class AccountClientMetadata {
  const AccountClientMetadata({required this.version, required this.locale, required this.timezoneOffsetSeconds});

  /// The app's build (`1.0.0`), the way dsh-TUI reports its own version.
  factory AccountClientMetadata.current() => AccountClientMetadata(
    version: AppInfo.version.split('+').first,
    locale: switch (AppLocale.current.languageCode) {
      'pt' => 'pt-BR',
      'en' => 'en',
      _ => 'zh-CN',
    },
    timezoneOffsetSeconds: DateTime.now().timeZoneOffset.inSeconds,
  );

  final String version;
  final String locale;
  final int timezoneOffsetSeconds;

  Map<String, Object?> toJson() => {
    'version': version,
    'locale': locale,
    'timezoneOffsetSeconds': timezoneOffsetSeconds,
  };
}

// ── API ──────────────────────────────────────────────────────────────────────

/// The account operations the app uses; [DshAccountApi] talks to a Host, tests fake it.
abstract interface class AccountApi {
  /// `http://127.0.0.1:<port>`: where the browser on this phone reaches the Host's
  /// `/oauth/callback`. The Host only accepts loopback HTTP origins with a port.
  String get callbackOrigin;

  Future<AccountView> getState();

  /// Complete snapshots: one on (re)subscribe, then one per change. Survives
  /// socket reconnects (each new generation starts with a fresh snapshot).
  Stream<AccountView> watch();

  /// Starts a browser attempt, or joins the one already running.
  Future<AccountView> startSignIn({LoginSource source = LoginSource.web});

  /// Cancels only the named attempt; an attempt already committing settles first.
  Future<AccountView> cancelSignIn(String attemptId);

  /// Removes the local grant (API keys stay); Platform revocation runs in the background.
  Future<AccountView> signOut();

  /// Null when signed out or the grant changed during the query.
  Future<AccountProfile?> getProfile();

  /// Null when signed out; throws [AccountQueryFailed] when Platform did not answer.
  Future<AccountBalance?> getBalance();

  /// Whether running agents are using the account route (sign-out would cancel them).
  Future<bool> hasRunningAccountTasks();

  /// Saves the first available account model as the default when no API key is configured.
  Future<void> initializeDefaultModel();
}

class DshAccountApi implements AccountApi {
  /// [callbackOrigin] must be the loopback origin the phone's browser can reach
  /// (see [loopbackCallbackOrigin]); only the on-device engine qualifies.
  DshAccountApi(this.client, {required this.callbackOrigin, AccountClientMetadata Function()? metadata})
    : _metadata = metadata ?? AccountClientMetadata.current;

  final DshClient client;
  final AccountClientMetadata Function() _metadata;

  @override
  final String callbackOrigin;

  Map<String, Object?> get _client => _metadata().toJson();

  @override
  Future<AccountView> getState() async => AccountView.fromJson(await client.rpc.call('account/getState'));

  @override
  Stream<AccountView> watch() {
    late final StreamController<AccountView> controller;
    var stopped = false;
    MuxStream? current;

    Future<void> run() async {
      while (!stopped) {
        try {
          await client.mux.ready();
        } on Object catch (error) {
          if (!stopped) controller.addError(error);
          break;
        }
        if (stopped) break;
        final stream = client.mux.open('account/watch', const {});
        current = stream;
        try {
          await for (final item in stream.items) {
            if (stopped) break;
            try {
              controller.add(AccountView.fromJson(item));
            } on DshProtocolException catch (error) {
              controller.addError(error);
            }
          }
          if (stopped) break;
          // The Host ended the stream (shutting down or replaced): reopen shortly.
          await Future<void>.delayed(const Duration(milliseconds: 500));
        } on DshCarrierLostException {
          continue;
        } on DshClosedException {
          break;
        } on Object catch (error) {
          if (!stopped) controller.addError(error);
          break;
        }
      }
      if (!controller.isClosed) await controller.close();
    }

    controller = StreamController<AccountView>(
      onListen: () => unawaited(run()),
      onCancel: () async {
        stopped = true;
        await current?.cancel();
      },
    );
    return controller.stream;
  }

  @override
  Future<AccountView> startSignIn({LoginSource source = LoginSource.web}) async => AccountView.fromJson(
    await client.rpc.call('account/startSignIn', {
      'client': _client,
      'callbackOrigin': callbackOrigin,
      'loginSource': source.wire,
    }),
  );

  @override
  Future<AccountView> cancelSignIn(String attemptId) async =>
      AccountView.fromJson(await client.rpc.call('account/cancelSignIn', {'attemptId': attemptId}));

  @override
  Future<AccountView> signOut() async =>
      AccountView.fromJson(await client.rpc.call('account/signOut', {'client': _client}));

  @override
  Future<AccountProfile?> getProfile() async {
    final value = _asMap(await client.rpc.call('account/getProfile', {'client': _client}));
    if (value == null) return null;
    if (value['status'] != 'ready') throw const AccountQueryFailed('profile');
    return AccountProfile.fromJson(value['value']);
  }

  @override
  Future<AccountBalance?> getBalance() async {
    final value = _asMap(await client.rpc.call('account/getBalance', {'client': _client}));
    if (value == null) return null;
    if (value['status'] != 'ready') throw const AccountQueryFailed('balance');
    List<AccountWallet> wallets(Object? list) =>
        _asListOrEmpty(list).map(AccountWallet.fromJson).whereType<AccountWallet>().toList(growable: false);
    return AccountBalance(recharge: wallets(value['value']), bonus: wallets(value['bonusWallets']));
  }

  @override
  Future<bool> hasRunningAccountTasks() async => await client.rpc.call('account/hasRunningAccountTasks') == true;

  @override
  Future<void> initializeDefaultModel() async {
    await client.rpc.call('session/initializeDefaultModel');
  }
}

/// `http://127.0.0.1:<port>` for a local engine base URL, or null when the Host
/// would refuse it as a callback origin (it accepts only loopback HTTP
/// `localhost` / `127.0.0.1` / `[::1]` with an explicit port, no path).
String? loopbackCallbackOrigin(String? baseUrl) {
  final uri = baseUrl == null ? null : Uri.tryParse(baseUrl);
  if (uri == null || uri.scheme != 'http' || !uri.hasPort || uri.port == 0) return null;
  const hosts = {'127.0.0.1', 'localhost', '::1'};
  if (!hosts.contains(uri.host)) return null;
  final host = uri.host == '::1' ? '[::1]' : uri.host;
  return 'http://$host:${uri.port}';
}

// ── JSON helpers (local: the client package keeps its own private) ──────────

Map<String, Object?>? _asMap(Object? value) => value is Map ? value.cast<String, Object?>() : null;
Map<String, Object?> _asMapOrEmpty(Object? value) => _asMap(value) ?? const {};
List<Object?> _asListOrEmpty(Object? value) => value is List ? value.cast<Object?>() : const [];
String? _asString(Object? value) => value is String ? value : null;

// ── Display helpers ──────────────────────────────────────────────────────────

/// Platform Web's money format: two decimals with grouping, positive amounts
/// truncated to cents, positive sub-cent amounts as `<0.01`, negative amounts
/// rounded with a minimum magnitude of 0.01. Works on the decimal string so
/// `0E-16` and 18-digit fractions never pass through a double.
String formatWalletAmount(String raw) {
  final parsed = _Decimal.tryParse(raw);
  if (parsed == null) return raw;
  if (parsed.isZero) return '0.00';
  if (!parsed.negative) {
    final cents = parsed.centsTruncated();
    if (cents == BigInt.zero) return '<0.01';
    return _groupCents(cents);
  }
  var cents = parsed.centsRounded();
  if (cents == BigInt.zero) cents = BigInt.one;
  return '-${_groupCents(cents)}';
}

String currencySymbol(String currency) => switch (currency) {
  'CNY' => '¥',
  'USD' => r'$',
  _ => '$currency ',
};

/// Sum of [wallets] in [currency] as a decimal string, or null when none match.
String? sumWallets(List<AccountWallet> wallets, String currency) {
  _Decimal? total;
  for (final w in wallets) {
    if (w.currency != currency) continue;
    final d = _Decimal.tryParse(w.balance);
    if (d == null) continue;
    total = total == null ? d : total + d;
  }
  return total?.toPlainString();
}

String _groupCents(BigInt cents) {
  final whole = (cents ~/ BigInt.from(100)).toString();
  final frac = (cents % BigInt.from(100)).toString().padLeft(2, '0');
  final grouped = StringBuffer();
  for (var i = 0; i < whole.length; i++) {
    if (i > 0 && (whole.length - i) % 3 == 0) grouped.write(',');
    grouped.write(whole[i]);
  }
  return '$grouped.$frac';
}

/// Exact decimal: unscaled magnitude × 10^-scale.
class _Decimal {
  const _Decimal(this.negative, this.digits, this.scale);

  final bool negative;
  final BigInt digits;
  final int scale;

  static final _grammar = RegExp(r'^(-?)(\d*)(?:\.(\d*))?(?:[eE]([+-]?\d+))?$');

  static _Decimal? tryParse(String raw) {
    final m = _grammar.firstMatch(raw.trim());
    if (m == null) return null;
    final intPart = m.group(2) ?? '';
    final fracPart = m.group(3) ?? '';
    if (intPart.isEmpty && fracPart.isEmpty) return null;
    final exp = int.tryParse(m.group(4) ?? '0') ?? 0;
    var digits = BigInt.parse('${intPart.isEmpty ? '0' : intPart}$fracPart');
    var scale = fracPart.length - exp;
    if (scale < 0) {
      digits *= BigInt.from(10).pow(-scale);
      scale = 0;
    }
    return _Decimal(m.group(1) == '-' && digits != BigInt.zero, digits, scale);
  }

  bool get isZero => digits == BigInt.zero;

  BigInt get _pow => BigInt.from(10).pow(scale);

  BigInt centsTruncated() =>
      scale <= 2 ? digits * BigInt.from(10).pow(2 - scale) : digits ~/ BigInt.from(10).pow(scale - 2);

  BigInt centsRounded() {
    if (scale <= 2) return digits * BigInt.from(10).pow(2 - scale);
    final div = BigInt.from(10).pow(scale - 2);
    final q = digits ~/ div;
    return (digits % div) * BigInt.two >= div ? q + BigInt.one : q;
  }

  _Decimal operator +(_Decimal other) {
    final s = scale > other.scale ? scale : other.scale;
    BigInt signed(_Decimal d) => (d.negative ? -d.digits : d.digits) * BigInt.from(10).pow(s - d.scale);
    final sum = signed(this) + signed(other);
    return _Decimal(sum.isNegative, sum.abs(), s);
  }

  String toPlainString() {
    if (scale == 0) return '${negative ? '-' : ''}$digits';
    final whole = digits ~/ _pow;
    final frac = (digits % _pow).toString().padLeft(scale, '0');
    return '${negative ? '-' : ''}$whole.$frac';
  }
}
