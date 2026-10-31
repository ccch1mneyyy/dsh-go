import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../chat/render/markdown_body.dart';
import '../../state/connection_state.dart';
import '../../ui_config/ui_config_source.dart';
import 'memory_paths.dart';

/// Native view of the shared dsh-mesh memory.
///
/// The host writes a small manifest to `$DSH_HOME/dsh-go/dsh-mesh.json`;
/// this page reads that manifest and the individual Markdown files through
/// `workspaceFiles/read`, so it works for local and DSH Remote hosts without
/// the dsh-go bridge. Inbox actions run `/mesh-memory …` on the host through
/// `commands/execute`, so they work over Remote as well.
class MemoryPage extends ConsumerStatefulWidget {
  const MemoryPage({super.key, this.sessionId});

  final String? sessionId;

  @override
  ConsumerState<MemoryPage> createState() => _MemoryPageState();
}

class _MemoryFile {
  const _MemoryFile({
    required this.path,
    required this.title,
    required this.kind,
    required this.size,
    required this.description,
    this.updatedAt,
  });

  final String path;
  final String title;
  final String kind;
  final int size;
  final String description;
  final DateTime? updatedAt;

  factory _MemoryFile.fromJson(Map<String, dynamic> json) => _MemoryFile(
    path: '${json['path'] ?? ''}',
    title: '${json['title'] ?? json['path'] ?? ''}',
    kind: '${json['kind'] ?? ''}',
    size: (json['size'] as num?)?.toInt() ?? 0,
    description: '${json['description'] ?? ''}',
    updatedAt: DateTime.tryParse('${json['updatedAt'] ?? ''}'),
  );
}

class _InboxItem {
  const _InboxItem({required this.path, required this.title, required this.turns, this.updatedAt});

  final String path;
  final String title;
  final int turns;
  final DateTime? updatedAt;

  factory _InboxItem.fromJson(Map<String, dynamic> json) => _InboxItem(
    path: '${json['path'] ?? ''}',
    title: '${json['title'] ?? json['path'] ?? ''}',
    turns: (json['turns'] as num?)?.toInt() ?? 0,
    updatedAt: DateTime.tryParse('${json['updatedAt'] ?? ''}'),
  );
}

class _MemoryManifest {
  const _MemoryManifest({
    required this.root,
    required this.device,
    required this.files,
    this.inbox = const [],
  });

  final String root;
  final String device;
  final List<_MemoryFile> files;
  final List<_InboxItem> inbox;
}

class _MemoryPageState extends ConsumerState<MemoryPage> {
  bool _loading = true;
  String? _error;
  _MemoryManifest? _manifest;

  @override
  void initState() {
    super.initState();
    _load();
  }

  Future<void> _load() async {
    setState(() {
      _loading = true;
      _error = null;
    });
    try {
      final conn = ref.read(activeConnectionProvider).value;
      final client = conn?.client;
      if (client == null) throw StateError('没有连接到主机');
      final host = DshUiRemoteHost(client);
      if (!host.supports('workspaceFiles/read')) {
        throw StateError('当前主机不支持 workspaceFiles/read');
      }
      final session = widget.sessionId ?? await host.recentSessionId();
      if (session == null) throw StateError('没有可用于读取记忆的会话');
      final manifestPath = '${await _dshHome(host, session)}/dsh-go/dsh-mesh.json';
      final map = jsonDecode(await _readAll(host, session, manifestPath)) as Map<String, dynamic>;
      final root = '${map['root'] ?? ''}';
      final files = [
        for (final item in (map['files'] as List? ?? const []))
          if (item is Map<String, dynamic>) _MemoryFile.fromJson(item),
        // A manifest cannot make the page read outside the memory root.
      ].where((file) => memoryEntryPath(root, file.path) != null).toList(growable: false);
      final inbox = [
        for (final item in (map['inbox'] as List? ?? const []))
          if (item is Map<String, dynamic>) _InboxItem.fromJson(item),
      ].where((item) => meshMemoryCommand('accept', item.path) != null).toList(growable: false);
      if (!mounted) return;
      setState(() {
        _manifest = _MemoryManifest(
          root: root,
          device: '${map['device'] ?? ''}',
          files: files,
          inbox: inbox,
        );
        _loading = false;
      });
    } catch (error) {
      if (!mounted) return;
      setState(() {
        _error = '$error';
        _loading = false;
      });
    }
  }

