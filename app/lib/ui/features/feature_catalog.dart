// Every user-facing surface of the official DSH Web client (0.2.1-rc.2) and
// where it lives in the app: a native page, the official page inside the app
// (DSH Web with a deep link), or both. The parity table behind it is
// `docs/official-parity.md`.

import 'dart:async';

import 'package:dsh_client/dsh_client.dart' show PluginBundle;
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../l10n/l10n.dart';
import '../../plugins/native/native_icons.dart';
import '../../plugins/native/native_state.dart';
import '../../plugins/seams/seams.dart';
import '../../state/plugins_state.dart';
import '../common/feature_tile.dart';
import '../agents/team_page.dart';
import '../bots/bots_page.dart';
import '../community/community_page.dart';
import '../cordis/cordis_page.dart';
import '../files/files_page.dart';
import '../memory/memory_page.dart';
import '../forum/forum_home_page.dart';
import '../phone/phone_control_screen.dart';
import '../plugins/plugin_detail_sheet.dart';
import '../plugins/plugins_screen.dart';
import '../plugins/seats/plugin_seat_page.dart';
import '../plugins/seats/seat_links.dart';
import '../providers/providers_page.dart';
import '../remote/remote_screen.dart';
import '../session/session_artifacts.dart';
import '../session/session_detail_page.dart';
import '../share_code/profile_share_sheet.dart';
import '../shell/session_search_page.dart';
import '../terminal/terminal_page.dart';
import '../theme/app_icons.dart';
import '../web/web_target.dart';
import '../workspace/workspaces_page.dart';
import 'feature_widgets.dart' show openSessionInChat;
import 'jobs_page.dart';
import 'permission_page.dart';
import 'schedules_page.dart';
import 'session_export_page.dart';
import 'skills_page.dart';

/// Builds a native page; [sessionId] is the conversation open in the chat.
typedef FeaturePageBuilder = Widget Function(String? sessionId);

/// Does something other than pushing a page (a sheet, back to the chat).
typedef FeatureAction = FutureOr<void> Function(BuildContext context, WidgetRef ref, String? sessionId);

/// One entry of 全部功能.
class FeatureItem {
  const FeatureItem({
    required this.id,
    required this._title,
    required this._summary,
    required this.icon,
    this.tile,
    this.native,
    this.action,
    this.web,
    this.needsSession = false,
    this.webInSession = false,
  }) : _localizedTitle = null,
       _localizedSummary = null,
       assert(native != null || action != null || web != null);

  const FeatureItem.localized({
    required this.id,
    required String Function(L10n) title,
    required String Function(L10n) summary,
    required this.icon,
    this.tile,
    this.native,
    this.action,
    this.web,
    this.needsSession = false,
    this.webInSession = false,
  }) : _title = '',
       _summary = '',
       _localizedTitle = title,
       _localizedSummary = summary,
       assert(native != null || action != null || web != null);

  final String id;
  final String _title;
  final String _summary;
  final String Function(L10n)? _localizedTitle;
  final String Function(L10n)? _localizedSummary;

  // Resolve on read: the catalog and its provider keep the same objects
  // across language changes.
  String get title => _localizedTitle?.call(appL10n) ?? _title;
  String get summary => _localizedSummary?.call(appL10n) ?? _summary;

  /// [title] in [l10n]'s language (search matches both languages).
  String titleIn(L10n l10n) => _localizedTitle?.call(l10n) ?? _title;
  final IconData icon;

  /// The feature's own graphic ([FeatureTile]), for the nine headline features.
  final FeatureKind? tile;

  /// The app's own page, when there is one.
  final FeaturePageBuilder? native;

  /// The app's own way in when it isn't a page (a sheet, the composer).
  final FeatureAction? action;

  /// The official page inside the app.
  final DshWebTarget? web;

  /// Only makes sense for an open conversation (disabled without one).
  final bool needsSession;

  /// The web page belongs to the open conversation: open it there first.
  final bool webInSession;

  /// The app has its own page or flow for it.
  bool get hasNative => native != null || action != null;

  bool get webOnly => !hasNative;

  /// [web] aimed at [sessionId] when it belongs to a conversation.
  DshWebTarget? webFor(String? sessionId) => webInSession && sessionId != null ? web?.inSession(sessionId) : web;
}

class FeatureSection {
  const FeatureSection(String title, this.items, {this.note, this.id}) : _title = title, _localizedTitle = null;

  const FeatureSection.localized(String Function(L10n) title, this.items, {this.note, this.id})
    : _title = '',
      _localizedTitle = title;

  /// Names a section the page draws something more for ([settingsFeatureSection]).
  final String? id;

  final String _title;
  final String Function(L10n)? _localizedTitle;
  String get title => _localizedTitle?.call(appL10n) ?? _title;

