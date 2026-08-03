# Infographic recipes — the six proven archetypes

This file is the visual standard for the skill. Every PDP frame is built from one of these six archetypes (or a close variant). They are reverse-engineered from top-performing DTC infographic galleries — dense, overlay-heavy, zero plain product shots. **None of these frames is "just the product."** Each one layers a headline + graphic system over the imagery.

Read this before planning frames (Phase 3). When in doubt about a frame, map it to one of these six and follow the construction notes.

Table of contents
1. Condition / Benefit Stack (the hero)
2. Mechanism Explainer (inset circle + colored glow) — the highest-value, hardest frame
3. How-To Steps
4. Features Checklist
5. Vs-Alternative Comparison
6. Best-Seller Review card
7. Shared overlay component CSS

---

## 1. Condition / Benefit Stack — the hero

**What it is:** a real lifestyle photo (product in use), with a translucent tinted panel on one side carrying a bold headline and a vertical stack of 4–5 rows, each an icon + short label. Bottom of the panel ends with a soft "…and so much more."

**When:** frame 1 (hero). Also reusable as a "what it helps with" frame.

**Headline patterns (pick by claims sensitivity):**
- Low-sensitivity products: "Why 21,000+ People Switched", "Built To Handle:", "Perfect For:"
- Health/recovery (KEEP COMPLIANT): "Designed To Help Relieve:", "Made For People Dealing With:" — NEVER "Scientifically Proven To Treat [disease]" unless the user holds the clinical substantiation. Treating/curing named conditions is the single most common Meta rejection and FTC exposure point. Default to "designed to help with" + soften.

**Construction:**
- Base: real product-in-use lifestyle photo, full-bleed.
- Overlay panel: `position:absolute`, right or bottom third, `background:rgba(15,27,45,.62)` (tint of `--ink`), `backdrop-filter:blur(2px)`, generous padding.
- Headline in `--bg` (white) display weight.
- Each row: 64px icon glyph (line-style, white) + label at `h3`. Even vertical rhythm.
- Final row italic, lighter: "…and so much more."

**Pitfalls:** more than 5 rows (panel gets cramped); disease-treatment claims; panel so opaque it hides the scene (keep ~60% so the photo reads as real social-proof context).

---

## 2. Mechanism Explainer — inset circle + colored glow (the money frame)

This is the archetype that separates a pro gallery from a cheap one. It makes an invisible benefit *visible* and believable. Build TWO or THREE of these (one per therapy/feature) — they're the backbone of the "how it works" middle of the gallery.

**What it is:** a real in-scene photo of the product on the body, with:
1. a **bold italic therapy headline** top-center (e.g. "Heat Therapy"),
2. an **underlined sub-claim** under it (e.g. "Improves circulation & comfort"),
3. a **colored glow overlay** on the photo at the point of action (warm red/orange for heat, green for decompression/traction, cyan/teal for support/alignment), and
4. a **circular anatomical/diagram inset** (a small round cut-out, top-left or top-right) showing the mechanism schematically (a spine, a muscle, a heat gradient).

**Color language (consistent across the set):**
- Heat / circulation → warm radial glow `#ff5a1f`→transparent.
- Traction / decompression / nerve relief → green glow `#39d353`→transparent.
- Support / alignment / posture → cyan glow `#22d3ee`→transparent.