  /// The host's DSH home.
  ///
  /// `dshHomeFromSkillPath` already returns `…/.dsh` (from
  /// `<home>/skills/dsh-go-ui/SKILL.md`); only `$HOME` needs `/.dsh` appended.
  Future<String> _dshHome(DshUiRemoteHost host, String session) async {
    final userHome = host.userHome;
    if (userHome != null && userHome.isNotEmpty) {
      return '${userHome.replaceFirst(RegExp(r'/+$'), '')}/.dsh';
    }
    final skill = await host.skillFile(session);
    final home = dshHomeFromSkillPath(skill ?? '');
    if (home == null || home.isEmpty) throw StateError('无法确定主机 DSH_HOME');
    return home.replaceFirst(RegExp(r'/+$'), '');
  }

  /// Reads a whole text file: one `workspaceFiles/read` call is a page, not
  /// the file, so keep reading until `eof` within a size budget.
  Future<String> _readAll(
    DshUiRemoteHost host,
    String session,
    String path, {
    int maxBytes = 2 * 1024 * 1024,
  }) async {
    final first = await host.read(session, path);
    if ((first.bytes ?? 0) > maxBytes) throw StateError('文件过大（超过 ${maxBytes ~/ 1024} KB）');
    final text = StringBuffer(first.text);
    var page = first;
    var pages = 1;
    while (!page.eof && page.lines > 0 && pages < 64) {
      page = await host.read(session, path, offset: page.offset + page.lines);
      text
        ..write('\n')
        ..write(page.text);
      pages += 1;
      if (text.length > maxBytes) throw StateError('文件过大（超过 ${maxBytes ~/ 1024} KB）');
    }
    return text.toString();
  }

