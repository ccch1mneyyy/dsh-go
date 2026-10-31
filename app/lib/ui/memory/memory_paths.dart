/// Path rules for the native memory page.
///
/// The manifest comes from the host, but its `root` and every `path` are still
/// untrusted input: a malformed or hostile manifest must not be able to read
/// files outside the shared memory directory through `workspaceFiles/read`.
library;

/// Joins a manifest entry to the memory [root], rejecting absolute paths,
/// `..`/`.`/empty segments and Windows drive prefixes.
///
/// Returns null when either side is not a usable absolute root or when the
/// entry would resolve outside [root].
String? memoryEntryPath(String root, String relative) {
  final base = _normalizeRoot(root);
  if (base == null) return null;

  final rel = relative.replaceAll('\\', '/').trim();
  if (rel.isEmpty) return null;
  if (rel.startsWith('/')) return null;
  if (RegExp(r'^[A-Za-z]:').hasMatch(rel)) return null;

  final parts = rel.split('/');
  for (final part in parts) {
    if (part.isEmpty || part == '.' || part == '..') return null;
  }
  return '$base/${parts.join('/')}';
}

/// Builds the `/mesh-memory` command line for one inbox draft.
///
/// The draft path is still host input: only a plain `sessions/...` relative
/// path is accepted, so the command can never point the plugin at another
/// directory. Returns null for anything else.
String? meshMemoryCommand(String action, String path, {String kind = 'notes'}) {
  final rel = path.replaceAll('\\', '/').trim();
  if (rel.isEmpty || rel.startsWith('/')) return null;
  if (RegExp(r'^[A-Za-z]:').hasMatch(rel)) return null;
  if (!rel.startsWith('sessions/')) return null;
  for (final part in rel.split('/')) {
    if (part.isEmpty || part == '.' || part == '..') return null;
  }
  switch (action) {
    case 'accept':
      const kinds = {'notes', 'facts', 'decisions', 'projects'};
      final chosen = kinds.contains(kind) ? kind : 'notes';
      return '/mesh-memory accept $rel $chosen';
    case 'reject':
      return '/mesh-memory reject $rel';
    default:
      return null;
  }
}

/// Absolute directory with no `..` segments and no trailing slash. Null when
/// [root] is relative or otherwise unusable for containment checks.
String? _normalizeRoot(String root) {
  final raw = root.replaceAll('\\', '/').trim();
  if (raw.isEmpty) return null;
  final base = raw.replaceFirst(RegExp(r'/+$'), '');
  if (base.isEmpty) return null;

  final unix = base.startsWith('/');
  final windows = RegExp(r'^[A-Za-z]:/').hasMatch(base);
  if (!unix && !windows) return null;
  if (base.split('/').contains('..')) return null;
  return base;
}
