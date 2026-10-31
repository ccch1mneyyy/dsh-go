// The fixed vocabulary of `$DSH_HOME/dsh-go/ui.json` v1. The same lists and
// limits are in the skill's `schema.json` (assets/skills/dsh-go-ui/), which the
// zero-dependency checker `check.mjs` reads;
// test/ui_config/schema_sync_test.dart keeps the two equal, and the shared
// fixtures keep both validators' output equal.

/// Version, limits and value sets of ui.json v1.
abstract final class UiSchema {
  /// The newest version this app reads.
  static const version = 1;

  /// Larger files are not read at all.
  static const maxBytes = 64 * 1024;

  /// Deeper nesting is a syntax error (nothing valid comes close).
  static const maxDepth = 32;

  /// Top-level keys; `$schema` is also accepted (for editors) and skipped.
  static const topKeys = [
    'version',
    'header',
    'composer',
    'emptyState',
    'drawer',
    'density',
    'hide',
    'theme',
    'pet',
    'shortcuts',
    'plugins',
  ];

  // ── header ─────────────────────────────────────────────────────────────

  /// The chat header's own buttons (lib/ui/chat/chat_header.dart): new
  /// chat, conversation details (the title pill's panel key on wide
  /// windows), the schedule clock, the agents capsule and the model chip.
  /// The menu key and the title pill always stay.
  static const headerBuiltins = ['newChat', 'detail', 'schedule', 'agents', 'model'];
  static const headerCustomMax = 3;
  static const headerLabelMax = 8;

  // ── composer / empty state ─────────────────────────────────────────────

  static const quickActionsMax = 8;
  static const quickLabelMax = 10;
  static const suggestionsMax = 6;
  static const suggestionTitleMax = 20;
  static const suggestionSubtitleMax = 40;

  // ── drawer, density, hide, theme, pet ──────────────────────────────────

  /// lib/state/drawer_view_state.dart: pinned, folders, then `SessionDay`.
  static const drawerGroups = ['pinned', 'folders', 'today', 'yesterday', 'thisWeek', 'earlier'];

  /// `DrawerSort` names.
  static const drawerSorts = ['activity', 'created'];

  /// `DrawerFilter` names.
  static const drawerFilters = ['all', 'running', 'pending', 'unread'];
  static const densities = ['compact', 'comfortable'];

  /// turnFooter: the per-turn footnote (turn_footnote.dart); tokenCount: the
  /// token figures in it and in the activity strip; reasoningDetails: the
  /// thinking row (thinking_pill.dart); activityStrip, whaleTail; todoPill
  /// and goalBar: the dock bars (chat/dock/).
  static const hideItems = [
    'turnFooter',
    'tokenCount',
    'reasoningDetails',
    'activityStrip',
    'whaleTail',
    'todoPill',
    'goalBar',
  ];
  static const themeModes = ['system', 'light', 'dark'];

  /// `AppAccent.presets` ids (lib/ui/theme/accent.dart).
  static const accentPresets = ['mist', 'daiqing', 'dusk', 'turquoise', 'amber', 'graphite'];
  static const petPositions = ['top-left', 'top-right', 'bottom-left', 'bottom-right'];

  // ── shortcuts ──────────────────────────────────────────────────────────

  static const shortcutsMax = 20;

  /// Keys a shortcut may end in (after `ctrl` / `alt` / `shift`).
  static const shortcutKeys = [
    'a', 'b', 'c', 'd', 'e', 'f', 'g', 'h', 'i', 'j', 'k', 'l', 'm', //
    'n', 'o', 'p', 'q', 'r', 's', 't', 'u', 'v', 'w', 'x', 'y', 'z', //
    '0', '1', '2', '3', '4', '5', '6', '7', '8', '9', //
    'f1', 'f2', 'f3', 'f4', 'f5', 'f6', 'f7', 'f8', 'f9', 'f10', 'f11', 'f12', //
    '/', ',', '.', '[', ']', 'enter', 'up', 'down', 'left', 'right',
  ];

  /// Words that name a system key (never allowed).
  static const systemModifiers = ['meta', 'cmd', 'command', 'win', 'super', 'os'];

  /// Taken by text editing, the system or input methods (canonical form).
  static const reservedShortcuts = [
    'ctrl+a',
    'ctrl+c',
    'ctrl+v',
    'ctrl+x',
    'ctrl+y',
    'ctrl+z',
    'ctrl+shift+v',
    'ctrl+shift+z',
    'alt+f4',
  ];

  // ── plugins ────────────────────────────────────────────────────────────

  /// `plugins.seats` values; `web` is the seat planner's 「在网页版打开」.
  static const seatModes = ['native', 'island', 'web', 'hidden'];

  // ── actions ────────────────────────────────────────────────────────────

  static const actionTypes = ['send', 'open', 'command', 'link'];
  static const sendTextMax = 2000;
  static const commandArgsMax = 500;
  static const urlMax = 2000;

  /// `open` targets: the ids of lib/ui/features/feature_catalog.dart plus
  /// the new-chat screen and settings.
  static const pages = [
    'session-detail',
    'artifacts',
    'files',
    'terminal',
    'export',
    'jobs',
    'plan-goal',
    'skills',
    'subagents',
    'reference',
    'schedules',
    'permission',
    'agent-presets',
    'models',
    'subagent-settings',
    'agent-loop',
    'shell-settings',
    'web-search',
    'plugins',
    'plugin-inventory',
    'cordis',
    'agent-team',
    'cot-translation',
    'voice-input',
    'forum',
    'community',
    'ds-bot',
    'share-profile',
    'search',
    'notifications',
    'workspaces',
    'general',
    'account',
    'remote',
    'phone',
    'engine',
    'diagnostics',
    'web',
    'memory',
    'new-chat',
    'settings',
  ];

  /// Icons a custom header button may use (lib/ui_config/ui_config_icons.dart
  /// maps each to an `AppIcons` role).
  static const icons = [
    'bolt',
    'star',
    'sparkle',
    'heart',
    'flag',
    'bookmark',
    'pin',
    'bell',
    'clock',
    'alarm',
    'calendar',
    'todo',
    'note',
    'document',
    'folder',
    'search',
    'code',
    'terminal',
    'globe',
    'chart',
    'lightbulb',
    'book',
    'puzzle',
    'robot',
    'chat',
    'mail',
    'translate',
    'image',
    'camera',
    'mic',
    'link',
    'summary',
    'wrench',
    'bug',
    'travel',
    'school',
    'home',
    'play',
    'refresh',
    'archive',
    'team',
    'wallet',
    'palette',
  ];
}
