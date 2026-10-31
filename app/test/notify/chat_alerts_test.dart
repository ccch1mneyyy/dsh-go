// Which host events become alerts, and when they are withdrawn
// (lib/notify/chat_alerts.dart).

import 'package:dsh_app/state/hosts_state.dart';
import 'package:dsh_app/state/notify_state.dart';
import 'package:dsh_app/notify/chat_alerts.dart';
import 'package:dsh_app/l10n/l10n.dart';
import 'package:dsh_client/dsh_client.dart';
import 'package:flutter_test/flutter_test.dart';

import 'support.dart';

class _Recorder {
  final alerts = <ChatAlert>[];
  final withdrawn = <(String, String)>[];
  final gone = <String>[];
}

void main() {
  late FakeAlertSource source;
  late _Recorder out;
  HostAlertTracker? tracker;

  HostAlertTracker start({
    Duration announce = Duration.zero,
    Duration reconcile = const Duration(milliseconds: 30),
    bool Function(String)? skipApproval,
  }) {
    final next = HostAlertTracker(
      host: HostRef.local,
      source: source,
      onAlert: out.alerts.add,
      onWithdraw: (host, session, key) => out.withdrawn.add((session, key)),
      onSessionGone: (host, session) => out.gone.add(session),
      skipApproval: skipApproval,
      announceDelay: announce,
      reconcileDelay: reconcile,
    );
    tracker = next..start();
    return next;
  }

  setUp(() {
    source = FakeAlertSource()
      ..sessions = [
        session('s1', title: '修复登录按钮'),
        session('s2', title: '给设置页加深色模式'),
        session('sub1', title: '子任务', parent: 's1'),
      ];
    out = _Recorder();
    tracker = null;
  });

  tearDown(() => tracker?.dispose());

  test('approval notification prefers the displayed language reason', () {
    const request = ApprovalRequest(
      eventId: 'approval',
      sessionId: 's1',
      toolName: 'bash',
      reason: 'fallback reason',
      displayReason: {'en': 'English reason', 'pt-BR': 'Motivo em português'},
    );
    const blankPortuguese = ApprovalRequest(
      eventId: 'approval-blank',
      sessionId: 's1',
      toolName: 'bash',
      reason: 'fallback reason',
      displayReason: {'en': 'English reason', 'pt-BR': '   '},
    );
    final previous = AppLocale.current;
    try {
      AppLocale.use(AppLocale.en);
      expect(approvalText(request), contains('English reason'));
      AppLocale.use(AppLocale.ptBR);
      expect(approvalText(request), contains('Motivo em português'));
      expect(approvalText(blankPortuguese), contains('English reason'));
    } finally {
      AppLocale.use(previous);
    }
  });

  group('requests', () {
    test('an approval alerts once, with the card verb and reason', () async {
      start();
      source.emit(approval('e1', 's1', reason: 'escalate to full access'));
      await settle();
      expect(out.alerts, hasLength(1));
      final alert = out.alerts.single;
      expect(alert.kind, AlertKind.approval);
      expect(alert.sessionId, 's1');
      expect(alert.key, 'e1');
      expect(alert.eventId, 'e1');
      expect(alert.title, '修复登录按钮');
      expect(alert.text, '等你确认：运行命令 · escalate to full access');

      // Redelivered (reconnect) with the same eventId: no second alert.
      source.emit(approval('e1', 's1'));
      await settle();
      expect(out.alerts, hasLength(1));
    });

    test('a question alerts with its first question and the count', () async {
      start();
      source.emit(question('q1', 's2', ['用 SQLite 还是 Postgres？', '要不要加索引？']));
      await settle();
      expect(out.alerts.single.kind, AlertKind.question);
      expect(out.alerts.single.text, '问你：用 SQLite 还是 Postgres？（共 2 个）');
    });

    test('answered anywhere: the alert is withdrawn', () async {
      start();
      source.emit(approval('e1', 's1'));
      await settle();
      source.emit(const HostRequestCancelledEvent('e1'));
      expect(out.withdrawn, [('s1', 'e1')]);
      // Unknown ids (another client's, or never alerted) are ignored.
      source.emit(const HostRequestCancelledEvent('zzz'));
      expect(out.withdrawn, hasLength(1));
    });

    test('answered within the grace period: never alerts', () async {
      start(announce: const Duration(milliseconds: 40));
      source.emit(approval('e1', 's1'));
      await settle();
      source.emit(const HostRequestCancelledEvent('e1'));
      await Future<void>.delayed(const Duration(milliseconds: 60));
      expect(out.alerts, isEmpty);
    });

    test('auto-approved conversations: no approval alert, questions still alert', () async {
      start(skipApproval: (s) => s == 's1');
      source.emit(approval('e1', 's1'));
      source.emit(question('q1', 's1', ['继续吗？']));
      await settle();
      expect(out.alerts.map((a) => a.kind), [AlertKind.question]);
    });

    test('a subagent request opens its top-level conversation', () async {
      start();
      source.emit(approval('e1', 'sub1', tool: 'write'));
      await settle();
      expect(out.alerts.single.sessionId, 's1');
      expect(out.alerts.single.title, '修复登录按钮');
      expect(out.alerts.single.text, '等你确认：写入文件');
      source.emit(const HostRequestCancelledEvent('e1'));
      expect(out.withdrawn, [('s1', 'e1')]);
    });

    test('requests pending before the tracker started still alert', () async {
      source.pending = [approval('e0', 's2')];
      start();
      await settle();
      expect(out.alerts.single.key, 'e0');
    });

    test('after a reconnect, requests not redelivered are withdrawn', () async {
      start();
      source.emit(approval('e1', 's1'));
      source.emit(approval('e2', 's2'));
      await settle();
      source.emit(const HostReadyEvent('client-2', '/root'));
      source.emit(approval('e2', 's2')); // still pending
      await Future<void>.delayed(const Duration(milliseconds: 60));
      expect(out.withdrawn, [('s1', 'e1')]);
      expect(out.alerts, hasLength(2), reason: 'the redelivered one does not alert again');
    });
  });

  group('turn ends', () {
    test('running → idle reads the outcome and alerts once per turn', () async {
      source.outcomes['s1'] = outcome(18, 'completed', reply: '## 好了\n\n登录按钮已改成 **防抖**。', title: '修复登录按钮');
      start();
      source.emit(const SessionStatusEvent('s1', true));
      source.emit(const SessionStatusEvent('s1', false));
      await settle();
      expect(out.alerts, hasLength(1));
      final alert = out.alerts.single;
      expect(alert.kind, AlertKind.done);
      expect(alert.key, turnKey);
      expect(alert.text, '已完成 · 好了 登录按钮已改成 防抖。');

      // A repeated idle edge reporting the same turn/end: deduped by seq.
      source.emit(const SessionStatusEvent('s1', true));
      source.emit(const SessionStatusEvent('s1', false));
      await settle();
      expect(out.alerts, hasLength(1));

      // The next turn alerts again.
      source.outcomes['s1'] = outcome(29, 'completed', reply: 'OK');
      source.emit(const SessionStatusEvent('s1', true));
      source.emit(const SessionStatusEvent('s1', false));
      await settle();
      expect(out.alerts, hasLength(2));
    });

    test('stopped and failed turns have their own words', () async {
      source.outcomes['s1'] = outcome(19, 'aborted', cause: 'user');
      source.outcomes['s2'] = outcome(
        17,
        'error',
        error: const LlmFailure(message: 'no API key', code: 'MISSING_CREDENTIAL'),
      );
      start();
      source.emit(const SessionStatusEvent('s1', false));
      source.emit(const SessionStatusEvent('s2', false));
      await settle();
      expect(
        {for (final a in out.alerts) a.sessionId: (a.kind, a.text)},
        {'s1': (AlertKind.stopped, '已停止'), 's2': (AlertKind.failed, '出错了 · 还没有配置密钥')},
      );
    });

    test('a second idle edge without a running one in between is ignored', () async {
      source.outcomes['s1'] = outcome(18, 'completed');
      start();
      source.emit(const SessionStatusEvent('s1', false));
      source.emit(const SessionStatusEvent('s1', false));
      await settle();
      expect(source.lastTurnCalls, ['s1']);
    });

    test('subagent turns never alert', () async {
      source.outcomes['sub1'] = outcome(5, 'completed');
      start();
      source.emit(const SessionStatusEvent('sub1', true));
      source.emit(const SessionStatusEvent('sub1', false));
      await settle();
      expect(out.alerts, isEmpty);
      expect(source.lastTurnCalls, isEmpty);
    });

    test('unreadable outcome: no alert rather than a wrong one', () async {
      source.outcomes['s1'] = null;
      start();
      source.emit(const SessionStatusEvent('s1', false));
      await settle();
      expect(out.alerts, isEmpty);
    });

    test('a turn that ended while disconnected alerts after the reconnect', () async {
      source.sessions = [session('s1', title: '长任务', running: true)];
      source.outcomes['s1'] = outcome(40, 'completed', reply: '全部测试通过');
      start();
      await settle(); // seeded: s1 running
      source.sessions = [session('s1', title: '长任务')];
      source.emit(const HostReadyEvent('client-2', '/root'));
      await settle();
      expect(out.alerts.single.text, '已完成 · 全部测试通过');
    });

    test('the first seed alone never alerts', () async {
      source.sessions = [session('s1')];
      source.outcomes['s1'] = outcome(3, 'completed');
      start();
      await settle();
      expect(out.alerts, isEmpty);
    });
  });

  test('a removed session withdraws everything of it', () async {
    start();
    source.emit(approval('e1', 's1'));
    await settle();
    source.emit(const SessionRemovedEvent('s1'));
    expect(out.gone, ['s1']);
    // Its request is forgotten: a late cancel withdraws nothing more.
    source.emit(const HostRequestCancelledEvent('e1'));
    expect(out.withdrawn, isEmpty);
  });

  group('outcomeFromEvents', () {
    // Shapes captured from a live `dsh web` 0.2.1-rc.2: a one-message tail
    // of session/page at the projections cut.
    SessionLogEvent ev(int seq, String type, Map<String, Object?> data) =>
        SessionLogEvent.fromJson({'seq': seq, 'time': 1792712155483, 'type': type, 'data': data});

    Map<String, Object?> assistant(String text) => {
      'turn': 1,
      'step': 1,
      'message': {
        'role': 'assistant',
        'content': [
          {'type': 'reasoning', 'text': ''},
          {'type': 'text', 'text': text},
        ],
        'source': {'kind': 'model'},
      },
    };

    test('completed: the reply before turn/end, later bookkeeping ignored', () {
      final result = outcomeFromEvents([
        ev(16, 'assistant/message', assistant('OK done.')),
        ev(17, 'step/end', {'turn': 1, 'step': 1}),
        ev(18, 'turn/end', {
          'turn': 1,
          'reason': {'kind': 'completed'},
        }),
        ev(19, 'session-log-deepseek/delivery-accepted', {}),
        ev(20, 'session/title', {'title': 'x'}),
      ], title: '标题');
      expect(result!.seq, 18);
      expect(result.kind, AlertKind.done);
      expect(result.reply, 'OK done.');
      expect(result.title, '标题');
    });

    test('aborted before any reply', () {
      final result = outcomeFromEvents([
        ev(10, 'user/message', {
          'id': 'u1',
          'role': 'user',
          'content': [
            {'type': 'text', 'text': 'SLOW please'},
          ],
          'source': {'kind': 'user'},
        }),
        ev(17, 'assistant/attempt', {'turn': 1, 'step': 1}),
        ev(19, 'turn/end', {
          'turn': 1,
          'reason': {
            'kind': 'aborted',
            'reason': {'kind': 'user'},
          },
        }),
      ]);
      expect(result!.kind, AlertKind.stopped);
      expect(result.reason.cancelCause, 'user');
      expect(result.reply, isNull);
      expect(result.text, '已停止');
    });

    test('no turn/end in the page: null', () {
      expect(outcomeFromEvents([ev(3, 'step/end', {})]), isNull);
    });
  });

  group('copy', () {
    test('snippet flattens markdown and caps the length', () {
      expect(snippet('# 标题\n\n- 第一项\n- **第二项** 用 `flutter test`'), '标题 第一项 第二项 用 flutter test');
      expect(snippet('   '), isNull);
      final long = snippet('字' * 200)!;
      expect(long.runes.length, 121);
      expect(long.endsWith('…'), isTrue);
    });

    test('reply secrets retain only their first eight characters', () {
      const key = 'sk-1234567890abcdefghijklmnopqrstuvwxyz';
      expect(snippet('回复 $key'), '回复 sk-12345••••••');
      expect(outcome(1, 'completed', reply: key).text, isNot(contains(key.substring(8))));
    });

    test('secrets crossing the snippet boundary are masked before truncation', () {
      const key = 'sk-1234567890abcdefghijklmnopqrstuvwxyz';
      final text = snippet('${'字' * 110}$key')!;
      expect(text, isNot(contains('67890')));
      expect(text, isNot(contains(key.substring(8))));
    });

    test('notification titles mask credentials', () {
      const key = 'sk-1234567890abcdefghijklmnopqrstuvwxyz';
      expect(alertTitle('部署 $key'), '部署 sk-12345••••••');
    });

    test('every kind has a lock-screen line without content', () {
      expect(AlertKind.values.map((k) => k.publicText), ['有一轮完成了', '有一轮出错了', '有一轮停下了', '有一步等你确认', '有个问题等你回答']);
      expect(AlertKind.values.where((k) => k.attention), [AlertKind.approval, AlertKind.question]);
    });

    test('turn texts for the rarer endings', () {
      expect(outcome(1, 'max-tokens').text, '已结束 · 达到单次输出长度上限');
      expect(outcome(1, 'interrupted').text, '已中断 · 引擎重启过');
      expect(outcome(1, 'interrupted').kind, AlertKind.failed);
      expect(outcome(1, 'blocked').text, '这一轮被拦截了');
      expect(outcome(1, 'completed').text, '这一轮已完成');
      expect(outcome(1, 'error').text, '这一轮出错了');
      expect(
        outcome(
          1,
          'error',
          error: const LlmFailure(message: 'rate limited', code: 'RATE_LIMIT'),
        ).text,
        '出错了 · 请求太频繁，稍后再试',
      );
      expect(
        outcome(
          1,
          'error',
          error: const LlmFailure(
            message:
                'DeepSeek model "deepseek-v5" requires DeepSeek Harness 0.3.0 or later; current version is 0.2.1-rc.4',
            code: 'CLIENT_UPGRADE_REQUIRED',
          ),
        ).text,
        '出错了 · 这个模型需要新版引擎',
      );
    });

    test('untitled conversations read like the drawer', () {
      expect(alertTitle(null), '未命名对话');
      expect(alertTitle('  '), '未命名对话');
      expect(alertTitle(' 修 bug '), '修 bug');
      // A generation request's header stays out, as in the drawer.
      expect(alertTitle('〔生成图像 · 3:4 · 2 张 · Seedream'), '生成图像');
      expect(alertTitle('〔生成图像 · 1:1 · 1 张〕 橘猫'), '橘猫');
    });
  });
}
