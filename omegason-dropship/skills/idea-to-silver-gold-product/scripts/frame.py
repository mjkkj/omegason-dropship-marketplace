#!/usr/bin/env python3
"""Deterministic framing for product mockups on white.

  frame.py fix IN.png OUT.png [--area 0.30] [--size 2048]
      Pure #FFFFFF background, square canvas, product bbox centered on both axes,
      bbox width x height = AREA x canvas area. Prints a JSON report.
  frame.py check A.png [B.png ...]
      Report bbox %, area %, center offset and white-background share per image;
      with 2+ images also the bbox size difference between them (gold/silver match).

The bounding box is the whole product (every non-white pixel), not the metal pixel count.
Requires Pillow + numpy.
"""
import argparse
import json
import sys

import numpy as np
from PIL import Image

SUBJECT_T = 240   # a pixel with any channel below this belongs to the product
WHITE_T = 246     # a pixel with every channel at/above this becomes pure #FFFFFF
MIN_HITS = 3      # rows/cols with fewer product pixels are treated as noise


def load(path):
    return np.asarray(Image.open(path).convert("RGB"))


def bbox(a):
    border = np.concatenate([a[0], a[-1], a[:, 0], a[:, -1]])
    if np.median(border.min(1)) < SUBJECT_T:
        sys.exit("background is not white (border median below %d) - regenerate with a pure white background" % SUBJECT_T)
    m = (a < SUBJECT_T).any(2)
    rows = np.where(m.sum(1) >= MIN_HITS)[0]
    cols = np.where(m.sum(0) >= MIN_HITS)[0]
    if not len(rows) or not len(cols):
        sys.exit("no product found: image is blank or the product is near-white")
    return cols[0], rows[0], cols[-1] + 1, rows[-1] + 1  # x0, y0, x1, y1 (exclusive)


def report(a):
    h, w, _ = a.shape
    x0, y0, x1, y1 = bbox(a)
    bw, bh = x1 - x0, y1 - y0
    return {
        "size": [w, h],
        "bbox": [int(x0), int(y0), int(x1), int(y1)],
        "bbox_w_pct": round(100 * bw / w, 1),
        "bbox_h_pct": round(100 * bh / h, 1),
        "area_pct": round(100 * bw * bh / (w * h), 1),
        "center_offset_px": [round((x0 + x1) / 2 - w / 2, 1), round((y0 + y1) / 2 - h / 2, 1)],
        "touches_edge": bool(x0 == 0 or y0 == 0 or x1 == w or y1 == h),
        "pure_white_bg_pct": round(100 * float((a == 255).all(2).mean()), 1),
    }


def fix(src, dst, area, size):
    a = load(src).copy()
    if report(a)["touches_edge"]:
        print("warning: product touches the image edge - it may be cropped in the source", file=sys.stderr)
    a[(a >= WHITE_T).all(2)] = 255
    x0, y0, x1, y1 = bbox(a)
    crop = Image.fromarray(a[y0:y1, x0:x1])
    bw, bh = crop.size
    k = (area * size * size / (bw * bh)) ** 0.5
    k = min(k, 0.92 * size / max(bw, bh))  # never let a very long product touch the edges
    nw, nh = max(1, round(bw * k)), max(1, round(bh * k))
    if k > 1.6:
        print(f"warning: upscaling product x{k:.2f} - source detail may look soft", file=sys.stderr)
    crop = crop.resize((nw, nh), Image.LANCZOS)
    canvas = Image.new("RGB", (size, size), (255, 255, 255))
    canvas.paste(crop, ((size - nw) // 2, (size - nh) // 2))
    out = np.asarray(canvas).copy()
    out[(out >= WHITE_T).all(2)] = 255  # resampling can leave off-white halos
    Image.fromarray(out).save(dst, optimize=True)
    return report(out)


def main():
    p = argparse.ArgumentParser(description=__doc__, formatter_class=argparse.RawDescriptionHelpFormatter)
    sub = p.add_subparsers(dest="cmd", required=True)
    f = sub.add_parser("fix")
    f.add_argument("src")
    f.add_argument("dst")
    f.add_argument("--area", type=float, default=0.30)
    f.add_argument("--size", type=int, default=2048)
    c = sub.add_parser("check")
    c.add_argument("files", nargs="+")
    args = p.parse_args()

    if args.cmd == "fix":
        print(json.dumps(fix(args.src, args.dst, args.area, args.size), indent=1))
        return
    reps = {path: report(load(path)) for path in args.files}
    if len(reps) > 1:
        dims = [(r["bbox_w_pct"], r["bbox_h_pct"]) for r in reps.values()]
        reps["pair_bbox_diff_pct"] = [round(max(d[0] for d in dims) - min(d[0] for d in dims), 1),
                                      round(max(d[1] for d in dims) - min(d[1] for d in dims), 1)]
    print(json.dumps(reps, indent=1))


if __name__ == "__main__":
    main()
