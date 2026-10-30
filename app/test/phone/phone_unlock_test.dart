// 设置 › 手机操控 › 解除限制 and what points at it: the three rules off by
// default, turning one on only through the confirmation page and a 1.5 s
// hold (never during a task), off in one tap; 确认方式's 「这些由你来操作」;
// the main page's 「已解除限制」 tag.

import 'package:dsh_app/phone/phone_channel.dart';
import 'package:dsh_app/ui/phone/app_rules_page.dart';
import 'package:dsh_app/ui/phone/hold_to_confirm.dart';
import 'package:dsh_app/ui/phone/phone_control_screen.dart';
import 'package:dsh_app/ui/phone/phone_unlock_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/semantics.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'harness.dart';
import 'support.dart';

Map<String, Object?> lifted({bool system = false, bool secrets = false, bool ownApp = false}) => {
  ...defaultPolicies(),
  'unlocks': {'systemPages': system, 'secretFields': secrets, 'ownApp': ownApp},
};

Switch switchOf(WidgetTester tester, PhoneUnlock unlock) => tester.widget<Switch>(
  find.descendant(of: find.byKey(ValueKey('unlock-${unlock.name}')), matching: find.byType(Switch)),
);

List<Object?> unlockWrites(FakePhoneNative native) => [
  for (final c in native.callsOf('setPolicies')) (c.arguments as Map)['unlocks'],
];

Future<void> hold(WidgetTester tester, Duration how) async {
  final gesture = await tester.startGesture(tester.getCenter(find.byType(HoldToConfirmButton)));
  // The fill's clock starts on the first frame after the press.
  await tester.pump();
  await tester.pump(how);
  await gesture.up();
  await settlePhone(tester);
  await tester.pumpAndSettle();
}

