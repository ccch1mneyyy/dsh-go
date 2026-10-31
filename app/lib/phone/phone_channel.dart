// Dart side of the `dsh/phone` method channel and `dsh/phone/events` event
// channel (the native side is PhonePlugin.kt). The native module is
// built separately; every call here tolerates it being absent
// (MissingPluginException → "未就绪") or failing (PlatformException → a reason).

import 'dart:async';

import 'package:flutter/services.dart';

import '../l10n/l10n.dart';

// ── Wire helpers ─────────────────────────────────────────────────────────────

bool _flag(Object? v) => v == true;

bool? _maybeFlag(Object? v) => v is bool ? v : null;

String? _text(Object? v) => v is String && v.trim().isNotEmpty ? v : null;

int? _int(Object? v) => v is num ? v.toInt() : null;

Map<Object?, Object?> _map(Object? v) => v is Map ? v.cast<Object?, Object?>() : const {};

List<String> _strings(Object? v) => v is List
    ? [
        for (final e in v)
          if (e is String && e.isNotEmpty) e,
      ]
    : const [];

/// Shown when the native module isn't in this build (or hasn't registered yet).
String get phoneNotReadyReason => appL10n.statePhoneNotReady;

// ── Status ───────────────────────────────────────────────────────────────────

/// Where 不打扰模式 gets its shell identity from.
enum PhoneBackgroundMode {
  off,
  shizuku,
  adb;

  static PhoneBackgroundMode parse(Object? wire) => switch (wire) {
    'shizuku' => shizuku,
    'adb' => adb,
    _ => off,
  };
}

class PhoneA11yStatus {
  const PhoneA11yStatus({this.enabled = false, this.serviceConnected = false});

  factory PhoneA11yStatus.fromMap(Map<Object?, Object?> m) =>
      PhoneA11yStatus(enabled: _flag(m['enabled']), serviceConnected: _flag(m['serviceConnected']));

  /// The user turned DSH on in the system accessibility settings.
  final bool enabled;

  /// The service is bound and answering (false right after a force stop).
  final bool serviceConnected;

  bool get ok => enabled && serviceConnected;
}

class ShizukuStatus {
  const ShizukuStatus({this.installed = false, this.running = false, this.granted = false});

  factory ShizukuStatus.fromMap(Map<Object?, Object?> m) =>
      ShizukuStatus(installed: _flag(m['installed']), running: _flag(m['running']), granted: _flag(m['granted']));

  final bool installed;
  final bool running;
  final bool granted;
}

class AdbStatus {
  const AdbStatus({this.wirelessDebugging, this.paired = false, this.connected = false});

  factory AdbStatus.fromMap(Map<Object?, Object?> m) => AdbStatus(
    wirelessDebugging: _maybeFlag(m['wirelessDebugging']),
    paired: _flag(m['paired']),
    connected: _flag(m['connected']),
  );

  /// Null when the system won't say (Android 17 hides the ADB settings from apps).
  final bool? wirelessDebugging;
  final bool paired;
  final bool connected;
}

class PhoneBackgroundStatus {
  const PhoneBackgroundStatus({
    this.mode = PhoneBackgroundMode.off,
    this.ready = false,
    this.reason,
    this.androidOk = false,
    this.shizuku = const ShizukuStatus(),
    this.adb = const AdbStatus(),
  });

  factory PhoneBackgroundStatus.fromMap(Map<Object?, Object?> m) => PhoneBackgroundStatus(
    mode: PhoneBackgroundMode.parse(m['mode']),
    ready: _flag(m['ready']),
    reason: _text(m['reason']),
    androidOk: _flag(m['androidOk']),
    shizuku: ShizukuStatus.fromMap(_map(m['shizuku'])),
    adb: AdbStatus.fromMap(_map(m['adb'])),
  );

  final PhoneBackgroundMode mode;

  /// The chosen mode can drive a virtual display right now.
  final bool ready;

  /// Why not, one Chinese sentence from the native side.
  final String? reason;

  /// Android 14 or later (the practical floor).
  final bool androidOk;
  final ShizukuStatus shizuku;
  final AdbStatus adb;
}

class PhoneTaskStatus {
  const PhoneTaskStatus({
    this.id,
    this.active = false,
    this.app,
    this.paused = false,
    this.stopped = false,
    this.waived = false,
  });