  Future<void> _open(_MemoryFile file) async {
    final conn = ref.read(activeConnectionProvider).value;
    final client = conn?.client;
    final manifest = _manifest;
    if (client == null || manifest == null) return;
    final path = memoryEntryPath(manifest.root, file.path);
    if (path == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('拒绝读取：路径不在记忆目录内')),
      );
      return;
    }
    final host = DshUiRemoteHost(client);
    final session = widget.sessionId ?? await host.recentSessionId();
    if (session == null) return;
    try {
      final text = await _readAll(host, session, path, maxBytes: 8 * 1024 * 1024);
      if (!mounted) return;
      await Navigator.of(context).push(
        MaterialPageRoute<void>(builder: (_) => _MemoryFilePage(file: file, text: text)),
      );
    } catch (error) {
      if (!mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('读取失败：$error')));
    }
  }

  Future<void> _accept(_InboxItem item, String kind) async {
    final line = meshMemoryCommand('accept', item.path, kind: kind);
    if (line != null) await _runCommand(line);
  }

  Future<void> _reject(_InboxItem item) async {
    final confirmed = await showDialog<bool>(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('忽略这条草稿？'),
        content: Text(item.title),
        actions: [
          TextButton(onPressed: () => Navigator.pop(context, false), child: const Text('取消')),
          FilledButton(onPressed: () => Navigator.pop(context, true), child: const Text('忽略')),
        ],
      ),
    );
    if (confirmed != true) return;
    final line = meshMemoryCommand('reject', item.path);
    if (line != null) await _runCommand(line);
  }

  Future<void> _flush() => _runCommand('/mesh-memory flush');

  /// Runs a `/mesh-memory` command on the host through `commands/execute`.
  ///
  /// The command table lives on the host, so this works for both the local
  /// engine and DSH Remote hosts (both carry `commands/execute`); the page
  /// never mutates the shared memory by itself.
  Future<void> _runCommand(String line) async {
    final client = ref.read(activeConnectionProvider).value?.client;
    if (client == null) return;
    try {
      final session = widget.sessionId ?? await DshUiRemoteHost(client).recentSessionId();
      if (session == null) {
        if (!mounted) return;
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('没有可用于执行命令的会话')));
        return;
      }
      final result = await client.executeCommand(session, line);
      if (!mounted) return;
      final text = result.text?.trim();
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(text != null && text.isNotEmpty ? text : (result.success ? '已执行' : '执行失败'))),
      );
      if (result.success) await _load();
    } catch (error) {
      if (!mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('执行失败：$error')));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('记忆'),
        actions: [IconButton(onPressed: _loading ? null : _load, icon: const Icon(Icons.refresh), tooltip: '刷新')],
      ),
      body: _body(context),
    );
  }

  Widget _body(BuildContext context) {
    if (_loading) return const Center(child: CircularProgressIndicator());
    if (_error != null) {
      return Center(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Icon(Icons.cloud_off_outlined, size: 40),
              const SizedBox(height: 12),
              Text('还读不到共享记忆', style: Theme.of(context).textTheme.titleMedium),
              const SizedBox(height: 8),
              Text(_error!, textAlign: TextAlign.center),
              const SizedBox(height: 16),
              FilledButton(onPressed: _load, child: const Text('重试')),
            ],
          ),
        ),
      );
    }
    final manifest = _manifest;
    if (manifest == null || (manifest.files.isEmpty && manifest.inbox.isEmpty)) {
      return const Center(child: Text('共享记忆目录还是空的。'));
    }

    const order = ['共享规则', '技能', '事实', '决策', '项目', '记忆库', '会话摘要', '其他'];
    final sections = <String, List<_MemoryFile>>{};
    for (final file in manifest.files) {
      sections.putIfAbsent(_sectionOf(file.path), () => []).add(file);
    }

    final content = <Widget>[
      if (manifest.inbox.isNotEmpty)
        _InboxCard(items: manifest.inbox, onAccept: _accept, onReject: _reject, onFlush: _flush),
      _Hero(manifest: manifest),
      for (final title in order)
        if (sections[title] case final files? when files.isNotEmpty)
          _SectionCard(
            title: title,
            files: files,
            icon: _sectionIcon(title),
            color: _sectionColor(context, title),
            onOpen: _open,
            titleOf: _displayTitle,
          ),
      const SizedBox(height: 28),
    ];

    return RefreshIndicator(
      onRefresh: _load,
      child: ListView(padding: const EdgeInsets.fromLTRB(16, 8, 16, 24), children: content),
    );
  }

  String _sectionOf(String path) {
    if (path == 'AGENTS.shared.md') return '共享规则';
    if (path.startsWith('skills/')) return '技能';
    if (path.startsWith('memory/facts/')) return '事实';
    if (path.startsWith('memory/decisions/')) return '决策';
    if (path.startsWith('memory/projects/')) return '项目';
    if (path.startsWith('memory/')) return '记忆库';
    if (path.startsWith('sessions/')) return '会话摘要';
    return '其他';
  }

  String _displayTitle(_MemoryFile file) {
    if (file.path == 'AGENTS.shared.md' && file.title == file.path) return '共享规则';
    return file.title;
  }

  IconData _sectionIcon(String section) {
    switch (section) {
      case '共享规则':
        return Icons.gavel_outlined;
      case '技能':
        return Icons.extension_outlined;
      case '事实':
        return Icons.lightbulb_outline;
      case '决策':
        return Icons.alt_route_outlined;
      case '项目':
        return Icons.work_outline;
      case '记忆库':
        return Icons.psychology_outlined;
      case '会话摘要':
        return Icons.forum_outlined;
      default:
        return Icons.folder_outlined;
    }
  }

  Color _sectionColor(BuildContext context, String section) {
    final scheme = Theme.of(context).colorScheme;
    switch (section) {
      case '共享规则':
        return scheme.tertiary;
      case '技能':
        return scheme.primary;
      case '事实':
        return scheme.secondary;
      case '决策':
        return scheme.error;
      case '项目':
        return scheme.tertiary;
      case '会话摘要':
        return scheme.primary;
      default:
        return scheme.secondary;
    }
  }
}