  /// [title] in [l10n]'s language.
  String titleIn(L10n l10n) => _localizedTitle?.call(l10n) ?? _title;
  final List<FeatureItem> items;
  final String? note;
}

String _session(String? id) => id ?? '';

/// 社区, with the forum card at its top opening the forum's home.
Widget communityPage() =>
    Builder(builder: (context) => CommunityPage(onOpenForum: () => Navigator.of(context).push(ForumHomePage.route())));

/// Back to the chat, where the composer does the rest (`@`, the mic).
void _backToChat(BuildContext context, WidgetRef ref, String? _) =>
    Navigator.of(context).popUntil((route) => route.isFirst);

/// The settings sheet of an official optional bundle, when the host has it.
Future<void> _bundleSheet(BuildContext context, WidgetRef ref, String name) async {
  final messenger = ScaffoldMessenger.maybeOf(context);
  List<PluginBundle>? bundles;
  try {
    bundles = await ref.read(installedPluginsProvider.future).timeout(const Duration(seconds: 10));
  } catch (_) {
    bundles = null;
  }
  final bundle = bundles?.where((b) => b.name == name).firstOrNull;
  if (!context.mounted) return;
  if (bundle == null) {
    final l10n = context.l10n;
    messenger?.showSnackBar(
      SnackBar(content: Text(bundles == null ? l10n.commonEngineUnreachable : l10n.catalogHostPluginMissing)),
    );
    return;
  }
  await showBundleSheet(context, bundle);
}

/// DSH's optional reasoning-translation bundle.
const cotTranslationBundle = '@deepseek-ai/dsh-experimental-cot-translation-bundle';

/// The last section: shortcuts to settings pages (the same pages, by the same
/// names), followed by 全部设置.
const settingsFeatureSection = 'settings';

