// Portions derived from PiPilot (https://github.com/CikeSeven/pi_pilot), MIT, Copyright (c) 2026 CikeSeven. See THIRD_PARTY_NOTICES.md.

import 'dart:async';

import 'package:dsh_client/dsh_client.dart' show DshRemoteException;
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gpt_markdown/gpt_markdown.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../l10n/l10n.dart';
import '../../../links/page_links.dart' show openReplyPageLink;
import '../../../state/artifacts.dart';
import '../../../state/workspace_state.dart';
import '../../common/edge_fade.dart';
import '../../common/streaming_cursor.dart';
import '../../theme/app_icons.dart';
import '../../plugins/native/native_taps.dart' show openConfirmedLink;
import '../../theme/theme.dart';
import '../artifact_preview.dart';
import '../dsh_ui/dsh_ui.dart';
import 'code_block.dart';
import 'markdown_blocks.dart';
import 'markdown_image.dart';
import 'markdown_math.dart';
import 'math_syntax.dart';
import 'stream_repair.dart';
import 'table_syntax.dart';

/// 流式光标的占位符(私用区码位)。拼在正文末尾,由 [InlinePattern] 换成
/// 光标 —— 这样光标跟着最后一段文字走,而不是孤零零掉到正文下面。
const _cursorSentinel = '\uE000';

/// 收进 `<details>` 之外,模型常写的 HTML 都按 gpt_markdown 的默认表
/// 渲染(`<br>` 换行、`<sub>` / `<sup>`、`<kbd>`、`<u>`、`<mark>`…),
/// 不认识的标签原样显示;`<details>` 换成可折叠的一块。
final Map<String, HtmlTag?> _htmlTags = {
  'details': const HtmlTag.block(MarkdownDisclosure.build),
  'summary': const HtmlTag.block(),
};

/// 助手正文的 Markdown 渲染。
///
/// - 正文样式与用户气泡同源([AppType.chatBody]),流式与完成态不跳字号;
/// - 围栏代码交给 [CodeBlock](Mist 高亮 + 复制);
/// - 行内代码是画在文字下面的小井(gpt_markdown 1.4 的 chip),可换行、可选中;
/// - 公式:`$…$` / `\(…\)` 行内、`$$…$$` / `\[…\]` 成块([MarkdownMath]),
///   价格(`$5 和 $10`)不当公式([normalizeMath]);
/// - 图片:工作区文件、网页、`data:` 都能显示([MarkdownImage]);
/// - [streaming] 时修补正在生成的末尾([repairStreamingMarkdown]),并在
///   最后一段末尾放呼吸光标。
class MarkdownBody extends StatefulWidget {
  const MarkdownBody({
    super.key,
    required this.text,
    this.streaming = false,
    this.selectable = true,
    this.secondary = false,
  });

  final String text;
  final bool streaming;
  final bool selectable;

  /// 次级排版(思考过程):小一号、次级文字色,标题也不抢眼。
  final bool secondary;

  /// 表格单列最宽多少;更长的单元格在列内换行,而不是把整表拉得很长。
  static const _maxColumnWidth = 260.0;

  static final _themes = <String, Expando<GptMarkdownThemeData>>{};
  static final _secondaryThemes = <String, Expando<GptMarkdownThemeData>>{};

  /// 每个 ThemeData 只建一次(工厂内部会构造整套 ThemeData,不便宜)。
  static GptMarkdownThemeData _themeFor(ThemeData theme, bool secondary, L10n l10n) {
    final cache = (secondary ? _secondaryThemes : _themes).putIfAbsent(
      l10n.localeName,
      () => Expando<GptMarkdownThemeData>('markdownTheme'),
    );
    return cache[theme] ??= _buildTheme(theme, l10n, secondary: secondary);
  }

