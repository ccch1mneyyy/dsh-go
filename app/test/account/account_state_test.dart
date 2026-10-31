// State machine of the DeepSeek account sign-in, against an in-memory Host.

import 'dart:async';
import 'dart:ui' show Brightness;

import 'package:dsh_app/l10n/l10n.dart';
import 'package:dsh_app/state/account_state.dart';
import 'package:dsh_client/dsh_client.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';

import 'support.dart';

ProviderContainer _container({AccountApi? api, FakeBrowser? browser}) {
  final container = ProviderContainer(
    overrides: accountOverrides(api: api, browser: browser),
  );
  addTearDown(container.dispose);
  container.listen(accountProvider, (_, _) {});
  return container;
}

Future<void> _flush() async {
  for (var i = 0; i < 12; i++) {
    await Future<void>.delayed(Duration.zero);
  }
}

AccountState _state(ProviderContainer c) => c.read(accountProvider);
AccountController _account(ProviderContainer c) => c.read(accountProvider.notifier);

void main() {
  group('connection', () {
    test('unknown without an engine, then follows the Host snapshot', () async {
      final api = FakeAccountApi();
      final c = _container();
      expect(_state(c).phase, AccountPhase.unknown);
      expect(_state(c).connected, isFalse);

      c.read(apiSwitchProvider.notifier).set(api);
      await _flush();
      expect(_state(c).phase, AccountPhase.signedOut);
      expect(_state(c).connected, isTrue);
      expect(_state(c).links?.topUpUrl, links.topUpUrl);
    });

    test('a login made elsewhere loads the profile', () async {
      final api = FakeAccountApi();
      final c = _container(api: api);
      await _flush();
      api.emit(signedInView());
      await _flush();
      expect(_state(c).phase, AccountPhase.signedIn);
      expect(_state(c).profile?.name, '雾蓝');
      expect(api.calls, contains('getProfile'));
    });

    test('a profile failure is flagged and keeps the login', () async {
      final api = FakeAccountApi(initial: signedInView())..profileError = const AccountQueryFailed('profile');
      final c = _container(api: api);
      await _flush();
      expect(_state(c).signedIn, isTrue);
      expect(_state(c).profileFailed, isTrue);
      expect(_state(c).profile, isNull);
    });

    test('an engine without the account service reads as unsupported', () async {
      final api = FakeAccountApi()
        ..getStateError = const DshHttpException(404, 'endpoint account/getState is not served');
      final c = _container(api: api);
      await _flush();
      api.failWatchers(const DshRemoteException('gateway/not-found', 'no account/watch'));
      await _flush();
      expect(_state(c).phase, AccountPhase.unsupported);
      expect(await _account(c).signIn(), SignInResult.failed);
    });

    test('a broken stream recovers from one snapshot and resubscribes', () async {
      final api = FakeAccountApi();
      final c = _container(api: api);
      await _flush();
      api.current = signedInView();
      api.failWatchers(const DshRemoteException('gateway/internal', 'boom'));
      await _flush();
      expect(_state(c).signedIn, isTrue, reason: 'getState snapshot applied');
    });
  });

  group('sign-in', () {
    test('happy path: one browser open with the theme, then signed in', () async {
      final api = FakeAccountApi();
      final browser = FakeBrowser();
      final c = _container(api: api, browser: browser);
      await _flush();

      final result = _account(c).signIn(brightness: Brightness.dark);
      expect(_state(c).phase, AccountPhase.signingIn);
      expect(_state(c).stage, SignInStage.preparing);
      await _flush();
      expect(api.calls, contains('startSignIn:web'));

      api.emit(signedOutView(attempt: attempt(SignInPhase.waitingBrowser)));
      await _flush();
      expect(_state(c).stage, SignInStage.waitingBrowser);
      expect(_state(c).authorizeUrl, authorizeUrl);
      expect(browser.opened, hasLength(1));
      expect(browser.opened.single.queryParameters, {'authorize_id': 'a-1', 'theme': 'dark'});

      api.emit(signedOutView(attempt: attempt(SignInPhase.exchanging)));
      await _flush();
      expect(_state(c).stage, SignInStage.finishing);
      expect(_state(c).authorizeUrl, authorizeUrl, reason: 'kept for the record while finishing');

      api.emit(signedInView(attempt: attempt(SignInPhase.succeeded)));
      expect(await result, SignInResult.success);
      await _flush();
      expect(_state(c).phase, AccountPhase.signedIn);
      expect(_state(c).profile?.contact, '138****5678');
      expect(_state(c).failure, isNull);
      expect(api.calls, containsAll(['initializeDefaultModel', 'getProfile']));
      expect(browser.opened, hasLength(1));
    });

    test('a waiting-browser snapshot that beats the startSignIn answer is not undone', () async {
      final api = FakeAccountApi();
      final browser = FakeBrowser();
      api.onStart = () async {
        api.emit(signedOutView(attempt: attempt(SignInPhase.waitingBrowser)));
        await Future<void>.delayed(Duration.zero);
        return signedOutView(attempt: attempt(SignInPhase.initializing));
      };
      final c = _container(api: api, browser: browser);
      await _flush();
      unawaited(_account(c).signIn());
      await _flush();
      expect(_state(c).stage, SignInStage.waitingBrowser);
      expect(browser.opened, hasLength(1));
    });

    test('signIn while running rejoins and reopens the page', () async {
      final api = FakeAccountApi();
      final browser = FakeBrowser();
      final c = _container(api: api, browser: browser);
      await _flush();
      final first = _account(c).signIn();
      await _flush();
      api.emit(signedOutView(attempt: attempt(SignInPhase.waitingBrowser)));
      await _flush();
      final second = _account(c).signIn();
      await _flush();
      expect(browser.opened, hasLength(2));
      expect(api.calls.where((c) => c.startsWith('startSignIn')), hasLength(1));
      api.emit(signedInView(attempt: attempt(SignInPhase.succeeded)));
      expect(await first, SignInResult.success);
      expect(await second, SignInResult.success);
    });

    test('joins an attempt another client started', () async {
      final foreign = signedOutView(attempt: attempt(SignInPhase.waitingBrowser, id: 'other'));
      final api = FakeAccountApi(initial: foreign);
      final browser = FakeBrowser();
      api.onStart = () async => foreign; // the Host joins instead of starting another
      final c = _container(api: api, browser: browser);
      await _flush();
      expect(_state(c).phase, AccountPhase.signingIn, reason: 'shown, but not ours to open');
      expect(browser.opened, isEmpty);

      final result = _account(c).signIn();
      await _flush();
      expect(browser.opened, hasLength(1));
      api.emit(signedInView(attempt: attempt(SignInPhase.succeeded, id: 'other')));
      expect(await result, SignInResult.success);
    });

    test('a previous attempt\'s failure is not reported as a new one', () async {
      final api = FakeAccountApi(
        initial: signedOutView(
          attempt: attempt(SignInPhase.failed, id: 'old', error: SignInErrorCode.noResponse),
        ),
      );
      final c = _container(api: api);
      await _flush();
      expect(_state(c).phase, AccountPhase.signedOut);
      expect(_state(c).failure, isNull);
    });

    test('waits for the engine before starting', () async {
      final api = FakeAccountApi();
      final c = _container();
      final result = _account(c).signIn();
      await _flush();
      expect(_state(c).stage, SignInStage.preparing);
      expect(_state(c).connected, isFalse);

      c.read(apiSwitchProvider.notifier).set(api);
      await _flush();
      expect(api.calls, contains('startSignIn:web'));
      api.emit(signedInView(attempt: attempt(SignInPhase.succeeded)));
      expect(await result, SignInResult.success);
    });
  });

  group('cancel', () {
    test('while waiting: cancels the exact attempt, no error left behind', () async {
      final api = FakeAccountApi();
      final c = _container(api: api);
      await _flush();
      final result = _account(c).signIn();
      await _flush();
      api.emit(signedOutView(attempt: attempt(SignInPhase.waitingBrowser)));
      await _flush();

      await _account(c).cancel();
      expect(await result, SignInResult.cancelled);
      expect(api.calls, contains('cancelSignIn:att-1'));
      expect(_state(c).phase, AccountPhase.signedOut);
      expect(_state(c).failure, isNull);
      expect(_state(c).authorizeUrl, isNull);
    });

    test('before the Host answered: settles at once and drops the attempt when it appears', () async {
      final api = FakeAccountApi();
      final started = Completer<AccountView>();
      api.onStart = () => started.future;
      final c = _container(api: api);
      await _flush();
      final result = _account(c).signIn();
      await _flush();

      await _account(c).cancel();
      expect(await result, SignInResult.cancelled);
      expect(_state(c).phase, AccountPhase.signedOut);

      started.complete(signedOutView(attempt: attempt(SignInPhase.initializing)));
      await _flush();
      expect(api.calls, contains('cancelSignIn:att-1'));
      expect(_state(c).phase, AccountPhase.signedOut);
    });

    test('while the engine is still starting', () async {
      final c = _container();
      final result = _account(c).signIn();
      await _flush();
      await _account(c).cancel();
      expect(await result, SignInResult.cancelled);
      final api = FakeAccountApi();
      c.read(apiSwitchProvider.notifier).set(api);
      await _flush();
      expect(api.calls.where((c) => c.startsWith('startSignIn')), isEmpty);
    });

    test('a commit that wins the race reports success', () async {
      final api = FakeAccountApi();
      api.onCancel = (id) async {
        final view = signedInView(attempt: attempt(SignInPhase.succeeded, id: id));
        api.emit(view);
        return view;
      };
      final c = _container(api: api);
      await _flush();
      final result = _account(c).signIn();
      await _flush();
      api.emit(signedOutView(attempt: attempt(SignInPhase.committing)));
      await _flush();
      await _account(c).cancel();
      expect(await result, SignInResult.success);
      expect(_state(c).signedIn, isTrue);
    });
  });

  group('failures', () {
    final cases = <(SignInPhase, SignInErrorCode?, SignInFailureKind)>[
      (SignInPhase.failed, SignInErrorCode.noResponse, SignInFailureKind.offline),
      (SignInPhase.failed, SignInErrorCode.network, SignInFailureKind.service),
      (SignInPhase.failed, SignInErrorCode.protocol, SignInFailureKind.rejected),
      (SignInPhase.failed, SignInErrorCode.storage, SignInFailureKind.storage),
      (SignInPhase.expired, SignInErrorCode.expired, SignInFailureKind.timeout),
      (SignInPhase.failed, null, SignInFailureKind.rejected),
    ];
    for (final (phase, code, kind) in cases) {
      test('${phase.name}/${code?.name} reads as ${kind.name}', () async {
        final api = FakeAccountApi();
        final c = _container(api: api);
        await _flush();
        final result = _account(c).signIn();
        await _flush();
        api.emit(signedOutView(attempt: attempt(SignInPhase.waitingBrowser)));
        await _flush();
        api.emit(signedOutView(attempt: attempt(phase, error: code)));
        expect(await result, SignInResult.failed);
        expect(_state(c).phase, AccountPhase.signedOut);
        expect(_state(c).failure?.kind, kind);
        expect(_state(c).failure?.title, isNotEmpty);

        _account(c).dismissFailure();
        expect(_state(c).failure, isNull);
      });
    }

    final refusals = <(Object, SignInFailureKind)>[
      (const DshRemoteException('gateway/internal', 'account: no-response'), SignInFailureKind.offline),
      (const DshRemoteException('gateway/internal', 'account: protocol'), SignInFailureKind.rejected),
      (const DshRemoteException('gateway/input-invalid', 'wire field "loginSource"'), SignInFailureKind.rejected),
      (const DshHttpException(404, 'not served'), SignInFailureKind.unsupported),
      (const DshTransportException('connection refused'), SignInFailureKind.engine),
    ];
    for (final (error, kind) in refusals) {
      test('startSignIn refusal $error reads as ${kind.name}', () async {
        final api = FakeAccountApi()..onStart = () async => throw error;
        final c = _container(api: api);
        await _flush();
        expect(await _account(c).signIn(), SignInResult.failed);
        expect(_state(c).failure?.kind, kind);
      });
    }

    test('the engine going away mid-attempt interrupts the sign-in', () async {
      final api = FakeAccountApi();
      final c = _container(api: api);
      await _flush();
      final result = _account(c).signIn();
      await _flush();
      api.emit(signedOutView(attempt: attempt(SignInPhase.waitingBrowser)));
      await _flush();
      c.read(apiSwitchProvider.notifier).set(null);
      expect(await result, SignInResult.failed);
      expect(_state(c).failure?.kind, SignInFailureKind.interrupted);
      expect(_state(c).connected, isFalse);
    });

    test('a new attempt clears the previous failure', () async {
      final api = FakeAccountApi()..onStart = () async => throw const DshRemoteException('x', 'account: network');
      final c = _container(api: api);
      await _flush();
      await _account(c).signIn();
      expect(_state(c).failure, isNotNull);
      api.onStart = null;
      unawaited(_account(c).signIn());
      expect(_state(c).failure, isNull);
    });
  });

  group('browser', () {
    test('cannot open: copy-link hint; reopen tries again', () async {
      final api = FakeAccountApi();
      final browser = FakeBrowser(succeeds: false);
      final c = _container(api: api, browser: browser);
      await _flush();
      unawaited(_account(c).signIn());
      await _flush();
      api.emit(signedOutView(attempt: attempt(SignInPhase.waitingBrowser)));
      await _flush();
      expect(_state(c).browserHint, BrowserHint.notOpened);

      browser.succeeds = true;
      await _account(c).reopenBrowser();
      expect(browser.opened, hasLength(2));
      expect(_state(c).browserHint, BrowserHint.none);
    });

    testWidgets('returning to the app without a result suggests the page was closed', (tester) async {
      final api = FakeAccountApi();
      final c = _container(api: api);
      await tester.pump();
      unawaited(_account(c).signIn());
      await tester.pump();
      api.emit(signedOutView(attempt: attempt(SignInPhase.waitingBrowser)));
      await tester.pump();
      expect(_state(c).stage, SignInStage.waitingBrowser);

      _account(c).noteAppResumed();
      await tester.pump(const Duration(milliseconds: 500));
      expect(_state(c).browserHint, BrowserHint.none, reason: 'grace period for a result in flight');
      await tester.pump(const Duration(seconds: 2));
      expect(_state(c).browserHint, BrowserHint.returned);

      api.emit(signedOutView(attempt: attempt(SignInPhase.exchanging)));
      await tester.pump();
      expect(_state(c).browserHint, BrowserHint.none);
      await _account(c).cancel();
    });
  });

  group('timeouts', () {
    testWidgets('gives up when the engine never comes up', (tester) async {
      final c = _container();
      final result = _account(c).signIn();
      await tester.pump(AccountController.engineWait + const Duration(seconds: 1));
      expect(await result, SignInResult.failed);
      expect(_state(c).failure?.kind, SignInFailureKind.engine);
    });

    testWidgets('the local deadline ends an attempt the Host never settles', (tester) async {
      final api = FakeAccountApi();
      final c = _container(api: api);
      await tester.pump();
      final result = _account(c).signIn();
      await tester.pump();
      api.emit(signedOutView(attempt: attempt(SignInPhase.waitingBrowser)));
      await tester.pump();
      await tester.pump(const Duration(minutes: 11));
      expect(await result, SignInResult.failed);
      expect(_state(c).failure?.kind, SignInFailureKind.timeout);
      expect(api.calls, contains('cancelSignIn:att-1'));
    });
  });

  group('signed in', () {
    test('balance keeps recharge and bonus apart; failures throw', () async {
      final api = FakeAccountApi(initial: signedInView());
      final c = _container(api: api);
      await _flush();
      final balance = await _account(c).balance();
      expect(balance?.recharge.single.balance, '128.4567');
      expect(balance?.bonus.single.balance, '10.0000000000000000');
      expect(await c.read(accountBalanceProvider.future), isNotNull);

      api.balanceError = const AccountQueryFailed('balance');
      expect(_account(c).balance(), throwsA(isA<AccountQueryFailed>()));
    });

    test('sign-out ends signed out and forgets the profile', () async {
      final api = FakeAccountApi(initial: signedInView())..runningTasks = true;
      final c = _container(api: api);
      await _flush();
      expect(await _account(c).hasRunningAccountTasks(), isTrue);
      await _account(c).signOut();
      expect(_state(c).phase, AccountPhase.signedOut);
      expect(_state(c).profile, isNull);
      expect(await _account(c).balance(), isNull);
    });

    test('engine stopping keeps the last known login and hides wallets', () async {
      final api = FakeAccountApi(initial: signedInView());
      final c = _container(api: api);
      await _flush();
      expect(await c.read(accountBalanceProvider.future), isNotNull);
      c.read(apiSwitchProvider.notifier).set(null);
      await _flush();
      expect(_state(c).signedIn, isTrue);
      expect(_state(c).connected, isFalse);
      expect(await c.read(accountBalanceProvider.future), isNull, reason: 'unknown, not zero');
    });

    test('expiry elsewhere (grant rejected) flips to signed out', () async {
      final api = FakeAccountApi(initial: signedInView());
      final c = _container(api: api);
      await _flush();
      api.emit(signedOutView());
      await _flush();
      expect(_state(c).phase, AccountPhase.signedOut);
    });
  });

  group('wire', () {
    test('AccountView parses the Host\'s JSON', () {
      final view = AccountView.fromJson({
        'status': 'signed-out',
        'attempt': {
          'id': 'adceb4e1-a323-46ca-8b97-9e6835efc8fe',
          'phase': 'waiting-browser',
          'authorizeUrl': 'https://platform.deepseek.com/dsh/authorize?authorize_id=x',
          'expiresAt': 1792729254569,
        },
        'links': {
          'usageUrl': 'https://platform.deepseek.com/usage',
          'topUpUrl': 'https://platform.deepseek.com/top_up',
        },
      });
      expect(view.signedIn, isFalse);
      expect(view.attempt?.phase, SignInPhase.waitingBrowser);
      expect(view.attempt?.expiresAt?.millisecondsSinceEpoch, 1792729254569);
      expect(view.links?.topUpUrl, endsWith('/top_up'));

      final failed = AccountView.fromJson({
        'status': 'signed-out',
        'attempt': {'id': 'a', 'phase': 'failed', 'errorCode': 'no-response'},
        'links': {'usageUrl': 'u', 'topUpUrl': 't'},
      });
      expect(failed.attempt?.errorCode, SignInErrorCode.noResponse);
      expect(AccountView.fromJson({'status': 'credential-stored', 'attempt': null}).signedIn, isTrue);
      expect(() => AccountView.fromJson({'status': 'weird'}), throwsA(isA<DshProtocolException>()));
    });

    test('profile keeps Platform masking and falls back for display', () {
      final p = AccountProfile.fromJson({'id': 'u', 'name': null, 'contact': 'a***@x.com', 'avatarUrl': ''});
      expect(p.displayName, 'a***@x.com');
      expect(p.avatarUrl, isNull);
      expect(const AccountProfile().displayName, 'DeepSeek 账号');
    });

    test('callback origin: loopback HTTP with a port only', () {
      expect(loopbackCallbackOrigin('http://127.0.0.1:3080/'), 'http://127.0.0.1:3080');
      expect(loopbackCallbackOrigin('http://localhost:41234'), 'http://localhost:41234');
      expect(loopbackCallbackOrigin('http://[::1]:5000/'), 'http://[::1]:5000');
      expect(loopbackCallbackOrigin('http://192.168.1.5:3080/'), isNull);
      expect(loopbackCallbackOrigin('https://127.0.0.1:3080/'), isNull);
      expect(loopbackCallbackOrigin('http://127.0.0.1/'), isNull);
      expect(loopbackCallbackOrigin(null), isNull);
    });

    test('client metadata matches what the Host validates', () {
      final m = AccountClientMetadata.current().toJson();
      expect(m.keys, {'version', 'locale', 'timezoneOffsetSeconds'});
      expect(m['locale'], 'zh-CN');
      expect(m['version'], isNot(contains('+')));
      expect(m['timezoneOffsetSeconds'], isA<int>());
      AppLocale.use(AppLocale.ptBR);
      expect(AccountClientMetadata.current().toJson()['locale'], 'pt-BR');
      AppLocale.use(AppLocale.zhCN);
    });
  });

  group('money', () {
    test('Platform Web formatting on decimal strings', () {
      expect(formatWalletAmount('12.3456'), '12.34');
      expect(formatWalletAmount('5.0000000000000000'), '5.00');
      expect(formatWalletAmount('0E-16'), '0.00');
      expect(formatWalletAmount('0'), '0.00');
      expect(formatWalletAmount('0.004'), '<0.01');
      expect(formatWalletAmount('-0.004'), '-0.01');
      expect(formatWalletAmount('-12.345'), '-12.35');
      expect(formatWalletAmount('1234567.899'), '1,234,567.89');
      expect(formatWalletAmount('.5'), '0.50');
      expect(formatWalletAmount('1e3'), '1,000.00');
      expect(formatWalletAmount('2.5E-1'), '0.25');
      expect(formatWalletAmount('NaN'), 'NaN');
    });

    test('sums wallets per currency', () {
      const wallets = [
        AccountWallet(currency: 'CNY', balance: '1.25'),
        AccountWallet(currency: 'CNY', balance: '0E-16'),
        AccountWallet(currency: 'USD', balance: '3'),
        AccountWallet(currency: 'CNY', balance: '-0.5'),
      ];
      expect(sumWallets(wallets, 'CNY'), '0.7500000000000000');
      expect(formatWalletAmount(sumWallets(wallets, 'CNY')!), '0.75');
      expect(sumWallets(wallets, 'USD'), '3');
      expect(sumWallets(wallets, 'EUR'), isNull);
      expect(currencySymbol('CNY'), '¥');
    });
  });
}