/// What 全部功能 holds: things to do now. Settings live in 设置; the last
/// group is a few shortcuts there (docs/design/settings-ia.md §4.6).
final featureSections = <FeatureSection>[
  FeatureSection.localized((l10n) => l10n.catalogCurrentChat, [
    FeatureItem.localized(
      id: 'session-detail',
      title: (l10n) => l10n.catalogChatDetails,
      summary: (l10n) => l10n.catalogChatDetailsSummary,
      icon: AppIcons.sessionDetails,
      needsSession: true,
      action: (context, ref, id) => SessionDetailPage.open(context, _session(id)),
    ),
    FeatureItem.localized(
      id: 'artifacts',
      title: (l10n) => l10n.catalogArtifacts,
      summary: (l10n) => l10n.catalogArtifactsSummary,
      icon: AppIcons.artifacts,
      needsSession: true,
      native: (id) => SessionArtifactsPage(sessionId: _session(id)),
    ),
    FeatureItem.localized(
      id: 'files',
      title: (l10n) => l10n.catalogFiles,
      summary: (l10n) => l10n.catalogFilesSummary,
      icon: AppIcons.files,
      tile: FeatureKind.files,
      needsSession: true,
      native: (id) => WorkspaceFilesPage(sessionId: _session(id)),
    ),
    FeatureItem.localized(
      id: 'memory',
      title: (l10n) => '记忆',
      summary: (l10n) => '查看跨设备共享记忆与 Markdown 原文',
      icon: AppIcons.readText,
      needsSession: true,
      native: (id) => MemoryPage(sessionId: _session(id)),
    ),
    FeatureItem.localized(
      id: 'terminal',
      title: (l10n) => l10n.catalogTerminal,
      summary: (l10n) => l10n.catalogTerminalSummary,
      icon: AppIcons.terminal,
      tile: FeatureKind.terminal,
      needsSession: true,
      native: (id) => TerminalPage(sessionId: _session(id)),
    ),
    FeatureItem.localized(
      id: 'export',
      title: (l10n) => l10n.catalogExport,
      summary: (l10n) => l10n.catalogExportSummary,
      icon: AppIcons.exportLog,
      needsSession: true,
      native: (id) => SessionExportPage(sessionId: _session(id)),
    ),
    FeatureItem.localized(
      id: 'jobs',
      title: (l10n) => l10n.catalogJobs,
      summary: (l10n) => l10n.catalogJobsSummary,
      icon: AppIcons.jobs,
      needsSession: true,
      native: (id) => JobsPage(sessionId: _session(id)),
    ),
    FeatureItem.localized(
      id: 'plan-goal',
      title: (l10n) => l10n.catalogPlanGoal,
      summary: (l10n) => l10n.catalogPlanGoalSummary,
      icon: AppIcons.goal,
      needsSession: true,
      action: (context, ref, id) => SessionDetailPage.open(context, _session(id), tab: SessionTab.progress),
    ),
    FeatureItem.localized(
      id: 'skills',
      title: (l10n) => l10n.catalogSkills,
      summary: (l10n) => l10n.catalogSkillsSummary,
      icon: AppIcons.skill,
      needsSession: true,
      native: (id) => SkillsPage(sessionId: _session(id)),
    ),
    FeatureItem.localized(
      id: 'subagents',
      title: (l10n) => l10n.catalogSubagents,
      summary: (l10n) => l10n.catalogSubagentsSummary,
      icon: AppIcons.subagents,
      tile: FeatureKind.subagents,
      needsSession: true,
      action: (context, ref, id) => SessionDetailPage.open(context, _session(id), tab: SessionTab.subagents),
    ),
    FeatureItem.localized(
      id: 'reference',
      title: (l10n) => l10n.catalogReference,
      summary: (l10n) => l10n.catalogReferenceSummary,
      icon: AppIcons.mention,
      action: _backToChat,
    ),
  ]),
  FeatureSection.localized((l10n) => l10n.catalogAutomationSection, [
    FeatureItem.localized(
      id: 'schedules',
      title: (l10n) => l10n.catalogSchedules,
      summary: (l10n) => l10n.catalogSchedulesSummary,
      icon: AppIcons.automation,
      tile: FeatureKind.automation,
      native: (_) => const SchedulesPage(),
    ),
  ]),
  FeatureSection.localized((l10n) => l10n.catalogPlugins, [
    FeatureItem.localized(
      id: 'plugins',
      title: (l10n) => l10n.catalogPlugins,
      summary: (l10n) => l10n.catalogPluginsSummary,
      icon: AppIcons.plugin,
      tile: FeatureKind.plugins,
      native: (_) => const PluginsScreen(),
    ),
    FeatureItem.localized(
      id: 'cordis',
      title: (_) => 'Cordis',
      summary: (l10n) => l10n.catalogCordisSummary,
      icon: AppIcons.cordis,
      native: (id) => CordisPage(sessionId: id),
    ),
    FeatureItem.localized(
      id: 'agent-team',
      title: (l10n) => l10n.catalogAgentTeam,
      summary: (l10n) => l10n.catalogAgentTeamSummary,
      icon: AppIcons.team,
      native: (id) => TeamPage(sessionId: id),
    ),
    FeatureItem.localized(
      id: 'cot-translation',
      title: (l10n) => l10n.catalogCotTranslation,
      summary: (l10n) => l10n.catalogCotTranslationSummary,
      icon: AppIcons.translate,
      action: (context, ref, _) => _bundleSheet(context, ref, cotTranslationBundle),
    ),
    FeatureItem.localized(
      id: 'voice-input',
      title: (l10n) => l10n.catalogVoiceInput,
      summary: (l10n) => l10n.catalogVoiceInputSummary,
      icon: AppIcons.voice,
      action: _backToChat,
      // l10n:keep DSH Web plugin title aliases used for deep-link matching
      web: const DshWebTarget(pluginItem: ['语音输入', 'Voice input']),
    ),
  ]),
  FeatureSection.localized((l10n) => l10n.catalogCommunitySharingSection, [
    FeatureItem.localized(
      id: 'forum',
      title: (l10n) => l10n.catalogForum,
      summary: (l10n) => l10n.catalogForumSummary,
      icon: AppIcons.forum,
      native: (_) => const ForumHomePage(),
    ),
    FeatureItem.localized(
      id: 'community',
      title: (l10n) => l10n.catalogCommunity,
      summary: (l10n) => l10n.catalogCommunitySummary,
      icon: AppIcons.community,
      tile: FeatureKind.community,
      native: (_) => communityPage(),
    ),
    FeatureItem.localized(
      id: 'ds-bot',
      title: (_) => 'DS Bot',
      summary: (l10n) => l10n.catalogBotSummary,
      icon: AppIcons.bot,
      native: (_) => const BotsPage(),
    ),
    FeatureItem.localized(
      id: 'share-profile',
      title: (l10n) => l10n.catalogShareProfile,
      summary: (l10n) => l10n.catalogShareProfileSummary,
      icon: AppIcons.shareConfig,
      action: (context, ref, _) => showShareProfileSheet(context),
    ),
  ]),
  FeatureSection.localized((l10n) => l10n.catalogToolsSection, [
    FeatureItem.localized(
      id: 'search',
      title: (l10n) => l10n.catalogSearch,
      summary: (l10n) => l10n.catalogSearchSummary,
      icon: AppIcons.search,
      action: (context, ref, _) async {
        final id = await showSessionSearch(context);
        if (id != null && context.mounted) {
          openSessionInChat(context, ref, id);
        }
      },
    ),
    FeatureItem.localized(
      id: 'workspaces',
      title: (l10n) => l10n.catalogWorkspaces,
      summary: (l10n) => l10n.catalogWorkspacesSummary,
      icon: AppIcons.workspace,
      tile: FeatureKind.workspace,
      native: (_) => const WorkspacesPage(),
    ),
    FeatureItem.localized(
      id: 'web',
      title: (l10n) => l10n.commonWeb,
      summary: (l10n) => l10n.catalogWebSummary,
      icon: AppIcons.webApp,
      web: const DshWebTarget(),
    ),
  ]),
  // The same pages as in 设置 (one home, one name), for people who look
  // here first; 全部设置 follows them (AllFeaturesPage).
  FeatureSection.localized((l10n) => l10n.commonSettings, [
    FeatureItem.localized(
      id: 'models',
      title: (l10n) => l10n.catalogModels,
      summary: (l10n) => l10n.catalogModelsSummary,
      icon: AppIcons.providers,
      tile: FeatureKind.models,
      native: (_) => const ProvidersPage(),
    ),
    FeatureItem.localized(
      id: 'permission',
      title: (l10n) => l10n.catalogPermission,
      summary: (l10n) => l10n.catalogPermissionSummary,
      icon: AppIcons.permissions,
      native: (id) => PermissionPage(sessionId: id),
    ),
    FeatureItem.localized(
      id: 'phone',
      title: (l10n) => l10n.catalogPhoneControl,
      summary: (l10n) => l10n.catalogPhoneControlSummary,
      icon: AppIcons.phoneControl,
      tile: FeatureKind.phone,
      native: (_) => const PhoneControlScreen(),
    ),
    FeatureItem.localized(
      id: 'remote',
      title: (l10n) => l10n.commonRemoteHost,
      summary: (l10n) => l10n.catalogRemoteSummary,
      icon: AppIcons.remoteHosts,
      native: (_) => const RemoteScreen(),
    ),
  ], id: settingsFeatureSection),
];