  factory PhoneTaskStatus.fromMap(Map<Object?, Object?> m) => PhoneTaskStatus(
    id: _int(m['id']),
    active: _flag(m['active']),
    app: _text(m['app']),
    paused: _flag(m['paused']),
    stopped: _flag(m['stopped']),
    waived: _flag(m['waived']),
  );

  /// The current (or last) task's number; a new one means a new task even
  /// when no inactive status came in between. Null from older builds.
  final int? id;

  final bool active;

  /// Label of the app being driven, when known.
  final String? app;
  final bool paused;

  /// The person pressed 停止 (overlay or notification); native refuses phone
  /// actions for a short while after. The app cancels the running turn.
  final bool stopped;

  /// 本任务免确认 was granted: the rest of this task asks nothing.
  final bool waived;
}

/// Where Android 13+'s 「受限制的设置」 stands for this app (native
/// `RestrictedSettings.kt`).
enum RestrictedSettingsState {
  /// The accessibility switch is greyed out, and App info's ⋮ has nothing yet:
  /// a tap on the switch comes first (it shows the 「受限制的设置」 dialog).
  guarded,

  /// The dialog was seen: App info's ⋮ offers 「允许受限制的设置」.
  acknowledged,

  /// Not restricted (a store install, an older Android, or allowed already).
  clear;

  static RestrictedSettingsState? parse(Object? wire) => values.asNameMap()[wire is String ? wire : null];
}

/// Device facts for the guidance pages. Not in the channel contract yet: read
/// from an optional `device` entry of `status` and null when absent.
class PhoneDevice {
  const PhoneDevice({this.manufacturer, this.sdkInt, this.sideloaded, this.restricted});

  factory PhoneDevice.fromMap(Map<Object?, Object?> m) => PhoneDevice(
    manufacturer: _text(m['manufacturer']),
    sdkInt: _int(m['sdkInt']),
    sideloaded: _maybeFlag(m['sideloaded']),
    restricted: RestrictedSettingsState.parse(m['restricted']),
  );

  /// `Build.MANUFACTURER`, e.g. `vivo`, `Xiaomi`, `HONOR`.
  final String? manufacturer;
  final int? sdkInt;

  /// Installed from a browser or file manager (restricted settings apply on 13+).
  final bool? sideloaded;

  /// The restriction as the system holds it; null when it can't be told.
  final RestrictedSettingsState? restricted;

  /// Whether Android's "restricted settings" can block the accessibility switch.
  /// Unknown facts count as "maybe": the guide is a hint, not a gate.
  bool get mayNeedRestrictedSettings => switch (restricted) {
    RestrictedSettingsState.guarded || RestrictedSettingsState.acknowledged => true,
    RestrictedSettingsState.clear => false,
    null => (sdkInt == null || sdkInt! >= 33) && sideloaded != false,
  };
}

class A11yKeeperStatus {
  const A11yKeeperStatus({this.granted = false, this.path = 'setup', this.command = ''});

  factory A11yKeeperStatus.fromMap(Map<Object?, Object?> m) => A11yKeeperStatus(
    granted: _flag(m['granted']),
    path: _text(m['path']) ?? 'setup',
    command: _text(m['command']) ?? '',
  );

  final bool granted;
  final String path;
  final String command;
}

/// Snapshot of the native phone-control module (`status` / status events).
class PhoneStatus {
  const PhoneStatus({
    this.ready = true,
    this.error,
    this.enabled = false,
    this.bridgeListening = false,
    this.a11y = const PhoneA11yStatus(),
    this.a11yKeeper = const A11yKeeperStatus(),
    this.overlay = false,
    this.notifications = false,
    this.confirmationNotifications,
    this.background = const PhoneBackgroundStatus(),
    this.task = const PhoneTaskStatus(),
    this.device = const PhoneDevice(),
  });

  /// The native module isn't there (or failed to answer): "未就绪".
  const PhoneStatus.notReady([this.error])
    : ready = false,
      enabled = false,
      bridgeListening = false,
      a11y = const PhoneA11yStatus(),
      a11yKeeper = const A11yKeeperStatus(),
      overlay = false,
      notifications = false,
      confirmationNotifications = null,
      background = const PhoneBackgroundStatus(),
      task = const PhoneTaskStatus(),
      device = const PhoneDevice();

