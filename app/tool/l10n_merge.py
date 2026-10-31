#!/usr/bin/env python3
"""Merges the per-area ARB parts and regenerates the L10n class.

  lib/l10n/parts/<area>_{zh,en,pt}.arb
      -> lib/l10n/app_{zh,en,pt}.arb
      -> flutter gen-l10n -> lib/l10n/gen/

Checks, all fatal (exit 1, nothing written):
  - every part is valid JSON, keys are lowerCamel identifiers;
  - a key appears in only one part, and in all languages of that part;
  - the placeholders of a key are the same in every language, and match its
    "@key" metadata when that declares any;
  - braces balance and plural / select blocks have an `other` case.

Usage: tool/l10n_merge.py [--check] [--no-gen] [--part AREA]
  --check      validate only (no writes, no gen-l10n)
  --no-gen     write the merged ARBs but skip `flutter gen-l10n`
  --part AREA  validate only lib/l10n/parts/AREA_{zh,en,pt}.arb (implies --check);
               keys clashing with other parts are still reported
"""
from __future__ import annotations

import json
import os
import re
import shutil
import subprocess
import sys
from collections import OrderedDict

APP = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))
L10N = os.path.join(APP, 'lib', 'l10n')
PARTS = os.path.join(L10N, 'parts')
LANGS = ('zh', 'en', 'pt')
KEY_RE = re.compile(r'^[a-z][a-zA-Z0-9]*$')
IDENT = re.compile(r'[A-Za-z_][A-Za-z0-9_]*')


def parse_message(msg: str):
    """Returns (placeholders, errors) for an ICU message (relax-syntax rules)."""
    names, errors = set(), []
    i, n = 0, len(msg)

    def parse_body(i, depth):
        # Parses until the closing brace of this level (depth>0) or end.
        while i < n:
            c = msg[i]
            if c == '{':
                m = IDENT.match(msg, i + 1)
                if not m:
                    i += 1  # relax-syntax: literal brace
                    continue
                name = m.group(0)
                j = m.end()
                while j < n and msg[j] == ' ':
                    j += 1
                if j < n and msg[j] == '}':
                    names.add(name)
                    i = j + 1
                    continue
                if j < n and msg[j] == ',':
                    # {name, plural|select, cases...}
                    k = msg.find(',', j + 1)
                    if k < 0:
                        errors.append(f'unterminated {{{name}, …')
                        return n
                    kind = msg[j + 1:k].strip()
                    if kind not in ('plural', 'select'):
                        errors.append(f'unknown ICU kind "{kind}" in {{{name}}}')
                        return n
                    names.add(name)
                    i, cases = parse_cases(k + 1)
                    if 'other' not in cases:
                        errors.append(f'{kind} {{{name}}} has no "other" case')
                    continue
                i += 1  # relax-syntax: `{word` not a placeholder -> literal
                continue
            if c == '}':
                if depth > 0:
                    return i
                i += 1  # relax-syntax: stray close brace is literal
                continue
            i += 1
        if depth > 0:
            errors.append('unbalanced braces')
        return i

    def parse_cases(i):
        cases = []
        while i < n:
            while i < n and msg[i] in ' \n\t':
                i += 1
            if i < n and msg[i] == '}':
                return i + 1, cases
            m = re.compile(r'(=\d+|[A-Za-z0-9_]+)\s*\{').match(msg, i)
            if not m:
                errors.append(f'bad plural/select case near "{msg[i:i + 20]}"')
                return n, cases
            cases.append(m.group(1))
            j = parse_body(m.end(), 1)
            i = j + 1
        errors.append('unterminated plural/select')
        return n, cases

    parse_body(0, 0)
    return names, errors


def load(path):
    try:
        with open(path, encoding='utf-8') as f:
            return json.load(f, object_pairs_hook=OrderedDict)
    except Exception as e:  # noqa: BLE001
        raise SystemExit(f'✗ {os.path.relpath(path, APP)}: invalid JSON: {e}')


