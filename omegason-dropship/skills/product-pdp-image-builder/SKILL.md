---
name: product-pdp-image-builder
description: Generate a branded 9-image Shopify/Amazon product page (PDP) gallery for ANY physical product (gadgets, health, beauty, home, supplements, apparel). EVERY frame is a dense conversion infographic — headline plus overlay graphics like callouts, badges, anatomical insets, glow overlays, comparison tables, mechanism explainers, steps, review cards. It NEVER outputs a plain product-on-white shot with no text; a frame that is "just the product" is wrong. Walks a cold buyer through a locked journey — benefit-stack hero, problem, solution, how-to, mechanism, features, vs-alternative, social proof, offer. Uses the user's REAL product photo (background-removed, composited) so it never misrepresents what ships; an HTML/CSS layer renders all text pixel-perfect. Use whenever the user wants product page images, an image gallery, infographic images, a PDP/infographic set, or uploads a product photo for marketing. Also triggers on reference PDP/infographic screenshots, match their density and beat them.
license: Inder's
---

# Product PDP Image Builder

A skill for producing a fully branded **9-image product page set** for any physical product. Built for Shopify PDPs, but the same square outputs work on Amazon, Etsy, eBay, and paid social.

The gallery is a funnel inside the funnel: by the time the shopper has swiped past frame 4, they should already want it. Every frame does one job, in journey order, and the whole set looks like it came from one brand.

## What this skill produces

A folder of **9 square (2000×2000) PNG images** at `/mnt/user-data/outputs/<brand>-pdp/`, numbered in journey order, every image sharing the same brand DNA — palette, type, badge shape, callout style, photo treatment. Ready to drag straight into Shopify's product media block in the order numbered.

