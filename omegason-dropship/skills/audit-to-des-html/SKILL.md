---
name: audit-to-des-html
description: End-to-end workflow that audits a product page (PDP) and produces a drop-in editorial HTML description block ready to paste into the Shopify product description (body_html). Use when the user asks to "audit a PDP and write description", "redesign product description", "rewrite product description as HTML for Shopify", "audit + ship description HTML", "create editorial PDP description", or provides a product URL and asks for new description code. Combines conversion-focused audit, asset extraction, editorial copy, and self-contained mobile-first HTML rendering. Outputs are scoped and theme-safe so they paste into Shopify product description WYSIWYG without breaking site CSS.
---

# Audit-to-Description-HTML

Turn one product URL into: (1) a conversion audit, (2) editorial copy that fixes the weakest parts, (3) a drop-in HTML description block ready for Shopify `body_html`.

## When to use

- User shares a product URL and asks to redesign/rewrite the description
- User asks for an "audit + description" combo
- User asks for HTML description code ready to paste into Shopify

## Inputs required

- Product URL (or homepage if PDP not specified — then ask which PDP)
- Traffic lens: **Cold** or **Warm** (ask if not stated)
- Optional: brand voice notes, palette overrides, must-keep claims

## Outputs

1. Scored audit (rubric 100) saved under `audits/YYYY-MM-DD_<brand>_<slug>.md`
2. Editorial HTML block saved under `deliverables/<brand>_<slug>_description.html`
3. Asset extractions promoted into `patterns/`, `copy-swipe/`, `benchmarks/` per the PDP Reviewer asset system
4. Browser preview (mobile + desktop screenshots) before handoff

## Workflow

Follow these phases in order. Do not skip Phase 1 — audit drives the HTML.

### Phase 1 — Audit the PDP

Use the rubric in `references/rubric.md`. Open the URL in the browser tool, snapshot DOM, capture pricing, reviews, trust, gallery count, mobile feel.

Look explicitly for:
- Pricing/badge math errors (sale higher than regular, "SAVE 0%")
- Cross-product review pollution (Judge.me/Loox feeds showing other SKUs)
- Bundle/set without "What's in the box" on fold
- Privacy gaps (intimate/personal niches need billing-name + packaging block)
- Banner marquee looped excessively → looks like broken code
- Description as prose without bullets / spec table

Score → write the audit file using `references/audit-template.md`.

Determine **3 weakest sections** that the new HTML must directly fix.

### Phase 2 — Extract visual DNA

Before writing copy, capture the brand's existing visual language so the new block doesn't look pasted in:

- Hero/feature image URLs (use browser eval to list `img` srcs inside `[class*=gallery]` / `[class*=product-media]`)
- Dominant palette (eyeball: dark, neutral, color accents)
- Type feel (serif/sans, italic accents)
- Tone words (luxury, playful, clinical, boudoir…)

Save raw extracted image URLs in the audit file under "Asset extraction → visuals" so future audits can reuse the trick.

If image analysis is blocked by content policy (e.g., intimates/adult niches), proceed using image URLs as-is — do **not** attempt to re-describe imagery; just embed by URL.

### Phase 3 — Write the editorial HTML

Use `assets/templates/editorial-pdp-description.html` as the base. It is a complete, scoped, mobile-first template with 11 sections.

Adapt by:

1. **Palette tokens** — replace the 8 CSS custom properties at the top to match the brand's existing visual DNA. See `references/palette-recipes.md` for proven palettes by niche.
2. **Copy slots** — fill all `{{PLACEHOLDERS}}` per `references/copy-slots.md`. Every slot has a written rule for what good copy looks like.
3. **Image slots** — paste real product image URLs into 3 spots: hero, inside-feature, split-panel. Use the URLs captured in Phase 2.
4. **Pieces grid** — adapt to actual bundle composition. If product is single-item not a set, replace the "What's inside" grid with a "Why this piece" grid (3 cards instead of 5–6).
5. **FAQ** — write 6 questions that resolve real objections from the audit's "Friction / blockers" list. Do not invent generic FAQs.

### Phase 4 — Mobile-first verification

Open the HTML file in the browser tool, resize to 390×844 (iPhone), screenshot full page. Check:
- No horizontal scroll
- Display headline doesn't clip (`word-wrap: break-word; hyphens: auto`)
- Touch targets ≥44px on FAQ summary
- Grid collapses 3→2→1 col cleanly
- Images load

Resize to 1280×900, screenshot full page. Confirm editorial rhythm reads like a lookbook (paper → image → cream → quote → split → spec → black privacy → bonus → FAQ → closing).

Fix issues directly in CSS tokens before handoff.

### Phase 5 — Handoff

Provide the user:
- Path to the HTML file
- Mobile + desktop preview screenshots
- Shopify paste instructions (Admin → Product → Description → `<>` Show HTML → paste → Save)
- Offer to deploy via Admin API if user provides token + store domain (requires `write_products` scope; backup `body_html` to `backups/` first)

## Hard rules

- HTML must be **scoped** under a single root class (default `.lny-pp`, rename per brand) so it cannot leak into theme CSS.
- HTML must be **self-contained**: no external CSS/JS, no Google Font links (use system serif/sans fallbacks). Fonts named `Cormorant Garamond` and `Inter` will silently fall back to Georgia/system-ui on stores that don't load them.
- Must use `aspect-ratio` not fixed pixel heights for image containers (prevents layout shift).
- Must wrap every long copy block in `max-width: 60ch` to preserve readability.
- Must use `clamp()` for every heading font-size.
- Must not include `<html>`, `<head>`, `<body>` tags — only the `<style>` + `<div>` block (Shopify Description is an inner-HTML field).
- Must include `loading="lazy"` on every image below the fold and `loading="eager"` only on the hero.

## Anti-patterns (do not ship)

- Fixed pixel widths on containers
- Hex colors hardcoded inline (always use CSS custom properties)
- Generic AI-prose ("Embrace the allure of desire and let passion play…") — every paragraph must do a job
- FAQ questions that no real buyer would ask
- "What's in the box" buried below scroll
- Images without alt text
- More than 11 sections (the editorial rhythm breaks past that)

## Reference files

- `references/rubric.md` — 100-point conversion rubric and verdict thresholds
- `references/audit-template.md` — exact audit file structure to save under `audits/`
- `references/copy-slots.md` — rules for every `{{PLACEHOLDER}}` in the template
- `references/palette-recipes.md` — proven CSS variable sets by niche (intimates, skincare, supplement, fashion, gadget)
- `references/shopify-deploy.md` — Admin API deploy script with backup + verify
- `references/asset-extraction.md` — what to write back into the PDP Reviewer asset system after each run

## Bundled assets

- `assets/templates/editorial-pdp-description.html` — the 11-section editorial template with all placeholders marked

## Bundled scripts

- `scripts/extract_pdp_images.js` — browser-eval one-liner to list product image URLs from a Shopify PDP
- `scripts/shopify_update_body_html.sh` — curl script to backup + update `body_html` via Admin API
