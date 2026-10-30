// ChatGPT / Claude sign-in: the 「订阅」 rows (hidden without the bridge), each
// step of the sign-in sheet against a fake bridge, polling that stops with
// the sheet, and the signed-in page's sign-out.

import 'package:dsh_app/l10n/l10n.dart';
import 'package:dsh_app/state/account_state.dart' show accountBrowserProvider;
import 'package:dsh_app/state/models_state.dart';
import 'package:dsh_app/state/subscriptions_state.dart';
import 'package:dsh_app/ui/common/list_page_row.dart';
import 'package:dsh_app/ui/providers/providers_page.dart';
import 'package:dsh_app/ui/providers/subscription_page.dart';
import 'package:dsh_app/ui/providers/subscription_sheet.dart';
import 'package:dsh_client/dsh_client.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/misc.dart' show Override;
import 'package:flutter_test/flutter_test.dart';

import '../account/support.dart' show FakeBrowser;
import '../shell/golden_harness.dart' show goldenApp, loadGoldenFonts;
import 'support.dart';

const _url = 'https://auth.example.com/oauth/authorize?state=abc';

const _signedInChatGpt = [
  SubscriptionStatus(subscription: Subscription.chatgpt, signedIn: true, account: 'me@example.com'),
  SubscriptionStatus(subscription: Subscription.claude, signedIn: false),
];

final _codexCatalog = ModelCatalog(
  defaultSelection: null,
  routableProviders: const ['openai-codex'],
  groups: const [
    ProviderGroup('openai-codex', 'ChatGPT', [
      ModelInfo(provider: 'openai-codex', id: 'gpt-5.1-codex', name: 'GPT-5.1 Codex'),
      ModelInfo(provider: 'openai-codex', id: 'gpt-5.1', name: 'gpt-5.1'),
    ]),
  ],
  failures: const [],
);

/// A page with one button that opens the sign-in sheet and shows its result.
class _Opener extends StatefulWidget {
  const _Opener({this.subscription = Subscription.chatgpt});

  final Subscription subscription;

  @override
  State<_Opener> createState() => _OpenerState();
}

class _OpenerState extends State<_Opener> {
  String result = 'none';

  @override
  Widget build(BuildContext context) => Scaffold(
    body: Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text('result: $result'),
          TextButton(
            onPressed: () async {
              final ok = await showSubscriptionLogin(context, widget.subscription);
              setState(() => result = '$ok');
            },
            child: const Text('open'),
          ),
        ],
      ),
    ),
  );
}

Future<void> _pump(WidgetTester tester, Widget home, List<Override> overrides, {double height = 900}) async {
  await tester.runAsync(loadGoldenFonts);
  tester.view.devicePixelRatio = 2;
  tester.view.physicalSize = Size(390 * 2, height * 2);
  tester.view.padding = const FakeViewPadding(top: 64, bottom: 48);
  tester.view.viewPadding = const FakeViewPadding(top: 64, bottom: 48);
  addTearDown(tester.view.reset);
  await tester.pumpWidget(goldenApp(home: home, brightness: Brightness.light, overrides: overrides));
  await settle(tester);
}

/// Opens the sheet against [bridge]; returns the browser fake.
Future<FakeBrowser> _openSheet(
  WidgetTester tester,
  FakeSubscriptionBackend bridge, {
  Subscription subscription = Subscription.chatgpt,
}) async {
  final browser = FakeBrowser();
  await _pump(tester, _Opener(subscription: subscription), [
    ...providerOverrides(FakeProviderBackend(), subscriptions: bridge),
    accountBrowserProvider.overrideWithValue(browser),
  ]);
  await tester.tap(find.text('open'));
  await settle(tester);
  return browser;
}

List<String> _mockClipboard(WidgetTester tester) {
  final copied = <String>[];
  tester.binding.defaultBinaryMessenger.setMockMethodCallHandler(SystemChannels.platform, (call) async {
    if (call.method == 'Clipboard.setData') copied.add((call.arguments as Map)['text'] as String);
    return null;
  });
  addTearDown(() => tester.binding.defaultBinaryMessenger.setMockMethodCallHandler(SystemChannels.platform, null));
  return copied;
}

