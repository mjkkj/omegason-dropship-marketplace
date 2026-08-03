---
name: ads-landing-builder
description: Build a complete, ads-ready landing page HTML from any product input (URL, name, or images). Use this skill when the user asks to create a landing page, LP, hoặc trang đích for Meta Ads (Facebook/Instagram) cold traffic, with Buy Now as the conversion goal. Output is a single self-contained HTML file using the Hybrid Modular skeleton (10 blocks) — optimized for CR and AOV. Triggers include "build landing page", "tạo landing page", "create LP for [product]", "trang bán hàng cho [sản phẩm]", or any request to generate a sales page from a product link.
version: 1.0
language: English (LP copy) / Vietnamese (agent reasoning)
---

# ads-landing-builder

## 1. SKILL NAME

**ads-landing-builder** — Product-to-Landing-Page Forge for Meta Cold Traffic

---

## 2. CORE GOAL

Generate a **single-file, conversion-optimized HTML landing page** from any product input. The landing page must be:

- **Self-contained** — single `.html` file, inline CSS, no framework/dependency, paste-and-deploy
- **Ads-ready** — built for Meta cold traffic (Facebook/Instagram), with one conversion goal: **Buy Now**
- **CR + AOV optimized** — clear hero, multiple CTAs, sticky mobile CTA, 3-tier bundle pricing
- **Mobile-first** — passes responsive checks at 375px, 380px, 768px breakpoints
- **Trust-loaded** — social proof, reviews, guarantees, FAQ — all in context with action
- **Honest** — no fabricated numbers, no fake urgency, no unverified claims

---

## 3. WHEN TO USE

### ✅ Trigger this skill when:
- User pastes a product URL (Amazon, AliExpress, Shopify, etc.) and asks for a landing page
- User describes a product and asks to build an LP / sales page / ad funnel page
- User mentions: "landing page", "LP", "trang đích", "sales page", "trang bán hàng", "Meta ads page", "ad funnel"
- User is preparing to run Meta Ads (Facebook/Instagram) and needs the destination page

### ❌ Do NOT use this skill for:
- PDP description blocks on existing Shopify (→ use `audit-to-des-html`)
- Meta Ads creative/hook testing (→ use `hook-tester`)
- Full brand strategy or brand kit (→ use `brand-builder`)
- Niche research and product hunting (→ use `niche-hunter`)
- Email design, advertorial-only pages, lead-gen pages (different format)
- B2B / SaaS landing pages (different conversion logic — this skill is DTC e-commerce specific)

---

## 4. INPUTS REQUIRED

### Mandatory (must have at least one):
- Product URL (Amazon, AliExpress, Shopify, Etsy, etc.)
- Product name + 1-2 images (URL or upload)
- Product description (3-5 lines minimum)

### Optional (improves output quality):
- Target market (default: US English unless specified)
- Target audience (if known — skill will infer if blank)
- Price point Mike wants to sell at (skill will use MSRP or research if blank)
- Brand voice / tone (default: confident, casual, witty)
- Checkout URLs / Shopify store links (placeholder used if not provided)
- Specific angle preference (otherwise skill picks based on persona)
- Custom color palette (default: neutral with high-converting orange CTA)

### Important note on URL fetching:
- Many product pages (Amazon, AliExpress, Fanttik official, etc.) **block automated scraping**
- If `web_fetch` fails → use `web_search` with product name + ID to gather context
- If still missing key data → ask user for: name, price, 2-3 images, 1-line description

---

## 5. EXECUTION PROCESS (Phase 1 → 6)

### PHASE 1 — INTEL GATHERING

**Step 1: Product Decode**
- Try `web_fetch` on the URL. If blocked → `web_search` with product name + ID
- Extract: name, category, core function, key specs, differentiators, price range, available images
- Output: Internal product brief (1 paragraph)

