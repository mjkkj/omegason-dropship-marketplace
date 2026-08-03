# Prompt templates reference

Used in **Phase 3** to fill `BUILD-KIT.md`. Replace every `<...>` from the pid + brief + outline. Keep claim discipline (pid 04) in every prompt.

---

## PART B — Claude Design HTML build prompt (homepage + product page)

> The user provides a **reference URL** at run time. Do **NOT** clone into Shopify or create any draft here. PART B's only job is to emit a **ready-to-paste Claude Design prompt** that builds two HTML pages (homepage + hero product page) using the reference URL as a design reference and `store-outline.md` as the content spec. The Shopify port is a **separate, later, optional** step (see note at the bottom) — only after the HTML is approved.
>
> Fill every `<...>` from pid + brief + outline. If the user hasn't given the reference URL yet, leave `REFERENCE URL:` as a labelled blank and say so.

```
Build two self-contained, production-quality HTML pages for the brand <Brand>: (1) a HOMEPAGE
and (2) a HERO PRODUCT PAGE. Use the reference URL below for layout/visual inspiration only —
match its structure, density, and polish; do NOT copy its copy or brand. Inject OUR content.

REFERENCE URL (design reference only): <paste the URL the user provides at run time>

=== CONTENT SPEC ===
- Anchor angle (every section must serve it): <winning angle>.
- Homepage sections: build exactly per store-outline.md §A (in order).
- Product page sections: build exactly per store-outline.md §B (scope: <full | essential>, in order).
- Copy: use the outline's Content lines + buyer-language verbatim from the brief. Voice per brand-brief.md.
- Offer: single <price> / bundle <AOV lever> / anchor <logic> (pid 03).
- Proof (reviews, ratings, counts, before/after, studies): EDITABLE PLACEHOLDERS clearly marked —
  never fabricate. Before/after labelled "representative".
- Claim discipline (pid 04, NON-NEGOTIABLE): <allowed framing> only; banned: medical/treatment/cure
  claims and unproven stats-as-fact; category labeling <e.g. FTC "rayon from bamboo">.

=== AESTHETIC ===
<token block: palette #hex set / type feel / mood>. Apply consistently across both pages.
Cohesive design system: spacing scale, radius, shadow, button styles, one type scale.

=== TECHNICAL REQUIREMENTS ===
- Mobile-first, fully responsive (360 / 768 / 1280 breakpoints); mobile is not shrunk desktop.
- Semantic HTML5; each page a single self-contained file (inline <style> + vanilla JS, no build step,
  no external framework; system/Google fonts only).
- Accessibility: logical heading order, alt text on every image, aria labels on controls, visible focus
  states, WCAG-AA contrast, prefers-reduced-motion honored.
- Performance: lazy-load below-fold images, width/height on media (no layout shift), no blocking scripts.
- SEO: <title>, meta description, canonical, Open Graph/Twitter tags, and Product JSON-LD structured
  data on the product page (name, price, availability, aggregateRating as placeholder).
- Cross-page: shared header/nav + footer; homepage hero CTA and product cards link to the product page.

=== REQUIRED FEATURES ===
Homepage: announcement bar, sticky nav w/ mobile menu, brand hero + single CTA, trust bar,
problem→shift block, hero-product feature card → product page, why-us pillars, social-proof strip
(placeholder cards), brand-level FAQ accordion, footer (policies + newsletter signup, front-end only).
Product page: sticky mobile buy bar (price + Add to cart), image gallery/carousel with thumbnails,
variant picker + bundle selector with LIVE total price update (vanilla JS), quantity stepper,
Add-to-cart interaction (front-end cart drawer/state — no real checkout), benefit blocks,
comparison table (honest, no named competitor), spec/materials, guarantee/risk-reversal near CTA,
review cards + star summary (placeholders), product-level FAQ accordion, final CTA recap.

=== OUTPUT ===
Two files: `index.html` (homepage) and `product.html` (hero product page). Both self-contained,
mobile-first, editable (all text/price/media/badges easy to find and swap). No lorem ipsum in the
final copy — use the real angle-driven copy; only proof numbers stay as marked placeholders.
Iterate with me on the canvas after the first pass.
```

> **Later / optional — Shopify port:** once the HTML is approved, it can be ported to a Shopify store with `clone-link-to-my-shopify` (feed it the approved `product.html`). That step stays DRAFT theme + product DRAFT, publishes nothing, and only runs on the user's go-ahead. Do not do it as part of PART B.

---

## PART C — 1:1 image set (Higgsfield / Nano Banana Pro)

Generate one prompt per slot. Bake aesthetic tokens + real product into each.

```
Aesthetic: <token set — palette + mood>. Format: 1:1. Product: <product, true to what ships>.

1. HERO — <product> clean composition, angle mood "<winning angle>", token palette, room for headline overlay.
2. LIFESTYLE — <buyer> in <trigger moment from 05>, using/holding <product>, authentic, not staged.
3. DETAIL — macro of <key material/feature from 00>, shows quality; supports spec section.
4. COMPARISON — <product> vs generic alternative (from 02); honest, labelled, no named competitor.
5. PROOF/RESULT — labelled representative <outcome>; only if honest per pid 04; else omit.
```
> No claims baked into imagery beyond what pid 04 allows. Faces/results = representative, labelled.

---

## PART D — 9:16 testimonial / UGC video (Higgsfield / Flora)

```
Format: 9:16, <15-30s>. Aesthetic: <token mood>. Product: <product>.
Hook line (buyer verbatim from 05): "<pain or desire verbatim>"
Beat 1 (0-3s): pattern-interrupt on the pain.
Beat 2 (3-12s): <product> as the shift; show the mechanism within claim limits (04).
Beat 3 (12-end): the desire realized (verbatim) + offer callout + CTA.
Voice/tone: <brief voice>. On-screen text: buyer's own words. No medical/cure claims.
```

---

## hook-tester seeds (paste into the `hook-tester` skill)

```
Product & price: <product> — single <price>, AOV lever <bundle>.
Testing target: hero product (<pid>).
Winning angle (confirmed): <angle from 06/07>.
Candidate angles to test (3-4): <angle A> · <angle B> · <angle C> · <angle D>.
Buyer language (seed hooks from these):
- Pain: "<verbatim 05>"
- Desire: "<verbatim 05>"
- Objection: "<verbatim 05>"
Budget: <$/day if known>. Market: <geo>.
Claim discipline: <allowed framing>; no medical/cure claims.
```

---

## Status table (end of BUILD-KIT.md)

```
| Part | Deliverable | Needs | Status |
|------|-------------|-------|--------|
| A (brief)   | brand-brief.md        | —                         | ✅ done (this run) |
| A (outline) | store-outline.md      | —                         | ✅ done (this run) |
| B | HTML homepage + product page | reference URL + Claude Design (paste prompt) | ⏳ prompt ready |
| B+ | Shopify port (optional, later) | approved HTML + clone-link + go-ahead | ⏳ deferred |
| C | 1:1 image set            | image tool (Higgsfield / Nano Banana Pro)     | ⏳ prompt ready |
| D | 9:16 video               | video tool (Higgsfield / Flora)               | ⏳ prompt ready |
| — | hook-tester system       | run hook-tester skill                          | ⏳ seeds ready |
```