  factory PhoneStatus.fromMap(Map<Object?, Object?> m) => PhoneStatus(
    enabled: _flag(m['enabled']),
    bridgeListening: _flag(m['bridgeListening']),
    a11y: PhoneA11yStatus.fromMap(_map(m['a11y'])),
    a11yKeeper: A11yKeeperStatus.fromMap(_map(m['a11yKeeper'])),
    overlay: _flag(m['overlay']),
    notifications: _flag(m['notifications']),
    confirmationNotifications: _maybeFlag(m['confirmationNotifications']),
    background: PhoneBackgroundStatus.fromMap(_map(m['background'])),
    task: PhoneTaskStatus.fromMap(_map(m['task'])),
    device: PhoneDevice.fromMap(_map(m['device'])),
  );

  /// The native side answered. False → everything else is a default.
  final bool ready;

  /// Why it didn't, when it said.
  final String? error;

  /// The master switch 「手机操控」.
  final bool enabled;
  final bool bridgeListening;
  final PhoneA11yStatus a11y;
  final A11yKeeperStatus a11yKeeper;
  final bool overlay;

  /// The app may post notifications (confirmations, 停止, ADB pairing code).
  final bool notifications;

  /// Dedicated phone-confirmation channel is available at high importance.
  /// Null on older native modules; it does not replace the global switch.
  final bool? confirmationNotifications;
  final PhoneBackgroundStatus background;
  final PhoneTaskStatus task;
  final PhoneDevice device;

  PhoneStatus copyWith({bool? enabled}) => PhoneStatus(
    ready: ready,
    error: error,
    enabled: enabled ?? this.enabled,
    bridgeListening: bridgeListening,
    a11y: a11y,
    a11yKeeper: a11yKeeper,
    overlay: overlay,
    notifications: notifications,
    confirmationNotifications: confirmationNotifications,
    background: background,
    task: task,
    device: device,
  );
}

// ── 悬浮条 ───────────────────────────────────────────────────────────────────

/// 设置 → 手机操控 → 悬浮条 (`overlayPrefs` / `setOverlayPrefs`): how opaque the
/// pill is when idle, and whether it folds into the ball by itself. A showing
/// overlay follows changes at once.
class PhoneOverlayPrefs {
  const PhoneOverlayPrefs({this.idleOpacity = defaultOpacity, this.autoCollapse = false});

  factory PhoneOverlayPrefs.fromMap(Map<Object?, Object?> m) => PhoneOverlayPrefs(
    idleOpacity: clampOpacity(m['idleOpacity'] is num ? (m['idleOpacity'] as num).toDouble() : defaultOpacity),
    autoCollapse: _flag(m['autoCollapse']),
  );

  /// 70 %: the line reads over light and dark pages alike (see OverlayPrefs.kt).
  static const defaultOpacity = 0.7;
  static const minOpacity = 0.3;
  static const maxOpacity = 1.0;

  /// Within 30–100 %, on whole percents.
  static double clampOpacity(double v) =>
      v.isNaN ? defaultOpacity : (v.clamp(minOpacity, maxOpacity) * 100).round() / 100;

  /// 闲置时不透明度, 0.3–1 (1: never fades).
  final double idleOpacity;

  /// 闲置时自动收起.
  final bool autoCollapse;

  int get percent => (idleOpacity * 100).round();

  PhoneOverlayPrefs copyWith({double? idleOpacity, bool? autoCollapse}) => PhoneOverlayPrefs(
    idleOpacity: idleOpacity == null ? this.idleOpacity : clampOpacity(idleOpacity),
    autoCollapse: autoCollapse ?? this.autoCollapse,
  );

  @override
  bool operator ==(Object other) =>
      other is PhoneOverlayPrefs && other.idleOpacity == idleOpacity && other.autoCollapse == autoCollapse;

  @override
  int get hashCode => Object.hash(idleOpacity, autoCollapse);
}

// ── Results ──────────────────────────────────────────────────────────────────

/// Only explicit one-shot native choices may answer an engine approval.
enum PhonePromptDecision { allowOnce, reject, open, dismissed, timeout, stopped, unavailable }

class PhonePromptResult {
  const PhonePromptResult({this.decision = PhonePromptDecision.unavailable, this.presented = 'none'});

