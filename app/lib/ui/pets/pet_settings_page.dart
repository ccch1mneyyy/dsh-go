// 设置 › 主题 › 宠物 (docs/design/pets.md §2.1): which pet (with live
// previews), its size, quiet mode, and the out-of-app overlay's group.
// Entry: [PetEntryTile] on the 主题 page.

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../l10n/l10n.dart';
import '../../pets/pet_prefs.dart';
import '../../pets/pet_signals.dart';
import '../../pets/pet_state.dart';
import '../common/expand_reveal.dart';
import '../settings/settings_widgets.dart';
import '../theme/app_icons.dart';
import '../shell/page_frame.dart';
import 'overlay_settings_tile.dart';
import 'pet_picker.dart';

/// 设置 › 宠物: the chosen pet (or 不显示) on the right; opens
/// [PetSettingsPage].
class PetEntryTile extends ConsumerWidget {
  const PetEntryTile({super.key, this.tint = 0});

  /// The hub group's hue.
  final int tint;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final id = ref.watch(petPrefsProvider.select((p) => p.packId));
    final packName = id == noPetId ? null : ref.watch(petPackProvider(id)).value?.name;
    final name = AppLocale.usesWesternConventions ? petNames[id] ?? packName ?? id : packName ?? petNames[id] ?? id;
    return SettingsTile(
      icon: AppIcons.pet,
      tint: tint,
      spot: SettingsIndex.entry(SettingsPageId.pets),
      value: Text(name),
      onTap: () => PetSettingsPage.open(context),
    );
  }
}

/// 宠物设置.
class PetSettingsPage extends ConsumerWidget {
  const PetSettingsPage({super.key});

  static Future<void> open(BuildContext context) =>
      Navigator.of(context).push(MaterialPageRoute<void>(builder: (_) => const PetSettingsPage()));

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = context.l10n;
    final prefs = ref.watch(petPrefsProvider);
    final now = ref.watch(petClockProvider)();
    final hidden = prefs.hiddenAt(now) ? prefs.hiddenUntil : null;
    final notifier = ref.read(petPrefsProvider.notifier);
    return AppPage.list(
      title: l10n.botsPets,
      children: [
        SettingsSection(footer: Text(l10n.botsPetSource), children: const [PetPicker()]),
        ExpandReveal(
          open: prefs.enabled,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              SettingsSection(
                children: [
                  SettingsSegmentTile<PetSize>(
                    spot: Spots.petSize,
                    segments: [for (final s in PetSize.values) PillSegment(s, s.label)],
                    selected: prefs.size,
                    onChanged: (s) => unawaited(notifier.setSize(s)),
                  ),
                  SettingsSwitchTile(
                    spot: Spots.petQuiet,
                    subtitle: l10n.botsPetQuietSubtitle,
                    value: prefs.quiet,
                    onChanged: (v) => unawaited(notifier.setQuiet(v)),
                  ),
                  if (hidden != null)
                    SettingsTile(
                      title: l10n.botsPetShowNow,
                      value: Text(l10n.botsPetHiddenUntil(_clock(hidden))),
                      chevron: false,
                      onTap: () => unawaited(notifier.unhide()),
                    ),
                ],
              ),
              // App 外显示 (the overlay).
              const PetOverlaySettingsSection(),
            ],
          ),
        ),
      ],
    );
  }

  static String _clock(DateTime t) => '${t.hour}:${t.minute.toString().padLeft(2, '0')}';
}
