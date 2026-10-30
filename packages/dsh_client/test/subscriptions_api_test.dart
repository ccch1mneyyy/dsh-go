// Subscription sign-in (`appAuth/*`, dsh-app's engine-side auth bridge):
// request shapes and parsing. The scripted values are what the bridge answered
// on a real DSH 0.2.1-rc.2 (authorize URLs shortened).

import 'package:dsh_client/dsh_client.dart';
import 'package:test/test.dart';

/// Unary calls only, scripted per endpoint.
class _ScriptedCarrier extends DshCarrier {
  _ScriptedCarrier(this.handlers);

  final Map<String, RpcResult Function(Map<String, Object?> args)> handlers;
  final List<(String, Map<String, Object?>)> calls = [];

  @override
  String get kind => 'memory';

  @override
  DshTracer? get tracer => null;

  @override
  Future<RpcResult> call(String endpoint, Map<String, Object?> args, {Duration? timeout}) async {
    calls.add((endpoint, args));
    final handler = handlers[endpoint];
    if (handler == null) {
      return RpcError(
        DshRemoteException(
          'gateway/invocation-unavailable',
          'typert gateway: $endpoint: no active Remote method exports this endpoint',
        ),
      );
    }
    return handler(args);
  }

  @override
  Future<DshMuxLink> openLink(MuxOptions options) => throw UnsupportedError('no streams');

  @override
  Future<void> close() async {}
}

RpcResult ok(Object? value) => RpcOk(value);

/// The recorded calls as `[endpoint, args]` lists (records compare maps by identity).
List<List<Object?>> _sent(_ScriptedCarrier carrier) => [
  for (final (endpoint, args) in carrier.calls) [endpoint, args],
];