void main() {
  setUp(() => SharedPreferences.setMockInitialValues({}));

  group('the page', () {
    testWidgets('all three off by default, with the 不碰 list next door', (tester) async {
      await pumpPhone(tester, const PhoneUnlockPage());
      expect(find.text('解除限制'), findsWidgets);
      for (final (unlock, title, hint) in [
        (PhoneUnlock.systemPages, '系统设置', '含权限页、安装器、安全中心、通知栏'),
        (PhoneUnlock.secretFields, '密码和验证码', '填写密码、验证码和支付密码'),
        (PhoneUnlock.ownApp, 'DSH Go 自身', '在 DSH Go 里点按和输入'),
      ]) {
        expect(find.text(title), findsOneWidget);
        expect(find.text(hint), findsOneWidget);
        expect(switchOf(tester, unlock).value, isFalse);
      }
      expect(find.text('解除限制会扩大 AI 的操作权限，可能造成不可逆损失。仅在需要时开启，用完关闭。'), findsOneWidget);
      await tester.tap(find.text('银行、支付类 App'));
      await tester.pumpAndSettle();
      expect(find.byType(PhoneAppRulesPage), findsOneWidget);
    });

    testWidgets('on: the confirmation page; a tap or a short press does nothing, 1.5 s does', (tester) async {
      final h = await pumpPhone(tester, const PhoneUnlockPage());
      await tester.tap(find.byKey(const ValueKey('unlock-secretFields')));
      await tester.pumpAndSettle();
      expect(find.byType(PhoneUnlockConfirmPage), findsOneWidget);
      expect(find.text('允许 AI 填写密码和验证码？'), findsWidgets);
      for (final line in [
        '开启后，AI 可以',
        '在密码、验证码和支付密码框里输入',
        '操作记录里只显示 ••••，不记下填写的内容',
        '可能出什么事',
        '恶意指令可能诱导 AI 把验证码填到别处，让他人登录你的账号',
        '免责声明',
        '解除限制后，AI 可能不经逐步确认便执行上述高风险操作。',
        'AI 可能误判界面，或被网页、消息与文件中的恶意指令诱导。',
        '可能造成账号、资金、数据、设备或隐私损失，请自行核对重要操作及结果。',
        '软件按现状提供；免责仅在适用法律允许范围内有效，不影响依法不得排除的责任。',
        '仅在自有或获授权的设备上临时开启，用后关闭；请勿在存有真实支付信息的主力机上测试。',
        '我了解风险，开启',
        '按住按钮约 1.5 秒',
      ]) {
        expect(find.text(line), findsWidgets, reason: line);
      }

      await tester.tap(find.byType(HoldToConfirmButton));
      await tester.pumpAndSettle();
      await hold(tester, const Duration(milliseconds: 1000));
      expect(unlockWrites(h.native!), isEmpty);
      expect(find.byType(PhoneUnlockConfirmPage), findsOneWidget);

      await hold(tester, const Duration(milliseconds: 1600));
      expect(unlockWrites(h.native!), [
        {'secretFields': true},
      ]);
      // Nothing else rides along with it.
      expect((h.native!.callsOf('setPolicies').single.arguments as Map).keys, ['unlocks']);
      expect(find.byType(PhoneUnlockConfirmPage), findsNothing);
      expect(switchOf(tester, PhoneUnlock.secretFields).value, isTrue);
      expect(switchOf(tester, PhoneUnlock.systemPages).value, isFalse);
      expect(find.text('已开启「密码和验证码」'), findsOneWidget);
    });

    for (final off in [false, true]) {
      testWidgets('the hold is 1.5 s of real time with the system\'s remove animations ${off ? 'on' : 'off'}', (tester) async {
        tester.platformDispatcher.accessibilityFeaturesTestValue = FakeAccessibilityFeatures(disableAnimations: off);
        addTearDown(tester.platformDispatcher.clearAccessibilityFeaturesTestValue);
        final h = await pumpPhone(tester, const PhoneUnlockConfirmPage(unlock: PhoneUnlock.secretFields));
        expect(SemanticsBinding.instance.disableAnimations, off);
        for (final ms in [100, 300, 1000]) {
          await hold(tester, Duration(milliseconds: ms));
          expect(unlockWrites(h.native!), isEmpty, reason: '$ms ms');
        }
        await hold(tester, const Duration(milliseconds: 1600));
        expect(unlockWrites(h.native!), [
          {'secretFields': true},
        ]);
      });
    }

    testWidgets('the hold is not an accessibility action: no tap or long press to fire it', (tester) async {
      await pumpPhone(tester, const PhoneUnlockConfirmPage(unlock: PhoneUnlock.systemPages));
      final node = tester.getSemantics(find.byType(HoldToConfirmButton));
      expect(node.label, '我了解风险，开启');
      expect(node.hint, '按住按钮约 1.5 秒');
      expect(node.getSemanticsData().hasAction(SemanticsAction.tap), isFalse);
      expect(node.getSemanticsData().hasAction(SemanticsAction.longPress), isFalse);
    });

    testWidgets('off: one tap, no page', (tester) async {
      final h = await pumpPhone(tester, const PhoneUnlockPage(), native: FakePhoneNative(policies: lifted(system: true)));
      expect(switchOf(tester, PhoneUnlock.systemPages).value, isTrue);
      await tester.tap(find.byKey(const ValueKey('unlock-systemPages')));
      await settlePhone(tester);
      await tester.pumpAndSettle();
      expect(find.byType(PhoneUnlockConfirmPage), findsNothing);
      expect(unlockWrites(h.native!), [
        {'systemPages': false},
      ]);
      expect(switchOf(tester, PhoneUnlock.systemPages).value, isFalse);
      expect(find.text('已关闭「系统设置」'), findsOneWidget);
    });

    testWidgets('during a task: nothing turns on, but anything turns off', (tester) async {
      final native = FakePhoneNative(
        status: phoneStatus(a11y: true, taskActive: true, taskApp: '设置'),
        policies: lifted(ownApp: true),
      );
      await pumpPhone(tester, const PhoneUnlockPage(), native: native);
      expect(find.byKey(const ValueKey('unlock-busy')), findsOneWidget);
      await tester.tap(find.byKey(const ValueKey('unlock-systemPages')));
      await tester.pumpAndSettle();
      expect(find.byType(PhoneUnlockConfirmPage), findsNothing);
      expect(find.text('任务进行中，结束后才能开启'), findsWidgets);
      expect(unlockWrites(native), isEmpty);

      await tester.tap(find.byKey(const ValueKey('unlock-ownApp')));
      await settlePhone(tester);
      expect(unlockWrites(native), [
        {'ownApp': false},
      ]);
    });

    testWidgets('a task that starts while the page is open: the hold goes dead', (tester) async {
      final h = await pumpPhone(tester, const PhoneUnlockConfirmPage(unlock: PhoneUnlock.ownApp));
      h.native!.push(phoneStatus(a11y: true, taskActive: true));
      await settlePhone(tester);
      expect(tester.widget<HoldToConfirmButton>(find.byType(HoldToConfirmButton)).enabled, isFalse);
      expect(find.text('任务进行中，结束后才能开启'), findsOneWidget);
      await hold(tester, const Duration(milliseconds: 1600));
      expect(unlockWrites(h.native!), isEmpty);
    });

    testWidgets('a task that started since the last read: the write is refused at the last moment', (tester) async {
      final h = await pumpPhone(tester, const PhoneUnlockConfirmPage(unlock: PhoneUnlock.secretFields));
      // The native side knows; no event reached the page yet.
      h.native!.status = phoneStatus(a11y: true, taskActive: true);
      await hold(tester, const Duration(milliseconds: 1600));
      expect(unlockWrites(h.native!), isEmpty);
      expect(find.byType(PhoneUnlockConfirmPage), findsOneWidget);
    });

    testWidgets('a refused write keeps the page, says so, and the hold can be tried again', (tester) async {
      final h = await pumpPhone(tester, const PhoneUnlockConfirmPage(unlock: PhoneUnlock.systemPages));
      h.native!.accept = false;
      await hold(tester, const Duration(milliseconds: 1600));
      expect(find.byType(PhoneUnlockConfirmPage), findsOneWidget);
      expect(find.text('没改成，稍后再试'), findsOneWidget);
      h.native!.accept = true;
      await hold(tester, const Duration(milliseconds: 1600));
      expect(unlockWrites(h.native!).last, {'systemPages': true});
    });
  });

  group('手机操控', () {
    testWidgets('nothing lifted: no tag, the usual footnote, 未开启 on the row', (tester) async {
      await pumpPhone(tester, const PhoneControlScreen());
      expect(find.byType(UnlockedTag), findsNothing);
      expect(find.text('密码、验证码、付款和系统设置都由你来'), findsOneWidget);
      expect(find.text('均未开启'), findsOneWidget);
    });

    testWidgets('something lifted: the tag under the overview opens 解除限制', (tester) async {
      await pumpPhone(tester, const PhoneControlScreen(), native: FakePhoneNative(policies: lifted(secrets: true, ownApp: true)));
      expect(find.byType(UnlockedTag), findsOneWidget);
      expect(find.text('已解除限制'), findsOneWidget);
      expect(find.text('已开启 2 项'), findsOneWidget);
      expect(find.text('密码、验证码、付款和系统设置都由你来'), findsNothing);
      await tester.tap(find.byType(UnlockedTag));
      await tester.pumpAndSettle();
      expect(find.byType(PhoneUnlockPage), findsOneWidget);
    });

    testWidgets('确认方式 says what stays with you, and where each is changed', (tester) async {
      await pumpPhone(tester, const PhoneControlScreen());
      await tester.ensureVisible(find.text('确认方式'));
      await tester.pumpAndSettle();
      await tester.tap(find.text('确认方式'));
      await tester.pumpAndSettle();
      final yours = find.byKey(const ValueKey('confirm-yours'));
      expect(find.descendant(of: yours, matching: find.text('这些由你来操作')), findsOneWidget);
      for (final line in ['系统设置和权限页面', '密码和验证码', 'DSH Go 自身', '应用名单里「不碰」的 App，默认含银行、支付类']) {
        expect(find.descendant(of: yours, matching: find.text(line)), findsOneWidget, reason: line);
      }
      expect(find.descendant(of: yours, matching: find.text('应用名单')), findsOneWidget);
      await tester.tap(find.descendant(of: yours, matching: find.text('解除限制')));
      await tester.pumpAndSettle();
      expect(find.byType(PhoneUnlockPage), findsOneWidget);
    });

    testWidgets('a lifted rule drops out of that list', (tester) async {
      await pumpPhone(tester, const PhoneControlScreen(), native: FakePhoneNative(policies: lifted(system: true)));
      await tester.ensureVisible(find.text('确认方式'));
      await tester.pumpAndSettle();
      await tester.tap(find.text('确认方式'));
      await tester.pumpAndSettle();
      final yours = find.byKey(const ValueKey('confirm-yours'));
      expect(find.descendant(of: yours, matching: find.text('系统设置和权限页面')), findsNothing);
      expect(find.descendant(of: yours, matching: find.text('密码和验证码')), findsOneWidget);
      await tester.tap(find.descendant(of: yours, matching: find.text('应用名单')));
      await tester.pumpAndSettle();
      expect(find.byType(PhoneAppRulesPage), findsOneWidget);
    });
  });

  test('wire: only an explicit true lifts a rule, and the rules never ride along', () {
    expect(PhonePolicies.fromMap({}).unlocks, isEmpty);
    expect(
      PhonePolicies.fromMap({
        'unlocks': {'systemPages': 'true', 'secretFields': 1, 'ownApp': true},
      }).unlocks,
      {PhoneUnlock.ownApp},
    );
    final p = PhonePolicies.fromMap(lifted(system: true, secrets: true));
    expect(p.unlocks, {PhoneUnlock.systemPages, PhoneUnlock.secretFields});
    expect(p.toWire().containsKey('unlocks'), isFalse);
    expect(p.withConfirmMode(PhoneConfirmMode.always).unlocks, p.unlocks);
    expect(p.withRule('a.b', AppRule.deny).unlocks, p.unlocks);
    expect(p.withUnlock(PhoneUnlock.systemPages, false).unlocks, {PhoneUnlock.secretFields});
  });
}
