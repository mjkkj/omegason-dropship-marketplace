---
name: pid-to-store
description: Turn a Greenlight Engine product (a pid folder, verdict GO or REFINE) into a planning package - a brand brief, content outlines for the homepage AND one full-section hero product page, plus a run-ready BUILD-KIT.md (HTML homepage + product page, 1:1 image, 9:16 video prompts + hook-tester seeds). Use when the user says "handoff pid-XXXX", "dựng store cho pid", "build store/PDP từ pid", "tạo product page từ greenlight", "handoff sang skill thật để dựng store", "biến pid thành trang bán hàng", "outline store từ pid", "brief brand từ pid", or points at a greenlight `products/pid-XXXX-*/` folder (or its SUMMARY.md) and asks to plan the store + creative. This skill does NOT build HTML - it outputs brief + outlines (.md) + the build kit; the actual store/images/video are built downstream by the tools named in the kit. Works for ANY niche - adapts brief, outline, copy, and claim discipline to the product category.
---

# pid-to-store

Take a **validated product** (a Greenlight Engine `pid` folder, verdict GO or REFINE) and produce a **planning package** — not finished HTML. Three deliverables:

1. `brand-brief.md` — the strategic brief for the new brand (positioning, buyer, voice, aesthetic tokens, offer architecture, claim discipline).
2. `store-outline.md` — proposed **content outlines** for (a) the **homepage** and (b) **one full-section hero product page**, anchored to the winning angle and buyer language.
3. `BUILD-KIT.md` — run-ready prompts for **PART B** (a **Claude Design** prompt that builds the homepage + hero product page as HTML, using a user-provided reference URL for design + `store-outline.md` for content), **PART C** (1:1 image set), **PART D** (9:16 testimonial video), plus **hook-tester** seed input.

This skill **does not write any HTML or touch a store.** It plans. The build kit prompts hand off to the real builders: PART B is pasted into **Claude Design** (needs a reference URL) to build the HTML pages, PART C/D need an image/video tool (Higgsfield / Nano Banana Pro), hook-tester runs as its own skill. Porting the approved HTML to Shopify (via `clone-link-to-my-shopify`) is a separate optional step, later. Those run with the user's go-ahead.

## When to use

- User hands off a greenlight pid: "handoff pid-0003", "outline store cho pid này", points at `products/pid-XXXX-*/`.
- User wants the brand brief + store outline + build kit for a product that already passed the greenlight scorecard.

If there's no pid (just a bare product), you can still run — collect the same Product Facts manually, but say the data isn't pid-backed and proof/economics are unvalidated.

## Inputs required

