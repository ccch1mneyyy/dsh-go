#!/usr/bin/env python3
"""Helpers for runtime/build-runtime.sh: deb extraction, ELF inspection/patching,
rootfs tar assembly and manifest generation.

Runs with `python3 -I` on the build host (any arch). Never executes anything from the
inputs it reads; downloaded archives are treated as data.
"""
import argparse
import gzip
import hashlib
import io
import json
import lzma
import os
import posixpath
import shutil
import stat
import struct
import subprocess
import sys
import tarfile

EM_NAMES = {3: "i386", 40: "arm", 62: "x86-64", 183: "aarch64"}
NPMMIRROR = "https://registry.npmmirror.com/"
NPMJS = "https://registry.npmjs.org/"
# `dsh web` overlay (passed with --patch by the launch command): plugin-install registries and
# the dsh-go-bridge plugin row.
DSH_WEB_PATCH = "/etc/dsh-app/dsh-web.patch.yml"
# Where runtime/bridge/dsh-go-bridge lands in the rootfs (loaded by absolute path from the overlay).
DSH_GO_BRIDGE = "/opt/dsh-go/dsh-go-bridge"
# runtime/boot/boot-cache.mjs: path cache for `dsh web` while it boots, preloaded by the dsh shim.
BOOT_CACHE = "/opt/dsh-go/boot-cache.mjs"
BOOT_CACHE_SRC = os.path.join(os.path.dirname(os.path.abspath(__file__)), "..", "boot", "boot-cache.mjs")
DIRECT_SRC = os.path.join(os.path.dirname(os.path.abspath(__file__)), "..", "direct")
PNPM_BINS = {"pnpm": "pnpm.mjs", "pnpx": "pnpx.mjs", "pn": "pnpm.mjs", "pnx": "pnpx.mjs"}
ABI = {
    "arm64-v8a": {"machine": 183, "npm_cpu": "arm64", "node": "arm64", "ubuntu": "arm64", "termux": "aarch64"},
    "x86_64": {"machine": 62, "npm_cpu": "x64", "node": "x64", "ubuntu": "amd64", "termux": "x86_64"},
}


