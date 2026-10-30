// Portions derived from PiPilot (https://github.com/CikeSeven/pi_pilot), MIT, Copyright (c) 2026 CikeSeven. See THIRD_PARTY_NOTICES.md.

import 'dart:async';

import 'package:dsh_client/dsh_client.dart' show CotTranslationLimits;
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../l10n/l10n.dart';
import '../../../state/cot_translation_state.dart';
import '../../../state/sessions_state.dart';
import '../../common/expand_reveal.dart';
import '../../common/pressable.dart';
import '../../common/smooth_size.dart';
import '../../common/think_glyph.dart';
import '../../engine_settings/engine_settings_page.dart' show openSettingsPage;
import '../../theme/app_icons.dart';
import '../../theme/theme.dart';
import '../render/markdown_body.dart';
import 'stream_row.dart';

/// 思考过程:**和工具行同一套解剖的一行**,点开在下面细线旁展开全文。
///
/// ```
/// ⚛ 思考中 · 先看 pubspec 里锁的版本…   ⌄   ← 轨道在转;预览是最近一段的首行
/// ⚛ 思考 · 用户想把工具调用折叠起来…    ⌄   ← 完成后预览全文首行
/// │ 全文(次级排版)                        ← 点正文任意处也收回去
/// │ ⌃ 收起                                ← 展开区末尾留一个出口
/// ```
///
/// 图形块是品牌蓝(思考是 DeepSeek 的品牌时刻),其余都是过程行的次级色。
///
/// 预览规则照官方 Web:思考中只取"已经写完首行的最近一段",不跟着半句话抖;
/// 完成后取全文第一行;都去掉 `**`。展开是次级排版的 Markdown。
///
/// 引擎开着「思考过程机器翻译」插件时,展开的全文上方多一颗「翻译」:
/// 译文就地替换原文,随时「查看原文」切回去(官方 cot-translation 的行为)。
/// DeepSeek 品牌蓝(与鲸尾同色)。
const _brandBlue = Color(0xFF4D6BFE);

class ThinkingPill extends StatefulWidget {
  const ThinkingPill({super.key, required this.reasoning, this.active = false});

  final String reasoning;

  /// 模型此刻还在思考(流式中且正文还没开始)。
  final bool active;

  @override
  State<ThinkingPill> createState() => _ThinkingPillState();
}

/// 收起时的一行预览(官方 ReasoningRow 的规则)。
String thinkingPreview(String text, {required bool active}) {
  final line = active ? _latestParagraphFirstLine(text) : _firstLine(text);
  return line.replaceAll('**', '').trim();
}

String _firstLine(String text) {
  final trimmed = text.trimLeft();
  final newline = trimmed.indexOf('\n');
  return newline == -1 ? trimmed : trimmed.substring(0, newline);
}

/// 最近一段里已经写完(后面跟着换行)的首行;还没有就空。
String _latestParagraphFirstLine(String text) {
  var summary = '';
  var start = 0;
  final separators = _paragraphBreak.allMatches(text).toList();
  for (var i = 0; i <= separators.length; i++) {
    final separator = i < separators.length ? separators[i] : null;
    final end = separator == null ? text.length : separator.start + separator[0]!.indexOf('\n');
    final newline = text.indexOf('\n', start);
    if (newline != -1 && newline <= end) {
      final candidate = text.substring(start, newline).trim();
      if (candidate.isNotEmpty) summary = candidate;
    }
    if (separator == null) break;
    start = separator.end;
  }
  return summary;
}

final _paragraphBreak = RegExp(r'\r?\n(?:[\t ]*\r?\n)+');

class _ThinkingPillState extends State<ThinkingPill> {
  bool _expanded = false;

  /// 译文与"看译文还是原文":收起再展开也还在。
  final _translation = _TranslationHolder();

  @override
  void dispose() {
    _translation.dispose();
    super.dispose();
  }

  void _toggle() => setState(() => _expanded = !_expanded);

  /// 展开区自己也能收回去:长思考读完时人已经在下面了,不必滚回标题行。
  void _collapse() {
    if (_expanded) setState(() => _expanded = false);
  }

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final theme = Theme.of(context);
    final dark = theme.brightness == Brightness.dark;
    // 深色底上品牌蓝提一档亮度,图形才不发闷。
    final brand = dark ? Color.lerp(_brandBlue, Colors.white, 0.3)! : _brandBlue;
    final active = widget.active;
    final preview = _expanded ? '' : thinkingPreview(widget.reasoning, active: active);
    final detail = StreamRow.detail(context);
    final body = _hasProviderScope(context)
        ? _TranslatableReasoning(text: widget.reasoning.trim(), active: active, holder: _translation)
        : MarkdownBody(text: widget.reasoning.trim(), streaming: active, secondary: true);