  static GptMarkdownThemeData _buildTheme(ThemeData theme, L10n l10n, {bool secondary = false}) {
    final colors = theme.colorScheme;
    final dsh = theme.extension<DshColors>()!;
    final shrink = secondary ? 0.9 : 1.0;
    TextStyle heading(double size, {double height = 1.45}) => TextStyle(
      fontSize: size * shrink,
      fontWeight: FontWeight.w600,
      height: height,
      color: secondary ? colors.onSurfaceVariant : colors.onSurface,
      leadingDistribution: TextLeadingDistribution.even,
    );
    return GptMarkdownThemeData(
      brightness: theme.brightness,
      h1: heading(20, height: 1.4),
      h2: heading(18, height: 1.4),
      h3: heading(16.5),
      h4: heading(16),
      h5: heading(15),
      h6: heading(15),
      hrLineThickness: 0.5,
      hrLineColor: colors.outlineVariant,
      hrLinePadding: const EdgeInsets.symmetric(vertical: 12),
      linkColor: colors.primary,
      linkHoverColor: colors.primary,
      autoAddDividerLineAfterH1: false,
      inlineCode: InlineCodeStyle(
        fontFamily: AppType.monoFamily,
        fontFamilyFallback: AppType.monoFallback,
        fontSizeFactor: 0.875,
        color: dsh.codeWellFg,
        backgroundColor: dsh.codeWellBg,
        borderColor: dsh.codeWellBorder,
        borderWidth: 0.5,
        borderRadius: const Radius.circular(AppShape.xs),
        padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 1),
      ),
      styleSheet: GptMarkdownStyleSheet(
        blockQuote: BlockQuoteStyle(
          barWidth: 3,
          barColor: colors.outlineVariant,
          barRadius: const Radius.circular(2),
          textStyle: TextStyle(color: colors.onSurfaceVariant),
        ),
        list: ListStyle(
          bulletColor: colors.onSurfaceVariant,
          bulletSize: 5,
          markerTextStyle: TextStyle(color: colors.onSurfaceVariant),
        ),
        // GitHub 提示块:状态色的浅底 + 左侧色条,标题用中文。
        alert: AlertStyle(
          borderRadius: const Radius.circular(AppShape.sm),
          padding: const EdgeInsetsDirectional.fromSTEB(12, 10, 14, 10),
          // 和段落同一个块间距,不再额外加外边距。
          margin: EdgeInsets.zero,
          titleStyle: const TextStyle(fontWeight: FontWeight.w600),
          titleGap: 4,
          note: AlertStyle(title: l10n.chatAlertNote, color: dsh.info, icon: AppIcons.info),
          tip: AlertStyle(title: l10n.chatAlertTip, color: dsh.success, icon: AppIcons.tip),
          important: AlertStyle(title: l10n.chatAlertImportant, color: dsh.ansi[5], icon: AppIcons.important),
          warning: AlertStyle(title: l10n.chatAlertWarning, color: dsh.warning, icon: AppIcons.warning),
          caution: AlertStyle(title: l10n.chatAlertCaution, color: dsh.danger, icon: AppIcons.caution),
        ),
        // `<mark>`:荧光笔一样的暖黄底。
        highlight: HighlightStyle(backgroundColor: dsh.warningContainer, color: dsh.onWarningContainer),
        link: LinkStyle(
          color: colors.primary,
          hoverColor: colors.primary,
          decoration: TextDecoration.underline,
          decorationThickness: 0.6,
        ),
        hr: HrStyle(thickness: 0.5, color: colors.outlineVariant),
        // 表格:细线网格、圆角与代码井一致、表头加粗;列宽随内容,但单列
        // 不超过 [_maxColumnWidth](长文字在列内换行),整表放不下时横向滚动。
        table: TableStyle(
          // 比代码井的描边重一点:深色下行线也要看得见。
          borderColor: colors.onSurface.withValues(alpha: theme.brightness == Brightness.dark ? 0.18 : 0.14),
          borderWidth: 0.5,
          borderRadius: const Radius.circular(AppShape.md),
          headerBackground: dsh.codeWellHeader,
          cellPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
          columnWidth: const MinColumnWidth(IntrinsicColumnWidth(), FixedColumnWidth(_maxColumnWidth)),
          overflow: TableOverflow.scroll,
        ),
      ),
    );
  }

  static final _cursorPattern = InlinePattern(
    pattern: RegExp(_cursorSentinel),
    builder: (context, match, style) => _cursorSpan(style),
  );

  static InlineSpan _cursorSpan(TextStyle style) {
    final fontSize = style.fontSize ?? 16;
    final lineHeight = fontSize * (style.height ?? 1.6);
    return WidgetSpan(
      alignment: PlaceholderAlignment.middle,
      child: Padding(
        padding: const EdgeInsets.only(left: 2),
        // 光标自己一层:呼吸动画只重绘这 2.5px,不重绘整段正文。
        child: RepaintBoundary(child: StreamingCursor(height: lineHeight * 0.66)),
      ),
    );
  }

  static final _streamingPatterns = [_cursorPattern];

  // Builders stay static. gpt_markdown 1.4.0's config.isSame ignores
  // onLinkTap identity; its cached spans may retain this context-only callback.
  static void _onLinkTap(BuildContext context, String url, String title) {
    if (!context.mounted) return;
    // `dshgo://open/<page>`: the guide's links to the app's own pages.
    if (openReplyPageLink(context, url)) return;
    final uri = linkToOpen(url);
    if (uri != null) {
      launchUrl(uri, mode: LaunchMode.externalApplication);
      return;
    }
    final scope = MarkdownImageScope.maybeOf(context);
    // `[官网](example.com)`: a site written without https, unless the
    // workspace really has a file by that name.
    final site = bareDomainLink(url);
    // Detached share/replay text must not borrow an unrelated active session.
    if (scope == null) {
      if (site != null) unawaited(openConfirmedLink(context, site));
      return;
    }
    final path = workspaceLinkPath(url, baseDir: scope.baseDir);
    if (path == null) return;
    if (site != null) {
      unawaited(_openFileOrSite(context, scope.sessionId, path, site));
      return;
    }
    _preview(context, scope.sessionId, path);
  }

  static void _preview(BuildContext context, String sessionId, String path) {
    Navigator.of(context).push(
      ArtifactPreviewPage.route(
        sessionId: sessionId,
        artifact: Artifact(path: path, origin: ArtifactOrigin.linked, turn: 0),
      ),
    );
  }

  /// The workspace file at [path] when there is one (a folder by that name
  /// too: its preview says so); otherwise [site], after the browser prompt.
  static Future<void> _openFileOrSite(BuildContext context, String sessionId, String path, Uri site) async {
    WorkspaceSource? source;
    try {
      source = ProviderScope.containerOf(context, listen: false).read(workspaceSourceProvider(sessionId));
    } catch (_) {
      // No provider scope above this text: nothing to look the file up in.
    }
    var file = false;
    if (source != null) {
      try {
        await source.stat(path);
        file = true;
      } on DshRemoteException catch (e) {
        file = e.code == 'workspace-file/not-regular-file';
      } catch (_) {
        // Offline or the Host failed: the site is what the link most likely meant.
      }
    }
    if (!context.mounted) return;
    if (file) {
      _preview(context, sessionId, path);
    } else {
      await openConfirmedLink(context, site);
    }
  }

  /// File endings a bare `name.ext` link reads as a file by, even where the
  /// ending is also a country's domain (`.md`, `.py`, `.rs`, `.sh`, `.pl`…).
  static const _fileEndings = {
    'md',
    'py',
    'rs',
    'sh',
    'pl',
    'pm',
    'so',
    'cc',
    'ps',
    'ml',
    'mk',
    'sv',
    'tf',
    'bz',
    'gz',
    'xz',
    'js',
    'ts',
    'go',
    'rb',
    'cs',
    'kt',
    'hs',
    'el',
    'ex',
    'fs',
    'jl',
    'db',
    'hh',
    'cp',
    'vb',
    'nb',
    'zip',
    'mov',
    'pro',
  };

  /// Endings of three letters or more that read as a website.
  static const _siteEndings = {
    'com',
    'net',
    'org',
    'edu',
    'gov',
    'mil',
    'int',
    'info',
    'biz',
    'dev',
    'app',
    'xyz',
    'top',
    'site',
    'online',
    'tech',
    'cloud',
    'page',
    'blog',
    'shop',
    'store',
    'art',
    'wiki',
    'news',
    'live',
    'life',
    'world',
    'today',
    'space',
    'website',
    'link',
    'club',
    'name',
    'mobi',
    'asia',
    'email',
    'studio',
    'design',
    'media',
    'network',
    'games',
    'chat',
    'fun',
    'icu',
    'vip',
    'ltd',
    'group',
    'global',
    'run',
    'codes',
    'tools',
    'software',
    'one',
    'plus',
    'social',
    'ink',
  };

  static final _hostLabel = RegExp(r'^[a-z0-9](?:[a-z0-9-]{0,61}[a-z0-9])?$');

  /// `example.com`, `www.example.com/docs`, `github.io` — a link target that
  /// names a website without `https://` — as the https URL; null for
  /// anything else, a file name like `notes.md` or `main.py` included.
  @visibleForTesting
  static Uri? bareDomainLink(String url) {
    var target = url.trim();
    if (target.startsWith('<') && target.endsWith('>')) {
      target = target.substring(1, target.length - 1).trim();
    }
    if (target.isEmpty || target.contains(RegExp(r'\s'))) return null;
    final uri = Uri.tryParse(target);
    if (uri == null || uri.hasScheme || uri.hasAuthority) return null;
    // The host as written: Uri drops a leading `./`, which makes it a path.
    final end = target.indexOf(RegExp('[/?#]'));
    final host = (end < 0 ? target : target.substring(0, end)).toLowerCase();
    final labels = host.split('.');
    if (labels.length < 2 || !labels.every(_hostLabel.hasMatch)) return null;
    final ending = labels.last;
    if (!RegExp(r'^[a-z]{2,}$').hasMatch(ending) || _fileEndings.contains(ending)) return null;
    final site = ending.length == 2 || _siteEndings.contains(ending) || labels.first == 'www';
    return site ? Uri.tryParse('https://$target') : null;
  }

  /// External links open only on the web or as an email: the text is
  /// model-written (and can echo a web page), so `tel:`, `sms:`, `intent:`
  /// or another app's deep link (payments included) must not launch apps.
  @visibleForTesting
  static Uri? linkToOpen(String url) {
    final uri = Uri.tryParse(url.trim());
    if (uri == null) return null;
    return switch (uri.scheme.toLowerCase()) {
      'http' || 'https' when uri.host.isNotEmpty => uri,
      'mailto' => uri,
      _ => null,
    };
  }

  /// File links are read by the existing session preview, never launched as
  /// platform URLs. Unknown schemes and remote file authorities stay blocked.
  @visibleForTesting
  static String? workspaceLinkPath(String url, {String? baseDir}) => resolveWorkspaceLink(url, baseDir: baseDir);

  static Widget _codeBuilder(BuildContext context, String name, String code, bool closed) {
    final info = name.trim();
    final language = info.isEmpty ? null : info.split(RegExp(r'\s+')).first;
    // A visual reply (dsh-ui): drawn as native cards. The cursor sentinel inside an open fence means it is still
    // streaming; open without it means the reply was cut short.
    if (language == 'dsh-ui') {
      return DshUiBlock(
        source: code.replaceAll(_cursorSentinel, ''),
        streaming: !closed && code.contains(_cursorSentinel),
        closed: closed,
      );
    }
    // A display formula still streaming in ([normalizeMath]): its source,
    // muted, until the closing `$$` arrives and it can be drawn whole.
    if (language == pendingMathLanguage) {
      final style = AppType.chatBody(context);
      return MathSource(
        source: code.replaceAll(_cursorSentinel, ''),
        style: style,
        trailing: code.contains(_cursorSentinel) ? _cursorSpan(style) : null,
      );
    }
    return CodeBlock(
      code: code.replaceAll(_cursorSentinel, ''),
      // 围栏信息串可能带属性(```json title="…"),只取第一个 token。
      language: language,
      replyActions: true,
    );
  }

  /// 标题是读屏里能逐个跳转的 header 节点。
  static Widget _headingBuilder(BuildContext context, int level, Widget content, HeadingStyle style) =>
      Semantics(header: true, container: true, child: content);

  /// 任务清单 `- [ ]` / `- [x]`:只读的方框图标。包里默认用 Material 的
  /// [Checkbox],它要求祖先里有 Material,聊天列表里没有,会报错并溢出。
  static Widget _checkboxBuilder(BuildContext context, bool checked, Widget content, CheckboxStyle style) {
    final colors = Theme.of(context).colorScheme;
    // TaskBox: a bullet item that opens with this box draws no bullet.
    return TaskBox(
      child: Row(
        mainAxisSize: MainAxisSize.min,
        textBaseline: TextBaseline.alphabetic,
        crossAxisAlignment: CrossAxisAlignment.baseline,
        children: [
          Text.rich(
            WidgetSpan(
              alignment: PlaceholderAlignment.middle,
              child: Padding(
                padding: const EdgeInsetsDirectional.only(end: TaskBox.gap),
                child: Icon(
                  checked ? AppIcons.checkboxOn : AppIcons.checkboxOff,
                  size: TaskBox.size,
                  color: checked ? colors.primary : colors.onSurfaceVariant,
                ),
              ),
            ),
          ),
          Flexible(child: content),
        ],
      ),
    );
  }

  /// What gpt_markdown is given for [text]: maths delimiters normalised,
  /// table headers bold and, while [streaming], the unfinished tail
  /// repaired and the cursor sentinel placed.
  @visibleForTesting
  static String prepareSource(String text, {bool streaming = false}) => _prepareSource(text, streaming: streaming);

  static String _prepareSource(String text, {bool streaming = false, StreamingMarkdownRepair? repair}) {
    final source = boldTableHeaders(normalizeMath(text, streaming: streaming));
    if (!streaming) return source;
    return _withCursor(repair?.repair(source) ?? repairStreamingMarkdown(source));
  }

  /// [text] with the cursor sentinel where the reader's eye is: at the end
  /// of the last line, except that a closing fence or a display formula's
  /// `\]` must stay alone on its line, and a table row takes it inside its
  /// last cell rather than as a new cell after the pipe.
  static String _withCursor(String text) {
    final last = text.substring(text.lastIndexOf('\n') + 1).trim();
    if (_fenceLine.hasMatch(last) || last.endsWith(r'\]')) {
      return '$text\n$_cursorSentinel';
    }
    if (last.length > 1 && last.startsWith('|') && last.endsWith('|')) {
      final pipe = text.lastIndexOf('|');
      return '${text.substring(0, pipe).trimRight()} $_cursorSentinel '
          '${text.substring(pipe)}';
    }
    return '$text$_cursorSentinel';
  }

  static final _fenceLine = RegExp(r'^(?:>\s*)*(?:`{3,}|~{3,})\s*$');

  static InlineSpan _inlineCodeBuilder(BuildContext context, String code, TextStyle style, InlineCodeStyle codeStyle) =>
      CodeTextSpan(
        text: code.replaceAll(_cursorSentinel, ''),
        codeStyle: codeStyle,
        style: style.copyWith(fontFeatures: AppType.monoFeatures),
      );

  @override
  State<MarkdownBody> createState() => _MarkdownBodyState();
}

