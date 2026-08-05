#!/usr/bin/env python3
"""Tự sinh SKILLS.md — catalog mọi skill từ frontmatter SKILL.md."""
import os, re

ROOT = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))
SK = os.path.join(ROOT, "omegason-dropship", "skills")

def frontmatter(path):
    txt = open(path, encoding="utf-8").read()
    m = re.match(r"^---\n(.*?)\n---", txt, re.S)
    if not m: return {}
    d, key = {}, None
    for line in m.group(1).splitlines():
        mk = re.match(r"^(\w[\w-]*):\s*(.*)$", line)
        if mk:
            key = mk.group(1); d[key] = mk.group(2).strip().strip('>|').strip()
        elif key and line.strip():
            d[key] = (d[key] + " " + line.strip()).strip()
    return d

rows = []
for s in sorted(os.listdir(SK)):
    p = os.path.join(SK, s, "SKILL.md")
    if not os.path.isfile(p): continue
    fm = frontmatter(p)
    desc = (fm.get("description","") or "").replace("|"," ").strip()
    if len(desc) > 160: desc = desc[:157] + "..."
    rows.append((s, desc))

out = ["# Catalog Skill\n",
       f"> Tự sinh bởi `scripts/generate_catalog.py`. Tổng: **{len(rows)} skill**. Đừng sửa tay.\n",
       "| Skill | Mô tả |", "|---|---|"]
for name, desc in rows:
    out.append(f"| `{name}` | {desc} |")
open(os.path.join(ROOT, "SKILLS.md"), "w", encoding="utf-8").write("\n".join(out) + "\n")
print(f"Đã sinh SKILLS.md với {len(rows)} skill.")
