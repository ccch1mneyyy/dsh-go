// Words and numbers the Bot pages share: what a Bot is doing, short times,
// token counts, the DS Bot error lines.

import 'package:dsh_client/dsh_client.dart';
import 'package:intl/intl.dart';

import '../../l10n/l10n.dart';

/// 「正在运行命令」 for what a Bot's turn does now; null when it is idle.
String? workPhrase(DsBotWork? work, {String? activity, DsBotTeam? team}) {
  if (work == null) return activity == 'thinking' ? appL10n.botsThinking : null;
  if (work.switching) return appL10n.botsOrganizingNotes;
  final tool = work.tool;
  if (tool == null) return appL10n.botsThinking;
  return _toolWorkPhrase(tool);
}

/// The verb for a tool, as the chat says it: 「运行命令」.
String toolVerb(String tool) => switch (tool) {
  'bash' || 'pwsh' || 'shell' || 'run_code' => appL10n.botsToolRun,
  'read' || 'read_file' || 'fs_read' || 'view' || 'list' || 'glob' || 'grep' => appL10n.botsToolRead,
  'write' || 'edit' || 'str_replace_editor' || 'apply_patch' => appL10n.botsToolEdit,
  'web_search' => appL10n.botsToolSearch,
  'web_fetch' || 'read_browser' => appL10n.botsToolBrowse,
  'message_bot' => appL10n.botsToolMessage,
  'group_relay' || 'post_to_group' || 'read_group_chat' => appL10n.botsToolGroup,
  'remember' || 'forget' => appL10n.botsToolMemory,
  'recall' || 'read_own_chat' => appL10n.botsToolRecall,
  'create_bot' || 'update_bot' || 'create_group' || 'update_group' => appL10n.botsToolTeam,
  'ask_user' || 'show_view' => appL10n.botsToolAsk,
  _ => appL10n.botsToolWork,
};

/// 「刚刚」「14:05」「昨天」「10月3日」.
String shortTime(DateTime? time, {DateTime? now}) {
  if (time == null) return '';
  final at = now ?? DateTime.now();
  final diff = at.difference(time);
  if (diff.inSeconds.abs() < 60) return appL10n.botsJustNow;
  final today = DateTime(at.year, at.month, at.day);
  final day = DateTime(time.year, time.month, time.day);
  final hm = '${time.hour.toString().padLeft(2, '0')}:${time.minute.toString().padLeft(2, '0')}';
  if (day == today) return hm;
  if (day == today.subtract(const Duration(days: 1))) return appL10n.commonYesterday;
  if (time.year == at.year) return appL10n.monthDay(time);
  return '${time.year}/${time.month}/${time.day}';
}

/// `12345` → `1.2 万`, `980` → `980`.
String compactCount(int value) {
  if (AppLocale.usesWesternConventions) return NumberFormat.compact(locale: AppLocale.current.languageCode).format(value);
  if (value >= 100000000) return appL10n.botsCountHundredMillion((value / 100000000).toStringAsFixed(1));
  if (value >= 10000) return appL10n.botsCountTenThousand((value / 10000).toStringAsFixed(value >= 100000 ? 0 : 1));
  return '$value';
}

/// The model's short name for a `provider/model` ref, as the catalog names it.
String modelLabel(String? ref, List<DsBotModel> models) {
  if (ref == null || ref.isEmpty) return appL10n.botsModelNotSelected;
  for (final model in models) {
    if (model.ref == ref) return model.name;
  }
  final slash = ref.indexOf('/');
  return slash < 0 ? ref : ref.substring(slash + 1);
}

/// The first character of a name, upper-cased for Latin letters.
String monogramOf(String name) {
  final trimmed = name.trim();
  if (trimmed.isEmpty) return '?';
  final first = String.fromCharCodes(trimmed.runes.take(1));
  return first.toUpperCase();
}

/// A group's last line: 「Writer：……」, the user's own as 「你：……」.
String roomPreview(DsBotRoom room, DsBotTeam team) {
  final preview = room.preview?.replaceAll(RegExp(r'\s+'), ' ').trim();
  if (preview == null || preview.isEmpty) return '';
  for (final id in room.members) {
    final name = team.bot(id)?.name;
    // l10n:keep engine preview prefix
    if (name != null && preview.startsWith('$name：')) {
      return appL10n.botsSenderPreview(name, preview.substring(name.length + 1));
    }
  }
  return appL10n.botsYourPreview(preview);
}