class _MarkdownBodyState extends State<MarkdownBody> {
  StreamingMarkdownRepair? _repair;

  // Preparation depends only on text and streaming, not theme, text scale or
  // selection. Keep one result for this mounted body; unrelated stream rows
  // can rebuild its parent without rescanning the unchanged Markdown.
  late String _source = _prepareSource();

  String _prepareSource() {
    _repair = widget.streaming ? (_repair ?? StreamingMarkdownRepair()) : null;
    return MarkdownBody._prepareSource(widget.text, streaming: widget.streaming, repair: _repair);
  }

  @override
  void didUpdateWidget(MarkdownBody oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.text != widget.text || oldWidget.streaming != widget.streaming) {
      _source = _prepareSource();
    }
  }

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final theme = Theme.of(context);
    final body = widget.secondary
        ? AppType.chatBody(context, scale: 0.9, color: theme.colorScheme.onSurfaceVariant)
        : AppType.chatBody(context, color: theme.colorScheme.onSurface);
    final source = _source;

    Widget markdown = GptMarkdownTheme(
      gptThemeData: MarkdownBody._themeFor(theme, widget.secondary, l10n),
      child: GptMarkdown(
        source,
        style: body,
        followLinkColor: false,
        htmlTags: _htmlTags,
        // The tail is repaired here (and open formulas shown as source), so
        // the package must not complete open `\(` / `\[` on its own.
        isStreaming: false,
        inlinePatterns: widget.streaming ? MarkdownBody._streamingPatterns : null,
        onLinkTap: (url, title) => MarkdownBody._onLinkTap(context, url, title),
        codeBuilder: MarkdownBody._codeBuilder,
        inlineCodeBuilder: MarkdownBody._inlineCodeBuilder,
        checkboxBuilder: MarkdownBody._checkboxBuilder,
        headingBuilder: MarkdownBody._headingBuilder,
        inlineLatexBuilder: MarkdownMath.inline,
        blockLatexBuilder: MarkdownMath.block,
        imageBuilder: markdownImageBuilder,
        orderedListBuilder: MarkdownLists.ordered,
        unOrderedListBuilder: MarkdownLists.unordered,
      ),
    );
    // 表格、成块公式横向放不下时,两端淡出提示还能横滑。
    markdown = ScrollConfiguration(behavior: const EdgeFadeScrollBehavior(), child: markdown);
    if (widget.selectable) markdown = SelectionArea(child: markdown);
    return markdown;
  }
}