void main() {
  group('rows', () {
    testWidgets('Grok appears as a subscription and opens its login sheet', (tester) async {
      final bridge = FakeSubscriptionBackend();
      await _pump(tester, const ProvidersPage(), providerOverrides(FakeProviderBackend(), subscriptions: bridge));
      expect(find.text('Grok'), findsOneWidget);
      expect(find.text('X'), findsOneWidget);
      await tester.tap(find.text('Grok'));
      await settle(tester);
      expect(find.text('登录 Grok'), findsOneWidget);
      expect(bridge.calls, contains('begin:xai'));
    });

    testWidgets('signed in shows the account; signed out a 登录 capsule', (tester) async {
      final bridge = FakeSubscriptionBackend(statuses: _signedInChatGpt);
      await _pump(
        tester,
        const ProvidersPage(),
        providerOverrides(
          FakeProviderBackend(
            profiles: const [
              gateway,
              // The bridge's own route: shown as the subscription, not again.
              ProviderProfile(route: 'openai-codex', displayName: 'ChatGPT'),
            ],
            displayNameOnlyRoutes: const {'openai-codex'},
            credentials: const {'CUSTOM_MYGW_API_KEY': 'k'},
          ),
          subscriptions: bridge,
        ),
      );
      expect(find.text('订阅'), findsOneWidget);
      expect(find.text('已登录 · me@example.com'), findsOneWidget);
      expect(find.widgetWithText(FilledButton, '登录'), findsOneWidget);
      final titles = [
        for (final row in tester.widgetList<ListPageRow>(find.byType(ListPageRow)))
          row.title ?? row.spot?.title(appL10n),
      ];
      expect(titles, ['DeepSeek', 'ChatGPT', 'Claude', 'My Gateway', '添加渠道']);
      // Plain letters, no brand marks: 「G」 and 「C」.
      expect(find.text('G'), findsOneWidget);
      expect(find.text('C'), findsOneWidget);
    });

    testWidgets('no bridge on the engine: no rows, no gap', (tester) async {
      await _pump(
        tester,
        const ProvidersPage(),
        providerOverrides(FakeProviderBackend(), subscriptions: FakeSubscriptionBackend(available: false)),
      );
      expect(find.text('订阅'), findsNothing);
      expect(find.text('ChatGPT'), findsNothing);
      expect(find.text('Claude'), findsNothing);
      expect(find.text('Grok'), findsNothing);
    });

    testWidgets('the 登录 capsule ends 16 in, centred on the row', (tester) async {
      await _pump(
        tester,
        const ProvidersPage(),
        providerOverrides(FakeProviderBackend(), subscriptions: FakeSubscriptionBackend()),
      );
      final row = tester.getRect(find.widgetWithText(ListPageRow, 'Claude'));
      final card = tester.getRect(find.ancestor(of: find.text('Claude'), matching: find.byType(Material)).first);
      final capsule = tester.getRect(
        find.descendant(
          of: find.widgetWithText(ListPageRow, 'Claude'),
          matching: find.widgetWithText(FilledButton, '登录'),
        ),
      );
      expect(card.right - capsule.right, moreOrLessEquals(16, epsilon: 0.6));
      expect(capsule.center.dy, moreOrLessEquals(row.center.dy, epsilon: 0.6));
      expect(capsule.height, moreOrLessEquals(LoginCapsule.height, epsilon: 0.6));
      expect(row.height, moreOrLessEquals(52, epsilon: 0.6));
    });
  });

  group('sheet', () {
    testWidgets('open: the browser opens once, polling every second, reopen and copy', (tester) async {
      final copied = _mockClipboard(tester);
      final bridge = FakeSubscriptionBackend(
        steps: const [LoginStep(phase: LoginPhase.open, url: _url)],
      );
      final browser = await _openSheet(tester, bridge);
      expect(find.text('登录 ChatGPT'), findsOneWidget);
      expect(find.text('在浏览器中完成登录'), findsOneWidget);
      expect(bridge.calls.first, 'begin:openai-codex');
      expect(browser.opened, [Uri.parse(_url)]);

      final before = bridge.polls;
      await tester.pump(const Duration(seconds: 1));
      await tester.pump(const Duration(seconds: 1));
      expect(bridge.polls, before + 2);
      expect(browser.opened, hasLength(1), reason: 'the same URL is not reopened by itself');

      await tester.tap(find.text('重新打开'));
      await tester.pump();
      expect(browser.opened, hasLength(2));
      await tester.tap(find.text('复制链接'));
      await tester.pump();
      expect(copied, [_url]);
      expect(find.text('已复制'), findsOneWidget);
      await tester.pump(const Duration(seconds: 2));
      expect(find.text('复制链接'), findsOneWidget);

      // Closing stops polling and cancels the attempt.
      await tester.tap(find.byTooltip('关闭'));
      await settle(tester);
      expect(bridge.calls, contains('cancel:att-1'));
      final after = bridge.polls;
      await tester.pump(const Duration(seconds: 3));
      expect(bridge.polls, after);
      expect(find.text('result: false'), findsOneWidget);
    });

    testWidgets('open: the waiting line is centred as one unit; the buttons mirror', (tester) async {
      await _openSheet(
        tester,
        FakeSubscriptionBackend(
          steps: const [LoginStep(phase: LoginPhase.open, url: _url)],
        ),
      );
      final sheet = tester.getRect(find.byType(SubscriptionLoginSheet));
      final title = tester.getRect(find.text('在浏览器中完成登录'));
      final spinner = tester.getRect(
        find.descendant(of: find.byType(SubscriptionLoginSheet), matching: find.byType(CircularProgressIndicator)),
      );
      final text = tester.getRect(find.text('等待登录…'));
      final unitCentre = (spinner.left + text.right) / 2;
      expect(unitCentre, moreOrLessEquals(sheet.center.dx, epsilon: 0.6));
      expect(title.center.dx, moreOrLessEquals(sheet.center.dx, epsilon: 0.6));
      expect(spinner.center.dy, moreOrLessEquals(text.center.dy, epsilon: 1));
      final reopen = tester.getRect(find.widgetWithText(OutlinedButton, '重新打开'));
      final copy = tester.getRect(find.widgetWithText(OutlinedButton, '复制链接'));
      expect(reopen.width, moreOrLessEquals(copy.width, epsilon: 0.6));
      expect(reopen.left - sheet.left, moreOrLessEquals(20, epsilon: 0.6));
      expect(sheet.right - copy.right, moreOrLessEquals(20, epsilon: 0.6));
      expect(reopen.top, moreOrLessEquals(copy.top, epsilon: 0.6));
      expect(reopen.height, 48);
      expect(copy.height, 48);
      expect(copy.left - reopen.right, 12);
    });

    testWidgets('a browser that cannot open says so in place', (tester) async {
      final bridge = FakeSubscriptionBackend(
        steps: const [LoginStep(phase: LoginPhase.open, url: _url)],
      );
      final browser = FakeBrowser(succeeds: false);
      await _pump(tester, const _Opener(), [
        ...providerOverrides(FakeProviderBackend(), subscriptions: bridge),
        accountBrowserProvider.overrideWithValue(browser),
      ]);
      await tester.tap(find.text('open'));
      await settle(tester);
      expect(find.text('没能打开浏览器'), findsOneWidget);
    });

    testWidgets('Grok device login: the code, copy it, open the verification page', (tester) async {
      final copied = _mockClipboard(tester);
      final bridge = FakeSubscriptionBackend(
        steps: const [
          LoginStep(phase: LoginPhase.device, url: 'https://accounts.x.ai/oauth2/device', userCode: 'WDJB-MJHT'),
        ],
      );
      final browser = await _openSheet(tester, bridge, subscription: Subscription.grok);
      expect(find.text('登录 Grok'), findsOneWidget);
      expect(bridge.calls, contains('begin:xai'));
      expect(find.text('WDJB-MJHT'), findsOneWidget);
      expect(browser.opened, isEmpty, reason: 'the code comes first');
      await tester.tap(find.text('复制验证码'));
      await tester.pump();
      expect(copied, ['WDJB-MJHT']);
      await tester.tap(find.text('打开验证页'));
      await tester.pump();
      expect(browser.opened, [Uri.parse('https://accounts.x.ai/oauth2/device')]);
    });

    testWidgets('prompt: paste, 确定 answers, then done closes the sheet and refreshes', (tester) async {
      final bridge = FakeSubscriptionBackend(
        steps: const [
          LoginStep(phase: LoginPhase.prompt, message: 'Paste the authorization code', placeholder: 'code#state'),
          LoginStep(phase: LoginPhase.done),
        ],
      );
      await _openSheet(tester, bridge);
      expect(find.text('粘贴授权码'), findsOneWidget);
      expect(find.text('Paste the authorization code'), findsNothing, reason: 'flow text shows only when localized');
      expect(promptTitle('Paste the redirect URL'), '粘贴跳转后的链接');
      expect(promptTitle(null), '粘贴授权码');
      final ok = find.widgetWithText(FilledButton, '确定');
      expect(tester.widget<FilledButton>(ok).onPressed, isNull, reason: 'nothing to send yet');
      await tester.enterText(find.byType(TextField), '  abc#xyz ');
      await tester.pump();
      await tester.tap(ok);
      await settle(tester);
      expect(bridge.calls, contains('answer:att-1:abc#xyz'));
      expect(find.text('已登录'), findsOneWidget);
      await tester.pump(SubscriptionLoginSheet.doneDwell);
      await settle(tester);
      expect(find.byType(SubscriptionLoginSheet), findsNothing);
      expect(find.text('result: true'), findsOneWidget);
      expect(bridge.calls, isNot(contains('cancel:att-1')), reason: 'a finished attempt is not cancelled');
    });

    testWidgets('failed: the reason and 再试一次 starts a new attempt', (tester) async {
      final bridge = FakeSubscriptionBackend(
        steps: const [LoginStep(phase: LoginPhase.failed, error: '授权已过期')],
      );
      await _openSheet(tester, bridge);
      expect(find.text('登录没有完成'), findsOneWidget);
      expect(find.text('授权已过期'), findsOneWidget);
      final polls = bridge.polls;
      await tester.pump(const Duration(seconds: 2));
      expect(bridge.polls, polls, reason: 'a finished attempt is not polled');
      bridge.steps = const [LoginStep(phase: LoginPhase.open, url: _url)];
      await tester.tap(find.text('再试一次'));
      await settle(tester);
      expect(bridge.calls.where((c) => c.startsWith('begin')), hasLength(2));
      expect(find.text('在浏览器中完成登录'), findsOneWidget);
    });

    testWidgets('cancelled reads as such; a bridge that refuses to begin fails in place', (tester) async {
      await _openSheet(tester, FakeSubscriptionBackend(steps: const [LoginStep(phase: LoginPhase.cancelled)]));
      expect(find.text('登录已取消'), findsOneWidget);
      expect(find.text('再试一次'), findsOneWidget);
    });

    testWidgets('begin refused', (tester) async {
      final bridge = FakeSubscriptionBackend()
        ..beginError = const DshRemoteException('gateway/internal', 'could not reach https://auth.example.com');
      await _openSheet(tester, bridge);
      expect(find.text('登录没有完成'), findsOneWidget);
      expect(find.text('连不上登录服务，检查网络后重试'), findsOneWidget);
    });
  });

  test('unrecognized login errors use local copy', () {
    expect(describeLoginError(const DshRemoteException('gateway/internal', 'secret raw error')), '没能完成登录，再试一次');
  });

  group('session', () {
    test('three failed polls in a row give up; one recovers', () async {
      final bridge = _FlakyBridge(failures: 3);
      final session = LoginSession(bridge, Subscription.claude, interval: Duration.zero);
      await session.start();
      for (var i = 0; i < 10 && !session.step.phase.finished; i++) {
        await Future<void>.delayed(const Duration(milliseconds: 5));
      }
      expect(session.step.phase, LoginPhase.failed);
      session.dispose();

      final flaky = _FlakyBridge(failures: 1);
      final ok = LoginSession(flaky, Subscription.claude, interval: Duration.zero);
      await ok.start();
      for (var i = 0; i < 10 && !ok.step.phase.finished; i++) {
        await Future<void>.delayed(const Duration(milliseconds: 5));
      }
      expect(ok.step.phase, LoginPhase.done);
      ok.dispose();
    });
  });

  group('signed-in page', () {
    testWidgets('Grok shows models from the xai route', (tester) async {
      await _pump(tester, const SubscriptionPage(subscription: Subscription.grok), [
        ...providerOverrides(
          FakeProviderBackend(),
          subscriptions: FakeSubscriptionBackend(
            statuses: const [SubscriptionStatus(subscription: Subscription.grok, signedIn: true)],
          ),
        ),
        modelCatalogProvider.overrideWith(
          (ref) async => ModelCatalog(
            defaultSelection: null,
            routableProviders: const ['xai'],
            groups: const [
              ProviderGroup('xai', 'Grok', [ModelInfo(provider: 'xai', id: 'grok-4.7', name: 'Grok 4.7')]),
            ],
            failures: const [],
          ),
        ),
      ]);
      expect(find.text('Grok 4.7'), findsOneWidget);
      expect(find.text('退出登录'), findsOneWidget);
    });

    testWidgets('account, the models it brings, sign out with a confirm', (tester) async {
      final bridge = FakeSubscriptionBackend(statuses: [..._signedInChatGpt]);
      await _pump(tester, const _PageOpener(), [
        ...providerOverrides(FakeProviderBackend(), subscriptions: bridge),
        modelCatalogProvider.overrideWith((ref) async => _codexCatalog),
      ]);
      await tester.tap(find.text('open'));
      await settle(tester);
      expect(find.text('me@example.com'), findsOneWidget);
      expect(find.text('模型 · 2'), findsOneWidget);
      expect(find.text('GPT-5.1 Codex'), findsOneWidget);
      expect(find.text('gpt-5.1-codex'), findsOneWidget);

      await tester.tap(find.text('退出登录'));
      await settle(tester);
      expect(find.text('退出 ChatGPT？'), findsOneWidget);
      expect(find.text(appL10n.engineSubscriptionSignOutBody), findsNothing);
      await tester.tap(find.text('取消'));
      await settle(tester);
      expect(bridge.calls, isNot(contains('signOut:openai-codex')));

      await tester.tap(find.text('退出登录'));
      await settle(tester);
      await tester.tap(find.widgetWithText(FilledButton, '退出登录'));
      await settle(tester);
      expect(bridge.calls, contains('signOut:openai-codex'));
      expect(find.byType(SubscriptionPage), findsNothing);
    });
  });
}

class _PageOpener extends StatelessWidget {
  const _PageOpener();

  @override
  Widget build(BuildContext context) => Scaffold(
    body: Center(
      child: TextButton(
        onPressed: () => Navigator.of(context)
            .push(MaterialPageRoute<void>(builder: (_) => const SubscriptionPage(subscription: Subscription.chatgpt))),
        child: const Text('open'),
      ),
    ),
  );
}

/// Polls fail [failures] times, then the attempt is done.
class _FlakyBridge extends FakeSubscriptionBackend {
  _FlakyBridge({required this.failures});

  int failures;

  @override
  Future<LoginStep> poll(String attemptId) async {
    if (failures-- > 0) throw const DshTransportException('timeout');
    return const LoginStep(phase: LoginPhase.done);
  }
}