**Step 2: Audience Mapping**
- Infer the single primary buyer persona for Meta cold traffic
- Build: demographics, psychographics, current alternative (what they do today), trigger moment, awareness level (default: problem-aware, solution-unaware)
- Output: 5-bullet persona profile

**Step 3: Angle Selection**
- Pick ONE archetype from the table below
- State the choice + 1-paragraph reasoning explicitly
- **CHECKPOINT:** Briefly show the angle to user before building (allow veto)

#### Angle Archetypes:

| Archetype | Use when |
|---|---|
| **Problem Agitation** | Pain is daily/visible; audience suffering now |
| **Us vs Them** | Strong competitor or "old way" exists to contrast against |
| **Identity / Aspiration** | Product is tied to who they want to become |
| **Social Proof Takeover** | Product has real traction, reviews are the strongest asset |
| **Discovery / Curiosity** | Product is novel, mechanism unfamiliar, requires education |

---

### PHASE 2 — PAGE ARCHITECTURE

**Step 4: Skeleton Mapping**
- Apply the **Hybrid Modular Skeleton** (10 blocks below) by default
- Tune block weight/length based on angle (see angle tuning notes)

#### The 10-Block Hybrid Modular Skeleton:

```
[1] ANNOUNCEMENT BAR      → Urgency or value framing (NOT fake countdown)
[2] HERO SECTION          → Headline + subhead + primary CTA + hero image + trust micro
[3] SOCIAL PROOF BAR      → Star rating + reviews + guarantees + shipping
[4] PROBLEM BLOCK         → Agitate pain — what's NOT working today
[5] SOLUTION REVEAL       → Product as answer (visual-heavy, not salesy)
[6] HOW IT WORKS          → 3-4 key features or modes
[7] PROOF STACK           → Reviews with name + location + verified badge
[8] COMPARISON BLOCK      → vs. competitor / vs. old way (table format)
[9] OFFER BLOCK           → 3-tier bundle: single / popular / best-value
[10] FAQ + FINAL CTA      → Objection handling + last push
+ STICKY MOBILE CTA       → Always-visible bottom bar on mobile
+ FOOTER                  → Trust links (privacy, returns, contact)
```

#### Angle-based tuning:
- **Problem Agitation** → Block 4 is longer/darker; Block 8 minimal
- **Us vs Them** → Block 8 is centerpiece (larger table, more rows)
- **Identity** → Block 2 + 5 visual-heavy; Block 7 uses aspirational quotes
- **Social Proof** → Block 3 + 7 expanded; rating shown 4+ times
- **Discovery** → Block 6 expanded into mini-advertorial format

---

### PHASE 3 — COPY ENGINE

**Step 5: Hero Headline Writing**
- Apply formula: `[Outcome] + [Timeframe/Ease] + [Without sacrifice]`
- Generate 2-3 variants, pick strongest
- Sub-headline formula: `[Current pain] → [Mechanism] → [New reality]`

**Step 6: Full Copy Per Block**
- Maintain chosen angle through every block (do not drift)
- Each block ends with micro-hook pulling reader down
- CTA text: never generic "Buy Now" — gear to outcome ("Get My V10 — From $79.99")
- Reviews: realistic, has name + location + specific detail (avoid generic praise)
- FAQ: 5-6 questions covering shipping, returns, results, comparison, edge cases

---

### PHASE 4 — BUILD

**Step 7: Asset Collection**

Priority order for images:
1. ✅ Direct image URLs provided by user → use as-is
2. ✅ User-uploaded files → reference from path
3. ⚠️ Image URLs from search → only if verified clickable/embeddable
4. ⚠️ Product CDN URLs (Amazon, Shopify) → DO NOT GUESS or hardcode unverified URLs
5. ✅ Fallback → use `placehold.co/[size]/F7F7F5/0F0F0F/png?text=[Product+Name]` with clear `⚠️ SWAP` HTML comment