  factory PhonePromptResult.fromMap(Map<Object?, Object?> map) => PhonePromptResult(
    decision: switch (map['decision']) {
      'allowed-once' => PhonePromptDecision.allowOnce,
      'rejected' => PhonePromptDecision.reject,
      'open' => PhonePromptDecision.open,
      'dismissed' => PhonePromptDecision.dismissed,
      'timeout' => PhonePromptDecision.timeout,
      'stopped' => PhonePromptDecision.stopped,
      _ => PhonePromptDecision.unavailable,
    },
    presented: switch (map['presented']) {
      'overlay' => 'overlay',
      'notification' => 'notification',
      'app' => 'app',
      _ => 'none',
    },
  );

  final PhonePromptDecision decision;
  final String presented;
}

/// Reply of `finishTask`.
class PhoneFinish {
  const PhoneFinish({
    this.closed = false,
    this.busy = false,
    this.opened = false,
    this.launched = false,
    this.notified = false,
    this.current = true,
  });

  factory PhoneFinish.fromMap(Map<Object?, Object?> m) => PhoneFinish(
    closed: _flag(m['closed']),
    busy: _flag(m['busy']),
    opened: _flag(m['opened']),
    launched: _flag(m['launched']),
    notified: _flag(m['notified']),
    current: m['current'] != false,
  );

  /// A task (or a stop's note) was open and is closed now, overlay included.
  final bool closed;

  /// Not closed: a phone call still runs. This is not proof of another owner.
  final bool busy;

  /// The app is on screen now.
  final bool opened;

  /// The app was asked to come forward (it may still have been blocked).
  final bool launched;

  /// A result notification was posted when automatic return did not succeed.
  final bool notified;

  /// The same task still owns this completion; false retires later UI actions.
  final bool current;

  PhoneFinish withNotice() =>
      PhoneFinish(closed: closed, busy: busy, opened: opened, launched: launched, notified: true, current: current);

  PhoneFinish retired() =>
      PhoneFinish(closed: closed, busy: busy, opened: opened, launched: launched, notified: notified, current: false);
}

/// `{ok, reason?}` replies.
class PhoneResult {
  const PhoneResult(this.ok, [this.reason, this.pending = false]);

  factory PhoneResult.fromMap(Map<Object?, Object?> m) =>
      PhoneResult(_flag(m['ok']), _text(m['reason']), _flag(m['pending']));

  final bool ok;
  final String? reason;
  final bool pending;
}

/// Reply of `testScreen`: the main screen read once.
class ScreenTestResult {
  const ScreenTestResult({required this.ok, this.text, this.reason});

  factory ScreenTestResult.fromMap(Map<Object?, Object?> m) => ScreenTestResult(
    ok: _flag(m['ok']),
    text: m['text'] is String ? m['text'] as String : null,
    reason: _text(m['reason']),
  );

  final bool ok;
  final String? text;
  final String? reason;
}

// ── Policies ─────────────────────────────────────────────────────────────────

/// What DSH may do in one app.
enum AppRule {
  /// Neither read nor act (banks, payment by default).
  deny,

  /// Read freely; every write action asks first (WeChat by default).
  confirmEachStep,

  /// The general rules only (sensitive actions still ask).
  normal,
}

/// Labels for well-known packages, used when the native side sends none:
/// the apps' own names in the app language.
Map<String, String> get knownAppLabels => AppLocale.usesWesternConventions ? _knownAppLabelsEn : _knownAppLabelsZh;

// l10n:keep-begin the apps' Chinese names (what Chinese systems show)
const _knownAppLabelsZh = <String, String>{
  'com.eg.android.AlipayGphone': '支付宝',
  'com.unionpay': '云闪付',
  'com.tencent.mm': '微信',
  'com.tencent.mobileqq': 'QQ',
  'com.icbc': '中国工商银行',
  'com.chinamworld.main': '中国建设银行',
  'com.android.bankabc': '中国农业银行',
  'com.chinamworld.bocmbci': '中国银行',
  'cmb.pb': '招商银行',
  'com.bankcomm.Bankcomm': '交通银行',
  'com.yitong.mbank.psbc': '中国邮政储蓄银行',
  'com.jd.jrapp': '京东金融',
  'com.taobao.taobao': '淘宝',
  'com.jingdong.app.mall': '京东',
  'com.xunmeng.pinduoduo': '拼多多',
  'com.sankuai.meituan': '美团',
  'com.autonavi.minimap': '高德地图',
  'com.ss.android.ugc.aweme': '抖音',
  'com.xingin.xhs': '小红书',
  'com.MobileTicket': '铁路12306',
}; // l10n:keep-end

