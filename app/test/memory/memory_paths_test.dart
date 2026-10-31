import 'package:flutter_test/flutter_test.dart';

import 'package:dsh_app/ui/memory/memory_paths.dart';

void main() {
  group('memoryEntryPath', () {
    test('joins a normal manifest entry under a unix root', () {
      expect(
        memoryEntryPath('/sdcard/DSH-mesh/', 'memory/facts/a.md'),
        '/sdcard/DSH-mesh/memory/facts/a.md',
      );
    });

    test('joins under a windows root', () {
      expect(
        memoryEntryPath(r'C:\Users\me\DSH-mesh', r'AGENTS.shared.md'),
        'C:/Users/me/DSH-mesh/AGENTS.shared.md',
      );
    });

    test('rejects traversal and absolute entries', () {
      expect(memoryEntryPath('/sdcard/DSH-mesh', '../secret'), isNull);
      expect(memoryEntryPath('/sdcard/DSH-mesh', 'memory/../../secret'), isNull);
      expect(memoryEntryPath('/sdcard/DSH-mesh', '/etc/passwd'), isNull);
      expect(memoryEntryPath('/sdcard/DSH-mesh', r'C:\Windows\win.ini'), isNull);
      expect(memoryEntryPath('/sdcard/DSH-mesh', 'memory//x.md'), isNull);
      expect(memoryEntryPath('/sdcard/DSH-mesh', './x.md'), isNull);
      expect(memoryEntryPath('/sdcard/DSH-mesh', ''), isNull);
    });

    test('rejects roots that are relative or contain traversal', () {
      expect(memoryEntryPath('DSH-mesh', 'a.md'), isNull);
      expect(memoryEntryPath('/sdcard/../etc', 'passwd'), isNull);
      expect(memoryEntryPath('/', 'a.md'), isNull);
      expect(memoryEntryPath('', 'a.md'), isNull);
    });
  });

  group('meshMemoryCommand', () {
    test('builds accept/reject lines for a plain sessions path', () {
      expect(
        meshMemoryCommand('accept', 'sessions/session-1.md'),
        '/mesh-memory accept sessions/session-1.md notes',
      );
      expect(
        meshMemoryCommand('accept', 'sessions/session-1.md', kind: 'facts'),
        '/mesh-memory accept sessions/session-1.md facts',
      );
      expect(
        meshMemoryCommand('reject', 'sessions/session-1.md'),
        '/mesh-memory reject sessions/session-1.md',
      );
    });

    test('falls back to notes for an unknown kind', () {
      expect(
        meshMemoryCommand('accept', 'sessions/a.md', kind: 'bogus'),
        '/mesh-memory accept sessions/a.md notes',
      );
    });

    test('rejects paths outside the inbox', () {
      expect(meshMemoryCommand('accept', '../secret'), isNull);
      expect(meshMemoryCommand('accept', '/etc/passwd'), isNull);
      expect(meshMemoryCommand('accept', r'C:\x.md'), isNull);
      expect(meshMemoryCommand('accept', 'memory/facts/a.md'), isNull);
      expect(meshMemoryCommand('accept', 'sessions/../x.md'), isNull);
      expect(meshMemoryCommand('delete', 'sessions/a.md'), isNull);
    });
  });
}
