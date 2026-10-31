// A folder in the drawer list: its header row and the
// members it reveals.

import 'package:flutter/material.dart';

import '../../../l10n/l10n.dart';
import '../../../state/drawer_view_state.dart';
import '../../common/expand_reveal.dart';
import '../../theme/app_icons.dart';
import '../../theme/theme.dart';
import 'folder_mark.dart';
import 'session_tile.dart';

/// A folder's row: the mark on the 20 line, the name, the member count and a
/// chevron that turns as the folder opens. Same 44 height and 10 edges as a
/// conversation row. Tap: open or close. Long press: the folder's actions.
class DrawerFolderHeader extends StatelessWidget {
  const DrawerFolderHeader({
    super.key,
    required this.folder,
    required this.count,
    required this.onTap,
    required this.onLongPress,
  });

  final DrawerFolder folder;
  final int count;
  final VoidCallback onTap;
  final VoidCallback onLongPress;

  /// Mark slot (members' titles start [SessionTile.folderIndent] in).
  static const mark = 20.0;

  /// Optical shift of the chevron (its glyph carries its own air).
  static const chevronNudge = 4.0;

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final theme = Theme.of(context);
    final colors = DshColors.of(context);
    final open = !folder.collapsed;
    return Semantics(
      button: true,
      expanded: open,
      label: count == 0 ? l10n.shellFolderLabel(folder.name) : l10n.shellFolderChatCount(folder.name, count),
      onTap: onTap,
      onLongPress: onLongPress,
      excludeSemantics: true,
      child: Material(
        type: MaterialType.transparency,
        child: InkWell(
          onTap: onTap,
          onLongPress: onLongPress,
          customBorder: Squircle.border(AppShape.md),
          child: SizedBox(
            height: SessionTile.height,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Row(
                children: [
                  FolderMarkGlyph.of(folder, size: mark),
                  const SizedBox(width: SessionTile.folderIndent - mark),
                  Expanded(
                    child: Text(
                      folder.name,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: theme.textTheme.bodyLarge?.copyWith(
                        fontSize: 15,
                        height: 1.4,
                        color: theme.colorScheme.onSurface,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                  if (count > 0) ...[
                    const SizedBox(width: 8),
                    Text(
                      '$count',
                      style: AppType.tabular(theme.textTheme.bodySmall!.copyWith(color: colors.textTertiary)),
                    ),
                  ],
                  const SizedBox(width: 4),
                  // The chevron's glyph sits ~5 inside its box; 4 out puts its
                  // ink on the line where the rows' markers end.
                  Transform.translate(
                    offset: const Offset(chevronNudge, 0),
                    child: AnimatedRotation(
                      turns: open ? 0 : -0.25,
                      duration: AppMotion.of(context, AppMotion.collapse),
                      curve: AppMotion.collapseCurve,
                      child: Icon(AppIcons.expand, size: 18, color: colors.textTertiary),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

/// A folder's members under its header, opening and closing with
/// [ExpandReveal]. An empty folder says so on the members' line.
class DrawerFolderBody extends StatelessWidget {
  const DrawerFolderBody({super.key, required this.open, required this.childrenBuilder});

  final bool open;
  final List<Widget> Function() childrenBuilder;

  @override
  Widget build(BuildContext context) {
    return ExpandReveal(
      open: open,
      // ExpandReveal removes this subtree once closed. Defer constructing the
      // member tiles too, including folders that start collapsed.
      child: Builder(
        builder: (_) {
          final children = childrenBuilder();
          return Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisSize: MainAxisSize.min,
            children: children.isEmpty ? const [_EmptyFolderLine()] : children,
          );
        },
      ),
    );
  }
}

class _EmptyFolderLine extends StatelessWidget {
  const _EmptyFolderLine();

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final theme = Theme.of(context);
    return SizedBox(
      height: 36,
      child: Padding(
        // The list sits on the 10 line; rows add 10 more, members the indent.
        padding: const EdgeInsets.only(left: 10 + SessionTile.folderIndent),
        child: Align(
          alignment: Alignment.centerLeft,
          child: Text(
            l10n.shellNoChatsYet,
            style: theme.textTheme.bodySmall?.copyWith(color: DshColors.of(context).textTertiary),
          ),
        ),
      ),
    );
  }
}