class _InboxCard extends StatelessWidget {
  const _InboxCard({
    required this.items,
    required this.onAccept,
    required this.onReject,
    required this.onFlush,
  });

  final List<_InboxItem> items;
  final Future<void> Function(_InboxItem, String) onAccept;
  final Future<void> Function(_InboxItem) onReject;
  final Future<void> Function() onFlush;

  @override
  Widget build(BuildContext context) {
    final scheme = Theme.of(context).colorScheme;
    return Container(
      margin: const EdgeInsets.only(bottom: 18),
      decoration: BoxDecoration(
        color: scheme.surfaceContainerLow,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: scheme.primary.withValues(alpha: 0.35)),
      ),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(14, 12, 8, 8),
            child: Row(
              children: [
                Icon(Icons.inbox_outlined, size: 20, color: scheme.primary),
                const SizedBox(width: 8),
                Expanded(
                  child: Text(
                    '待确认 ${items.length} 条',
                    style: Theme.of(context).textTheme.titleSmall?.copyWith(fontWeight: FontWeight.w600),
                  ),
                ),
                TextButton(onPressed: onFlush, child: const Text('立即整理')),
              ],
            ),
          ),
          Divider(height: 1, color: scheme.outlineVariant.withValues(alpha: 0.35)),
          for (var i = 0; i < items.length; i++) ...[
            _InboxRow(item: items[i], onAccept: onAccept, onReject: onReject),
            if (i != items.length - 1)
              Divider(height: 1, indent: 16, color: scheme.outlineVariant.withValues(alpha: 0.28)),
          ],
        ],
      ),
    );
  }
}

class _InboxRow extends StatelessWidget {
  const _InboxRow({required this.item, required this.onAccept, required this.onReject});

  final _InboxItem item;
  final Future<void> Function(_InboxItem, String) onAccept;
  final Future<void> Function(_InboxItem) onReject;

  @override
  Widget build(BuildContext context) {
    final scheme = Theme.of(context).colorScheme;
    final when = item.updatedAt == null ? '' : ' · ${_fmt(item.updatedAt!)}';
    return Padding(
      padding: const EdgeInsets.fromLTRB(14, 8, 6, 8),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  item.title,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: Theme.of(context).textTheme.titleSmall?.copyWith(fontWeight: FontWeight.w500),
                ),
                const SizedBox(height: 2),
                Text(
                  '${item.turns} 轮$when',
                  style: Theme.of(context).textTheme.bodySmall?.copyWith(color: scheme.onSurfaceVariant),
                ),
              ],
            ),
          ),
          PopupMenuButton<String>(
            tooltip: '接受为…',
            onSelected: (kind) => onAccept(item, kind),
            itemBuilder: (context) => const [
              PopupMenuItem(value: 'notes', child: Text('接受为笔记')),
              PopupMenuItem(value: 'facts', child: Text('接受为事实')),
              PopupMenuItem(value: 'decisions', child: Text('接受为决策')),
              PopupMenuItem(value: 'projects', child: Text('接受为项目')),
            ],
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 10),
              child: Text('接受', style: TextStyle(color: scheme.primary, fontWeight: FontWeight.w600)),
            ),
          ),
          TextButton(onPressed: () => onReject(item), child: const Text('忽略')),
        ],
      ),
    );
  }

  String _fmt(DateTime value) {
    final local = value.toLocal();
    return '${local.month.toString().padLeft(2, '0')}-${local.day.toString().padLeft(2, '0')} '
        '${local.hour.toString().padLeft(2, '0')}:${local.minute.toString().padLeft(2, '0')}';
  }
}

class _Hero extends StatelessWidget {
  const _Hero({required this.manifest});

  final _MemoryManifest manifest;

