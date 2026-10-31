// Keeps a reply that is still streaming in from flickering through wrong
// layouts, the way Vercel Streamdown's `remend` does: only the unfinished tail
// is touched, and only in ways the finished text will agree with, so nothing
// jumps when the closer arrives.
//
// * `**bold`, `*italic`, `~~strike`, `` `code `` are closed for the parser —
//   the text is styled from its first letter instead of showing the markers
//   and restyling later. A marker with nothing after it yet is held back.
// * `[label](https://exa` renders as the link it is becoming; a half-written
//   image `![alt](…` is held back whole.
// * A table shows once its delimiter row is complete, never as a paragraph
//   of pipes first.
// * A lone `#`, list marker, `---` / `===` underline, `<tag` or the opening
//   line of a fence still typing its language is held back for a moment.
//
// Display maths still streaming in is handled in [normalizeMath] (shown as
// source until it closes), so the formula never flashes as an error.

/// [text] (a reply still arriving) with its unfinished tail repaired.
///
/// Only the last block is looked at; everything before it is final.
String repairStreamingMarkdown(String text) {
  if (text.isEmpty) return text;
  return _repairWithScan(text, _BlockScan(text));
}

/// The same repair as [repairStreamingMarkdown], retaining the scan of complete
/// lines while text is appended. The unfinished last line is always rescanned:
/// appending to a fence closer can turn it back into ordinary code.
///
/// Input is the prepared Markdown, not the raw reply. If maths or table
/// preparation rewrites an earlier line (or the reply is replaced/truncated),
/// the prefix no longer matches and the whole scan starts again.
class StreamingMarkdownRepair {
  String _previous = '';
  var _offset = 0;
  var _prefix = _BlockScan.empty();

  String repair(String text) {
    if (!text.startsWith(_previous)) {
      _offset = 0;
      _prefix = _BlockScan.empty();
    }
    _previous = text;
    if (text.isEmpty) return text;
    for (var end = text.indexOf('\n', _offset); end != -1; end = text.indexOf('\n', _offset)) {
      _prefix.addLine(text.substring(_offset, end), _offset);
      _offset = end + 1;
    }
    final scan = _BlockScan.copy(_prefix);
    if (_offset < text.length) scan.addLine(text.substring(_offset), _offset);
    if (scan.lastBlockStart > text.length) scan.lastBlockStart = text.length;
    return _repairWithScan(text, scan);
  }
}

String _repairWithScan(String text, _BlockScan scan) {
  if (scan.openFenceLine != null) {
    // Inside an open fence the code streams as itself, except the opening
    // line while its info string is still being typed.
    final opener = scan.openFenceLine!;
    return text.indexOf('\n', opener) == -1 ? text.substring(0, opener).trimRight() : text;
  }
  final start = scan.lastBlockStart;
  final head = text.substring(0, start);
  var tail = text.substring(start);
  final table = _unfinishedTableAt(tail);
  if (table != -1) tail = tail.substring(0, table).trimRight();
  tail = _dropPartialLastLine(tail);
  tail = _repairInline(tail);
  return tail.trim().isEmpty ? head.trimRight() : head + tail;
}

/// Where the last block starts and whether the text ends inside a fence.
class _BlockScan {
  _BlockScan.empty();

  _BlockScan.copy(_BlockScan other)
    : lastBlockStart = other.lastBlockStart,
      _openFenceLine = other._openFenceLine,
      _fenceChar = other._fenceChar,
      _fenceLength = other._fenceLength;

  _BlockScan(String text) {
    var offset = 0;
    final lines = text.split('\n');
    // `abc\n` is one line, not a line and a blank one.
    if (lines.length > 1 && lines.last.isEmpty) lines.removeLast();
    for (final line in lines) {
      addLine(line, offset);
      offset += line.length + 1;
    }
    if (lastBlockStart > text.length) lastBlockStart = text.length;
  }

  int lastBlockStart = 0;
  int? _openFenceLine;
  String? _fenceChar;
  int _fenceLength = 0;

  int? get openFenceLine => _fenceChar == null ? null : _openFenceLine;

  void addLine(String line, int offset) {
    final fence = _fence.firstMatch(line);
    if (_fenceChar != null) {
      final close = _fenceClose.firstMatch(line);
      if (close != null && close.group(1)![0] == _fenceChar && close.group(1)!.length >= _fenceLength) {
        _fenceChar = null;
        lastBlockStart = offset + line.length + 1;
      }
    } else if (fence != null) {
      _fenceChar = fence.group(1)![0];
      _fenceLength = fence.group(1)!.length;
      _openFenceLine = offset;
    } else if (line.trim().isEmpty || line.replaceAll(RegExp(r'[\s>]'), '').isEmpty) {
      lastBlockStart = offset + line.length + 1;
    }
  }