**Critical rule:** Never hardcode image URLs you cannot verify exist. Default to clear placeholder with swap instructions.

**Step 8: HTML Build**

Technical spec (non-negotiable):
- Single `.html` file
- All CSS inline in `<style>` block (no external stylesheets)
- Google Fonts only (Inter recommended)
- Mobile breakpoints: 768px, 380px (and 375px sanity check)
- No JavaScript dependency (FAQ uses `<details>` element)
- Sticky bottom CTA on mobile (`position:fixed`)
- Color palette derived from product/category — never default blue-and-white
- All `[CHECKOUT_URL_*]` placeholders clearly marked
- All `<!-- ⚠️ SWAP -->` image comments clearly marked
- All `[REVIEW_COUNT]` / `[RATING]` placeholders clearly marked if real numbers unknown

#### Recommended default color palette (override per product):
```css
--bg: #FFFFFF
--bg-alt: #F7F7F5
--bg-dark: #0F0F0F
--text: #1A1A1A
--text-muted: #6B7280
--accent: #FF5722  (high-converting orange)
--accent-dark: #E64A19
--success: #10B981
--star: #FFB800
--border: #E5E5E5
```

---

### PHASE 5 — QA

**Step 9: Self-QA Checklist (must pass all)**

```
CONVERSION
□ Hero headline communicates benefit in 3 seconds
□ Primary CTA appears 4+ times across page
□ Sticky mobile CTA works
□ Offer block has 3-tier bundle (drives AOV)
□ Urgency/scarcity present but NOT FAKE (no "Today Only" if not true)

TRUST
□ Social proof visible above-fold or just below hero
□ FAQ covers at minimum: shipping, returns, results, comparison
□ No claims unsupported by proof (no fabricated review counts)
□ Guarantee mentioned 3+ times (hero, offer, final)

TECHNICAL
□ Layout works at 375px width
□ All images have alt text
□ All placeholders clearly marked (CHECKOUT_URL, SWAP, REVIEW_COUNT)
□ Page works without JS (pure HTML/CSS)
□ Single file, no dependencies

HONESTY (CRITICAL — see Section 9)
□ No fabricated review counts/ratings
□ No fake urgency ("Today Only" without actual deadline)
□ No unverified image URLs hardcoded
□ Brand name correct (or marked as placeholder)
```

---

### PHASE 6 — DELIVERY

**Step 10: Output Package**

Deliver in this exact format:

```
[A] ANGLE BRIEF (1 block, ~5-7 lines)
    - Product: [name]
    - Persona: [primary buyer profile]
    - Angle: [archetype + reasoning]
    - Hero headline: [chosen H1]
    - 1 A/B test recommendation

[B] HTML FILE
    - Saved to /mnt/user-data/outputs/landing-[product-slug].html
    - Presented via present_files tool

[C] QUICK SWAP GUIDE (checklist of placeholders)
    - List all [CHECKOUT_URL_*] occurrences
    - List all ⚠️ SWAP image comments
    - List all [REVIEW_COUNT] / [RATING] placeholders
    - Brand name location (if not Mike's own brand)
```

---

## 6. OUTPUT STANDARDS

### Format
- ✅ Single self-contained `.html` file
- ✅ Saved to `/mnt/user-data/outputs/landing-[slug].html`
- ✅ Presented via `present_files` tool
- ❌ Never deliver as raw text in chat (too long, not testable)

### Length & Density
- Target: 600–900 lines of HTML
- Hero section: ≤ 5 sentences total above the fold (mobile)
- FAQ: 5–6 items
- Reviews: 3 items in proof stack
- Comparison: 5–7 rows

### Style
- LP copy in English (US market default) unless user specifies otherwise
- Tone: confident, casual, occasional wit (no corporate-speak)
- Sentence case in all headings (no Title Case, no ALL CAPS for body)
- Sentences ≤ 25 words on average
- Active voice throughout