  @override
  Widget build(BuildContext context) {
    final scheme = Theme.of(context).colorScheme;
    final counts = <String, int>{};
    for (final file in manifest.files) {
      final section = _sectionOf(file.path);
      counts[section] = (counts[section] ?? 0) + 1;
    }
    return Container(
      margin: const EdgeInsets.only(bottom: 18),
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [scheme.primaryContainer.withValues(alpha: 0.9), scheme.surfaceContainerLow],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(22),
        border: Border.all(color: scheme.primary.withValues(alpha: 0.16)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                width: 42,
                height: 42,
                decoration: BoxDecoration(
                  color: scheme.primary.withValues(alpha: 0.14),
                  borderRadius: BorderRadius.circular(14),
                ),
                child: Icon(Icons.auto_awesome_outlined, color: scheme.primary),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('共享记忆', style: Theme.of(context).textTheme.titleLarge?.copyWith(fontWeight: FontWeight.w600)),
                    const SizedBox(height: 2),
                    Text(
                      '${manifest.files.length} 条 · ${manifest.device}',
                      style: Theme.of(context).textTheme.bodySmall,
                    ),
                  ],
                ),
              ),
              Icon(Icons.lock_outline, size: 18, color: scheme.onSurfaceVariant.withValues(alpha: 0.7)),
            ],
          ),
          const SizedBox(height: 14),
          Wrap(
            spacing: 8,
            runSpacing: 8,
            children: [
              for (final entry in counts.entries)
                _StatChip(label: entry.key, count: entry.value, color: _sectionColor(context, entry.key)),
            ],
          ),
          const SizedBox(height: 12),
          Text(
            '只读 · 跨设备同步 · Markdown',
            style: Theme.of(context).textTheme.labelSmall?.copyWith(color: scheme.onSurfaceVariant),
          ),
        ],
      ),
    );
  }

  String _sectionOf(String path) {
    if (path == 'AGENTS.shared.md') return '共享规则';
    if (path.startsWith('skills/')) return '技能';
    if (path.startsWith('memory/facts/')) return '事实';
    if (path.startsWith('memory/decisions/')) return '决策';
    if (path.startsWith('memory/projects/')) return '项目';
    if (path.startsWith('memory/')) return '记忆库';
    if (path.startsWith('sessions/')) return '会话摘要';
    return '其他';
  }

  Color _sectionColor(BuildContext context, String section) {
    final scheme = Theme.of(context).colorScheme;
    switch (section) {
      case '共享规则':
        return scheme.tertiary;
      case '技能':
        return scheme.primary;
      case '事实':
        return scheme.secondary;
      case '决策':
        return scheme.error;
      case '项目':
        return scheme.tertiary;
      case '会话摘要':
        return scheme.primary;
      default:
        return scheme.secondary;
    }
  }
}

class _StatChip extends StatelessWidget {
  const _StatChip({required this.label, required this.count, required this.color});

  final String label;
  final int count;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
      decoration: BoxDecoration(
        color: color.withValues(alpha: 0.10),
        borderRadius: BorderRadius.circular(999),
        border: Border.all(color: color.withValues(alpha: 0.18)),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            width: 6,
            height: 6,
            decoration: BoxDecoration(color: color, shape: BoxShape.circle),
          ),
          const SizedBox(width: 6),
          Text('$label $count', style: Theme.of(context).textTheme.labelMedium),
        ],
      ),
    );
  }
}

class _SectionCard extends StatelessWidget {
  const _SectionCard({
    required this.title,
    required this.files,
    required this.icon,
    required this.color,
    required this.onOpen,
    required this.titleOf,
  });

  final String title;
  final List<_MemoryFile> files;
  final IconData icon;
  final Color color;
  final Future<void> Function(_MemoryFile) onOpen;
  final String Function(_MemoryFile) titleOf;

