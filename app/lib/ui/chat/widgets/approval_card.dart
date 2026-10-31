// Portions derived from PiPilot (https://github.com/CikeSeven/pi_pilot), MIT, Copyright (c) 2026 CikeSeven. See THIRD_PARTY_NOTICES.md.
// Layout after DSH Web's ApprovalPanel (warning hairline, warning strip, title,
// monospace command, right-aligned buttons).

import 'package:dsh_client/dsh_client.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../../l10n/l10n.dart';
import '../../../notify/approval_reason.dart';
import '../../common/risk_notice.dart';
import '../../theme/app_icons.dart';
import '../../theme/theme.dart';
import '../tool_view.dart';
import 'chat_card.dart';

typedef ApprovalResponder = Future<void> Function(ApprovalRequest request, ApprovalDecision decision);

/// "本对话都允许":允许这一次,并让本对话之后的审批都自动放行。
typedef ApprovalAllowAll = Future<void> Function(ApprovalRequest request);

/// 审批卡:**屏幕上最显眼的东西,但不靠大红色**。
///
/// 本机没有 bash 沙箱,审批是最后一道闸。外壳与标题行是 [ChatCard] 的
/// 「警示」语气:警示色盾牌 + 1px 警示细线,标题直接问「允许运行这条命令？」。
///
/// ```
/// ┌──────────────────────────────────┐
/// │ ⛉ 允许运行这条命令？             │
/// │   运行登录相关测试               │  说明(次级)
/// │ ┌──────────────────────────────┐ │
/// │ │ $ flutter test test/auth     │ │  命令井
/// │ └──────────────────────────────┘ │
/// │   沙箱外运行:需要联网            │  理由(三级)
/// │ [    拒绝    ]  [   允许本次   ] │  等宽两键,主色只给"允许本次"
/// │           本对话都允许           │  更宽的授权降为文字按钮,避免误触
/// └──────────────────────────────────┘
/// ```
class ApprovalCard extends StatefulWidget {
  const ApprovalCard({super.key, required this.request, required this.onRespond, this.onAllowAll, this.view});

  final ApprovalRequest request;
  final ApprovalResponder onRespond;

  /// null 时不显示"本对话都允许"。
  final ApprovalAllowAll? onAllowAll;

  /// 对应的工具调用(有的话用它的命令 / 路径做正文)。
  final ToolView? view;

  @override
  State<ApprovalCard> createState() => _ApprovalCardState();
}

class _ApprovalCardState extends State<ApprovalCard> {
  ApprovalDecision? _busy;

  Future<void> _respond(ApprovalDecision decision) async {
    if (_busy != null) return;
    HapticFeedback.selectionClick();
    setState(() => _busy = decision);
    await widget.onRespond(widget.request, decision);
    // 成功时卡片会随 HostRequestCancelled 消失;失败时恢复可点。
    if (mounted) setState(() => _busy = null);
  }

  Future<void> _allowAll() async {
    final allowAll = widget.onAllowAll;
    if (_busy != null || allowAll == null) return;
    HapticFeedback.selectionClick();
    // The whole conversation stops asking: said once, then trusted.
    if (!await confirmRisk(context, RiskNotices.allowForChat) || !mounted) return;
    setState(() => _busy = ApprovalDecision.allowOnce);
    await allowAll(widget.request);
    if (mounted) setState(() => _busy = null);
  }

  String get _title {
    final name = widget.view?.name ?? widget.request.toolName;
    return switch (name) {
      'bash' || 'pwsh' => appL10n.chatApproveCommand,
      'write' => appL10n.chatApproveWrite,
      'edit' || 'str_replace_editor' => appL10n.chatApproveEdit,
      'web_fetch' => appL10n.chatApproveWebpage,
      'web_search' => appL10n.chatApproveSearch,
      _ => appL10n.chatApproveTool(name),
    };
  }

  String? get _reason {
    final localized = localizedApprovalReason(widget.request.displayReason, AppLocale.current.languageCode);
    final text = (localized ?? widget.request.reason)?.trim();
    return text == null || text.isEmpty ? null : text;
  }

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final theme = Theme.of(context);
    final colors = theme.colorScheme;
    final dsh = DshColors.of(context);
    final view = widget.view;
    final code = view?.command ?? (view?.path == null ? null : view!.path);
    final description = view?.arg('description')?.trim();
    final reason = _reason;
    const button = Size(0, 44);