- A pid folder path (e.g. `dropship-greenlight/products/pid-0003-*/`) **or** its `SUMMARY.md`.
- Verdict must be **GO** or **REFINE**. If **KILL/REWORK-blocking**, stop and tell the user why (don't plan a store for a killed product).

## Outputs

Saved under `store-builds/<pid>-<brand-slug>/`:
1. `brand-brief.md`
2. `store-outline.md`
3. `BUILD-KIT.md`

Then `present_files` — brief first, outline second, build kit third.

## Workflow

### Phase 1 — Read the pid (do NOT skip)

Read the pid folder and extract build inputs. Mapping:

| From | Extract | Feeds |
|------|---------|-------|
| `00-product.md` | product name, category, hypothesis, source | brief, hero, product facts |
| `06-scorecard.md` / `07-brief.md` | verdict, **winning angle**, score | positioning, gate check |
| `05-buyer-language.md` | verbatim, pain/desire/objection, **hook seeds** | brief voice, reviews, FAQ, hooks, video lines |
| `03-unit-economics.md` | pricing, **bundles/AOV** levers | offer architecture |
| `04-compliance-risk.md` | tier + **claim discipline** | copy guardrails (critical) |
| `02-competitor-gap.md` | differentiation / USP / gap | positioning, "why us" |

Confirm verdict is GO/REFINE. Restate the **winning angle in one line** so the whole package is anchored to it.

### Phase 2 — Brand brief + store outline

Two steps, in order. See `references/brief-and-aesthetic.md` and `references/section-architecture.md`.

**2a — Collect brief inputs.** Gather what the pid can't give you. Use `ask_user_input_v0` where it fits (aesthetic + section scope as selects; brand name + any free notes as typed answers). Minimum intake:
1. **Brand name?** (free text — coin a placeholder only if the user explicitly defers)
2. **Aesthetic direction?** First **derive 3 candidate token sets fitted to THIS brand/niche** (per `references/brief-and-aesthetic.md`), present them as the options + an "I'll describe it" path. No fixed menu — the 3 come from the pid + brief. Never auto-default to dark-neon health-tech unless the niche fits.
3. **Hero PDP section scope?** `All sections (full)` / `Essential (~10)`.
4. Any must-keep brand cues, competitors to echo/avoid, or offer constraints (optional free text).

**2b — Write the brief, then propose outlines.** Fill the brief template in `references/brief-and-aesthetic.md` from pid data + intake. Then, using the brief + Phase 1 data, propose the two content outlines in `store-outline.md` per `references/section-architecture.md`:
- **Homepage outline** — brand-level, drives to the hero product.
- **Hero product page outline** — full-section (or essential per 2a answer), every section labeled with its purpose, the angle it serves, and the pid data / buyer-language verbatim that fills it.

Outlines are **content plans**, not HTML. Each section entry = section name → job → source content, so a downstream builder (or PART B) can execute it directly.

### Phase 3 — Build the BUILD-KIT.md

Fill the templates in `references/prompt-templates.md` with the product facts, brand, aesthetic tokens, bundles, angle, hooks, and claim discipline. Produce:
- **PART B** — a ready-to-paste **Claude Design** prompt that builds **two HTML pages** (homepage + hero product page). It does **NOT** create a Shopify draft. The user provides a **reference URL** at run time (design/layout inspiration only); the prompt tells Claude Design to match its structure/polish but inject this brand's content from `brand-brief.md` + `store-outline.md` (copy, angle, sections, offer). Bake in **specific, detailed technical requirements** (mobile-first responsive, semantic self-contained HTML, accessibility/WCAG-AA, performance/lazy-load, SEO + Product JSON-LD) and **full features** (sticky mobile buy bar, image gallery, variant + bundle selector with live total, front-end cart, FAQ accordions, review/proof placeholders, comparison, guarantee). Output = `index.html` + `product.html`, editable, no fabricated proof. Porting to Shopify via `clone-link-to-my-shopify` is a separate optional step **after** the HTML is approved.
- **PART C** — 1:1 image-set prompts (hero, lifestyle, detail, comparison, proof) with aesthetic tokens baked in.
- **PART D** — 9:16 testimonial/UGC video prompt seeded from buyer-language verbatim.
- **hook-tester seeds** — product + price/AOV, winning angle, 3–4 candidate angles, and pain/desire/objection verbatim ready to paste into the `hook-tester` skill.
- A **status table** — what's planned vs. what still needs a connector/tool + the user's go-ahead.

### Phase 4 — Hand off

`present_files` (brief → outline → build kit). Briefly say what's planned and what needs a connector/tool: PART B = paste into Claude Design (needs a reference URL) to build `index.html` + `product.html`; Shopify port is optional/later; PART C/D = image/video tool; hook-tester = its own skill run.

## Guardrails (carry from the pid, always)

- **Claim discipline** from `04-compliance-risk.md` overrides everything in copy, brief, and outline. Comfort/look-feel framing only for regulated-adjacent niches (health, beauty, supplement, bedding-with-health-angle). No medical/treatment/cure claims. Category labeling correct (e.g. FTC "rayon from bamboo").
- **Never fabricate proof.** Social proof, ratings, review counts, study figures = placeholders in the outline/brief; mark them editable and tell the user to replace with real data before launch.
- **Before/after** = labelled representative.
- **PART B = Claude Design prompt, not a store write.** Never create a Shopify draft in this skill. Never invent the reference URL — it's the user's, provided at run time; if missing, leave it a labelled blank. The built HTML must keep every text/price/media/badge easy to find and edit; all proof stays placeholder. Shopify porting (draft theme + product DRAFT, publish nothing) only happens later, via `clone-link-to-my-shopify`, on the user's go-ahead.
- If the pid verdict is KILL → refuse to plan, explain the fatal reason.