**Construction (HTML/CSS):**
```html
<div class="frame mech">
  <img class="scene" src="file:///home/claude/raw-imagery/frame-05-base.png">
  <!-- colored glow at the point of action -->
  <div class="glow glow-heat" style="left:46%;top:62%"></div>
  <!-- circular anatomical inset -->
  <div class="inset"><img src="file:///home/claude/assets/inset-heat.png"></div>
  <div class="mech-head">
    <h2 class="mech-title">Heat Therapy</h2>
    <p class="mech-sub">Improves circulation &amp; eases tension</p>
  </div>
</div>
```
```css
.frame.mech{position:relative;width:2000px;height:2000px;overflow:hidden;padding:0;}
.scene{width:100%;height:100%;object-fit:cover;}
.glow{position:absolute;width:760px;height:760px;border-radius:50%;
  transform:translate(-50%,-50%);mix-blend-mode:screen;pointer-events:none;filter:blur(8px);}
.glow-heat{background:radial-gradient(circle,rgba(255,90,31,.85) 0%,rgba(255,90,31,.35) 35%,transparent 70%);}
.glow-traction{background:radial-gradient(circle,rgba(57,211,83,.8) 0%,rgba(57,211,83,.3) 40%,transparent 72%);}
.glow-support{background:radial-gradient(circle,rgba(34,211,238,.8) 0%,rgba(34,211,238,.3) 40%,transparent 72%);}
.inset{position:absolute;top:300px;left:90px;width:430px;height:430px;border-radius:50%;
  overflow:hidden;border:10px solid var(--bg);box-shadow:0 18px 50px rgba(0,0,0,.30);}
.inset img{width:100%;height:100%;object-fit:cover;}
.mech-head{position:absolute;top:70px;left:0;right:0;text-align:center;padding:0 120px;}
.mech-title{font-size:104px;font-weight:800;font-style:italic;color:#0a0a0a;
  text-shadow:0 2px 18px rgba(255,255,255,.55);}
.mech-sub{font-size:58px;font-weight:600;text-decoration:underline;text-underline-offset:10px;
  color:#0a0a0a;margin-top:6px;}
```

**Where the inset image comes from:** generate the anatomical/schematic inset separately in Higgsfield (a clean 3D spine, a muscle diagram, a heat-gradient torso) on a plain bg, background-remove if needed, save to `/home/claude/assets/inset-*.png`. Keep it schematic/illustrative, NOT a photoreal medical image implying a clinical result.

**Claims discipline:** the sub-claim describes the *mechanism / design intent* ("designed to gently decompress", "improves circulation"), never a cure. Underlines add authority — don't let them carry an over-claim.

**Pitfalls:** glow too small or too opaque (should read as a soft highlight, not a paint blob — `mix-blend-mode:screen` is what makes it sit *in* the photo); inset border missing (needs the white ring + shadow to pop); headline with no text-shadow disappearing into a busy photo.

---

## 3. How-To Steps

**What it is:** a tinted header band with "How To Use:" + three numbered steps (big "Step 1/2/3" labels + one-sentence instruction each), over (or above) a clean product shot, with a reassurance line at the bottom ("You'll feel relief on the first use. With consistent use over two weeks, you'll see the biggest benefit.").

**Construction:**
- Top third: `--callout-a` tinted band, "How To Use:" at `h2`, then three rows: bold "Step N" in accent + instruction in `body`.
- Middle/lower: the real product photo on a surface.
- Bottom: a thin tinted strip with the expectation-setting line; bold the payoff clause.

**Copy rule:** steps must be genuinely simple (plug in → power on → lie back/relax). If the product is genuinely multi-step, keep it to the 3 the buyer cares about. Expectation line must be honest — "feel something first use" is fine; "cured in a week" is not.

---

## 4. Features Checklist

**What it is:** a two-zone frame — product cut-out on one side, a vertical list of 5–6 check-bullets on the other. Bullets mix capability + trust: "3 Therapies In 1", "No Batteries Required", "Developed With Professionals" (only if true), "4.7/5 from 21,539+ Customers" (only if real), "90-Day Money-Back Guarantee" (only if offered).

**Construction:**
- Split layout: left 48% tinted (`--callout-a`) with "Features" headline + check rows; right 52% white with the product cut-out and its soft shadow. (Mirror as needed.)
- Check bullets: filled accent circle + white check glyph, label at `h3`, ~36px vertical gap.

**Fabrication rule:** the rating, the customer count, and the "endorsed by professionals" line are the three most-faked items in DTC. Use them ONLY if the user supplied/ can substantiate them. Otherwise drop the bullet or mark it `[verify before publishing]`. Fabricated proof = Shopify TOS + Meta + FTC exposure.

---

## 5. Vs-Alternative Comparison