const _knownAppLabelsEn = <String, String>{
  'com.eg.android.AlipayGphone': 'Alipay',
  'com.unionpay': 'UnionPay',
  'com.tencent.mm': 'WeChat',
  'com.tencent.mobileqq': 'QQ',
  'com.icbc': 'ICBC',
  'com.chinamworld.main': 'China Construction Bank',
  'com.android.bankabc': 'Agricultural Bank of China',
  'com.chinamworld.bocmbci': 'Bank of China',
  'cmb.pb': 'China Merchants Bank',
  'com.bankcomm.Bankcomm': 'Bank of Communications',
  'com.yitong.mbank.psbc': 'Postal Savings Bank of China',
  'com.jd.jrapp': 'JD Finance',
  'com.taobao.taobao': 'Taobao',
  'com.jingdong.app.mall': 'JD',
  'com.xunmeng.pinduoduo': 'Pinduoduo',
  'com.sankuai.meituan': 'Meituan',
  'com.autonavi.minimap': 'Amap',
  'com.ss.android.ugc.aweme': 'Douyin',
  'com.xingin.xhs': 'Xiaohongshu',
  'com.MobileTicket': 'China Railway 12306',
};

/// A hard rule the person may lift (解除限制, `unlocks` in the policies; the
/// wire key is the name). All are off until turned on behind the
/// confirmation page; the native side reads anything else as off.
enum PhoneUnlock {
  /// System settings, permission pages, installers, security centres, the
  /// notification shade.
  systemPages,

  /// Password, verification-code and payment-code inputs.
  secretFields,

  /// DSH Go's own screens.
  ownApp,
}

/// How much the person is asked before DSH acts (`confirmMode`; the wire
/// value is the name). The hard rules refuse in every mode, unless lifted
/// ([PhoneUnlock]).
enum PhoneConfirmMode {
  /// 每次都询问: a new app, sending, deleting, paying… ask first.
  ask,

  /// 本任务免确认: the first question of a task can waive the rest of it.
  task,

  /// 始终免确认: nothing is asked.
  always;

  /// Unknown or missing values read as [ask], the strictest.
  static PhoneConfirmMode parse(Object? wire) => values.firstWhere((m) => m.name == wire, orElse: () => ask);
}

/// `getPolicies` / `setPolicies`. Only the two lists and [confirmMode] go back
/// over the wire; [labels] and the defaults are optional extras the native
/// side may send. [unlocks] never rides along: it changes only through
/// [PhoneChannel.setUnlock], so a stale copy can't lift or restore a rule.
class PhonePolicies {
  const PhonePolicies({
    this.denyPackages = const [],
    this.confirmEveryWritePackages = const [],
    this.labels = const {},
    this.defaultDeny = const [],
    this.defaultConfirm = const [],
    this.confirmMode = PhoneConfirmMode.ask,
    this.unlocks = const {},
  });

  factory PhonePolicies.fromMap(Map<Object?, Object?> m) {
    final defaults = _map(m['defaults']);
    final unlocks = _map(m['unlocks']);
    return PhonePolicies(
      denyPackages: _strings(m['denyPackages']),
      confirmEveryWritePackages: _strings(m['confirmEveryWritePackages']),
      labels: {
        for (final e in _map(m['labels']).entries)
          if (e.key is String && e.value is String) e.key as String: e.value as String,
      },
      defaultDeny: _strings(defaults['denyPackages']),
      defaultConfirm: _strings(defaults['confirmEveryWritePackages']),
      confirmMode: PhoneConfirmMode.parse(m['confirmMode']),
      // Only an explicit true lifts a rule.
      unlocks: {
        for (final u in PhoneUnlock.values)
          if (unlocks[u.name] == true) u,
      },
    );
  }

  final List<String> denyPackages;
  final List<String> confirmEveryWritePackages;

  /// Package → app label, from the native side.
  final Map<String, String> labels;

  /// The lists as shipped with this APK, when the native side says.
  final List<String> defaultDeny;
  final List<String> defaultConfirm;

  final PhoneConfirmMode confirmMode;

  /// The hard rules the person lifted; empty by default.
  final Set<PhoneUnlock> unlocks;

  Map<String, Object?> toWire() => {
    'denyPackages': denyPackages,
    'confirmEveryWritePackages': confirmEveryWritePackages,
    'confirmMode': confirmMode.name,
  };