void main() {
  group('Subscription', () {
    test('wire ids are the pi-ai provider ids', () {
      expect(Subscription.chatgpt.wire, 'openai-codex');
      expect(Subscription.claude.wire, 'anthropic');
      expect(Subscription.grok.wire, 'xai');
      expect(Subscription.fromWire('openai-codex'), Subscription.chatgpt);
      expect(Subscription.fromWire('anthropic'), Subscription.claude);
      expect(Subscription.fromWire('xai'), Subscription.grok);
      expect(Subscription.fromWire('openai'), isNull);
      expect(Subscription.fromWire(null), isNull);
    });
  });

  group('appAuth/list', () {
    test('supported providers, with the account when the grant names one', () async {
      final carrier = _ScriptedCarrier({
        'appAuth/list': (_) => ok({
          'providers': [
            {'id': 'openai-codex', 'signedIn': true, 'account': 'tester@example.invalid'},
            {'id': 'anthropic', 'signedIn': false},
            {'id': 'xai', 'signedIn': true},
          ],
        }),
      });
      final client = DshClient.withCarrier(carrier);
      final list = await client.subscriptions();
      expect(_sent(carrier), [
        ['appAuth/list', <String, Object?>{}],
      ]);
      expect(list.map((s) => s.subscription), [Subscription.chatgpt, Subscription.claude, Subscription.grok]);
      expect(list[0].signedIn, isTrue);
      expect(list[0].account, 'tester@example.invalid');
      expect(list[1].signedIn, isFalse);
      expect(list[1].account, isNull);
      expect(list[2].signedIn, isTrue);
    });

    test('unknown ids, malformed entries and non-true flags are dropped or read as signed out', () async {
      final client = DshClient.withCarrier(
        _ScriptedCarrier({
          'appAuth/list': (_) => ok({
            'providers': [
              {'id': 'github-copilot', 'signedIn': true},
              'not a map',
              null,
              {'signedIn': true},
              {'id': 'anthropic', 'signedIn': 'yes', 'account': 3},
            ],
          }),
        }),
      );
      final list = await client.subscriptions();
      expect(list, hasLength(1));
      expect(list.single.subscription, Subscription.claude);
      expect(list.single.signedIn, isFalse);
      expect(list.single.account, isNull);
    });

    test('an empty or odd result is an empty list', () async {
      for (final value in [
        null,
        <String, Object?>{},
        'x',
        {'providers': 'x'},
      ]) {
        final client = DshClient.withCarrier(_ScriptedCarrier({'appAuth/list': (_) => ok(value)}));
        expect(await client.subscriptions(), isEmpty, reason: '$value');
      }
    });

    test('without the bridge the Host refusal surfaces as DshRemoteException', () async {
      final client = DshClient.withCarrier(_ScriptedCarrier({}));
      await expectLater(
        client.subscriptions(),
        throwsA(isA<DshRemoteException>().having((e) => e.code, 'code', 'gateway/invocation-unavailable')),
      );
    });
  });

  group('appAuth/begin', () {
    test('sends the provider wire id and returns the attempt id', () async {
      final carrier = _ScriptedCarrier({
        'appAuth/begin': (_) => ok({'attemptId': 'cbf52a89-d780-4f71-a08a-c78446e8c86b'}),
      });
      final client = DshClient.withCarrier(carrier);
      expect(await client.beginLogin(Subscription.chatgpt), 'cbf52a89-d780-4f71-a08a-c78446e8c86b');
      expect(await client.beginLogin(Subscription.claude), 'cbf52a89-d780-4f71-a08a-c78446e8c86b');
      expect(await client.beginLogin(Subscription.grok), 'cbf52a89-d780-4f71-a08a-c78446e8c86b');
      expect(_sent(carrier), [
        [
          'appAuth/begin',
          {'provider': 'openai-codex'},
        ],
        [
          'appAuth/begin',
          {'provider': 'anthropic'},
        ],
        [
          'appAuth/begin',
          {'provider': 'xai'},
        ],
      ]);
    });

    test('no attempt id is a FormatException', () async {
      for (final value in [
        null,
        <String, Object?>{},
        {'attemptId': 7},
      ]) {
        final client = DshClient.withCarrier(_ScriptedCarrier({'appAuth/begin': (_) => ok(value)}));
        await expectLater(client.beginLogin(Subscription.claude), throwsFormatException, reason: '$value');
      }
    });

    test('a bridge refusal keeps its code and Chinese message', () async {
      final client = DshClient.withCarrier(
        _ScriptedCarrier({
          'appAuth/begin': (_) => const RpcError(DshRemoteException('app-auth/unknown-provider', '不支持这个登录方式')),
        }),
      );
      await expectLater(
        client.beginLogin(Subscription.chatgpt),
        throwsA(
          isA<DshRemoteException>()
              .having((e) => e.code, 'code', 'app-auth/unknown-provider')
              .having((e) => e.message, 'message', '不支持这个登录方式'),
        ),
      );
    });
  });

  group('appAuth/poll', () {
    Future<LoginStep> poll(Object? value) async {
      final carrier = _ScriptedCarrier({'appAuth/poll': (_) => ok(value)});
      final step = await DshClient.withCarrier(carrier).pollLogin('a1');
      expect(_sent(carrier), [
        [
          'appAuth/poll',
          {'attemptId': 'a1'},
        ],
      ]);
      return step;
    }

    test('open: authorize URL, paste placeholder and message', () async {
      final step = await poll({
        'phase': 'open',
        'url': 'https://auth.openai.com/oauth/authorize?response_type=code&client_id=app_x',
        'placeholder': 'http://localhost:1455/auth/callback',
        'message': '在浏览器里完成登录',
      });
      expect(step.phase, LoginPhase.open);
      expect(step.url, startsWith('https://auth.openai.com/oauth/authorize'));
      expect(step.placeholder, 'http://localhost:1455/auth/callback');
      expect(step.message, '在浏览器里完成登录');
      expect(step.userCode, isNull);
      expect(step.error, isNull);
      expect(step.phase.finished, isFalse);
    });

    test('prompt and device', () async {
      final prompt = await poll({
        'phase': 'prompt',
        'url': 'https://claude.ai/oauth/authorize?code=true',
        'placeholder': 'http://localhost:53692/callback',
        'message': '在浏览器里登录后，把地址栏里的完整网址复制下来，粘贴到这里',
      });
      expect(prompt.phase, LoginPhase.prompt);
      expect(prompt.url, startsWith('https://claude.ai/oauth/authorize'));
      final device = await poll({
        'phase': 'device',
        'url': 'https://auth.openai.com/codex/device',
        'userCode': 'ABCD-1234',
        'message': '在打开的网页里输入下面的代码',
      });
      expect(device.phase, LoginPhase.device);
      expect(device.userCode, 'ABCD-1234');
    });

    test('starting, then the terminal phases with their error copy', () async {
      expect((await poll({'phase': 'starting', 'message': '正在完成登录…'})).phase, LoginPhase.starting);
      final done = await poll({'phase': 'done'});
      expect(done.phase, LoginPhase.done);
      expect(done.phase.finished, isTrue);
      final cancelled = await poll({'phase': 'cancelled', 'error': '登录已取消'});
      expect(cancelled.phase, LoginPhase.cancelled);
      expect(cancelled.error, '登录已取消');
      expect(cancelled.phase.finished, isTrue);
      final failed = await poll({'phase': 'failed', 'error': '授权没有完成，再试一次'});
      expect(failed.phase, LoginPhase.failed);
      expect(failed.error, '授权没有完成，再试一次');
    });

    test('an unknown, missing or non-string phase reads as failed', () async {
      for (final value in [
        {'phase': 'exchanging'},
        <String, Object?>{},
        {'phase': 3},
        null,
      ]) {
        final step = await poll(value);
        expect(step.phase, LoginPhase.failed, reason: '$value');
        expect(step.phase.finished, isTrue);
      }
    });

    test('non-string fields are ignored', () async {
      final step = await poll({
        'phase': 'open',
        'url': 42,
        'message': ['x'],
        'placeholder': null,
      });
      expect(step.phase, LoginPhase.open);
      expect(step.url, isNull);
      expect(step.message, isNull);
      expect(step.placeholder, isNull);
    });
  });

  group('appAuth/answer, cancel, signOut', () {
    test('request shapes', () async {
      final carrier = _ScriptedCarrier({
        'appAuth/answer': (_) => ok(<String, Object?>{}),
        'appAuth/cancel': (_) => ok(<String, Object?>{}),
        'appAuth/signOut': (_) => ok(<String, Object?>{}),
      });
      final client = DshClient.withCarrier(carrier);
      await client.answerLogin('a1', 'http://localhost:1455/auth/callback?code=c&state=s');
      await client.cancelLogin('a1');
      await client.signOut(Subscription.chatgpt);
      await client.signOut(Subscription.claude);
      await client.signOut(Subscription.grok);
      expect(_sent(carrier), [
        [
          'appAuth/answer',
          {'attemptId': 'a1', 'value': 'http://localhost:1455/auth/callback?code=c&state=s'},
        ],
        [
          'appAuth/cancel',
          {'attemptId': 'a1'},
        ],
        [
          'appAuth/signOut',
          {'provider': 'openai-codex'},
        ],
        [
          'appAuth/signOut',
          {'provider': 'anthropic'},
        ],
        [
          'appAuth/signOut',
          {'provider': 'xai'},
        ],
      ]);
    });

    test('answer and signOut refusals surface with their code', () async {
      final client = DshClient.withCarrier(
        _ScriptedCarrier({
          'appAuth/answer': (_) => const RpcError(DshRemoteException('app-auth/not-waiting', '现在不需要粘贴内容')),
          'appAuth/signOut': (_) => const RpcError(DshRemoteException('app-auth/sign-out-failed', '退出登录没有完成，再试一次')),
        }),
      );
      await expectLater(
        client.answerLogin('a1', 'x'),
        throwsA(isA<DshRemoteException>().having((e) => e.code, 'code', 'app-auth/not-waiting')),
      );
      await expectLater(
        client.signOut(Subscription.claude),
        throwsA(isA<DshRemoteException>().having((e) => e.code, 'code', 'app-auth/sign-out-failed')),
      );
    });
  });
}