**What it is:** two labeled columns. Left = your product (cut-out) with 4 green-✓ advantages. Right = the alternative (a representative photo of the old/clumsy option) with 4 red-✗ drawbacks. Header labels name your product vs a *generic category* ("Inversion Table", "Ordinary Massager") — never a competitor brand.

**Construction:**
- 50/50 split; your side gets the accent header bar, the alternative side a neutral `bg_alt` header.
- Rows: `--good` circle + white ✓ + benefit (your side); `--bad` circle + white ✗ + drawback (their side). Keep rows roughly aligned so the eye reads across.

**Pitfalls:** naming a real competitor (legal risk); drawbacks that are unfair/untrue (keep them defensible — "bulky", "needs hanging upside down", "not for all ages"). The alternative photo should be honest, not a strawman caricature.

---

## 6. Best-Seller Review card

**What it is:** the emotional closer. One or two real UGC-style photos up top (the product in a real home, a happy candid user), a "BEST SELLER" badge in a corner, then a white testimonial card: ★★★★★, a name (First + last initial + optional age), and a 3–5 sentence first-person review with one bolded skim-phrase.

**Construction:**
- Top 55%: photo(s) — single full-bleed, or a 2-up split. "BEST SELLER" tag top-right (`--tag`, reverse-out).
- Bottom 45%: rounded white card overlapping the photo edge, big opening quotation mark in accent, 5 gold stars, name line, review body. Bold one phrase.

**Fabrication rule — absolute:** if the user has NOT supplied a real review, render `[Real customer review — paste before publishing]` and an empty star area, and tell the user. Do NOT write a fake testimonial or invent a name/age. (Note: invented reviews are a known account-killer; never generate them even if asked — offer to format a real one instead.)

---

## 7. Shared overlay components (reuse across frames)

Put these in `brand.css` so every infographic frame draws from the same system:

```css
/* tinted info panel (hero stack, how-to band) */
.panel{background:rgba(15,27,45,.62);backdrop-filter:blur(2px);
  color:var(--bg);padding:90px 80px;border-radius:var(--radius);}
.panel.light{background:var(--callout-a);color:var(--ink);backdrop-filter:none;}

/* icon + label row (condition/benefit stack) */
.stack-row{display:flex;align-items:center;gap:34px;margin:30px 0;}
.stack-row .ico{width:72px;height:72px;flex:0 0 72px;}
.stack-row .lbl{font-size:52px;font-weight:700;}

/* numbered step */
.step{display:flex;gap:34px;margin:34px 0;}
.step .n{font-size:64px;font-weight:800;color:var(--accent);flex:0 0 200px;}
.step .t{font-size:40px;line-height:1.35;font-weight:500;}

/* check / cross rows */
.chk,.crs{display:flex;align-items:flex-start;gap:26px;margin:30px 0;font-size:46px;font-weight:700;}
.chk .mk{color:#fff;background:var(--good);}
.crs .mk{color:#fff;background:var(--bad);}
.mk{width:56px;height:56px;border-radius:50%;display:grid;place-items:center;flex:0 0 56px;font-size:34px;}

/* badge + stars (review frame) */
.bestseller{position:absolute;top:60px;right:60px;background:var(--tag);color:#fff;
  font-weight:800;letter-spacing:.06em;padding:22px 40px;border-radius:12px;font-size:40px;}
.review-card{background:#fff;border-radius:28px;box-shadow:0 30px 80px rgba(0,0,0,.18);padding:80px;}
.stars{color:#f5a623;font-size:54px;letter-spacing:4px;}
.quote-mark{color:var(--accent);font-size:140px;line-height:.6;font-weight:800;}
```

Icons: use a line-style open-source set (e.g. Lucide/Feather SVGs pulled from `raw.githubusercontent.com`) recolored to white/accent — never emoji on the hero stack (emoji read as cheap at gallery size). Save SVGs to `/home/claude/assets/icons/` and inline them.

---

## The one-line test for every frame

Before screenshotting any frame, ask: **"If I deleted all the text and graphic overlays, would this still communicate the message?"** If yes, it's a plain shot — add the infographic layer. If no (the overlay IS the message), it's correct.