  PhonePolicies withConfirmMode(PhoneConfirmMode mode) => PhonePolicies(
    denyPackages: denyPackages,
    confirmEveryWritePackages: confirmEveryWritePackages,
    labels: labels,
    defaultDeny: defaultDeny,
    defaultConfirm: defaultConfirm,
    confirmMode: mode,
    unlocks: unlocks,
  );

  PhonePolicies withUnlock(PhoneUnlock unlock, bool on) => PhonePolicies(
    denyPackages: denyPackages,
    confirmEveryWritePackages: confirmEveryWritePackages,
    labels: labels,
    defaultDeny: defaultDeny,
    defaultConfirm: defaultConfirm,
    confirmMode: confirmMode,
    unlocks: on ? {...unlocks, unlock} : ({...unlocks}..remove(unlock)),
  );

  AppRule ruleFor(String package) {
    if (denyPackages.contains(package)) return AppRule.deny;
    if (confirmEveryWritePackages.contains(package)) {
      return AppRule.confirmEachStep;
    }
    return AppRule.normal;
  }

  /// What the shipped defaults say about [package] (null when unknown).
  AppRule? defaultRuleFor(String package) {
    if (defaultDeny.contains(package)) return AppRule.deny;
    if (defaultConfirm.contains(package)) return AppRule.confirmEachStep;
    if (defaultDeny.isEmpty && defaultConfirm.isEmpty) return null;
    return AppRule.normal;
  }

  String labelFor(String package) => labels[package] ?? knownAppLabels[package] ?? package;

  PhonePolicies withRule(String package, AppRule rule) {
    final deny = [...denyPackages]..remove(package);
    final confirm = [...confirmEveryWritePackages]..remove(package);
    switch (rule) {
      case AppRule.deny:
        deny.add(package);
      case AppRule.confirmEachStep:
        confirm.add(package);
      case AppRule.normal:
        break;
    }
    return PhonePolicies(
      denyPackages: deny,
      confirmEveryWritePackages: confirm,
      labels: labels,
      defaultDeny: defaultDeny,
      defaultConfirm: defaultConfirm,
      confirmMode: confirmMode,
      unlocks: unlocks,
    );
  }
}

// ── Action log ───────────────────────────────────────────────────────────────

/// How a logged action was decided.
enum PhoneDecision {
  /// Ran without asking (not sensitive), or went on after a handoff.
  done,

  /// The person allowed it.
  allowed,

  /// The person said no, or didn't choose within 30 s.
  denied,

  /// The person stopped the task.
  stopped,

  /// A hard rule or the app list refused it (or handed it back).
  blocked,

  failed,
  unknown;

  /// Native vocabulary (PhoneCore / SafetyGate): `ok`, `allowed` (no question
  /// needed), `continue` (handoff resumed), `confirmed`, `confirmed-app`,
  /// `confirmed-task` (本任务免确认 granted), `denied` (said no or 30 s without a choice), `stopped`, `paused`,
  /// `refused:<rule>`, `unavailable`, `stale`, `timeout` (the tool ran out of
  /// time), `error`. Older or future words fall back to [unknown].
  static PhoneDecision parse(Object? wire) {
    final v = (wire is String ? wire : '').toLowerCase().replaceAll('-', '_');
    if (v.startsWith('refused')) return blocked;
    return switch (v) {
      'ok' || 'allowed' || 'continue' || 'auto' || 'done' => done,
      'confirmed' ||
      'confirmed_app' ||
      'confirmed_task' ||
      'allow_once' ||
      'allow_app_for_task' ||
      'allow_all_for_task' => allowed,
      'denied' || 'deny' => denied,
      'stopped' || 'stop' || 'paused' => stopped,
      'blocked' || 'handoff' => blocked,
      'error' || 'failed' || 'timeout' || 'unavailable' || 'stale' => failed,
      _ => unknown,
    };
  }
}

/// One line of the native action log. Never holds screen contents.
class PhoneLogEntry {
  const PhoneLogEntry({
    required this.time,
    required this.tool,
    this.app,
    this.summary = '',
    this.decision = PhoneDecision.unknown,
    this.rawDecision,
  });

  factory PhoneLogEntry.fromMap(Map<Object?, Object?> m) => PhoneLogEntry(
    time: _time(m['time']),
    tool: _text(m['tool']) ?? '',
    app: _text(m['app']),
    summary: _text(m['summary']) ?? '',
    decision: PhoneDecision.parse(m['decision']),
    rawDecision: _text(m['decision']),
  );