  static final _fence = RegExp(r'^[ \t]*(?:>[ \t]?)*[ \t]*(`{3,}|~{3,})(?!.*`)');
  static final _fenceClose = RegExp(r'^[ \t]*(?:>[ \t]?)*[ \t]*(`{3,}|~{3,})[ \t]*$');
}

final _tableRow = RegExp(r'^[ \t]*(?:>[ \t]?)*[ \t]*\|');
final _delimiterCell = RegExp(r'^\s*:?-+:?\s*$');

/// Where a table at the end of the block starts when its delimiter row is
/// not complete yet (-1 when there is none): its header row would otherwise
/// show as a paragraph of pipes and then jump into a grid.
int _unfinishedTableAt(String tail) {
  final lines = tail.replaceFirst(RegExp(r'\n+$'), '').split('\n');
  var first = lines.length;
  while (first > 0 && _tableRow.hasMatch(lines[first - 1])) {
    first -= 1;
  }
  // The delimiter row itself may be what is still arriving (`|---|--`).
  if (first == lines.length && first > 0 && RegExp(r'^[ \t]*(?:>[ \t]?)*[ \t]*:?-').hasMatch(lines.last)) {
    first -= 1;
    while (first > 0 && _tableRow.hasMatch(lines[first - 1])) {
      first -= 1;
    }
  }
  if (first >= lines.length || !_tableRow.hasMatch(lines[first])) return -1;
  final offset = lines.take(first).fold<int>(0, (sum, line) => sum + line.length + 1);
  if (first + 1 >= lines.length) return offset;
  final header = _cells(lines[first]);
  final delimiter = _cells(lines[first + 1]);
  if (delimiter.length < header.length || !delimiter.every(_delimiterCell.hasMatch)) return offset;
  return -1;
}

List<String> _cells(String row) {
  var t = row.trim().replaceFirst(RegExp(r'^(?:>[ \t]?)*'), '').trim();
  if (t.startsWith('|')) t = t.substring(1);
  if (t.endsWith('|') && !t.endsWith(r'\|')) t = t.substring(0, t.length - 1);
  if (t.trim().isEmpty) return const [];
  return t.split(RegExp(r'(?<!\\)\|'));
}

/// Lines that are only the start of a construct: a heading or list marker
/// with no text yet, a setext / rule underline still growing, a bare quote
/// marker, or the first backticks of a fence.
final _partialLine = RegExp(
  r'^[ \t]*(?:>[ \t]?)*[ \t]*(?:#{1,6}|[-*+]|\d{1,9}[.)]|=+|-{2}|_{1,2}|\*{2}|`{1,2}|~{1,2}|>|\${1,2})?[ \t]*$',
);

String _dropPartialLastLine(String tail) {
  final cut = tail.lastIndexOf('\n');
  final last = tail.substring(cut + 1);
  if (last.isEmpty || !_partialLine.hasMatch(last)) return tail;
  return cut == -1 ? '' : tail.substring(0, cut);
}

/// One emphasis delimiter run that is still open.
class _Opener {
  _Opener(this.marker, this.at);

  final String marker;
  final int at;
}

/// What a scan of the last block found still open.
class _InlineScan {
  _InlineScan(this.text) {
    final n = text.length;
    final brackets = <int>[];
    var i = 0;
    while (i < n) {
      final c = text[i];
      if (c == r'\' && i + 1 < n) {
        final next = text[i + 1];
        // Maths is opaque: its `_` and `*` are not emphasis.
        if (next == '(' || next == '[') {
          final close = text.indexOf(next == '(' ? r'\)' : r'\]', i + 2);
          if (close == -1) break;
          i = close + 2;
          continue;
        }
        i += 2;
        continue;
      }
      if (c == '`') {
        var run = 0;
        while (i + run < n && text[i + run] == '`') {
          run += 1;
        }
        final close = _closingRun(text, i + run, run);
        if (close == -1) {
          openCode = i;
          codeRun = run;
          break;
        }
        i = close + run;
        continue;
      }
      if (c == '*' || c == '_' || c == '~') {
        i = _delimiterRun(i, c);
        continue;
      }
      if (c == '[') {
        brackets.add(i);
      } else if (c == ']' && brackets.isNotEmpty) {
        final label = brackets.removeLast();
        if (i + 1 < n && text[i + 1] == '(') {
          final close = text.indexOf(')', i + 2);
          final newline = text.indexOf('\n', i + 2);
          if (close == -1 || (newline != -1 && newline < close)) {
            if (label > 0 && text[label - 1] == '!') {
              openImage = label - 1;
            } else {
              openLinkTarget = i + 1;
            }
            break;
          }
          i = close + 1;
          continue;
        }
      }
      i += 1;
    }
    // An image label still being typed (`![al`).
    for (final b in brackets) {
      if (b > 0 && text[b - 1] == '!') {
        openImage = openImage == null || b - 1 < openImage! ? b - 1 : openImage;
      }
    }
  }