/// The section the host's plugin panels join.
String get pluginFeatureSection => appL10n.catalogPlugins;

/// 全部功能's sections, with an entry per plugin panel the host has (`main`)
/// at the end of 插件. Exactly [featureSections] without one.
final featureSectionsProvider = Provider.autoDispose<List<FeatureSection>>((ref) {
  final plan = ref.watch(seatPlanProvider(const SeatRequest(slot: Slots.main, placement: SeatPlacement.page)));
  final items = plan.visible;
  if (items.isEmpty) return featureSections;
  final bundles = ref.watch(installedPluginsProvider.select((s) => s.value));
  final inventory = ref.watch(seatInventoryProvider);
  final panels = [
    for (final item in items)
      pluginPanelFeature(
        item,
        bundles: bundles,
        inventory: inventory,
        // A native panel's plugin may have declared a title of its own.
        owner: item.mode == SeatMode.native ? ref.watch(nativePluginTitleProvider(item.occupant.package)) : null,
      ),
  ];
  return [
    for (final section in featureSections)
      section.items.any((item) => item.id == 'plugins')
          ? FeatureSection.localized(
              (l10n) => l10n.catalogPlugins,
              [...section.items, ...panels],
              note: section.note,
              id: section.id,
            )
          : section,
  ];
});

/// One plugin panel as an entry: its native or island page, or DSH Web (the
/// card then says 「网页版」) when neither can come up. [owner] is the
/// plugin's name for people (its declared title); a package name is never
/// shown: then the card just says 「插件面板」.
FeatureItem pluginPanelFeature(SeatItem item, {List<PluginBundle>? bundles, SeatInventory? inventory, String? owner}) {
  final o = item.occupant;
  final bundle = seatBundleOf(bundles, o.package);
  // The panel's name is on its sidebar entry; `main` itself has none.
  final title = seatEntryTitle(o, inventory: inventory, bundle: bundle);
  final by = owner ?? bundle?.title() ?? o.package;
  final named = by.trim().isNotEmpty && by != o.package && by != title;
  final native = inventory?.nativePanel(o.package, o.cell);
  final page = SeatRequest(slot: Slots.main, placement: SeatPlacement.page, package: o.package, cell: o.cell);
  return FeatureItem.localized(
    id: 'plugin-panel:${o.package}#${o.cell}',
    title: (_) => title,
    summary: (l10n) => named ? by : l10n.catalogPluginPanel,
    icon: nativeIcon(native?.icon) ?? AppIcons.plugin,
    native: item.mode == SeatMode.webLink ? null : (_) => PluginSeatPage(title: title, request: page),
    web: item.mode == SeatMode.webLink ? seatWebTarget(o, bundle: bundle) : null,
  );
}