  /// Epoch milliseconds (seconds tolerated) or an ISO string; null if neither.
  static DateTime? _time(Object? v) {
    if (v is num) {
      final n = v.toInt();
      return DateTime.fromMillisecondsSinceEpoch(n < 100000000000 ? n * 1000 : n);
    }
    if (v is String) return DateTime.tryParse(v)?.toLocal();
    return null;
  }

  final DateTime? time;

  /// Tool name, e.g. `tap` (an `mcp__phone__` prefix is tolerated).
  final String tool;
  final String? app;
  final String summary;
  final PhoneDecision decision;
  final String? rawDecision;
}

// ── Channel ──────────────────────────────────────────────────────────────────

/// Typed wrapper over `dsh/phone` + `dsh/phone/events`.
class PhoneChannel {
  PhoneChannel({MethodChannel? methods, EventChannel? events})
    : _methods = methods ?? const MethodChannel('dsh/phone'),
      _events = events ?? const EventChannel('dsh/phone/events');

  final MethodChannel _methods;
  final EventChannel _events;
  Stream<PhoneStatus>? _stream;

  /// Status pushes. Listen only after [status] came back ready: activating the
  /// stream without a native side reports an error to Flutter.
  Stream<PhoneStatus> get statusChanges => _stream ??= _events
      .receiveBroadcastStream()
      .where((raw) => raw is Map)
      .map((raw) => PhoneStatus.fromMap((raw as Map).cast<Object?, Object?>()))
      .asBroadcastStream();

  Future<PhoneStatus> status() async {
    try {
      final map = await _methods.invokeMapMethod<Object?, Object?>('status');
      return map == null ? const PhoneStatus.notReady() : PhoneStatus.fromMap(map);
    } on MissingPluginException {
      return const PhoneStatus.notReady();
    } on PlatformException catch (e) {
      return PhoneStatus.notReady(e.message);
    }
  }

  Future<bool> setEnabled(bool enabled) => _bool('setEnabled', {'enabled': enabled});

  Future<bool> openAccessibilitySettings() => _bool('openAccessibilitySettings');

  Future<PhoneResult> grantSecureSettings() => _result('grantSecureSettings');

  /// This app's system "App info" page (restricted settings, notifications).
  Future<bool> openAppDetails() => _bool('openAppDetails');

  Future<ScreenTestResult> testScreen() async {
    try {
      final map = await _methods.invokeMapMethod<Object?, Object?>('testScreen');
      return map == null ? ScreenTestResult(ok: false, reason: phoneNotReadyReason) : ScreenTestResult.fromMap(map);
    } on MissingPluginException {
      return ScreenTestResult(ok: false, reason: phoneNotReadyReason);
    } on PlatformException catch (e) {
      return ScreenTestResult(ok: false, reason: e.message ?? e.code);
    }
  }

  Future<PhoneResult> setBackgroundMode(PhoneBackgroundMode mode) => _result('setBackgroundMode', {'mode': mode.name});

  Future<bool> requestShizukuPermission() => _bool('requestShizukuPermission');

  /// Posts the notification with a code field for 「使用配对码配对设备」.
  Future<PhoneResult> adbStartPairing() => _result('adbStartPairing');

  /// The in-app fallback: the six-digit code (and port) typed here.
  Future<PhoneResult> adbPair(String code, {int? port}) => _result('adbPair', {'code': code, 'port': port});

  Future<PhoneResult> adbConnect() => _result('adbConnect');

  Future<PhonePolicies?> getPolicies() async {
    try {
      final map = await _methods.invokeMapMethod<Object?, Object?>('getPolicies');
      return map == null ? null : PhonePolicies.fromMap(map);
    } on MissingPluginException {
      return null;
    } on PlatformException {
      return null;
    }
  }

  Future<bool> setPolicies(PhonePolicies policies) => _bool('setPolicies', policies.toWire());

  /// Lifts or restores one hard rule, and nothing else (`setPolicies` keeps
  /// what it isn't sent).
  Future<bool> setUnlock(PhoneUnlock unlock, bool on) => _bool('setPolicies', {
    'unlocks': {unlock.name: on},
  });