  @override
  Widget build(BuildContext context) {
    final scheme = Theme.of(context).colorScheme;
    return Container(
      margin: const EdgeInsets.only(bottom: 14),
      decoration: BoxDecoration(
        color: scheme.surfaceContainerLow,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: scheme.outlineVariant.withValues(alpha: 0.45)),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(14, 14, 14, 10),
              child: Row(
                children: [
                  Container(
                    width: 32,
                    height: 32,
                    decoration: BoxDecoration(
                      color: color.withValues(alpha: 0.12),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Icon(icon, size: 18, color: color),
                  ),
                  const SizedBox(width: 10),
                  Text(title, style: Theme.of(context).textTheme.titleSmall?.copyWith(fontWeight: FontWeight.w600)),
                  const SizedBox(width: 8),
                  Text(
                    '${files.length}',
                    style: Theme.of(context).textTheme.labelSmall?.copyWith(color: scheme.onSurfaceVariant),
                  ),
                ],
              ),
            ),
            Divider(height: 1, color: scheme.outlineVariant.withValues(alpha: 0.35)),
            for (var i = 0; i < files.length; i++) ...[
              _MemoryTile(file: files[i], title: titleOf(files[i]), color: color, onTap: () => onOpen(files[i])),
              if (i != files.length - 1)
                Divider(height: 1, indent: 64, color: scheme.outlineVariant.withValues(alpha: 0.28)),
            ],
          ],
        ),
      ),
    );
  }
}

class _MemoryTile extends StatelessWidget {
  const _MemoryTile({required this.file, required this.title, required this.color, required this.onTap});

  final _MemoryFile file;
  final String title;
  final Color color;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final scheme = Theme.of(context).colorScheme;
    final description = file.description.trim();
    final subtitle = description.isNotEmpty && description != '>' && description != '|' ? description : file.path;
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.fromLTRB(14, 11, 10, 11),
        child: Row(
          children: [
            Container(
              width: 36,
              height: 36,
              decoration: BoxDecoration(color: color.withValues(alpha: 0.09), borderRadius: BorderRadius.circular(11)),
              child: Icon(Icons.description_outlined, size: 19, color: color),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: Theme.of(context).textTheme.titleSmall?.copyWith(fontWeight: FontWeight.w500),
                  ),
                  const SizedBox(height: 3),
                  Text(
                    subtitle,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: Theme.of(context).textTheme.bodySmall?.copyWith(color: scheme.onSurfaceVariant),
                  ),
                ],
              ),
            ),
            const SizedBox(width: 8),
            Icon(Icons.chevron_right, size: 20, color: scheme.onSurfaceVariant.withValues(alpha: 0.7)),
          ],
        ),
      ),
    );
  }
}

class _MemoryFilePage extends StatelessWidget {
  const _MemoryFilePage({required this.file, required this.text});

  final _MemoryFile file;
  final String text;

  @override
  Widget build(BuildContext context) {
    final scheme = Theme.of(context).colorScheme;
    return Scaffold(
      appBar: AppBar(title: Text(file.title, overflow: TextOverflow.ellipsis)),
      body: SelectionArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.fromLTRB(16, 8, 16, 28),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(14),
                decoration: BoxDecoration(
                  color: scheme.surfaceContainerLow,
                  borderRadius: BorderRadius.circular(16),
                  border: Border.all(color: scheme.outlineVariant.withValues(alpha: 0.45)),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      file.title,
                      style: Theme.of(context).textTheme.titleMedium?.copyWith(fontWeight: FontWeight.w600),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      file.path,
                      style: Theme.of(context).textTheme.bodySmall?.copyWith(color: scheme.onSurfaceVariant),
                    ),
                    if (file.updatedAt != null) ...[
                      const SizedBox(height: 4),
                      Text(
                        '更新于 ${_fmtDate(file.updatedAt!)}',
                        style: Theme.of(context).textTheme.labelSmall?.copyWith(color: scheme.onSurfaceVariant),
                      ),
                    ],
                  ],
                ),
              ),
              const SizedBox(height: 16),
              MarkdownBody(text: text),
            ],
          ),
        ),
      ),
    );
  }

  String _fmtDate(DateTime value) {
    final local = value.toLocal();
    return '${local.year}-${local.month.toString().padLeft(2, '0')}-${local.day.toString().padLeft(2, '0')} '
        '${local.hour.toString().padLeft(2, '0')}:${local.minute.toString().padLeft(2, '0')}';
  }
}