Default spec (locked from the user's earlier choices, override on request):
- **9 frames** (full customer journey)
- **1:1 square**, 2000×2000 px
- **Vibe auto-derived** from the product category + brand kit (clean/trust-forward fallback)

## The defining rule #1 — EVERY FRAME IS AN INFOGRAPHIC (never a plain image)

This is the rule that the whole skill is built around. There is **no such thing as a "plain product shot" frame** in this gallery. Every single one of the 9 frames carries, at minimum:

- a **headline** (a claim, a condition, a benefit, a step label — never just the product name floating alone), and
- **overlay graphics** layered over the imagery: callout pills, check/cross rows, leader-line labels, anatomical inset circles, colored heat/traction glow overlays, numbered step blocks, comparison columns, badges, star-rating chips, or a testimonial card.

A bare product centered on a white background with nothing else is a **failure**, not a hero. Even the hero frame is an infographic (e.g. a condition stack — "Scientifically Designed To Help: …" — overlaid on a real lifestyle photo). If you render a frame and it would still make sense with all the text deleted, you have built the wrong frame: add the overlay layer before screenshotting.

The visual reference standard for this skill is the dense, overlay-heavy DTC infographic set described in `references/infographic-recipes.md`. **Read that file before planning the frames** — it contains the six proven archetypes (condition/benefit stack, mechanism-explainer with inset + glow, how-to steps, features checklist, vs-alternative table, best-seller review) that this skill reproduces and improves on for any product.

## The defining rule #2 — use the REAL product

This is a **physical product**. Unlike a digital product, it has a true physical appearance that the buyer will receive. The gallery must show *that* product.

- **If the user uploads product photos: use them.** Cut the product out (background removal) and composite it onto branded backgrounds. Do NOT regenerate the product from a text prompt — a hallucinated version will differ from what ships and creates returns/disputes.
- **Generate the product only as a last resort** (no photo available), and when you do, label it to the user as a *representation to verify before publishing.*
- For lifestyle/in-scene frames that must contain the product, **save the real photo as a Higgsfield reference element** and embed it, so the actual product appears in the scene (see *Putting the real product in a scene*).

## What this skill does NOT do

- **Does not invent facts.** Specs, dimensions, materials, what's-in-the-box, certifications, ratings, review counts, and outcome claims come ONLY from what the user provides. Never fabricate a measurement, a star rating, or a testimonial. Empty data → placeholder, not invention. (Fabricated reviews/specs violate Shopify TOS, Meta Ads policy, and FTC guidelines, and trigger refund storms.)
- **Does not make unqualified health/medical/results claims.** For health, beauty, supplement, or recovery products, keep copy to what the product *is* and *does mechanically*; frame benefits as design intent or customer-reported experience, not guaranteed medical outcomes. When in doubt, soften (see *Claims discipline*).
- **Does not write the product page itself** (that's `clone-link-to-my-shopify` or hand work). This produces the image gallery only.
- **Does not generate video** (use Higgsfield video tools / the ad-video skills directly).

---

# The workflow (8 phases — follow in order)

## Phase 0 — Capture inputs

Ask, in **one** short turn, only what cannot be inferred. Use `ask_user_input_v0` for the multiple-choice bits to make it tappable on mobile. Default aggressively; the fewer questions, the better.

Required:
1. **Product** — photos (strongly preferred — front, angle, in-use, packaging if available) AND a 2–4 sentence description: what it is, what problem it solves, who buys it.
2. **Brand name** — shown on hero, badges, footers.
3. **Key features & specs** — the bullet list the buyer needs: dimensions, materials, sizes, what's in the box, how it's used. Only what's true.

Optional but valuable:
4. **Brand kit** — logo, hex codes, font pair. If none, the skill picks a preset from the category and shows a swatch for approval.
5. **Vibe** — `clinical-clean` / `bold-hype` / `premium-elegant` / `earthy-natural` / custom. If none given, auto-derive from category (see *Category → preset map*).
6. **Real social proof** — star rating, review count, customer count, and 2–3 real testimonials (first name + last initial). If none, the social-proof frame ships with placeholders to fill before publishing.
7. **Offer** — price, bundle contents, discount, guarantee/returns terms, shipping promise. Used on frames 6, 8, 9.
8. **The one differentiator** — what this product has that the cheap alternative doesn't. Drives the comparison frame.
9. **Reference PDPs** — competitor/aspirational screenshots; capture badge shape, callout style, photo treatment.

## Phase 1 — Build the product fact sheet (no fabrication)

Write `/home/claude/product-facts.json` capturing only verified facts:

```json
{
  "name": "...",
  "category": "health-device | gadget | beauty | home | kitchen | supplement | apparel | accessory | other",
  "one_liner": "what it is in plain words",
  "problem": "the felt pain the buyer lives with",
  "mechanism": "how/why it works (only if the user told you)",
  "features": ["...", "..."],
  "specs": {"dimensions": "...", "materials": "...", "sizes": "...", "in_the_box": ["..."]},
  "differentiator": "the one thing competitors lack",
  "buyer": "who buys it / who they buy it for",
  "social_proof": {"rating": null, "review_count": null, "customer_count": null, "testimonials": []},
  "offer": {"price": null, "bundle": [], "guarantee": null, "shipping": null},
  "claims_sensitivity": "low | health/medical | beauty | supplement"
}
```

If a photo was uploaded, `view` it to confirm the product's true appearance, colorway, and form factor — this is what the gallery must match. Note anything the photo reveals that the description missed (a strap, a button, a texture) for the features frame.

**Any field the user didn't supply stays `null`/empty. Do not fill it from imagination.**

## Phase 2 — Lock the brand kit

Write `/home/claude/brand-kit.json`. Every downstream image reads from this — no ad-hoc hexes mid-build.

```json
{
  "brand_name": "...",
  "vibe": "clinical-clean | bold-hype | premium-elegant | earthy-natural | custom",
  "palette": {
    "bg": "#ffffff",
    "bg_alt": "#f3f5f7",
    "ink": "#0f1b2d",
    "accent": "#1f7a8c",
    "accent_2": "#0f1b2d",
    "callout_a": "#e6f2f4",
    "callout_b": "#fde8d8",
    "callout_c": "#e9eef4",
    "good": "#1f9d55",
    "bad": "#c0392b",
    "tag": "#e63946"
  },
  "type": {
    "display": "Inter / Geist — sans, 800 weight",
    "body": "Inter — sans, 400/500",
    "scale": {"h1": 104, "h2": 60, "h3": 34, "body": 24, "small": 18}
  },
  "shapes": {
    "badge": "rounded rectangle tag | thin-stroke circular seal | solid pill",
    "callout": "rounded pill with soft shadow | hairline card | solid pill",
    "corner_radius": 16,
    "leader_line": "thin 2px line + dot terminator, accent color"
  },
  "photography": {
    "product": "REAL uploaded photo, background-removed, soft ground shadow",
    "scene": "natural daylight, real-feel context, shallow DoF, no AI gloss",
    "avatar_anchor": "<soul_id or one-off description, only if a human appears>"
  },
  "logo_path": "/home/claude/assets/logo.png | null"
}
```

Pull full palettes/fonts from **Brand presets** below when a preset is chosen. If the user gave only a logo, sample 3–5 dominant colors from it with PIL and build a custom palette. **Always render a 5-swatch approval card and confirm before generating all 9 frames** — a 2-minute check saves 20 minutes of rework.

## Phase 3 — Plan the 9 frames

Write a flat numbered list to the conversation with the planned headline/contents of each frame. The user confirms or edits. Cheapest place to catch a wrong direction. Canonical journey (adapt copy, never the structure). **Every row produces an infographic — the "Overlay" column is mandatory, never empty:**

| # | Frame | Job | Base imagery | Mandatory overlay (the infographic layer) |
|---|-------|-----|--------------|--------------------------------------------|
| 1 | **Hero / Condition-Benefit Stack** | Stop the scroll; make the buyer self-identify | Real product in-use on a lifestyle scene | Big headline ("Scientifically Designed To Help:" / "X Reasons People Switch To…") + a vertical stack of 4–5 icon + label rows in a tinted panel |
| 2 | **The Problem** | Name the pain so the buyer feels seen | `bg_alt` or desaturated mood scene | Punchy problem headline + relatable subline + pain icons/agitation callouts |
| 3 | **Meet [Product] / Solution** | Position the product as the answer | Real product comp on clean/branded bg | Headline "Meet [Product]" + one-line mechanism + 3 quick benefit pills overlaid |
| 4 | **How To Use** | Kill the "is this complicated?" objection | Real product on surface/blanket | "How To Use:" + numbered Step 1/2/3 blocks + an expectation line ("relief on first use…") |
| 5 | **Mechanism Frame A** | Believability — show one therapy/feature working | Real product in-scene | Therapy headline + underlined subclaim + **anatomical inset circle** + **colored glow overlay** on the body (see recipe) |
| 6 | **Mechanism Frame B / Features Checklist** | Second mechanism OR the spec/trust stack | Real product cut-out | EITHER a second mechanism (inset + glow) OR a "Features" checklist: 5–6 check-bullets incl. rating + guarantee |
| 7 | **Comparison (Us vs Alternative)** | Answer "why not the cheaper/older option?" | Product cut-out vs alternative photo | Two columns, ✓ green for you / ✗ red for the alternative, 4 rows each, accent header on your side |
| 8 | **Social Proof / Best-Seller** | De-risk with real evidence | Real UGC-style photo(s) | BEST SELLER badge + ★★★★★ + named testimonial card (real, or placeholder flagged) |
| 9 | **The Offer** | Close: what you get + guarantee + CTA | Product/bundle laid out | "WHAT YOU GET" checklist + guarantee line + price/offer (if given) + implicit CTA |

Detailed anatomy + copy patterns per frame in the **9-frame anatomy** section, and the six core archetypes (with exact overlay construction) in `references/infographic-recipes.md`.

## Phase 4 — Set up the environment + prepare the product cut-out

**Fonts (do this once).** The sandbox cannot reach Google Fonts, so self-host. Pull open-source TTFs from allowed mirrors (`raw.githubusercontent.com` is reachable), install, and reference via `@font-face`:

```bash
mkdir -p ~/.fonts
# Inter (github.com/rsms/inter) and any Google-hosted font (github.com/google/fonts)
curl -sL "https://raw.githubusercontent.com/google/fonts/main/ofl/inter/Inter%5Bopsz,wght%5D.ttf" -o ~/.fonts/Inter.ttf
curl -sL "https://raw.githubusercontent.com/google/fonts/main/ofl/playfairdisplay/PlayfairDisplay%5Bwght%5D.ttf" -o ~/.fonts/Playfair.ttf
fc-cache -f ~/.fonts
```

In `brand.css`, declare `@font-face { font-family: 'Inter'; src: url('file:///root/.fonts/Inter.ttf'); }` so Playwright renders real type, not a fallback.

**Product cut-out.** If the user uploaded a product photo, remove its background so it composites cleanly on branded canvases:

```bash
pip install rembg pillow onnxruntime --break-system-packages
```
```python
from rembg import remove
from PIL import Image
img = Image.open("/mnt/user-data/uploads/<product>.png")
cut = remove(img)  # transparent PNG
cut.save("/home/claude/assets/product-cutout.png")
```

Save to `/home/claude/assets/product-cutout.png`. This cut-out is reused on frames 1, 3, 6, 9 — the product stays pixel-identical across the set, which is the core of "looks like one brand."

If `rembg` struggles (busy background, reflective product), fall back to `marketing_studio_image` to restage the product OR ask the user for a cleaner photo. Never ship a ragged cut-out edge.

## Phase 5 — Generate scene/background imagery via Higgsfield

Only frames that need a *scene* (lifestyle, before/after context, hero backdrop) call `Higgsfield:generate_image`. Use the **Higgsfield prompt templates** below.

Model selection:
- **`marketing_studio_image`** — clean commercial product/scene photography. Default for hero backdrops, lifestyle, before/after staging. Tuned for DTC.
- **`nano_banana_pro` / `nano_banana_2`** — when a generated scene must contain the *real product* via a reference element, and when crisp in-image detail matters.
- **`soul_2`** with `soul_id` — only if a recurring human face appears across frames.

Prompt discipline: 60–100 words; always state `aspect_ratio: "1:1"`, `count: 4` (pick the cleanest); name the brand background color ("warm cream, not white"); specify light source + direction; never ask Higgsfield to render headline/spec/testimonial text — that's the HTML layer. Save outputs to `/home/claude/raw-imagery/frame-XX-base.png`.

### Putting the real product in a scene
To get the actual uploaded product into a generated lifestyle shot (not a look-alike):
1. `Higgsfield:show_reference_elements` with `action='create'`, passing the uploaded product image, to get an `element_id`.
2. Generate with `nano_banana_2` (or another element-supporting model) and embed `<<<element_id>>>` inside the prompt, e.g. `"A bright bathroom counter at morning, <<<element_id>>> placed beside a folded towel, soft window light from the left..."`.
3. The real product is injected into the scene. Confirm the candidate actually preserved the product before using it.

## Phase 6 — Compose the final frames via HTML/CSS

Every frame's final pixels come from an HTML file screenshotted at 2000×2000. This is what makes the set "super branded": type, color, callout shapes, and leader lines are CSS, identical across all 9.

Create one shared `/home/claude/frames/brand.css` from the brand kit:

```css
@font-face { font-family:'BrandDisplay'; src:url('file:///root/.fonts/Inter.ttf'); }
:root{
  --bg:<palette.bg>; --bg-alt:<palette.bg_alt>; --ink:<palette.ink>;
  --accent:<palette.accent>; --good:<palette.good>; --bad:<palette.bad>; --tag:<palette.tag>;
  --callout-a:<palette.callout_a>; --callout-b:<palette.callout_b>; --callout-c:<palette.callout_c>;
  --radius:<shapes.corner_radius>px;
}
*{box-sizing:border-box;margin:0;}
body{width:2000px;height:2000px;background:var(--bg);color:var(--ink);
  font-family:'BrandDisplay',sans-serif;padding:120px;display:flex;flex-direction:column;}
.h1{font-size:<scale.h1>px;font-weight:800;letter-spacing:-.02em;line-height:1.02;}
.h2{font-size:<scale.h2>px;font-weight:800;letter-spacing:-.01em;}
.body{font-size:<scale.body>px;font-weight:400;line-height:1.4;}
.tag{background:var(--tag);color:#fff;padding:14px 32px;border-radius:8px;
  font-weight:800;letter-spacing:.05em;font-size:28px;display:inline-block;}
.pill{padding:22px 36px;border-radius:999px;box-shadow:0 4px 18px rgba(0,0,0,.06);
  font-size:30px;font-weight:600;display:inline-flex;align-items:center;gap:16px;}
.leader{position:absolute;height:2px;background:var(--accent);transform-origin:left;}
.leader-dot{position:absolute;width:16px;height:16px;border-radius:50%;background:var(--accent);}
.product-shadow{filter:drop-shadow(0 40px 60px rgba(0,0,0,.18));}
.stars{color:#f5a623;font-size:34px;letter-spacing:2px;}
```

Each `frame-NN.html`: 2000×2000 viewport, imports `brand.css`, embeds the product cut-out and/or Higgsfield base, layers text/callouts/leader lines. Screenshot with Playwright:

```bash
pip install playwright --break-system-packages && playwright install chromium
```
```python
from playwright.sync_api import sync_playwright
with sync_playwright() as p:
    b = p.chromium.launch()
    pg = b.new_page(viewport={"width":2000,"height":2000}, device_scale_factor=1)
    pg.goto(f"file:///home/claude/frames/frame-{n:02d}.html")
    pg.wait_for_timeout(400)  # let fonts/images settle
    pg.screenshot(path=f"/mnt/user-data/outputs/{slug}-pdp/{n:02d}-{name}.png")
    b.close()
```

## Phase 7 — Quality pass (contact sheet)

Render all 9 as a 3×3 grid and `view` it. Check:
1. **Infographic integrity (do this first)** — does EVERY frame carry a headline + an overlay layer (callouts, steps, insets, glow, table, leader lines, or testimonial)? If any frame would still "make sense" with all text/graphics removed, it's a plain shot — rebuild it as an infographic before anything else.
2. **Brand consistency** — same palette/type/callout shape across all 9?
3. **Journey logic** — problem → solution → proof → offer, or random?
4. **Product fidelity** — the product in every frame matches the real uploaded photo?
5. **Fact integrity** — no invented spec, rating, or testimonial; placeholders flagged?
6. **Claims safety** — no unqualified medical/results promises (esp. health products)?
7. **Thumbnail legibility** — every headline readable at Shopify-gallery thumbnail size?
8. **No AI-tells** — no warped hands in lifestyle, no garbled in-image text, no over-glossy AI sheen.

Any frame fails any check → redo it. One weak frame drags the whole gallery down.

## Phase 8 — Present

`present_files` with all 9 in numerical order, frame 1 as primary. One short post-amble:

> Here are your 9 PDP frames for `<brand>`. Drag them into Shopify product media in this order — frame 1 is the gallery hero. Frame 8 has placeholder reviews; swap in real ones before publishing. Want a 10th frame (FAQ band, founder note, size guide)? Say which.

Stop there. No essay.

---

# 9-frame anatomy (the customer journey in detail)

> **Every frame below is an infographic.** The exact overlay construction for the six core archetypes (condition stack, mechanism inset+glow, how-to, features checklist, vs-alternative, review card) lives in `references/infographic-recipes.md` — that file is the authority on *how* to build the overlay layer. The notes below cover the *copy and job* of each frame. Where the Phase 3 table and the recipes file differ in naming, the Phase 3 table wins.

Examples use neutral DTC products (a posture corrector, a cordless neck massager, a gravity water filter) to show patterns — adapt to the actual product.

## Frame 1 — Hero (Condition / Benefit Stack — NOT a bare product shot)
**Job:** Stop the scroll in 0.4s AND make the buyer self-identify. This is a condition/benefit-stack infographic (recipe #1), never a product floating on white.
**Anatomy:** Real product *in use* on a lifestyle scene as the base. A tinted overlay panel carries a bold headline ("Designed To Help With:" / "Why 21,000+ Switched") and a vertical stack of 4–5 icon + label rows, ending with "…and so much more." Optional small tag (`BESTSELLER` / `NEW`) and a star chip *only if real*.
**Copy:** Headline = the self-identification hook. Stack rows = the conditions/use-cases/benefits the buyer recognises.
**Pitfalls:** A plain centered product with just a name (this is the #1 thing this skill exists to prevent); disease "cure/treat" claims; >5 stack rows; an opaque panel that hides the real scene.

## Frame 2 — The Problem
**Job:** Name the pain so the buyer thinks "that's me." No product, or product de-emphasized. Mostly typography.
**Anatomy:** `bg_alt` background. A punchy problem headline (8–14 words). A relatable subline. Optional desaturated/grayscale mood image or a simple "pain" icon to set a heavier tone than the rest of the set.
**Copy:** "Stiff, aching neck by 3pm — every single day?" / "Tired of stretching, cracking, and still feeling tight?"
**Claims discipline:** Describe the *felt experience*, not a diagnosis. "Wake up with an aching back" (felt) not "cure your sciatica" (medical claim).
**Pitfalls:** Vague pain ("life is hard"). Make it specific and physical.

## Frame 3 — Meet [Product] (the turn)
**Job:** Resolve the tension from frame 2. Introduce the product as the answer.
**Anatomy:** Confident product shot (real cut-out on clean/lifestyle bg). Headline: "Meet [Product]" + a one-sentence plain-language description of what it does. A short relief-framed subline.
**Copy:** "Meet NeckEase — targeted heat + kneading that melts tension in 15 minutes, hands-free."
**Pitfalls:** Repeating the hero verbatim. This frame is *relief*, not *introduction-again*.

## Frame 4 — How It Works
**Job:** Make it believable. The credibility frame.
**Anatomy — pick one:**
- **1-2-3 strip:** three numbered steps with a tiny icon/image each ("1. Wrap it on · 2. Pick a mode · 3. Relax 15 min").
- **Mechanism callout:** product with 1–2 annotations explaining the working part ("Dual heat nodes reach 42°C to relax muscle tissue").
**Claims discipline:** Explain the *mechanism/design intent*, not a guaranteed cure. "Designed to support…" / "applies gentle compression to…".
**Pitfalls:** Hand-waving. If you can't say concretely how it works, ask the user — don't invent a mechanism.

## Frame 5 — Key Benefits
**Job:** Outcomes, not features. How they'll feel / what changes.
**Anatomy:** 3–4 colored pill/card callouts (use callout_a/b/c so the eye separates them), each = one icon + one bold outcome + a 3–6 word descriptor.
**Copy:** 🔥 **Loosens tight muscles** — in one session · 🙌 **Totally hands-free** — use it anywhere · 🔋 **Cordless** — 2 weeks per charge.
**Pitfalls:** Three benefits that all say the same thing. Each pill should hit a different motivation: result, convenience, identity/value.

## Frame 6 — Features & Specs (the annotated infographic)
**Job:** The frame buyers zoom into. Show the product and label its parts + give the hard specs.
**Anatomy:** Real product cut-out centered. **Leader lines** (thin 2px accent line + dot terminator) point from the product to 3–5 short feature labels around it. A compact spec block in a corner: dimensions, materials, sizes, what's in the box, charge time, etc. — *only real specs.*
**Technique (leader lines in HTML):** absolutely position the product, then position each label and draw a `.leader` div rotated toward its anchor point; cap with a `.leader-dot` on the product. Keep labels horizontal and readable (never rotate text).
**Copy:** "Medical-grade silicone" · "USB-C, 2-hr charge" · "Fits 13–18\" neck" · "In the box: device, strap, cable, pouch."
**Pitfalls:** Fabricated measurements; lines crossing each other; labels rotated to follow the line (hurts legibility).

## Frame 7 — Comparison
**Job:** Position against the alternative so "should I buy the cheap one?" is answered.
**Anatomy — pick one:**
- **Us vs Them table:** two columns, your product vs "Ordinary [category]", 4–6 rows with ✓ (good color) and ✗ (bad color). Your column gets the accent header.
- **Before / After:** split canvas. Only use if you can show it *honestly* — staged/representative imagery, labeled as such for health products; never imply a guaranteed medical result.
**Copy (table rows):** Hands-free use · Adjustable heat · Cordless · 30-day guarantee — ✓ for you, ✗ for the generic.
**Pitfalls:** Naming a competitor brand (legal risk — use "ordinary/generic"). Before/after that implies a clinical outcome you can't substantiate.

## Frame 8 — Social Proof + Trust
**Job:** De-risk the purchase with real evidence.
**Anatomy:** Headline `WHAT CUSTOMERS SAY`. 2–3 testimonial cards in different callout colors, each with a name (First + last initial), one bolded skim-phrase, ★★★★★. A rating/customer badge *if real* ("4.8★ from 2,100+ reviews"). A row of trust badges along the bottom: 30-day returns · free shipping · 1-yr warranty (only the ones the user actually offers).
**Hard rule on fabrication:** If the user gave no real testimonials/rating, render the cards with `[Real customer quote here]` placeholders and the rating area empty, and tell the user to fill before publishing. Do not invent reviews, star counts, or "10,000+ sold." Fabricated proof breaks Shopify TOS, Meta policy, and FTC rules — and burns trust on arrival.
**Pitfalls:** Five-star wall with no names; made-up numbers; a warranty/return promise the store doesn't honor.

## Frame 9 — The Offer (close)
**Job:** Make the "yes" easy. Show everything they get + remove risk + nudge.
**Anatomy:** Real product (or bundle/what's-in-box laid out) as hero. A `WHAT YOU GET` checklist (✓ device, ✓ accessories, ✓ guarantee, ✓ bonus). The offer/price if provided. A risk-reversal line ("30-day money-back — love it or return it"). A gentle urgency cue ("Limited stock" only if true) and an implicit CTA ("Tap Add to Cart").
**Copy:** "Everything in the box + a 30-day guarantee. Try it risk-free."
**Pitfalls:** Filler checklist items every product has ("✓ Ships in a box"). False scarcity. Every line must give a fresh reason to buy.

## The contact-sheet test
Render all 9 at 700×700 in a 3×3 grid and view. Ask: do all 9 look like one product family? Does the eye move through them in order? If the brand name were hidden, would they still feel like a set? Are any two frames doing the same job (cut or merge)? The goal isn't 9 great images — it's 9 images that tell one coherent story.

---

# Brand presets

Five built-in vibes; each is a complete kit. If the user picks `custom`, ask for 3–5 hex codes + a display font + a body font + one reference image.

## `clinical-clean` — health, recovery, medical devices, oral care, supplements (DEFAULT FALLBACK)
Trust-forward and calm. White / off-white bg, never busy. One trustworthy accent (medical teal or deep blue). Clean heavy sans. Lots of whitespace, hairline rules, checkmark icons.
```json
{"palette":{"bg":"#ffffff","bg_alt":"#eef3f6","ink":"#0f1b2d","accent":"#1f7a8c","accent_2":"#13496b","callout_a":"#e3f1f3","callout_b":"#e8eef5","callout_c":"#eaf5ee","good":"#1f9d55","bad":"#c0392b","tag":"#e63946"},
"type":{"display":"Inter / Geist — sans 800","body":"Inter — sans 400/500","scale":{"h1":104,"h2":60,"h3":34,"body":24,"small":18}},
"shapes":{"badge":"rounded rectangle tag","callout":"rounded pill with soft shadow","corner_radius":16,"leader_line":"2px accent line + dot"}}
```
**Rules:** White bg, navy ink (not pure black), one accent only, generous air, soft shadows not borders. Reads "credible / clinical / safe."

## `bold-hype` — gadgets, problem-solution gizmos, kitchen, auto, TikTok impulse
Loud and high-energy. White or near-black bg, ONE bright accent (electric orange/lime/blue). Black-weight type, huge numbers, arrow doodles, reverse-out tags.
```json
{"palette":{"bg":"#ffffff","bg_alt":"#0a0a0a","ink":"#0a0a0a","accent":"#ff5a1f","accent_2":"#0a0a0a","callout_a":"#fff0e8","callout_b":"#0a0a0a","callout_c":"#fde8d8","good":"#16a34a","bad":"#dc2626","tag":"#ff5a1f"},
"type":{"display":"Geist / Inter — sans 900","body":"Inter — sans 500","scale":{"h1":120,"h2":68,"h3":38,"body":24,"small":18}},
"shapes":{"badge":"solid rectangle, reverse-out type","callout":"solid pill (black/white flip)","corner_radius":10,"leader_line":"3px accent line + dot"}}
```
**Rules:** One bright accent everywhere, high contrast, no pastels. Type does the heavy lifting. Big bold claims, thick underlines on key words.

## `premium-elegant` — beauty, skincare, jewelry, premium home
Quiet luxury. Warm stone/ivory bg, serif display + sans body, gold/sage accents, hairline borders, lots of negative space, editorial.
```json
{"palette":{"bg":"#f7f5f0","bg_alt":"#e9e3d8","ink":"#1c1c1c","accent":"#b89968","accent_2":"#8a9a82","callout_a":"#ffffff","callout_b":"#efe9df","callout_c":"#e6e1d6","good":"#7a9d7e","bad":"#a8584a","tag":"#1c1c1c"},
"type":{"display":"Playfair Display — serif 700","body":"Inter — sans 300/400","scale":{"h1":92,"h2":52,"h3":30,"body":22,"small":17}},
"shapes":{"badge":"thin-stroke circular seal","callout":"hairline card, no fill","corner_radius":4,"leader_line":"1px gold line + small dot"}}
```
**Rules:** Restraint over abundance. Hairline borders not solid fills. Type at ~85% of default sizes — premium feels quieter. Gold/sage only.

## `earthy-natural` — organic, eco, food, pet, natural supplements
Warm and friendly. Cream/kraft bg, sage + terracotta, rounded approachable type, organic shapes, leaf motifs.
```json
{"palette":{"bg":"#faf6ee","bg_alt":"#efe7d6","ink":"#33372c","accent":"#7a9d6b","accent_2":"#c2703d","callout_a":"#e7efdc","callout_b":"#f6e2cf","callout_c":"#e9e1cd","good":"#5a8a4a","bad":"#b5503a","tag":"#c2703d"},
"type":{"display":"Inter / Fraunces — soft 700","body":"Inter — sans 400","scale":{"h1":100,"h2":58,"h3":33,"body":24,"small":18}},
"shapes":{"badge":"rounded organic blob seal","callout":"soft rounded pill","corner_radius":24,"leader_line":"2px terracotta line + dot"}}
```
**Rules:** Cream not white, no neons, rounded corners, friendly tone, natural texture cues.

## Category → preset map (when the user gives no vibe)
- health device / recovery / medical / oral care / supplement (clinical feel) → `clinical-clean`
- gadget / kitchen tool / car / cleaning / TikTok impulse → `bold-hype`
- beauty / skincare / fragrance / jewelry / premium home → `premium-elegant`
- organic food / eco / pet / herbal supplement → `earthy-natural`
- anything ambiguous → `clinical-clean` (safest, most trust-forward)

---

# Higgsfield prompt templates

Slots like `<BG>` fill from `brand-kit.json`. Always `aspect_ratio:"1:1"`, `count:4`.

## Hero / product backdrop (when no clean studio photo exists)
```
model: marketing_studio_image
prompt: A clean studio product scene on a <BG> seamless background, soft top-left key light with a gentle fill, a subtle ground shadow and faint reflection beneath. Generous negative space around the center where the product sits. Premium DTC e-commerce product photography, crisp but natural, no text, no props crowding the frame.
aspect_ratio: "1:1"
count: 4
```
Then composite the real product cut-out into the center in HTML (don't rely on Higgsfield to draw the product).

## Lifestyle scene WITH the real product (reference element)
```
model: nano_banana_2
prompt: <<<ELEMENT_ID>>> placed naturally in <CONTEXT, e.g. "a sunlit bathroom counter beside a folded towel and a small plant">, soft natural daylight from the left, shallow depth of field, real-feel lifestyle photography, warm color grade, no AI gloss, the product is the clear focus.
aspect_ratio: "1:1"
count: 4
```
(First create the element via `show_reference_elements action='create'` with the uploaded photo.)

## Lifestyle with a human (one-off, no product fidelity needed in-hand)
```
model: marketing_studio_image
prompt: A person in their <age> at <setting>, mid-use of the product, head tilted slightly down with eyes on the product (not the camera), natural window light from one side, shallow depth of field, warm natural color grade, looks like a real candid iPhone photo, slight film grain, no AI gloss.
aspect_ratio: "1:1"
count: 4
```
**Human-shot hard rules:** never "smiling at camera" (stock-photo tell); never "hands holding product up to camera" (warped-finger tell); always specify light direction; keep eyes on the product.

## Before/after staging (health products — caution)
Only when honest and representative. Stage two matched scenes (same person, same framing) showing context, not a clinical result. Label "representative" in the HTML. If you can't show it honestly, skip before/after and use the Us-vs-Them table instead.

**Post-Higgsfield:** all headlines, tags, spec callouts, leader lines, comparison tables, and testimonials are added in HTML — never in the Higgsfield prompt. Higgsfield's text rendering is unreliable; the HTML layer is what keeps the set pixel-perfect.

## Token discipline
60–100 words per prompt. Beyond ~100, Higgsfield drops the early instructions. If a frame needs more, split: imagery in Higgsfield, everything textual in HTML.

---

# Claims discipline (read before writing any copy)

Many DTC products are health/beauty/supplement adjacent. Keep the gallery compliant and chargeback-proof:
- **Describe, don't diagnose/cure.** "Designed to support comfortable sleep" ✓ · "Cures insomnia" ✗.
- **Felt experience over medical outcome.** "Wake up less stiff" framed as customer-reported ✓ · "Heals your spine" ✗.
- **Mechanism over miracle.** Explain what the product physically does; let the buyer infer benefit.
- **Only real numbers.** Ratings, review counts, "X sold", clinical percentages — only if the user can substantiate them.
- **No competitor names** in comparisons — "ordinary [category]".
- When unsure, soften the verb ("helps", "supports", "designed to") and add the implicit "results vary." This protects the user's Meta ad account and Shopify store as much as the buyer.

---

# Common pitfalls

- **Hallucinating the product.** The #1 failure for physical goods. Always composite the real cut-out; generate the product only when there's no photo, and flag it.
- **Brand drift.** Every frame derives colors/fonts/shapes from `brand-kit.json` + `brand.css`. The moment you eyeball a hex on frame 6, the set falls apart. New color? Add it to the kit first.
- **Fabricating proof or specs.** Placeholders, never invention. This is the contract.
- **Putting text in Higgsfield prompts.** Anything with a specific number, claim, name, or spec belongs in the HTML overlay.
- **Crossed/rotated leader lines on frame 6.** Keep labels horizontal; route lines so they don't overlap.
- **Skipping the swatch approval and the contact sheet.** Two cheap checks that prevent expensive rework.
- **Fonts falling back to Times.** If type looks wrong, the `@font-face` path or `fc-cache` step was skipped — fix before screenshotting.

---

# When the user is iterating

Single frame redo → read `brand-kit.json` + `product-facts.json`, regenerate only that frame's HTML (and base image if needed), rewrite that one PNG, and tell the user which frame changed so they re-upload just one.

Brand-kit change (new palette/font) → regenerate `brand.css` and re-screenshot all 9; reuse the product cut-out and Higgsfield bases.

New product, same brand → reuse the brand kit, build a fresh `product-facts.json` and a new cut-out. This is where the skill compounds: once a brand kit exists, every future product page is a 10-minute job.