/// What a group event line says.
String roomEventText(DsBotItem item) {
  final name = item.name ?? 'Bot';
  return switch (item.event) {
    'working' => appL10n.botsEventWorking(name),
    'approval' => appL10n.botsEventApproval(name),
    'done' => appL10n.botsEventDone(name),
    'stopped' => appL10n.botsEventStopped(name),
    'paused' => appL10n.commonPaused,
    'failed' => appL10n.botsEventFailed(name),
    'missed' => appL10n.botsEventMissed(name),
    'lookup' => item.text.isEmpty ? appL10n.botsEventLookup(name) : appL10n.botsEventLookupQuery(name, item.text),
    'resumed' => appL10n.botsEventResumed(name),
    'cut' => appL10n.botsEventCut(name),
    'schedule' => item.text.isEmpty ? appL10n.botsAutomation : appL10n.botsAutomationText(item.text),
    _ => item.text,
  };
}

/// What an event in a Bot's own chat says (a message from another Bot).
String chatEventText(DsBotItem item, {String? roomName}) {
  final name = item.name ?? appL10n.botsOtherBot;
  return switch (item.role) {
    'request' => appL10n.botsMessageFrom(name),
    'reply' => appL10n.botsEventReplied(name),
    'report' => roomName == null ? appL10n.botsGroupReplied : appL10n.botsNamedGroupReplied(roomName),
    'stopped' => appL10n.botsEventCalledStop(name),
    _ => item.text,
  };
}

String _toolWorkPhrase(String tool) => switch (tool) {
  'bash' || 'pwsh' || 'shell' || 'run_code' => appL10n.botsToolWorkingRun,
  'read' || 'read_file' || 'fs_read' || 'view' || 'list' || 'glob' || 'grep' => appL10n.botsToolWorkingRead,
  'write' || 'edit' || 'str_replace_editor' || 'apply_patch' => appL10n.botsToolWorkingEdit,
  'web_search' => appL10n.botsToolWorkingSearch,
  'web_fetch' || 'read_browser' => appL10n.botsToolWorkingBrowse,
  'message_bot' => appL10n.botsToolWorkingMessage,
  'group_relay' || 'post_to_group' || 'read_group_chat' => appL10n.botsToolWorkingGroup,
  'remember' || 'forget' => appL10n.botsToolWorkingMemory,
  'recall' || 'read_own_chat' => appL10n.botsToolWorkingRecall,
  'create_bot' || 'update_bot' || 'create_group' || 'update_group' => appL10n.botsToolWorkingTeam,
  'ask_user' || 'show_view' => appL10n.botsToolWorkingAsk,
  _ => appL10n.botsToolWorkingWork,
};

String approvalPhrase(String name, String tool) => switch (tool) {
  'bash' || 'pwsh' || 'shell' || 'run_code' => appL10n.botsToolApprovalRun(name),
  'read' || 'read_file' || 'fs_read' || 'view' || 'list' || 'glob' || 'grep' => appL10n.botsToolApprovalRead(name),
  'write' || 'edit' || 'str_replace_editor' || 'apply_patch' => appL10n.botsToolApprovalEdit(name),
  'web_search' => appL10n.botsToolApprovalSearch(name),
  'web_fetch' || 'read_browser' => appL10n.botsToolApprovalBrowse(name),
  'message_bot' => appL10n.botsToolApprovalMessage(name),
  'group_relay' || 'post_to_group' || 'read_group_chat' => appL10n.botsToolApprovalGroup(name),
  'remember' || 'forget' => appL10n.botsToolApprovalMemory(name),
  'recall' || 'read_own_chat' => appL10n.botsToolApprovalRecall(name),
  'create_bot' || 'update_bot' || 'create_group' || 'update_group' => appL10n.botsToolApprovalTeam(name),
  'ask_user' || 'show_view' => appL10n.botsToolApprovalAsk(name),
  _ => appL10n.botsToolApprovalWork(name),
};