    final header = Row(
      children: [
        SizedBox.square(
          dimension: StreamRow.lead,
          child: DecoratedBox(
            decoration: ShapeDecoration(
              color: brand.withValues(alpha: dark ? 0.18 : 0.10),
              shape: Squircle.border(StreamRow.lead * 0.32),
            ),
            child: Center(
              child: ThinkGlyph(size: 15, color: brand, spinning: active),
            ),
          ),
        ),
        const SizedBox(width: StreamRow.gap),
        SmoothSize(
          duration: AppMotion.of(context, AppMotion.quick),
          alignment: Alignment.centerLeft,
          child: AnimatedSwitcher(
            duration: AppMotion.of(context, AppMotion.quick),
            layoutBuilder: (current, previous) =>
                Stack(alignment: Alignment.centerLeft, children: [...previous, ?current]),
            child: Text(
              active ? l10n.chatThinkingActive : l10n.chatThinking,
              key: ValueKey(active),
              style: StreamRow.label(context),
            ),
          ),
        ),
        if (preview.isNotEmpty) ...[
          const StreamDot(),
          Expanded(
            child: ShaderMask(
              blendMode: BlendMode.dstIn,
              shaderCallback: (rect) => LinearGradient(
                colors: const [Colors.black, Colors.transparent],
                stops: [((rect.width - 40) / rect.width).clamp(0.0, 1.0), 1],
              ).createShader(rect),
              child: Text(preview, maxLines: 1, softWrap: false, overflow: TextOverflow.clip, style: detail),
            ),
          ),
        ] else
          const Spacer(),
        const SizedBox(width: 4),
        StreamChevron(open: _expanded),
      ],
    );

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      mainAxisSize: MainAxisSize.min,
      children: [
        Semantics(
          button: true,
          expanded: _expanded,
          child: StreamRowFrame(onTap: _toggle, child: header),
        ),
        ExpandReveal(
          open: _expanded,
          child: StreamThread(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisSize: MainAxisSize.min,
              children: [
                // 正文整块可以点:整段读完想收起时,手指就在这儿。
                // 链接和翻译胶囊自带识别器,点的还是它们;这里只兜住空白处。
                // excludeFromSemantics:读屏仍走标题行和底部「收起」,免得整段
                // 思考被念成一个大按钮。
                GestureDetector(
                  behavior: HitTestBehavior.opaque,
                  excludeFromSemantics: true,
                  onTap: _collapse,
                  child: Padding(padding: const EdgeInsets.only(top: 4), child: body),
                ),
                const SizedBox(height: 4),
                _CollapseFooter(onTap: _collapse),
                const SizedBox(height: 4),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

/// 展开区末尾的「收起」:还是那条过程行的骨相(同一点按区、同一套次级字色),
/// 箭头朝上。只在展开时在树上,跟着 [ExpandReveal] 一起长出来、一起淡出。
class _CollapseFooter extends StatelessWidget {
  const _CollapseFooter({required this.onTap});

  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final label = context.l10n.commonCollapse;
    return Semantics(
      button: true,
      label: label,
      onTap: onTap,
      excludeSemantics: true,
      child: StreamRowFrame(
        onTap: onTap,
        child: Row(
          children: [
            StreamChevron(open: true),
            const SizedBox(width: 6),
            Text(label, style: StreamRow.label(context)),
          ],
        ),
      ),
    );
  }
}

/// Golden and geometry tests pump the pill without a ProviderScope; there is
/// no engine to ask then, so the plain text shows.
bool _hasProviderScope(BuildContext context) {
  try {
    ProviderScope.containerOf(context, listen: false);
    return true;
  } on StateError {
    return false;
  }
}

/// 一段思考的翻译状态,挂在 [_ThinkingPillState] 上(展开区收起时子树会被
/// 拿掉,译文不能跟着丢)。
class _TranslationHolder {
  ReasoningTranslation? controller;

  /// 正在看译文(false = 用户切回了原文)。
  bool showTranslation = false;

  void dispose() => controller?.dispose();
}

/// 展开后的全文 + 翻译工具条。插件没开、当前模型的思考本来就是中文、或者
/// 没连上引擎时,只有全文。
class _TranslatableReasoning extends ConsumerStatefulWidget {
  const _TranslatableReasoning({required this.text, required this.active, required this.holder});

  final String text;
  final bool active;
  final _TranslationHolder holder;

  @override
  ConsumerState<_TranslatableReasoning> createState() => _TranslatableReasoningState();
}

class _TranslatableReasoningState extends ConsumerState<_TranslatableReasoning> {
  ReasoningTranslation? _listening;

  @override
  void initState() {
    super.initState();
    _listen(widget.holder.controller);
  }

  @override
  void didUpdateWidget(_TranslatableReasoning old) {
    super.didUpdateWidget(old);
    _listen(widget.holder.controller);
    if (old.text != widget.text || old.active != widget.active) {
      widget.holder.controller?.update(widget.text, running: widget.active);
    }
  }

  @override
  void dispose() {
    _listening?.removeListener(_changed);
    super.dispose();
  }

  void _listen(ReasoningTranslation? controller) {
    if (identical(controller, _listening)) return;
    _listening?.removeListener(_changed);
    _listening = controller?..addListener(_changed);
  }

  void _changed() {
    if (mounted) setState(() {});
  }

  void _start(CotTranslationLimits limits, ReasoningTranslator translator) {
    final holder = widget.holder;
    final sessionId = ref.read(currentSessionProvider);
    final controller = holder.controller ??= ReasoningTranslation(
      maxTextChars: limits.maxTextChars,
      translate: (text) => translator(text, limits: limits, sessionId: sessionId),
    );
    _listen(controller);
    setState(() => holder.showTranslation = true);
    controller.update(widget.text, running: widget.active);
  }

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final holder = widget.holder;
    final controller = holder.controller;
    final limits = ref.watch(cotTranslationProvider).value;
    final translator = ref.watch(reasoningTranslatorProvider);
    final offered =
        limits != null &&
        translator != null &&
        reasoningNeedsTranslation(widget.text, limits.targetFor(reasoningUiLanguage));
    final failed = controller?.failed ?? false;
    final showing = holder.showTranslation && controller != null && !failed;
    final body = MarkdownBody(
      text: showing ? controller.text.trim() : widget.text,
      streaming: widget.active,
      secondary: true,
    );
    if (controller == null && !offered) return body;

    final tools = <Widget>[
      if (controller == null)
        _TranslateChip(icon: AppIcons.translate, label: l10n.chatTranslate, onTap: () => _start(limits!, translator!))
      else if (failed) ...[
        Text(
          l10n.chatTranslationUnavailable,
          style: Theme.of(context).textTheme.labelMedium?.copyWith(color: DshColors.of(context).textTertiary),
        ),
        const SizedBox(width: 8),
        _TranslateChip(icon: AppIcons.retry, label: l10n.commonRetry, onTap: controller.retry),
      ] else
        _TranslateChip(
          icon: AppIcons.translate,
          label: showing ? l10n.chatViewOriginal : l10n.chatViewTranslation,
          onTap: () => setState(() => holder.showTranslation = !holder.showTranslation),
        ),
      if (controller != null && controller.pending && !failed) ...[
        const SizedBox(width: 10),
        Semantics(
          label: l10n.chatTranslating,
          child: SizedBox.square(
            dimension: 12,
            child: CircularProgressIndicator(strokeWidth: 1.6, color: DshColors.of(context).textTertiary),
          ),
        ),
      ],
    ];
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Padding(
          padding: const EdgeInsets.only(bottom: 6),
          child: Row(mainAxisSize: MainAxisSize.min, children: tools),
        ),
        body,
      ],
    );
  }
}

/// 工具条上的小胶囊:左右等距 10,图标 14、字 12.5。
class _TranslateChip extends StatelessWidget {
  const _TranslateChip({required this.icon, required this.label, required this.onTap});

  final IconData icon;
  final String label;
  final VoidCallback onTap;

  /// Held down: 翻译设置 (target language, translation service).
  void _settings(BuildContext context) => unawaited(openSettingsPage(context, 'cot-translation'));

  static const height = 26.0;
  static const padding = 10.0;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final dark = theme.brightness == Brightness.dark;
    final fg = theme.colorScheme.onSurfaceVariant;
    return Pressable(
      onTap: onTap,
      onLongPress: () => _settings(context),
      semanticLabel: label,
      child: Container(
        constraints: const BoxConstraints(minHeight: height),
        padding: const EdgeInsets.symmetric(horizontal: padding),
        decoration: ShapeDecoration(
          color: dark ? Colors.white.withValues(alpha: 0.08) : theme.colorScheme.onSurface.withValues(alpha: 0.06),
          shape: const StadiumBorder(),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(icon, size: 14, color: fg),
            const SizedBox(width: 4),
            Text(label, style: theme.textTheme.labelMedium?.copyWith(fontSize: 12.5, height: 1.2, color: fg)),
          ],
        ),
      ),
    );
  }
}