# ---------------------------------------------------------------------------
# ELF
# ---------------------------------------------------------------------------
class Elf:
    """Minimal ELF reader (32/64-bit little-endian) for audits and string patching."""

    def __init__(self, data):
        if data[:4] != b"\x7fELF":
            raise ValueError("not ELF")
        self.data = data
        self.bits = 64 if data[4] == 2 else 32
        if data[5] != 1:
            raise ValueError("big-endian ELF not supported")
        if self.bits == 64:
            (_, self.type, self.machine, _, _, self.phoff, self.shoff, _, _, self.phentsize,
             self.phnum, self.shentsize, self.shnum, self.shstrndx) = struct.unpack_from(
                "<16sHHIQQQIHHHHHH", data, 0)
        else:
            (_, self.type, self.machine, _, _, self.phoff, self.shoff, _, _, self.phentsize,
             self.phnum, self.shentsize, self.shnum, self.shstrndx) = struct.unpack_from(
                "<16sHHIIIIIHHHHHH", data, 0)
        self.phdrs = []
        for i in range(self.phnum):
            off = self.phoff + i * self.phentsize
            if self.bits == 64:
                p_type, p_flags, p_offset, p_vaddr, _, p_filesz, p_memsz, p_align = struct.unpack_from(
                    "<IIQQQQQQ", data, off)
            else:
                p_type, p_offset, p_vaddr, _, p_filesz, p_memsz, p_flags, p_align = struct.unpack_from(
                    "<IIIIIIII", data, off)
            self.phdrs.append(dict(type=p_type, offset=p_offset, vaddr=p_vaddr, filesz=p_filesz,
                                   memsz=p_memsz, align=p_align, flags=p_flags))

    def vaddr_to_offset(self, addr):
        for p in self.phdrs:
            if p["type"] == 1 and p["vaddr"] <= addr < p["vaddr"] + p["filesz"]:
                return addr - p["vaddr"] + p["offset"]
        raise ValueError("address 0x%x not in any LOAD segment" % addr)

    def interp(self):
        for p in self.phdrs:
            if p["type"] == 3:
                return self.data[p["offset"]:p["offset"] + p["filesz"]].rstrip(b"\0").decode()
        return None

    def min_load_align(self):
        aligns = [p["align"] for p in self.phdrs if p["type"] == 1]
        return min(aligns) if aligns else None

    def dynamic(self):
        """Returns [(tag, value, file_offset_of_entry)]."""
        out = []
        for p in self.phdrs:
            if p["type"] != 2:
                continue
            size = 16 if self.bits == 64 else 8
            fmt = "<qQ" if self.bits == 64 else "<iI"
            for i in range(p["filesz"] // size):
                off = p["offset"] + i * size
                tag, val = struct.unpack_from(fmt, self.data, off)
                if tag == 0:
                    break
                out.append((tag, val, off))
        return out

    def dynstr(self):
        dyn = dict((t, v) for t, v, _ in self.dynamic())
        if 5 not in dyn:
            return None, 0
        return self.vaddr_to_offset(dyn[5]), dyn.get(10, 0)

    def string_at(self, strtab_off, index):
        end = self.data.index(b"\0", strtab_off + index)
        return self.data[strtab_off + index:end].decode()

    def dyn_strings(self):
        off, _ = self.dynstr()
        res = {"needed": [], "soname": None, "runpath": None}
        if off is None:
            return res
        for tag, val, _ in self.dynamic():
            if tag == 1:
                res["needed"].append(self.string_at(off, val))
            elif tag == 14:
                res["soname"] = self.string_at(off, val)
            elif tag in (15, 29):
                res["runpath"] = self.string_at(off, val)
        return res

    def sections(self):
        out = []
        if not self.shoff or not self.shnum:
            return out
        for i in range(self.shnum):
            off = self.shoff + i * self.shentsize
            if self.bits == 64:
                name, typ, _, addr, offset, size, link, info, _, entsize = struct.unpack_from(
                    "<IIQQQQIIQQ", self.data, off)
            else:
                name, typ, _, addr, offset, size, link, info, _, entsize = struct.unpack_from(
                    "<IIIIIIIIII", self.data, off)
            out.append(dict(type=typ, addr=addr, offset=offset, size=size, link=link, info=info,
                            entsize=entsize))
        return out

    def dynstr_references(self):
        """All dynstr offsets referenced from .dynamic, .dynsym, verneed and verdef."""
        refs = []
        for tag, val, _ in self.dynamic():
            if tag in (1, 14, 15, 29):
                refs.append(val)
        for sec in self.sections():
            if sec["type"] == 11 and sec["entsize"]:  # SHT_DYNSYM
                for i in range(sec["size"] // sec["entsize"]):
                    refs.append(struct.unpack_from("<I", self.data, sec["offset"] + i * sec["entsize"])[0])
            elif sec["type"] == 0x6ffffffe:  # SHT_GNU_verneed
                off, n = sec["offset"], sec["info"]
                for _ in range(n):
                    _, cnt, vn_file, vn_aux, vn_next = struct.unpack_from("<HHIII", self.data, off)
                    refs.append(vn_file)
                    aux = off + vn_aux
                    for _ in range(cnt):
                        _, _, _, vna_name, vna_next = struct.unpack_from("<IHHII", self.data, aux)
                        refs.append(vna_name)
                        aux += vna_next
                    off += vn_next
            elif sec["type"] == 0x6ffffffd:  # SHT_GNU_verdef
                off, n = sec["offset"], sec["info"]
                for _ in range(n):
                    _, _, _, cnt, _, vd_aux, vd_next = struct.unpack_from("<HHHHIII", self.data, off)
                    aux = off + vd_aux
                    for _ in range(cnt):
                        vda_name, vda_next = struct.unpack_from("<II", self.data, aux)
                        refs.append(vda_name)
                        aux += vda_next
                    off += vd_next
        return refs


def elf_summary(data):
    e = Elf(data)
    info = {
        "class": e.bits,
        "machine": EM_NAMES.get(e.machine, str(e.machine)),
        "e_machine": e.machine,
        "type": {1: "REL", 2: "EXEC", 3: "DYN", 4: "CORE"}.get(e.type, str(e.type)),
        "interp": e.interp(),
        "minLoadAlign": e.min_load_align(),
    }
    try:
        info.update(e.dyn_strings())
    except Exception:  # odd/static ELF: keep header facts only
        pass
    needed = info.get("needed") or []
    # musl's libc is plain "libc.so" (glibc: libc.so.6); Android/bionic objects never reach this audit
    info["musl"] = bool("ld-musl" in (info["interp"] or "") or any("musl" in n or n == "libc.so" for n in needed))
    return info


def cmd_hoist_candidates(args):
    """Exact versions npm nested in many places because a different version won the top level.

    Pinning them as direct dependencies hoists one copy."""
    lock = json.load(open(args.lock))
    pkgs = lock.get("packages", {})
    nested = {}
    for key, meta in pkgs.items():
        if "/node_modules/" not in key[len("node_modules/"):] or not meta.get("version"):
            continue
        name = key.rsplit("node_modules/", 1)[1]
        nested.setdefault((name, meta["version"]), []).append(key)
    for (name, version), keys in sorted(nested.items()):
        top = pkgs.get("node_modules/" + name, {}).get("version")
        if len(keys) >= args.min_copies and top != version:
            print("%s@%s" % (name, version))


def cmd_elf_info(args):
    out = {}
    for path in args.files:
        with open(path, "rb") as f:
            out[path] = elf_summary(f.read())
    json.dump(out, sys.stdout, indent=2)
    print()


def cmd_patch_dynstr(args):
    """Rewrite one NUL-terminated .dynstr string in place (new must not be longer)."""
    old, new = args.old.encode(), args.new.encode()
    if len(new) > len(old):
        sys.exit("new string longer than old")
    with open(args.file, "rb") as f:
        data = bytearray(f.read())
    e = Elf(bytes(data))
    str_off, str_size = e.dynstr()
    if str_off is None:
        sys.exit("no DT_STRTAB in %s" % args.file)
    table = bytes(data[str_off:str_off + str_size])
    hits = [i for i in range(len(table)) if table.startswith(old + b"\0", i) and (i == 0 or table[i - 1] == 0)]
    if len(hits) != 1:
        sys.exit("expected exactly one '%s' in .dynstr of %s, found %d" % (args.old, args.file, len(hits)))
    idx = hits[0]
    refs = e.dynstr_references()
    if idx not in refs:
        sys.exit("'%s' is not referenced from the dynamic section" % args.old)
    inside = [r for r in refs if idx < r <= idx + len(old)]
    if inside:
        sys.exit("other dynstr references point inside '%s' (%s); refusing to patch" % (args.old, inside))
    padded = new + b"\0" * (len(old) - len(new) + 1)
    data[str_off + idx:str_off + idx + len(old) + 1] = padded
    with open(args.file, "wb") as f:
        f.write(data)
    print("patched %s: '%s' -> '%s' at .dynstr+0x%x" % (args.file, args.old, args.new, idx))


# ---------------------------------------------------------------------------
# DSH source patches (runtime/patches): strict unified diffs, pinned per DSH version
# ---------------------------------------------------------------------------
def parse_unified_diff(text):
    """[(relpath, [(old_lines, new_lines)])] for a plain unified diff (a/ b/ prefixes, no fuzz)."""
    files, cur, lines = [], None, text.splitlines(keepends=True)
    i = 0
    while i < len(lines):
        line = lines[i]
        if line.startswith("--- "):
            plus = lines[i + 1] if i + 1 < len(lines) else ""
            if not plus.startswith("+++ "):
                raise ValueError("'---' without '+++' at line %d" % (i + 1))
            path = plus[4:].split("\t", 1)[0].strip()
            path = path[2:] if path.startswith("b/") else path
            if path.startswith("/") or ".." in path.split("/"):
                raise ValueError("unsafe path in diff: " + path)
            cur = (path, [])
            files.append(cur)
            i += 2
            continue
        if line.startswith("@@"):
            if cur is None:
                raise ValueError("hunk before file header at line %d" % (i + 1))
            head = line.split("@@")[1].split()
            counts = [int(r.split(",")[1]) if "," in r else 1 for r in head]   # "-a,b +c,d"
            left_old, left_new = counts
            old, new = [], []
            i += 1
            while left_old > 0 or left_new > 0:
                if i >= len(lines):
                    raise ValueError("truncated hunk in %s" % cur[0])
                body = lines[i]
                i += 1
                if body.startswith("\\"):        # "\ No newline at end of file"
                    continue
                tag, rest = body[:1], body[1:]
                if body in ("\n", "\r\n"):        # context line whose leading space was stripped
                    tag, rest = " ", body
                if tag == " ":
                    old.append(rest)
                    new.append(rest)
                    left_old -= 1
                    left_new -= 1
                elif tag == "-":
                    old.append(rest)
                    left_old -= 1
                elif tag == "+":
                    new.append(rest)
                    left_new -= 1
                else:
                    raise ValueError("bad hunk line %d in %s: %r" % (i, cur[0], body[:40]))
            if left_old or left_new:
                raise ValueError("hunk line counts do not match its header in %s" % cur[0])
            cur[1].append(("".join(old), "".join(new)))
            continue
        i += 1
    return files


def apply_hunks(data, hunks, label):
    """Each hunk's old block (context + removed lines) must occur exactly once; no fuzz, any offset."""
    for n, (old, new) in enumerate(hunks, 1):
        count = data.count(old)
        if count != 1:
            raise SystemExit("%s: hunk %d matches %d places (needs exactly 1); the upstream file changed, "
                             "re-vet the patch" % (label, n, count))
        data = data.replace(old, new, 1)
    return data


def cmd_patch_dsh(args):
    """Apply runtime/patches/*.diff to a DSH npm prefix, refusing anything not pinned for this DSH version.

    pins.json maps patch -> DSH version -> file -> {before, after} sha256. Without --record the
    original must match `before` and the result `after`; files are replaced (write + rename), so a
    hard-linked tree is never modified in place. --record applies the hunks strictly and writes the
    observed hashes for this DSH version (use after reviewing the upstream file and the patch)."""
    pins_path = os.path.join(args.patches, "pins.json")
    pins = json.load(open(pins_path)) if os.path.isfile(pins_path) else {"schema": 1, "patches": {}}
    names = sorted(n for n in os.listdir(args.patches) if n.endswith(".diff"))
    if not names:
        sys.exit("no patches in " + args.patches)
    # Several independently reviewed patches may touch the same file. Their
    # pins must form one ordered chain, and a fully patched tree is a valid
    # idempotent input. Never accept an arbitrary intermediate/custom hash.
    terminal = {}
    if not args.record:
        for name in names:
            for rel, pin in pins["patches"].get(name, {}).get(args.dsh_version, {}).items():
                if rel in terminal and terminal[rel] != pin["before"]:
                    sys.exit("%s: broken patch hash chain for %s" % (name, rel))
                terminal[rel] = pin["after"]
    applied = []
    for name in names:
        diff = parse_unified_diff(open(os.path.join(args.patches, name)).read())
        want = pins["patches"].get(name, {}).get(args.dsh_version)
        if want is None and not args.record:
            sys.exit("patch %s has no pin for DSH %s: review the upstream files it touches, then run\n"
                     "  python3 -I runtime/lib/rtbuild.py patch-dsh --prefix <dsh-prefix> --dsh-version %s --record"
                     % (name, args.dsh_version, args.dsh_version))
        observed = {}
        for rel, hunks in diff:
            path = os.path.join(args.prefix, rel)
            raw = open(path, "rb").read()
            before = hashlib.sha256(raw).hexdigest()
            pin = (want or {}).get(rel)
            if not args.record:
                if pin is None:
                    sys.exit("%s: no pin for %s" % (name, rel))
                if before == pin["after"] or before == terminal.get(rel):
                    print("%s: %s already patched" % (name, rel))
                    observed[rel] = pin
                    continue
                if before != pin["before"]:
                    sys.exit("%s: %s sha256 %s differs from the vetted DSH %s original %s"
                             % (name, rel, before, args.dsh_version, pin["before"]))
            out = apply_hunks(raw.decode("utf-8"), hunks, "%s %s" % (name, rel)).encode("utf-8")
            after = hashlib.sha256(out).hexdigest()
            if not args.record and after != pin["after"]:
                sys.exit("%s: %s patched sha256 %s != pinned %s" % (name, rel, after, pin["after"]))
            mode = os.stat(path).st_mode & 0o777
            tmp = path + ".dsh-app-patch"
            with open(tmp, "wb") as f:
                f.write(out)
            os.chmod(tmp, mode)
            os.replace(tmp, path)
            observed[rel] = {"before": before, "after": after}
            print("%s: patched %s (%s -> %s)" % (name, rel, before[:12], after[:12]))
        if args.record:
            pins["patches"].setdefault(name, {})[args.dsh_version] = observed
        applied.append(name)
    if args.record:
        with open(pins_path, "w") as f:
            json.dump(pins, f, indent=2, sort_keys=True)
            f.write("\n")
        print("recorded pins for DSH %s in %s" % (args.dsh_version, pins_path))
    if args.out:
        with open(args.out, "w") as f:
            json.dump(applied, f)


# ---------------------------------------------------------------------------
# Debian dependency resolution (no dpkg/apt needed on the host)
# ---------------------------------------------------------------------------
def _ver_order(c):
    if c == "~":
        return -1
    if c.isdigit():
        return 0
    if c.isalpha():
        return ord(c)
    return ord(c) + 256


def _ver_part_cmp(a, b):
    i = j = 0
    while i < len(a) or j < len(b):
        first_diff = 0
        while (i < len(a) and not a[i].isdigit()) or (j < len(b) and not b[j].isdigit()):
            ac = _ver_order(a[i]) if i < len(a) and not a[i].isdigit() else 0
            bc = _ver_order(b[j]) if j < len(b) and not b[j].isdigit() else 0
            if ac != bc:
                return -1 if ac < bc else 1
            i += 1
            j += 1
        while i < len(a) and a[i] == "0":
            i += 1
        while j < len(b) and b[j] == "0":
            j += 1
        while i < len(a) and a[i].isdigit() and j < len(b) and b[j].isdigit():
            if not first_diff:
                first_diff = ord(a[i]) - ord(b[j])
            i += 1
            j += 1
        if i < len(a) and a[i].isdigit():
            return 1
        if j < len(b) and b[j].isdigit():
            return -1
        if first_diff:
            return -1 if first_diff < 0 else 1
    return 0


def debver_cmp(a, b):
    """dpkg's version comparison (epoch:upstream-revision)."""
    def split(v):
        epoch, _, rest = v.partition(":") if ":" in v else ("0", "", v)
        up, _, rev = rest.rpartition("-") if "-" in rest else (rest, "", "")
        return int(epoch or 0), up, rev
    ea, ua, ra = split(a)
    eb, ub, rb = split(b)
    if ea != eb:
        return -1 if ea < eb else 1
    return _ver_part_cmp(ua, ub) or _ver_part_cmp(ra, rb)


def ver_satisfies(have, op, want):
    if op is None:
        return True
    c = debver_cmp(have, want)
    return {"<<": c < 0, "<=": c <= 0, "=": c == 0, ">=": c >= 0, ">>": c > 0}[op]


def parse_relations(text):
    """'a (>= 1) | b, c:any' -> [[(a,'>=','1'), (b,None,None)], [(c,None,None)]]"""
    groups = []
    for group in (text or "").split(","):
        alts = []
        for alt in group.split("|"):
            alt = alt.split("[", 1)[0].strip()  # drop [arch] qualifiers
            if not alt:
                continue
            name, op, ver = alt, None, None
            if "(" in alt:
                name, rest = alt.split("(", 1)
                rest = rest.rstrip(")").strip()
                for candidate in ("<<", "<=", ">=", ">>", "=", "<", ">"):
                    if rest.startswith(candidate):
                        op, ver = candidate, rest[len(candidate):].strip()
                        break
                op = {"<": "<=", ">": ">="}.get(op, op)
            name = name.strip().split(":")[0].split("[")[0].strip()
            alts.append((name, op, ver))
        if alts:
            groups.append(alts)
    return groups


def parse_stanzas(text):
    out = []
    for block in text.split("\n\n"):
        fields, key = {}, None
        for line in block.splitlines():
            if line.startswith((" ", "\t")) and key:
                fields[key] += "\n" + line
            elif ":" in line:
                key, _, val = line.partition(":")
                fields[key] = val.strip()
        if "Package" in fields:
            out.append(fields)
    return out


def base_status(base_tar):
    with tarfile.open(base_tar, "r:gz") as t:
        for m in t:
            if norm_member(m.name) == "var/lib/dpkg/status":
                return parse_stanzas(t.extractfile(m).read().decode())
    raise SystemExit("no dpkg status in " + base_tar)


def cmd_resolve_debs(args):
    arch = args.arch
    installed = {s["Package"]: s for s in base_status(args.base)
                 if s.get("Status", "").endswith(" installed")}
    available = {}
    for path in args.packages:
        with open(path, "rb") as f:
            raw = f.read()
        text = (lzma.decompress(raw) if path.endswith(".xz") else raw).decode()
        for s in parse_stanzas(text):
            if s.get("Architecture") not in (arch, "all"):
                continue
            cur = available.get(s["Package"])
            if cur is None or debver_cmp(s["Version"], cur["Version"]) > 0:
                available[s["Package"]] = s
    def provided(s):
        """[(virtual name, provided version or None)] of a stanza."""
        return [(n, v if o == "=" else None) for grp in parse_relations(s.get("Provides", "")) for n, o, v in grp]

    provides = {}  # virtual -> {provider package: provided version}
    for pool in (installed, available):
        for s in pool.values():
            for name, ver in provided(s):
                provides.setdefault(name, {})[s["Package"]] = ver

    selected, reasons = {}, {}

    def provider_ok(name, op, ver, pool):
        for prov in pool.values():
            for vname, pver in provided(prov):
                if vname == name and (op is None or (pver is not None and ver_satisfies(pver, op, ver))):
                    return True
        return False

    def satisfied(name, op, ver):
        for pool in (selected, installed):
            if name in pool and ver_satisfies(pool[name]["Version"], op, ver):
                return True
        return provider_ok(name, op, ver, selected) or provider_ok(name, op, ver, installed)

    queue = [(w, "requested") for w in args.want]
    while queue:
        name, why = queue.pop(0)
        if name in selected:
            continue
        cand = available.get(name)
        if cand is None:
            raise SystemExit("package %s (needed by %s) not found in the indexes" % (name, why))
        if name in installed and debver_cmp(installed[name]["Version"], cand["Version"]) >= 0 and why == "requested":
            continue
        selected[name] = cand
        reasons[name] = why
        for field in ("Pre-Depends", "Depends"):
            for group in parse_relations(cand.get(field, "")):
                if any(satisfied(*alt) for alt in group):
                    continue
                pick = None
                for alt_name, op, ver in group:
                    real = available.get(alt_name)
                    if real is not None and ver_satisfies(real["Version"], op, ver):
                        pick = alt_name
                        break
                    cands = sorted(p for p, pver in provides.get(alt_name, {}).items()
                                   if p in available and (op is None or (pver and ver_satisfies(pver, op, ver))))
                    if cands:
                        pick = cands[0]
                        break
                if pick is None:
                    raise SystemExit("cannot satisfy %s of %s: %s" % (field, name, group))
                queue.append((pick, name))
    result = []
    for name, s in sorted(selected.items()):
        result.append({"package": name, "version": s["Version"], "architecture": s["Architecture"],
                       "filename": s["Filename"], "sha256": s["SHA256"], "size": int(s["Size"]),
                       "installedSize": int(s.get("Installed-Size", 0)),
                       "upgradesBase": installed[name]["Version"] if name in installed else None,
                       "neededBy": reasons[name]})
    with open(args.out, "w") as f:
        json.dump({"arch": arch, "want": args.want, "packages": result}, f, indent=2)
        f.write("\n")
    print("resolved %d packages (%.1f MiB download, %.1f MiB installed): %s" % (
        len(result), sum(r["size"] for r in result) / 2**20,
        sum(r["installedSize"] for r in result) / 1024, " ".join(r["package"] for r in result)))


# ---------------------------------------------------------------------------
# .deb
# ---------------------------------------------------------------------------
def _decompress(name, body):
    if name.endswith(".xz"):
        return lzma.decompress(body)
    if name.endswith(".gz"):
        return gzip.decompress(body)
    if name.endswith(".zst"):
        try:
            from compression import zstd  # Python >= 3.14
            return zstd.decompress(body)
        except ImportError:
            return subprocess.run(["zstd", "-dc"], input=body, stdout=subprocess.PIPE, check=True).stdout
    return body


def read_deb(path):
    """Returns (control_tar_bytes, data_tar_bytes) of a .deb (ar archive)."""
    with open(path, "rb") as f:
        blob = f.read()
    if not blob.startswith(b"!<arch>\n"):
        sys.exit("not an ar archive: " + path)
    pos, members = 8, {}
    while pos + 60 <= len(blob):
        hdr = blob[pos:pos + 60]
        name = hdr[:16].decode().strip().rstrip("/")
        size = int(hdr[48:58].decode().strip())
        members[name] = blob[pos + 60:pos + 60 + size]
        pos += 60 + size + (size & 1)
    ctl = [n for n in members if n.startswith("control.tar")]
    data = [n for n in members if n.startswith("data.tar")]
    if not ctl or not data:
        sys.exit("malformed deb: " + path)
    return _decompress(ctl[0], members[ctl[0]]), _decompress(data[0], members[data[0]])


def cmd_deb_extract(args):
    _, body = read_deb(args.deb)
    os.makedirs(args.outdir, exist_ok=True)
    with tarfile.open(fileobj=io.BytesIO(body), mode="r:") as t:
        for m in t.getmembers():
            clean = posixpath.normpath(m.name.lstrip("./"))
            if clean.startswith("..") or clean.startswith("/"):
                sys.exit("unsafe member " + m.name)
            dest = os.path.join(args.outdir, clean)
            if m.isdir():
                os.makedirs(dest, exist_ok=True)
            elif m.isfile():
                os.makedirs(os.path.dirname(dest), exist_ok=True)
                with open(dest, "wb") as out:
                    out.write(t.extractfile(m).read())
                os.chmod(dest, (m.mode & 0o755) | 0o600)
            elif m.issym():
                os.makedirs(os.path.dirname(dest), exist_ok=True)
                if os.path.lexists(dest):
                    os.unlink(dest)
                os.symlink(m.linkname, dest)


# ---------------------------------------------------------------------------
# rootfs assembly
# ---------------------------------------------------------------------------
class Entry:
    __slots__ = ("kind", "mode", "data", "path", "link", "origin")

    def __init__(self, kind, mode, data=None, path=None, link=None, origin=""):
        self.kind, self.mode, self.data, self.path, self.link, self.origin = kind, mode, data, path, link, origin

    def size(self):
        if self.kind != "file":
            return 0
        return len(self.data) if self.data is not None else os.path.getsize(self.path)

    def read(self):
        if self.data is not None:
            return self.data
        with open(self.path, "rb") as f:
            return f.read()


def direct_native_inventory(entries):
    """Snapshot the post-pruning bundled addons once for both hash and archive."""
    files = {}
    for path, entry in sorted(entries.items()):
        if path.startswith("opt/dsh/node_modules/") and path.endswith(".node") and entry.kind == "file":
            entry.data = entry.read()
            files["/" + path] = hashlib.sha256(entry.data).hexdigest()
    return {"schema": 1, "files": files}


def norm_member(name):
    name = name.lstrip("/")
    while name.startswith("./"):
        name = name[2:]
    name = name.rstrip("/")
    if name in ("", "."):
        return ""
    clean = posixpath.normpath(name)
    if clean.startswith("../") or clean == "..":
        raise ValueError("member escapes root: " + name)
    return clean


def base_drop(path):
    """Ubuntu Base trimming: docs, man pages, caches, logs. apt/dpkg state is kept."""
    if path.startswith("usr/share/doc/"):
        rest = path[len("usr/share/doc/"):]
        return not (rest.count("/") == 0 or rest.endswith("/copyright"))
    for prefix in ("usr/share/man/", "usr/share/info/", "usr/share/lintian/", "usr/share/linda/"):
        if path.startswith(prefix):
            return True
    if path.startswith("usr/share/locale/") and path != "usr/share/locale/locale.alias" and path.count("/") > 3:
        return True
    if path.startswith("var/cache/apt/") and path.endswith(".bin"):
        return True
    if path.startswith("var/cache/debconf/") and path.endswith("-old"):
        return True
    if path.startswith("var/lib/apt/lists/") and path.count("/") == 4 and path not in (
            "var/lib/apt/lists/lock", "var/lib/apt/lists/partial"):
        return True
    return False


def dsh_drop_reason(rel, abi, prune_dev):
    parts = rel.split("/")
    if "prebuilds" in parts:
        i = parts.index("prebuilds")
        if i + 1 < len(parts) and not parts[i + 1].startswith("linux-" + ABI[abi]["npm_cpu"]):
            return "foreign-prebuild"
        if i + 1 < len(parts) and "musl" in parts[i + 1]:
            return "foreign-prebuild"
    low = rel.lower()
    if low.endswith((".exe", ".dll", ".pdb", ".dylib")):
        return "foreign-binary"
    if "node-pty/third_party/conpty" in rel:
        return "foreign-binary"
    if prune_dev:
        if "/typescript/" not in "/" + rel and low.endswith((".d.ts", ".d.mts", ".d.cts", ".tsbuildinfo")):
            return "dev-metadata"
        if low.endswith((".js.map", ".mjs.map", ".cjs.map", ".ts.map", ".css.map")):
            return "dev-metadata"
    return None


def pnpm_drop_reason(rel, abi, prune_dev):
    """pnpm bundles @reflink prebuilds for macOS/Windows only (none for Linux) and Windows .exe helpers."""
    parts = rel.split("/")
    for i in range(len(parts) - 1):
        if parts[i] == "@reflink" and parts[i + 1].startswith("reflink-") and not parts[i + 1].startswith("reflink-linux-"):
            return "foreign-binary"
    return dsh_drop_reason(rel, abi, prune_dev)


PY_DROP_DIRS = ("test", "idlelib", "tkinter", "turtledemo", "lib2to3/tests")


def python_drop(rel):
    """Parts of python-build-standalone that are useless on a phone (GUI, test suite)."""
    parts = rel.split("/")
    if len(parts) >= 3 and parts[0] == "lib" and parts[1].startswith("python3."):
        sub = "/".join(parts[2:])
        if any(sub == d or sub.startswith(d + "/") for d in PY_DROP_DIRS):
            return True
        if sub.startswith("lib-dynload/_tkinter"):
            return True
        if sub == "turtle.py":
            return True
    if len(parts) >= 2 and parts[0] == "lib" and parts[1].startswith(("tcl8", "tk8", "itcl", "thread2", "tdbc", "Tix")):
        return True
    if parts[0] == "bin" and parts[-1].startswith(("idle3", "pydoc3")):
        return False
    return False


def install_ca_bundle(entries, report):
    """What ca-certificates' postinst (update-ca-certificates) would generate."""
    prefix = "usr/share/ca-certificates/"
    certs = sorted(p for p, e in entries.items()
                   if p.startswith(prefix) and p.endswith(".crt") and e.kind == "file")
    conf = ("# Generated by dsh-app's build (equivalent of update-ca-certificates).\n"
            "# Lines starting with ! are deselected; run update-ca-certificates after editing.\n"
            + "".join(p[len(prefix):] + "\n" for p in certs))
    entries["etc/ca-certificates.conf"] = Entry("file", 0o644, data=conf.encode(), origin="deb")
    bundle = b""
    hashes = {}
    have_openssl = shutil.which("openssl") is not None
    for p in certs:
        data = entries[p].data
        bundle += data if data.endswith(b"\n") else data + b"\n"
        pem = posixpath.basename(p)[:-4] + ".pem"
        entries["etc/ssl/certs/" + pem] = Entry("symlink", 0o777, link="/" + p, origin="deb")
        if have_openssl:
            h = subprocess.run(["openssl", "x509", "-hash", "-noout"], input=data,
                               stdout=subprocess.PIPE, stderr=subprocess.DEVNULL).stdout.decode().strip()
            if h:
                n = hashes.get(h, 0)
                hashes[h] = n + 1
                entries["etc/ssl/certs/%s.%d" % (h, n)] = Entry("symlink", 0o777, link=pem, origin="deb")
    entries["etc/ssl/certs/ca-certificates.crt"] = Entry("file", 0o644, data=bundle, origin="deb")
    # OpenSSL's built-in default CA file (python-build-standalone reads /etc/ssl/cert.pem)
    entries["etc/ssl/cert.pem"] = Entry("symlink", 0o777, link="certs/ca-certificates.crt", origin="deb")
    report["caCertificates"] = {"certs": len(certs), "hashLinks": sum(hashes.values()),
                                "bundleBytes": len(bundle)}


def overlay_entries(runtime_info, with_python=False, with_pnpm=False, with_bridge=False):
    """Files dsh-app adds to the rootfs. Kept here so the recipe lives in one place."""
    E = {}

    def f(path, text, mode=0o644):
        E[path] = Entry("file", mode, data=text.encode(), origin="overlay")

    def d(path, mode=0o755):
        E[path] = Entry("dir", mode, origin="overlay")

    def s(path, target):
        E[path] = Entry("symlink", 0o777, link=target, origin="overlay")

    f("etc/resolv.conf",
      "# dsh-app default resolvers. The app should rewrite this file at each launch with the\n"
      "# device's current DNS servers (ConnectivityManager LinkProperties.getDnsServers()).\n"
      "# It adds `no-aaaa` only when the device refuses to send AAAA queries (issue #55).\n"
      "nameserver 223.5.5.5\nnameserver 119.29.29.29\nnameserver 8.8.8.8\n"
      "options timeout:2 attempts:2\n")
    f("etc/hosts", "127.0.0.1 localhost\n::1 localhost ip6-localhost ip6-loopback\n")
    f("etc/hostname", "localhost\n")
    # what tzdata's postinst would do non-interactively; the app passes TZ=<IANA id> for local time
    f("etc/timezone", "Etc/UTC\n")
    s("etc/localtime", "../usr/share/zoneinfo/Etc/UTC")
    f("etc/profile.d/dsh-app.sh",
      "# dsh-app guest defaults (login shells). The launcher passes the same values via env -i.\n"
      "export PATH=/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin\n"
      "export HOME=\"${HOME:-/root}\"\n"
      "export LANG=\"${LANG:-C.UTF-8}\"\n"
      "export TERM=\"${TERM:-xterm-256color}\"\n"
      "export TMPDIR=\"${TMPDIR:-/tmp}\"\n"
      "export DSH_HOME=\"${DSH_HOME:-/root/.dsh}\"\n"
      + ("export pnpm_config_registry=\"${pnpm_config_registry:-%s}\"\n" % NPMMIRROR if with_pnpm else ""))
    f("etc/apt/apt.conf.d/99dsh-app-proot",
      "// proot fakes root; apt's privilege drop to _apt only causes setgroups/permission noise.\n"
      "APT::Sandbox::User \"root\";\n"
      "Acquire::Retries \"3\";\n")
    f("opt/node/etc/npmrc",
      "# Global npm config for the dsh-app runtime (npm reads <node prefix>/etc/npmrc).\n"
      "# pnpm 11 never reads this file: its registry comes from pnpm_config_registry, which the\n"
      "# launch environment and /etc/profile.d/dsh-app.sh set.\n"
      "prefix=/usr/local\n"
      "registry=https://registry.npmmirror.com\n"
      "update-notifier=false\nfund=false\naudit=false\n")
    s("usr/local/bin/node", "../../../opt/node/bin/node")
    s("usr/local/bin/npm", "../../../opt/node/bin/npm")
    s("usr/local/bin/npx", "../../../opt/node/bin/npx")
    s("usr/local/bin/corepack", "../../../opt/node/bin/corepack")
    # `dsh web` (the app's launch) preloads the boot cache: proot makes each path lookup costly
    # and DSH resolves the read-only /opt tree thousands of times while it boots.
    with open(BOOT_CACHE_SRC, "rb") as src:
        E[BOOT_CACHE.lstrip("/")] = Entry("file", 0o644, data=src.read(), origin="overlay")
    # Immutable direct-engine input; Android's per-install path config and
    # wrappers live separately under opt/dsh-app/direct.
    for name in sorted(os.listdir(DIRECT_SRC)):
        if name.endswith(".mjs"):
            with open(os.path.join(DIRECT_SRC, name), "rb") as src:
                E["opt/dsh-go/direct/" + name] = Entry("file", 0o644, data=src.read(), origin="overlay")
    f("usr/local/bin/dsh",
      "#!/bin/sh\n"
      "# dsh-app shim: run the bundled DeepSeek Harness CLI with the bundled Node.\n"
      "# `dsh web` (the app's launch) preloads the boot cache, " + BOOT_CACHE + ".\n"
      "if [ \"$1\" = web ]; then\n"
      "  exec /opt/node/bin/node --import=" + BOOT_CACHE + " /opt/dsh/node_modules/@deepseek-ai/dsh/lib/bin.js \"$@\"\n"
      "fi\n"
      "exec /opt/node/bin/node /opt/dsh/node_modules/@deepseek-ai/dsh/lib/bin.js \"$@\"\n", 0o755)
    if with_pnpm:
        # what `npm i -g pnpm` creates under npm's global prefix (/usr/local)
        for name, target in PNPM_BINS.items():
            s("usr/local/bin/" + name, "../lib/node_modules/pnpm/bin/" + target)
    if with_pnpm or with_bridge:
        patch = ("# dsh-app: overlay for `dsh web`, passed with --patch by the app's launch command and\n"
                 "# replaced on every runtime upgrade (edits here do not survive one).\n")
        if with_pnpm:
            patch += ("#\n"
                      "# Plugin installs (pluginManager) ask pnpm's own registry first; the launch environment\n"
                      "# points it at npmmirror (pnpm_config_registry). Listing npmmirror here keeps it in the\n"
                      "# public set, so npm's own registry is asked next when the mirror is unreachable, times out\n"
                      "# or has not synced a version yet. A private registry pnpm is pointed at is still asked\n"
                      "# alone. This row replaces plugin-manager's whole config: a plugin-manager config in the\n"
                      "# profile's cordis.patch.yml does not apply while DSH runs with this overlay.\n"
                      "- id: plugin-manager\n"
                      "  config:\n"
                      "    fallbackRegistries:\n"
                      "      - %s\n"
                      "      - %s\n" % (NPMMIRROR, NPMJS))
        if with_bridge:
            patch += ("#\n"
                      "# dsh-go-bridge: plugin inventory for the app (GET /dsh-go/v1/inventory), loaded by path.\n"
                      "# Do not also install dsh-go-bridge into a profile: two sources of one browser package\n"
                      "# fail the client composition.\n"
                      "- insert:\n"
                      "    - id: dsh-go-bridge\n"
                      "      name: %s/lib/index.js\n" % DSH_GO_BRIDGE)
        f(DSH_WEB_PATCH.lstrip("/"), patch)
    d("root/.dsh", 0o700)
    d("root/.l2s", 0o700)          # PROOT_L2S_DIR: hard-link backing files (kept with /root on upgrade)
    d("root/workspace", 0o755)
    d("var/lib/dsh-app", 0o755)
    d("var/lib/dsh-app/shm", 0o1777)    # bound to /dev/shm
    d("var/lib/dsh-app/empty", 0o755)   # bound over /sys/fs/selinux so dpkg/libselinux see no SELinux
    d("tmp", 0o1777)
    f("etc/dsh-app/runtime.json", json.dumps(runtime_info, indent=2, sort_keys=True) + "\n")
    if with_python:
        s("usr/local/bin/python3", "../../../opt/python/bin/python3")
        s("usr/local/bin/python", "../../../opt/python/bin/python3")
        s("usr/local/bin/pip3", "../../../opt/python/bin/pip3")
        s("usr/local/bin/pip", "../../../opt/python/bin/pip3")
        f("etc/pip.conf",
          "# dsh-app: PyPI mirror for users in China (change or delete to use pypi.org).\n"
          "[global]\nindex-url = https://pypi.tuna.tsinghua.edu.cn/simple\n"
          "disable-pip-version-check = true\n")
    return E


class HashingWriter:
    def __init__(self, sink):
        self.sink, self.h, self.n = sink, hashlib.sha256(), 0

    def write(self, b):
        self.h.update(b)
        self.n += len(b)
        self.sink.write(b)
        return len(b)

    def flush(self):
        self.sink.flush()


def cmd_assemble(args):
    abi = args.abi
    machine = ABI[abi]["machine"]
    entries = {}
    report = {"abi": abi, "dropped": {}, "droppedSamples": {}, "elf": [], "warnings": [],
              "convertedHardlinks": [], "relativizedSymlinks": 0, "installScriptsNotRun": []}

    def drop(reason, path, size):
        report["dropped"][reason] = report["dropped"].get(reason, 0) + size
        samples = report["droppedSamples"].setdefault(reason, [])
        if len(samples) < 12:
            samples.append(path)

    # 1. Ubuntu Base
    hardlinks = []
    with tarfile.open(args.base, "r:gz") as t:
        for m in t:
            p = norm_member(m.name)
            if not p:
                continue
            if base_drop(p):
                drop("ubuntu-docs-caches", p, m.size)
                continue
            if m.isdir():
                entries[p] = Entry("dir", m.mode, origin="ubuntu")
            elif m.isreg():
                entries[p] = Entry("file", m.mode, data=t.extractfile(m).read(), origin="ubuntu")
            elif m.issym():
                entries[p] = Entry("symlink", 0o777, link=m.linkname, origin="ubuntu")
            elif m.islnk():
                hardlinks.append((p, norm_member(m.linkname), m.mode))
            else:
                drop("device-or-fifo", p, 0)
    for p, target, mode in hardlinks:  # hard links become independent copies
        src = entries.get(target)
        if src is None or src.kind != "file":
            raise SystemExit("hard link %s -> %s has no regular-file target" % (p, target))
        entries[p] = Entry("file", mode, data=src.data, origin="ubuntu")
        report["convertedHardlinks"].append("%s -> %s" % (p, target))

    # 1b. extra Architecture: all packages (e.g. tzdata), registered in the dpkg database
    for deb in args.deb or []:
        ctl_tar, data_tar = read_deb(deb)
        with tarfile.open(fileobj=io.BytesIO(ctl_tar), mode="r:") as t:
            ctl = {norm_member(m.name): t.extractfile(m).read() for m in t if m.isreg()}
        fields = ctl["control"].decode()
        pkg = fields.split("\n", 1)[0].split(": ", 1)[1].strip()
        listed = ["/."]
        with tarfile.open(fileobj=io.BytesIO(data_tar), mode="r:") as t:
            for m in t:
                p = norm_member(m.name)
                if not p:
                    continue
                if base_drop(p):
                    drop("deb-docs", p, m.size)
                    continue
                if m.isdir():
                    entries.setdefault(p, Entry("dir", m.mode, origin="deb"))
                elif m.isreg():
                    entries[p] = Entry("file", m.mode, data=t.extractfile(m).read(), origin="deb")
                elif m.issym():
                    entries[p] = Entry("symlink", 0o777, link=m.linkname, origin="deb")
                elif m.islnk():  # hard link -> independent copy (target precedes it in the tar)
                    src = entries.get(norm_member(m.linkname))
                    if src is None or src.kind != "file":
                        raise SystemExit("hard link %s -> %s without target in %s" % (m.name, m.linkname, deb))
                    entries[p] = Entry("file", m.mode, data=src.data, origin="deb")
                    report["convertedHardlinks"].append("%s -> %s" % (p, norm_member(m.linkname)))
                else:
                    raise SystemExit("unsupported member %s in %s" % (m.name, deb))
                listed.append("/" + p)
        meta = dict(l.split(": ", 1) for l in fields.splitlines() if ": " in l and not l.startswith(" "))
        qualified = pkg + (":" + meta["Architecture"] if meta.get("Multi-Arch") == "same" else "")
        info = "var/lib/dpkg/info/%s." % qualified
        entries[info + "list"] = Entry("file", 0o644, data=("\n".join(listed) + "\n").encode(), origin="deb")
        if "md5sums" in ctl:
            keep = set(x[1:] for x in listed)
            lines = [l for l in ctl["md5sums"].decode().splitlines() if l.split("  ", 1)[-1] in keep]
            entries[info + "md5sums"] = Entry("file", 0o644, data=("\n".join(lines) + "\n").encode(), origin="deb")
        conffiles = [c.strip() for c in ctl.get("conffiles", b"").decode().splitlines() if c.strip()]
        conf_lines = []
        for c in conffiles:
            e = entries.get(c.lstrip("/"))
            if e is not None and e.kind == "file":
                conf_lines.append(" %s %s" % (c, hashlib.md5(e.data).hexdigest()))
        scripts = sorted(k for k in ctl if k in ("preinst", "postinst", "prerm", "postrm", "triggers"))
        status = entries["var/lib/dpkg/status"]
        stanzas = [x for x in status.data.decode().split("\n\n") if x.strip()]
        stanzas = [x for x in stanzas if not x.startswith("Package: %s\n" % pkg)]
        head, rest = fields.rstrip("\n").split("\n", 1)
        stanza = head + "\nStatus: install ok installed\n" + rest
        if conf_lines:
            stanza += "\nConffiles:\n" + "\n".join(conf_lines)
        stanzas.append(stanza)
        status.data = ("\n\n".join(stanzas) + "\n").encode()
        for k in scripts:
            entries[info + k] = Entry("file", 0o755 if k != "triggers" else 0o644, data=ctl[k], origin="deb")
        report.setdefault("extraDebs", []).append({"package": pkg, "deb": os.path.basename(deb),
                                                    "files": len(listed) - 1,
                                                    "maintainerScriptsNotRun": scripts})
    if any(d.get("package") == "ca-certificates" for d in report.get("extraDebs", [])):
        install_ca_bundle(entries, report)

    # 1c. relocatable CPython (python-build-standalone install_only)
    if args.python:
        with tarfile.open(args.python, "r:*") as t:
            for m in t:
                p = norm_member(m.name)
                if not p.startswith("python/"):
                    continue
                rel = p[len("python/"):]
                if not rel:
                    continue
                if python_drop(rel):
                    drop("python-unused", rel, m.size)
                    continue
                dest = "opt/python/" + rel
                if m.isdir():
                    entries[dest] = Entry("dir", m.mode, origin="python")
                elif m.isreg():
                    entries[dest] = Entry("file", m.mode, data=t.extractfile(m).read(), origin="python")
                elif m.issym():
                    entries[dest] = Entry("symlink", 0o777, link=m.linkname, origin="python")
                elif m.islnk():
                    src = entries.get("opt/python/" + norm_member(m.linkname)[len("python/"):])
                    entries[dest] = Entry("file", m.mode, data=src.data, origin="python")
        entries["opt/python"] = Entry("dir", 0o755, origin="python")

    # 2. Node.js
    keep_node_top = {"bin", "lib", "LICENSE"}
    with tarfile.open(args.node, "r:*") as t:
        for m in t:
            p = norm_member(m.name)
            parts = p.split("/", 1)
            if len(parts) < 2:
                continue
            rel = parts[1]
            top = rel.split("/", 1)[0]
            if top not in keep_node_top:
                drop("node-headers-docs", rel, m.size)
                continue
            dest = "opt/node/" + rel
            if m.isdir():
                entries[dest] = Entry("dir", m.mode, origin="node")
            elif m.isreg():
                entries[dest] = Entry("file", m.mode, data=t.extractfile(m).read(), origin="node")
            elif m.issym():
                entries[dest] = Entry("symlink", 0o777, link=m.linkname, origin="node")
            elif m.islnk():
                raise SystemExit("unexpected hard link in node tarball: " + m.name)
    entries["opt"] = Entry("dir", 0o755, origin="node")
    entries["opt/node"] = Entry("dir", 0o755, origin="node")

    # 3. npm trees on disk: DSH (whole --prefix) and pnpm (laid out like `npm i -g pnpm`)
    def add_tree(src, dest_root, origin, drop_reason):
        src = os.path.abspath(src)
        for dirpath, dirnames, filenames in os.walk(src):
            dirnames.sort()
            rel_dir = os.path.relpath(dirpath, src)
            rel_dir = "" if rel_dir == "." else rel_dir.replace(os.sep, "/")
            dest_dir = dest_root + ("/" + rel_dir if rel_dir else "")
            entries[dest_dir] = Entry("dir", 0o755, origin=origin)
            for name in list(dirnames):
                full = os.path.join(dirpath, name)
                if os.path.islink(full):  # symlinked dirs are recorded as symlinks, not walked
                    dirnames.remove(name)
                    filenames.append(name)
            for name in sorted(filenames):
                full = os.path.join(dirpath, name)
                rel = (rel_dir + "/" if rel_dir else "") + name
                dest = dest_root + "/" + rel
                if os.path.islink(full):
                    target = os.readlink(full)
                    if os.path.isabs(target):
                        target = os.path.relpath(target, os.path.dirname(full))
                    entries[dest] = Entry("symlink", 0o777, link=target, origin=origin)
                    continue
                st = os.lstat(full)
                if not stat.S_ISREG(st.st_mode):
                    drop("special-file", rel, 0)
                    continue
                reason = drop_reason(rel, abi, args.prune_dev_metadata)
                if reason:
                    drop(reason, rel, st.st_size)
                    continue
                if name == "package.json":
                    try:
                        with open(full, "rb") as fh:
                            meta = json.loads(fh.read())
                        scripts = meta.get("scripts") or {}
                        hooks = {k: scripts[k] for k in ("preinstall", "install", "postinstall") if k in scripts}
                        if hooks and "/node_modules/" in "/" + rel:
                            report["installScriptsNotRun"].append(
                                {"package": "%s@%s" % (meta.get("name"), meta.get("version")), "scripts": hooks})
                    except (ValueError, UnicodeDecodeError):
                        pass
                mode = 0o755 if st.st_mode & 0o111 else 0o644
                entries[dest] = Entry("file", mode, path=full, origin=origin)

    add_tree(args.dsh_prefix, "opt/dsh", "dsh", dsh_drop_reason)
    if args.pnpm_prefix:
        add_tree(os.path.join(args.pnpm_prefix, "node_modules", "pnpm"), "usr/local/lib/node_modules/pnpm",
                 "pnpm", pnpm_drop_reason)
    if args.bridge:
        add_tree(args.bridge, DSH_GO_BRIDGE.lstrip("/"), "bridge", lambda rel, abi, prune: None)

    # 4. dsh-app overlay (wins over everything above)
    runtime_info = json.loads(args.runtime_info)
    for p, e in overlay_entries(runtime_info, with_python=bool(args.python), with_pnpm=bool(args.pnpm_prefix),
                                with_bridge=bool(args.bridge)).items():
        entries[p] = e

    # 5. ELF audit + arch/libc pruning; Termux-style fixes for node-pty helpers
    for p in sorted(entries):
        e = entries[p]
        if e.kind != "file":
            continue
        head = e.data[:4] if e.data is not None else open(e.path, "rb").read(4)
        if head != b"\x7fELF":
            continue
        data = e.read()
        try:
            info = elf_summary(data)
        except Exception as exc:  # truncated/odd ELF objects (e.g. test fixtures)
            report["warnings"].append("unparsable ELF %s: %s" % (p, exc))
            continue
        if info["e_machine"] != machine:
            if e.origin in ("dsh", "pnpm"):
                # unusable on this ABI; keep the build going but make it visible
                drop("foreign-arch-elf", p, len(data))
                report["warnings"].append("pruned %s ELF from npm tree (package lacks a %s build?): %s"
                                          % (info["machine"], EM_NAMES[machine], p))
                del entries[p]
                continue
            raise SystemExit("ELF %s is %s, expected %s" % (p, info["machine"], EM_NAMES[machine]))
        if info["musl"]:
            if e.origin in ("dsh", "pnpm"):
                drop("musl-elf", p, len(data))
                del entries[p]
                continue
            report["warnings"].append("musl-linked ELF kept: " + p)
        if p.endswith("/spawn-helper"):
            e.mode = 0o755
        info["path"] = p
        info["bytes"] = len(data)
        report["elf"].append(info)
        if machine == 183 and (info["minLoadAlign"] or 0) < 16384:
            report["warnings"].append("ELF LOAD align %s < 16 KiB (fails on 16 KiB-page kernels): %s"
                                      % (info["minLoadAlign"], p))

    # Direct native loading supports only the exact bundled addon files, after
    # architecture/libc pruning. This generated inventory is part of the hashed
    # archive, never a hand-maintained asset or a grant to user profile packages.
    entries["opt/dsh-go/direct/native-addons.json"] = Entry(
        "file", 0o644, data=(json.dumps(direct_native_inventory(entries), sort_keys=True) + "\n").encode(), origin="overlay")

    # 6. Implicit parents, symlink normalisation, mode normalisation
    for p in list(entries):
        parent = posixpath.dirname(p)
        while parent and parent not in entries:
            entries[parent] = Entry("dir", 0o755, origin="implicit")
            parent = posixpath.dirname(parent)
    symlinks = {p for p, e in entries.items() if e.kind == "symlink"}
    for p in entries:
        anc = posixpath.dirname(p)
        while anc:
            if anc in symlinks:
                raise SystemExit("member %s lies under symlink %s" % (p, anc))
            if entries[anc].kind != "dir":
                raise SystemExit("member %s lies under non-directory %s" % (p, anc))
            anc = posixpath.dirname(anc)
    for p in symlinks:
        e = entries[p]
        target = e.link
        here = posixpath.dirname(p)
        if target.startswith("/"):
            resolved = posixpath.normpath(target.lstrip("/")) if target.strip("/") else "."
            report["relativizedSymlinks"] += 1
        else:
            stack = here.split("/") if here else []
            for part in target.split("/"):
                if part in ("", "."):
                    continue
                if part == "..":
                    if stack:
                        stack.pop()
                else:
                    stack.append(part)
            resolved = "/".join(stack) or "."
        rel = posixpath.relpath(resolved, here or ".")
        if rel != target:
            e.link = rel
        if posixpath.normpath(posixpath.join(here, e.link)).startswith(".."):
            raise SystemExit("symlink escapes root: %s -> %s" % (p, e.link))
    for e in entries.values():
        if e.kind == "dir":
            e.mode = (e.mode & 0o1777) | 0o700
        elif e.kind == "file":
            e.mode = (e.mode & 0o777) | 0o600

    # 7. Write the tar (GNU format, sorted, root-owned, fixed mtime) through the compressor
    def sort_key(p):
        return p.split("/")

    out_tmp = args.out + ".tmp"
    if args.compress == "xz":
        comp = subprocess.Popen(["xz", "-T%d" % args.threads, "-%s" % args.xz_preset, "-c"],
                                stdin=subprocess.PIPE, stdout=open(out_tmp, "wb"))
        sink = comp.stdin
    else:
        comp = None
        raw = open(out_tmp, "wb")
        sink = gzip.GzipFile(filename="", mode="wb", fileobj=raw, compresslevel=args.gzip_level, mtime=0)
    hw = HashingWriter(sink)
    counts = {"dir": 0, "file": 0, "symlink": 0}
    file_bytes = 0
    with tarfile.open(fileobj=hw, mode="w|", format=tarfile.GNU_FORMAT) as tar:
        for p in sorted(entries, key=sort_key):
            e = entries[p]
            ti = tarfile.TarInfo(p)
            ti.uid = ti.gid = 0
            ti.uname = ti.gname = "root"
            ti.mtime = args.epoch
            ti.mode = e.mode
            counts[e.kind] += 1
            if e.kind == "dir":
                ti.type = tarfile.DIRTYPE
                tar.addfile(ti)
            elif e.kind == "symlink":
                ti.type = tarfile.SYMTYPE
                ti.linkname = e.link
                tar.addfile(ti)
            else:
                data = e.read()
                ti.size = len(data)
                file_bytes += len(data)
                tar.addfile(ti, io.BytesIO(data))
    if comp is not None:
        comp.stdin.close()
        if comp.wait() != 0:
            raise SystemExit("xz failed")
    else:
        sink.close()
        raw.close()
    os.replace(out_tmp, args.out)

    with open(args.out, "rb") as f:
        archive_sha = hashlib.file_digest(f, "sha256").hexdigest() if hasattr(hashlib, "file_digest") \
            else hashlib.sha256(f.read()).hexdigest()
    report.update({
        "archive": os.path.basename(args.out),
        "archiveBytes": os.path.getsize(args.out),
        "archiveSha256": archive_sha,
        "tarBytes": hw.n,
        "tarSha256": hw.h.hexdigest(),
        "uncompressedBytes": file_bytes,
        "counts": counts,
        "origins": {o: sum(1 for e in entries.values() if e.origin == o)
                    for o in ("ubuntu", "deb", "python", "node", "dsh", "pnpm", "bridge", "overlay", "implicit")},
    })
    report["droppedBytes"] = sum(report["dropped"].values())
    with open(args.report, "w") as f:
        json.dump(report, f, indent=2, sort_keys=True)
        f.write("\n")
    print("rootfs %s: %d files, %d dirs, %d symlinks, %.1f MiB unpacked, %.1f MiB archive" % (
        args.out, counts["file"], counts["dir"], counts["symlink"], file_bytes / 2**20,
        report["archiveBytes"] / 2**20))
    if report["warnings"]:
        print("warnings: %d (see %s)" % (len(report["warnings"]), args.report))


# ---------------------------------------------------------------------------
# manifest
# ---------------------------------------------------------------------------
def launch_template():
    """The proot invocation the app runs (placeholders expanded by DshProcess.kt)."""
    guest_env = [
        "HOME=/root", "USER=root", "LOGNAME=root", "SHELL=/bin/bash",
        "PATH=/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin",
        "LANG=C.UTF-8", "TERM=xterm-256color", "TMPDIR=/tmp",
        "DSH_HOME=/root/.dsh",
        # pnpm 11 reads its registry from here (not from any npmrc outside $HOME); see DSH_WEB_PATCH
        "pnpm_config_registry=" + NPMMIRROR,
        "UV_USE_IO_URING=0",
        "NARB_DISABLE_NATIVE_CACHE=1",
        "NODE_OPTIONS=--dns-result-order=ipv4first",
    ]
    argv = [
        "{NATIVE_LIB_DIR}/libproot.so",
        "--kill-on-exit", "--link2symlink", "--sysvipc", "-L", "-0",
        "--rootfs={ROOTFS}", "--cwd=/root",
        "-b", "/dev",
        "-b", "/dev/urandom:/dev/random",
        "-b", "/proc",
        "-b", "/proc/self/fd:/dev/fd",
        "-b", "/proc/self/fd/0:/dev/stdin",
        "-b", "/proc/self/fd/1:/dev/stdout",
        "-b", "/proc/self/fd/2:/dev/stderr",
        "-b", "/sys",
        "-b", "{ROOTFS}/var/lib/dsh-app/empty:/sys/fs/selinux",
        "-b", "{ROOTFS}/var/lib/dsh-app/shm:/dev/shm",
        "-b", "/system",
        "-b", "/apex",
        "/usr/bin/env", "-i",
    ] + guest_env + [
        "{GUEST_ENV}",
        "/bin/sh", "-c",
        "echo $$ > /tmp/dsh-web.pid; exec /usr/local/bin/dsh web --patch " + DSH_WEB_PATCH
        + " --host 127.0.0.1 --port {PORT} --no-open",
    ]
    env = {
        "PROOT_LOADER": "{NATIVE_LIB_DIR}/libproot-loader.so",
        "PROOT_TMP_DIR": "{TMP}",
        "PROOT_L2S_DIR": "{ROOTFS}/root/.l2s",
        "LD_LIBRARY_PATH": "{NATIVE_LIB_DIR}",
    }
    return {
        "argv": argv,
        "env": env,
        "placeholders": {
            "{NATIVE_LIB_DIR}": "applicationInfo.nativeLibraryDir (libs must be extracted: useLegacyPackaging=true)",
            "{ROOTFS}": "filesDir/runtime/rootfs",
            "{TMP}": "app-private writable dir for PROOT_TMP_DIR (e.g. cacheDir/proot-tmp)",
            "{FILES_DIR}": "context.filesDir (unused by this template)",
            "{PORT}": "loopback port chosen by the app",
            "{GUEST_ENV}": "standalone element -> zero or more KEY=VALUE from the app "
                           "(DEEPSEEK_API_KEY, TZ, ...); later assignments override the fixed ones",
        },
        "tokenLine": {
            "stream": "stdout",
            "regex": "^dsh web: (http://127\\.0\\.0\\.1:[0-9]+/)\\?token=([A-Za-z0-9_-]+)",
            "example": "dsh web: http://127.0.0.1:3080/?token=<43 base64url chars>",
            "note": "printed once, after every plugin has loaded; the server is listening by then",
        },
        "auth": {
            "exchange": "GET /?token=<token> -> 303 Location ./ + Set-Cookie dsh-auth-<id>=v1.<...>; "
                        "Path=/; HttpOnly; SameSite=Strict",
            "webview": "either load the token URL directly, or exchange it natively and "
                       "CookieManager.setCookie(baseUrl, cookie + '; Path=/; HttpOnly; SameSite=Strict')",
        },
        "health": {
            "tcp": "127.0.0.1:{PORT} accepts",
            "http": "GET / without cookie -> 401 (server up, unauthenticated); with the dsh-auth cookie -> 200",
        },
        "stop": {
            "pidFile": "{ROOTFS}/tmp/dsh-web.pid",
            "graceful": "Os.kill(pid from pidFile, SIGTERM): dsh disposes plugins and exits 0; "
                        "--kill-on-exit then reaps the rest and proot exits",
            "fallback": "Os.kill(prootPid, SIGQUIT) kills every tracee; proot IGNORES SIGTERM/SIGINT/SIGHUP, "
                        "so Process.destroy() alone does nothing and destroyForcibly() orphans node",
        },
        "files": {
            "resolvConf": "{ROOTFS}/etc/resolv.conf",
            "dshHome": "{ROOTFS}/root/.dsh",
            "credentials": "{ROOTFS}/root/.dsh/.credentials.yaml (mode 0600; 'version: 1' + 'refs: {DEEPSEEK_API_KEY: ...}')",
            "l2sDir": "{ROOTFS}/root/.l2s (must exist; created by the archive)",
        },
    }


def cmd_manifest(args):
    report = json.load(open(args.report))
    jni = json.load(open(args.jnilibs))
    v = json.loads(args.versions)
    m = {
        "schema": 1,
        "runtimeVersion": v["runtimeVersion"],
        "abi": args.abi,
        "rootfs": report["archive"],
        "rootfsFormat": "tar.xz" if report["archive"].endswith(".xz") else "tar.gz",
        "rootfsSha256": report["archiveSha256"],
        "rootfsBytes": report["archiveBytes"],
        "tarBytes": report["tarBytes"],
        "tarSha256": report["tarSha256"],
        "uncompressedBytes": report["uncompressedBytes"],
        "entries": report["counts"],
        "archiveNotes": "GNU tar; names relative (no ./); only dirs, regular files and symlinks; "
                        "hard links already converted to copies; every symlink is relative and stays "
                        "inside the rootfs; no member lies under a symlink; setuid/setgid cleared; "
                        "uid/gid 0; sorted parent-before-child",
        "dshVersion": v["dshVersion"],
        "nodeVersion": v["nodeVersion"],
        "pnpmVersion": v["pnpmVersion"],
        "ubuntuVersion": v["ubuntuVersion"],
        "prootVersion": v["prootVersion"],
        "dshPatches": v.get("dshPatches", []),
        "dshGoBridge": {"version": v["dshGoBridge"], "path": DSH_GO_BRIDGE} if v.get("dshGoBridge") else None,
        "tallocVersion": v["tallocVersion"],
        "androidShmemVersion": v["androidShmemVersion"],
        "npmRegistry": "https://registry.npmmirror.com",
        "pnpmRegistry": NPMMIRROR,
        "pluginRegistries": {
            "order": [NPMMIRROR, NPMJS],
            "note": "pluginManager asks pnpm's own registry (pnpm_config_registry in launch.argv) and then "
                    "the fallbackRegistries set by " + DSH_WEB_PATCH + " (passed with --patch)",
        },
        "nativeMinSdk": 24,
        "jniLibs": jni,
        "directEngine": {
            "schema": 2,
            "defaultEnabled": False,
            "preload": "/opt/dsh-go/direct/preload.mjs",
            "loader": "/usr/lib/" + ("x86_64-linux-gnu/ld-linux-x86-64.so.2" if args.abi == "x86_64" else "aarch64-linux-gnu/ld-linux-aarch64.so.1"),
            "paths": "typed guest/physical path seams; same-path PRoot alias only for direct or a prior direct preparation",
            "safeMode": "proot",
            "tls": "Node bundled CA defaults; explicit extra CA environment retained",
            "pnpmPackageImportMethod": "copy",
            "moduleIdentity": "uncached physical identity at load; source and pinned bundled native addons use verified descriptors",
            "nativeAddonInventory": "/opt/dsh-go/direct/native-addons.json",
            "compatibilityGate": "nonempty or unreadable PRoot hard-link backing store selects proot; late L2S targets are refused without data migration",
        },
        "launch": launch_template(),
        "build": v.get("build", {}),
    }
    with open(args.out, "w") as f:
        json.dump(m, f, indent=2)
        f.write("\n")
    print("wrote " + args.out)


def main():
    ap = argparse.ArgumentParser()
    sub = ap.add_subparsers(dest="cmd", required=True)

    p = sub.add_parser("deb-extract")
    p.add_argument("deb")
    p.add_argument("outdir")
    p.set_defaults(fn=cmd_deb_extract)

    p = sub.add_parser("patch-dynstr")
    p.add_argument("file")
    p.add_argument("old")
    p.add_argument("new")
    p.set_defaults(fn=cmd_patch_dynstr)

    p = sub.add_parser("patch-dsh")
    p.add_argument("--prefix", required=True, help="npm --prefix tree holding node_modules/@deepseek-ai/...")
    p.add_argument("--dsh-version", required=True)
    p.add_argument("--patches", default=os.path.join(os.path.dirname(os.path.abspath(__file__)), "..", "patches"))
    p.add_argument("--record", action="store_true", help="write the observed hashes as this version's pins")
    p.add_argument("--out", help="write the applied patch names (JSON list) here")
    p.set_defaults(fn=cmd_patch_dsh)

    p = sub.add_parser("resolve-debs")
    p.add_argument("--base", required=True)
    p.add_argument("--arch", required=True)
    p.add_argument("--packages", action="append", required=True)
    p.add_argument("--want", nargs="+", required=True)
    p.add_argument("--out", required=True)
    p.set_defaults(fn=cmd_resolve_debs)

    p = sub.add_parser("hoist-candidates")
    p.add_argument("lock")
    p.add_argument("--min-copies", type=int, default=3)
    p.set_defaults(fn=cmd_hoist_candidates)

    p = sub.add_parser("elf-info")
    p.add_argument("files", nargs="+")
    p.set_defaults(fn=cmd_elf_info)

    p = sub.add_parser("assemble")
    p.add_argument("--abi", required=True, choices=sorted(ABI))
    p.add_argument("--base", required=True)
    p.add_argument("--node", required=True)
    p.add_argument("--dsh-prefix", required=True)
    p.add_argument("--pnpm-prefix", help="npm --prefix tree holding node_modules/pnpm -> /usr/local/lib/node_modules/pnpm")
    p.add_argument("--out", required=True)
    p.add_argument("--report", required=True)
    p.add_argument("--runtime-info", required=True)
    p.add_argument("--compress", choices=("xz", "gz"), default="xz")
    p.add_argument("--xz-preset", default="6")
    p.add_argument("--gzip-level", type=int, default=9)
    p.add_argument("--threads", type=int, default=0)
    p.add_argument("--epoch", type=int, default=1767225600)
    p.add_argument("--prune-dev-metadata", action="store_true")
    p.add_argument("--deb", action="append", help="extra .deb to unpack and register (no maintainer scripts)")
    p.add_argument("--python", help="python-build-standalone install_only tarball -> /opt/python")
    p.add_argument("--bridge", help="dsh-go-bridge package dir -> " + DSH_GO_BRIDGE + " (+ overlay row)")
    p.set_defaults(fn=cmd_assemble)

    p = sub.add_parser("manifest")
    p.add_argument("--abi", required=True)
    p.add_argument("--report", required=True)
    p.add_argument("--jnilibs", required=True)
    p.add_argument("--versions", required=True)
    p.add_argument("--out", required=True)
    p.set_defaults(fn=cmd_manifest)

    args = ap.parse_args()
    args.fn(args)


if __name__ == "__main__":
    main()