### Color Contrast
- Body text on background: ≥ 7:1 (WCAG AAA)
- CTA button: high-saturation accent color, never gray/muted

---

## 7. SELF-CHECK PROTOCOL

After building, run this **before final delivery**:

### Pass 1 — Goal Alignment
Ask explicitly:
- Does this LP serve Meta cold traffic? (Yes / No)
- Is "Buy Now" the only conversion path? (Yes / No)
- Are CR and AOV both optimized? (Yes / No)
- Could user paste this file and run an ad to it tomorrow? (Yes / No)

If any answer is No → fix before delivery.

### Pass 2 — Honesty Audit
Search the file for these red flags:
- `Today Only` / `Last Day` / `Expires Today` (without real deadline)
- Specific review counts that weren't verified
- Star ratings that weren't verified
- Hardcoded product image URLs (Amazon CDN, Shopify CDN) without verification

If any red flag found → replace with placeholder + clear comment.

### Pass 3 — User-Reportable Issues
Be transparent with user about:
- Any placeholders they must fill before launching
- Any data points (price, reviews, images) that were assumed
- Any limitations of the current build

---

## 8. EXAMPLE I/O

### Sample Input:
```
User: "Build a landing page for this product:
https://www.amazon.com/Fanttik-Slim-V10-Cordless-Keyboards/dp/B0DXVJ5Y39/"
```

### Expected Agent Process:

**Phase 1:**
- Try `web_fetch` → blocked by Amazon robots.txt
- `web_search` "Fanttik Slim V10 APEX Cordless vacuum specs price"
- Extract: 4-in-1 mini vacuum, 19,000Pa suction, 1.1lb, $89.99 sale ($109.99 MSRP), 10 attachments
- Persona: US daily driver 28-45, hates car mess, skeptical of mini vacuums
- Angle: **Us vs Them** (vs gas station vacuum, vs Dyson, vs cheap mini vacuums)

**Phase 2-3:**
- 10-block skeleton with Block 8 (Comparison) enlarged
- Headline: "Finally, a Car Vacuum That Actually Sucks." (double-meaning intentional)

**Phase 4:**
- 2 product images → placehold.co fallback (Amazon URLs not verifiable)
- Single HTML file at `/mnt/user-data/outputs/landing-fanttik-v10-apex.html`

**Phase 5:**
- QA all 12 checklist items pass
- Honesty audit: 4 placeholder swaps documented

**Phase 6:**
- Angle brief + file + swap guide delivered

### Expected Output Structure:
```
📋 ANGLE BRIEF
Product: Fanttik V10 APEX (mini cordless vacuum, $89.99)
Persona: US car owner 28-45, daily commuter, pet owner
Angle: "Us vs Them" — The Gas Station Vacuum Killer
Headline: "Finally, a Car Vacuum That Actually Sucks."
A/B test next: Variant with "out-sucks a Dyson" comparison

[FILE: landing-fanttik-v10-apex.html — 850 lines]

🔧 QUICK SWAP GUIDE:
1. [CHECKOUT_URL_SINGLE/BUNDLE/2PACK] — 3 buy buttons
2. ⚠️ SWAP comments — 2 product images
3. [REVIEW_COUNT] + [RATING] — 4 occurrences
4. Brand name "Fanttik" — title + footer (if reseller)
```

---

## 9. CRITICAL DON'TS (Lessons Learned)

### ❌ Don't fabricate review counts or ratings
**Bad:** Hard-coding "8,247 verified reviews" without source
**Good:** `[REVIEW_COUNT] verified reviews` + comment explaining user must replace
**Why:** Misleading claims violate Meta Ads policy and can get accounts banned

### ❌ Don't fake urgency
**Bad:** "FLASH SALE — Today Only" when there's no actual countdown logic
**Bad:** "Only 3 left in stock" without inventory connection
**Good:** "Save $20 when you bundle" — value framing, true to offer
**Why:** Plan explicitly says "urgency không fake"; user trust collapses on detection