def main(argv):
    check_only = '--check' in argv
    no_gen = '--no-gen' in argv
    only = argv[argv.index('--part') + 1] if '--part' in argv else None
    if only:
        check_only = True
    errors = []
    areas = sorted({f.rsplit('_', 1)[0] for f in os.listdir(PARTS) if f.endswith('.arb')})
    if only:
        # The part under check goes last so clashes are reported against it.
        if only not in areas:
            raise SystemExit(f'✗ no part named {only}')
        areas = [a for a in areas if a != only] + [only]
    merged = {lang: OrderedDict([('@@locale', lang)]) for lang in LANGS}
    owner = {}
    for area in areas:
        data = {}
        for lang in LANGS:
            p = os.path.join(PARTS, f'{area}_{lang}.arb')
            if not os.path.exists(p):
                errors.append(f'{area}: missing {area}_{lang}.arb')
                data[lang] = OrderedDict()
                continue
            data[lang] = load(p)
        zh = data['zh']
        zkeys = [k for k in zh if not k.startswith('@')]
        for k in zkeys:
            if not KEY_RE.match(k):
                errors.append(f'{area}: bad key "{k}" (lowerCamel identifiers only)')
            if k in owner:
                errors.append(f'{area}: key "{k}" already defined in {owner[k]}')
            owner.setdefault(k, area)
            for lang in LANGS[1:]:
                if k not in data[lang]:
                    errors.append(f'{area}: "{k}" has zh but no {lang}')
        for lang in LANGS[1:]:
            for k in (key for key in data[lang] if not key.startswith('@')):
                if k not in zh:
                    errors.append(f'{area}: "{k}" has {lang} but no zh')
        for k in zkeys:
            if any(k not in data[lang] for lang in LANGS[1:]):
                continue
            zv = zh[k]
            if any(not isinstance(data[lang][k], str) for lang in LANGS):
                errors.append(f'{area}: "{k}" value must be a string')
                continue
            zn, ze = parse_message(zv)
            errors += [f'{area}: "{k}" zh: {e}' for e in ze]
            meta = zh.get('@' + k) or {}
            declared = set((meta.get('placeholders') or {}).keys()) if isinstance(meta, dict) else set()
            if declared and declared != zn:
                errors.append(f'{area}: "{k}" @{k}.placeholders {sorted(declared)} ≠ message {sorted(zn)}')
            for lang in LANGS:
                value = data[lang][k]
                if not value.strip():
                    errors.append(f'{area}: "{k}" {lang} is empty')
                names, issues = parse_message(value)
                errors += [f'{area}: "{k}" {lang}: {e}' for e in issues]
                if names != zn:
                    errors.append(f'{area}: "{k}" placeholders differ: zh {sorted(zn)} {lang} {sorted(names)}')
                merged[lang][k] = value
            if meta:
                merged['zh']['@' + k] = meta
    if only:
        errors = [e for e in errors if e.startswith(only + ':')]
    if errors:
        print('\n'.join('✗ ' + e for e in errors))
        print(f'✗ {len(errors)} problem(s); nothing written.')
        return 1
    count = len(owner)
    print(f'✓ {len(areas)} parts, {count} keys')
    if check_only:
        return 0
    for lang in LANGS:
        with open(os.path.join(L10N, f'app_{lang}.arb'), 'w', encoding='utf-8') as f:
            json.dump(merged[lang], f, ensure_ascii=False, indent=2)
            f.write('\n')
    if no_gen:
        return 0
    flutter = os.environ.get('FLUTTER') or shutil.which('flutter')
    if not flutter:
        print('✗ flutter not found: put it on PATH or set FLUTTER')
        return 1
    r = subprocess.run([flutter, 'gen-l10n'], cwd=APP)
    if r.returncode != 0:
        print('✗ flutter gen-l10n failed')
        return r.returncode
    print('✓ gen-l10n → lib/l10n/gen/')
    return 0


if __name__ == '__main__':
    sys.exit(main(sys.argv[1:]))