  Future<List<PhoneLogEntry>> actionLog({int limit = 100}) async {
    try {
      final list = await _methods.invokeListMethod<Object?>('actionLog', {'limit': limit});
      return [
        for (final e in list ?? const [])
          if (e is Map) PhoneLogEntry.fromMap(e.cast<Object?, Object?>()),
      ];
    } on MissingPluginException {
      return const [];
    } on PlatformException {
      return const [];
    }
  }

  Future<bool> stopTask() => _bool('stopTask');

  /// Private, structured engine request. Native owns the UI identity, nonce,
  /// one-active-card policy and 30-second deadline; text is never an action.
  Future<PhonePromptResult> presentPrompt({
    required String requestId,
    required String sessionId,
    required String host,
    required String text,
    required bool canApprove,
    int? taskId,
  }) async {
    if (requestId.isEmpty ||
        requestId.length > 200 ||
        sessionId.isEmpty ||
        sessionId.length > 200 ||
        host.isEmpty ||
        host.length > 2048 ||
        text.isEmpty ||
        text.length > 4096 ||
        (taskId != null && taskId <= 0)) {
      return const PhonePromptResult();
    }
    try {
      final map = await _methods
          .invokeMapMethod<Object?, Object?>('presentPrompt', {
            'requestId': requestId,
            'taskId': ?taskId,
            'sessionId': sessionId,
            'host': host,
            'kind': canApprove ? 'approval' : 'review',
            'text': text,
          })
          .timeout(const Duration(seconds: 35));
      return map == null ? const PhonePromptResult() : PhonePromptResult.fromMap(map);
    } on TimeoutException {
      unawaited(cancelPrompt(requestId));
      return const PhonePromptResult(decision: PhonePromptDecision.timeout);
    } on MissingPluginException {
      return const PhonePromptResult();
    } on PlatformException {
      return const PhonePromptResult();
    }
  }

  Future<void> cancelPrompt(String requestId) async {
    try {
      await _methods.invokeMethod<void>('cancelPrompt', {'requestId': requestId}).timeout(const Duration(seconds: 2));
    } on MissingPluginException {
      // An older native module has no prompt to cancel.
    } on PlatformException {
      // Native also retires prompts with its task and engine lifecycle.
    } on TimeoutException {
      // The native 30-second deadline remains the final bound.
    }
  }

  /// The 悬浮条 settings; null without the native side.
  Future<PhoneOverlayPrefs?> overlayPrefs() => _overlay('overlayPrefs');

  /// Writes what is given (the rest stays); the stored result, null without the native side.
  Future<PhoneOverlayPrefs?> setOverlayPrefs({double? idleOpacity, bool? autoCollapse}) =>
      _overlay('setOverlayPrefs', {'idleOpacity': ?idleOpacity, 'autoCollapse': ?autoCollapse});

  Future<PhoneOverlayPrefs?> _overlay(String method, [Object? args]) async {
    try {
      final map = await _methods.invokeMapMethod<Object?, Object?>(method, args);
      return map == null ? null : PhoneOverlayPrefs.fromMap(map);
    } on MissingPluginException {
      return null;
    } on PlatformException {
      return null;
    }
  }

  /// The turn that drove the phone ended: closes the overlay and ends the
  /// task; with [reopen], brings the app forward on [sessionId] (just the app
  /// when null) if it is in the background, and says whether it came up.
  Future<PhoneFinish> finishTask({required int taskId, String? sessionId, String? host, bool reopen = false}) async {
    try {
      final map = await _methods.invokeMapMethod<Object?, Object?>('finishTask', {
        'taskId': taskId,
        'sessionId': sessionId,
        'host': host,
        'reopen': reopen,
      });
      return map == null ? const PhoneFinish() : PhoneFinish.fromMap(map);
    } on MissingPluginException {
      return const PhoneFinish();
    } on PlatformException {
      return const PhoneFinish();
    }
  }

  Future<bool> _bool(String method, [Object? args]) async {
    try {
      return await _methods.invokeMethod<bool>(method, args) ?? false;
    } on MissingPluginException {
      return false;
    } on PlatformException {
      return false;
    }
  }

  Future<PhoneResult> _result(String method, [Object? args]) async {
    try {
      final map = await _methods.invokeMapMethod<Object?, Object?>(method, args);
      return map == null ? PhoneResult(false, phoneNotReadyReason) : PhoneResult.fromMap(map);
    } on MissingPluginException {
      return PhoneResult(false, phoneNotReadyReason);
    } on PlatformException catch (e) {
      return PhoneResult(false, e.message ?? e.code);
    }
  }
}
