#!/usr/bin/env python3
"""Kiểm tra tính hợp lệ của plugin & toàn bộ skill.
Chạy: python3 scripts/validate_plugin.py
Trả exit code != 0 nếu có lỗi (dùng cho CI)."""
import json, os, re, sys

ROOT = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))
errors, warnings = [], []

def check_json(path):
    try:
        with open(path, encoding="utf-8") as f:
            return json.load(f)
    except Exception as e:
        errors.append(f"JSON lỗi: {path}: {e}")
        return None

# 1. marketplace.json
mp = check_json(os.path.join(ROOT, ".claude-plugin", "marketplace.json"))
if mp is not None:
    if "name" not in mp: errors.append("marketplace.json thiếu 'name'")
    for p in mp.get("plugins", []):
        src = os.path.join(ROOT, p.get("source", "").lstrip("./"))
        if not os.path.isdir(src):
            errors.append(f"marketplace.json trỏ tới plugin không tồn tại: {p.get('source')}")

# 2. mỗi plugin
for p in (mp or {}).get("plugins", []):
    pdir = os.path.join(ROOT, p.get("source", "").lstrip("./"))
    pj = check_json(os.path.join(pdir, ".claude-plugin", "plugin.json"))
    if pj is not None:
        for k in ("name", "version", "description"):
            if k not in pj: errors.append(f"{p['source']}/plugin.json thiếu '{k}'")

    # 3. skills
    skdir = os.path.join(pdir, "skills")
    if os.path.isdir(skdir):
        for s in sorted(os.listdir(skdir)):
            sp = os.path.join(skdir, s)
            if not os.path.isdir(sp): continue
            skill_md = os.path.join(sp, "SKILL.md")
            if not os.path.isfile(skill_md):
                errors.append(f"skill '{s}' thiếu SKILL.md"); continue
            txt = open(skill_md, encoding="utf-8").read()
            m = re.match(r"^---\n(.*?)\n---", txt, re.S)
            if not m:
                warnings.append(f"skill '{s}' không có YAML frontmatter")
            else:
                fm = m.group(1)
                if "name:" not in fm: warnings.append(f"skill '{s}' frontmatter thiếu 'name'")
                if "description:" not in fm: warnings.append(f"skill '{s}' frontmatter thiếu 'description'")

# 4. quét credential lọt vào repo
SECRET = re.compile(r"(ghp_[A-Za-z0-9]{20,}|sk-[A-Za-z0-9]{20,}|xox[baprs]-[A-Za-z0-9-]{10,})")
for dp, dn, fn in os.walk(ROOT):
    if "/.git" in dp: continue
    for f in fn:
        if f.endswith((".png",".jpg",".jpeg",".gif",".zip",".woff",".woff2",".ttf")): continue
        fp = os.path.join(dp, f)
        try: c = open(fp, encoding="utf-8", errors="ignore").read()
        except: continue
        if SECRET.search(c):
            errors.append(f"NGHI CÓ CREDENTIAL trong: {os.path.relpath(fp, ROOT)}")

print(f"Đã kiểm tra. Lỗi: {len(errors)} · Cảnh báo: {len(warnings)}")
for w in warnings: print("  ⚠ ", w)
for e in errors: print("  ✗ ", e)
if errors: sys.exit(1)
print("✓ Plugin hợp lệ.")