    return ChatCard(
      icon: AppIcons.approval,
      title: _title,
      tone: ChatCardTone.attention,
      children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(ChatCard.inset, 0, ChatCard.inset, ChatCard.inset),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              if (description != null && description.isNotEmpty)
                Padding(
                  padding: const EdgeInsets.only(bottom: 4),
                  child: Text(description, style: theme.textTheme.bodyMedium?.copyWith(color: colors.onSurfaceVariant)),
                ),
              if (code != null && code.trim().isNotEmpty) ...[
                const SizedBox(height: 8),
                _CommandWell(text: code.trim(), isCommand: view?.command != null),
              ],
              if (reason != null) ...[
                const SizedBox(height: 8),
                Text(
                  reason,
                  maxLines: 3,
                  overflow: TextOverflow.ellipsis,
                  style: theme.textTheme.bodySmall?.copyWith(color: dsh.textTertiary),
                ),
              ],
              const SizedBox(height: 16),
              Row(
                children: [
                  Expanded(
                    child: OutlinedButton(
                      onPressed: _busy == null ? () => _respond(ApprovalDecision.reject) : null,
                      style: OutlinedButton.styleFrom(
                        minimumSize: button,
                        tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                        side: BorderSide(color: colors.outline.withValues(alpha: 0.5)),
                      ),
                      child: _BusySwap(busy: _busy == ApprovalDecision.reject, child: Text(l10n.chatDecline)),
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: FilledButton(
                      onPressed: _busy == null ? () => _respond(ApprovalDecision.allowOnce) : null,
                      style: FilledButton.styleFrom(
                        minimumSize: button,
                        tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                      ),
                      child: _BusySwap(
                        busy: _busy == ApprovalDecision.allowOnce,
                        color: colors.onPrimary,
                        child: Text(l10n.chatAllowOnce),
                      ),
                    ),
                  ),
                ],
              ),
              if (widget.onAllowAll != null)
                Padding(
                  padding: const EdgeInsets.only(top: 4),
                  child: Center(
                    child: TextButton(
                      onPressed: _busy == null ? _allowAll : null,
                      style: TextButton.styleFrom(
                        foregroundColor: colors.onSurfaceVariant,
                        minimumSize: const Size(0, 40),
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                        textStyle: theme.textTheme.labelMedium?.copyWith(fontSize: 13),
                      ),
                      child: Text(l10n.chatAllowForChat),
                    ),
                  ),
                ),
            ],
          ),
        ),
      ],
    );
  }
}

class _CommandWell extends StatelessWidget {
  const _CommandWell({required this.text, required this.isCommand});

  final String text;
  final bool isCommand;

  @override
  Widget build(BuildContext context) {
    final dsh = DshColors.of(context);
    final style = AppType.mono(color: dsh.codeWellFg);
    return DecoratedBox(
      decoration: ShapeDecoration(
        color: dsh.codeWellBg,
        shape: RoundedSuperellipseBorder(
          borderRadius: AppShape.radiusSm,
          side: BorderSide(color: dsh.codeWellBorder, width: 0.5),
        ),
      ),
      child: ConstrainedBox(
        constraints: const BoxConstraints(maxHeight: 148),
        child: SingleChildScrollView(
          padding: const EdgeInsets.fromLTRB(12, 8, 12, 8),
          child: SizedBox(
            width: double.infinity,
            child: SelectableText.rich(
              TextSpan(
                children: [
                  if (isCommand)
                    TextSpan(
                      text: r'$ ',
                      style: style.copyWith(color: dsh.lineNumberFg),
                    ),
                  TextSpan(text: displayPathIfPath(text, isCommand)),
                ],
              ),
              style: style,
            ),
          ),
        ),
      ),
    );
  }

  static String displayPathIfPath(String text, bool isCommand) => isCommand ? text : displayPath(text);
}

/// 按钮文字与小环交叉淡变(按钮宽度不跟着跳)。
class _BusySwap extends StatelessWidget {
  const _BusySwap({required this.busy, required this.child, this.color});

  final bool busy;
  final Widget child;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return AnimatedSwitcher(
      duration: AppMotion.of(context, AppMotion.quick),
      child: busy
          ? SizedBox.square(
              key: const ValueKey('busy'),
              dimension: 16,
              child: CircularProgressIndicator(strokeWidth: 2, color: color),
            )
          : KeyedSubtree(key: const ValueKey('idle'), child: child),
    );
  }
}