  final String text;
  final openers = <_Opener>[];
  int? openCode;
  int codeRun = 0;
  int? openLinkTarget;
  int? openImage;

  /// A marker run at the very end that neither opened nor closed anything
  /// (`这是 **`, `然后 *`): it waits for the next character.
  int? dangling;

  int _delimiterRun(int i, String c) {
    final n = text.length;
    var run = 0;
    while (i + run < n && text[i + run] == c) {
      run += 1;
    }
    final before = i == 0 ? '\n' : text[i - 1];
    final after = i + run < n ? text[i + run] : '\n';
    final leftFlanking = !_isSpace(after) && (!_isPunct(after) || _isSpace(before) || _isPunct(before));
    final rightFlanking = !_isSpace(before) && (!_isPunct(before) || _isSpace(after) || _isPunct(after));
    var canOpen = leftFlanking;
    var canClose = rightFlanking;
    if (c == '_') {
      // `snake_case` is not emphasis.
      canOpen = leftFlanking && (!rightFlanking || _isPunct(before));
      canClose = rightFlanking && (!leftFlanking || _isPunct(after));
    }
    final markers = switch ((c, run)) {
      ('~', 2) => ['~~'],
      ('~', _) => const <String>[],
      (_, 1) => [c],
      (_, 2) => [c * 2],
      (_, 3) => [c * 2, c],
      _ => const <String>[],
    };
    var used = false;
    for (final marker in markers) {
      final open = canClose ? openers.lastIndexWhere((o) => o.marker == marker) : -1;
      if (open != -1) {
        openers.removeRange(open, openers.length);
        used = true;
      } else if (canOpen) {
        openers.add(_Opener(marker, i + (marker.length < run && marker.length == 1 ? run - 1 : 0)));
        used = true;
      }
    }
    if (!used && text.substring(i + run).trim().isEmpty) dangling = i;
    return i + run;
  }

  /// Where the block has to be cut: a half-written image, a half-written
  /// HTML tag, or a marker (code or emphasis) with nothing after it yet.
  int get cut {
    var at = text.length;
    final loose = dangling;
    if (loose != null) at = loose;
    final image = openImage;
    if (image != null && image < at) at = image;
    final code = openCode;
    if (code != null && code < at && text.substring(code + codeRun).trim().isEmpty) at = code;
    final scanned = code ?? openLinkTarget ?? at;
    final tag = RegExp(r'<[A-Za-z/!][^<>\n]*$').firstMatch(text.substring(0, scanned < at ? scanned : at));
    if (tag != null && tag.start < at) at = tag.start;
    for (final opener in openers) {
      if (opener.at < at && text.substring(opener.at + opener.marker.length, at).trim().isEmpty) {
        at = opener.at;
        break;
      }
    }
    return at;
  }
}

/// Closes what the last block left open: emphasis, a code span, a link
/// destination; holds back a half-written image or HTML tag.
String _repairInline(String tail) {
  var text = tail;
  var scan = _InlineScan(text);
  // Each cut can expose another unfinished marker (`**a *` → `**a`).
  for (var guard = 0; guard < 8; guard++) {
    final cut = scan.cut;
    if (cut >= text.length) break;
    text = text.substring(0, cut).trimRight();
    scan = _InlineScan(text);
  }
  final link = scan.openLinkTarget;
  if (link != null) {
    // The label renders as the link it is becoming; `#` opens nothing.
    text = '${text.substring(0, link)}(#)';
  }
  final code = scan.openCode;
  if (code == null && scan.openers.isEmpty) return text;
  final out = StringBuffer(text.trimRight());
  if (code != null) out.write('`' * scan.codeRun);
  for (final opener in scan.openers.reversed) {
    out.write(opener.marker);
  }
  return out.toString();
}

int _closingRun(String text, int from, int run) {
  var k = from;
  while (true) {
    final close = text.indexOf('`', k);
    if (close == -1) return -1;
    var len = 0;
    while (close + len < text.length && text[close + len] == '`') {
      len += 1;
    }
    if (len == run) return close;
    k = close + len;
  }
}

bool _isSpace(String c) => c == ' ' || c == '\t' || c == '\n' || c == '\r' || c == ' ' || c == '　';

bool _isPunct(String c) {
  final unit = c.codeUnitAt(0);
  if (unit < 0x80) return RegExp(r'[!-/:-@\[-`{-~]').hasMatch(c);
  // CJK and full-width punctuation count, so `**「重点」**` still pairs.
  return (unit >= 0x3000 && unit <= 0x303F) || (unit >= 0xFF00 && unit <= 0xFF65) || unit == 0x2014 || unit == 0x2026;
}