### ❌ Don't hardcode unverified image URLs
**Bad:** `<img src="https://m.media-amazon.com/images/I/61jXqLwK45L...">` when you don't know if this URL exists for this product
**Good:** `<img src="https://placehold.co/600x600/F7F7F5/0F0F0F/png?text=Product+Name">` + `<!-- ⚠️ SWAP -->` comment
**Why:** Wrong image displayed = ad rejected or terrible CR

### ❌ Don't write in Title Case or ALL CAPS body
**Bad:** "Get The Best Vacuum Today"
**Good:** "Get the best vacuum today"
**Why:** Title Case feels corporate; sentence case feels human and converts better

### ❌ Don't write generic "Buy Now" CTAs
**Bad:** `<button>Buy Now</button>`
**Good:** `<button>Get My V10 APEX — $89.99 →</button>`
**Why:** Specificity + outcome + price = much higher click-through

### ❌ Don't skip the mobile breakpoint test
**Why:** ~80% of Meta traffic is mobile. If 375px is broken, the entire ad spend is wasted.

### ❌ Don't drift angle mid-page
**Bad:** Hero is "Us vs Them", but Block 5 sounds like Identity, Block 7 sounds like Discovery
**Good:** Every block reinforces the same single angle
**Why:** Coherent narrative converts; mixed narrative confuses

### ❌ Don't over-design with too many sections
**Bad:** Adding 13 blocks because "more proof = better"
**Good:** Stick to the 10-block skeleton (max +2 if specifically justified)
**Why:** More blocks = more cognitive load = more drop-off; LP is not a website

### ❌ Don't ask multiple questions before starting
**Bad:** 5 clarifying questions before any work
**Good:** Make reasonable assumptions, state them explicitly, build, iterate
**Why:** User wants velocity; explicit assumptions are auditable

### ❌ Don't skip self-evaluation
**Why:** Every LP has at least 2-3 fixable issues on first build. Self-eval catches them before user does.

---

## 10. INVOCATION TEMPLATE

When user invokes this skill, follow this conversation flow:

```
1. RECEIVE: Product URL or description from user

2. PHASE 1 — INTEL (work silently, present briefly):
   - Fetch / search product data
   - If insufficient → ask 1 consolidated question (not 5)

3. PHASE 1 — ANGLE CHECKPOINT (single user-facing pause):
   "I've decoded the product. Here's my angle proposal:
   [Persona | Angle | Headline | Reasoning in 5 lines]
   Confirm to proceed, or veto and I'll re-pick."

4. PHASE 2-6 — BUILD (work silently, present final):
   - Skeleton + Copy + Assets + HTML + QA
   - Save file, present, deliver swap guide

5. SELF-EVALUATE (after delivery):
   - Run honesty audit
   - Surface any placeholders user must fill
   - Recommend 1 A/B test for v2
```

---

## 11. VERSION & MAINTENANCE

- **v1.0** — Initial release, based on Hybrid Modular skeleton for Meta cold traffic DTC
- **Future v1.1 candidates:**
  - Variant selector UI (color, size) integrated
  - Klaviyo email capture popup variant
  - Quiz-funnel skeleton as alternative to Hybrid Modular
  - Multi-language support (VN, ES, DE)
  - Programmatic CSS palette extraction from product image
  - Klaviyo / Shopify checkout deep-link automation

---

## 12. RELATED SKILLS

This skill works well in sequence with:
- **niche-hunter** → identify the niche → use this skill to build LP
- **hook-tester** → use this skill to build LP → test hooks driving to it
- **audit-to-des-html** → for editorial description blocks INSIDE Shopify PDP (different deliverable)
- **brand-builder** → for full brand strategy that informs LP voice

This skill is the **execution endpoint** for Meta Ads cold traffic — pairs with strategic / research skills upstream.

---

**END OF SKILL**
