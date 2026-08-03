# Brief + Aesthetic reference

Used in **Phase 2**. Produces `brand-brief.md` and supplies aesthetic tokens reused by the outline (Phase 2) and the image/video prompts (Phase 3).

## Intake (Phase 2a) — what to ask the user

The pid gives you product facts, angle, buyer language, economics, compliance. Ask only what it can't:

1. **Brand name** (typed; placeholder only if they defer).
2. **Aesthetic direction** (select — first **derive 3 candidate token sets fitted to THIS brand/niche** using the guidance below, present them as the options + "I'll describe it").
3. **Hero PDP section scope** (select — `All sections (full)` / `Essential (~10)`).
4. **Optional notes** (typed): must-keep cues, competitors to echo/avoid, offer constraints, tone dials.

Do not proceed to 2b until brand name + aesthetic + scope are answered.

## brand-brief.md template

```
# Brand Brief — <Brand> (<pid>)

## One-liner
<Brand> helps <buyer> <core outcome> — <the winning angle in plain words>.

## Winning angle (from pid 06/07)
<one line — everything anchors here>

## Target buyer (from pid 05 / 00)
- Who: <demographic + situation>
- Trigger moment: <when they start looking>
- Pain (verbatim): "<from 05>"
- Desire (verbatim): "<from 05>"
- Top objection (verbatim): "<from 05>"

## Positioning & differentiation (from pid 02)
- Category we play in: <...>
- Gap we own: <...>
- Why us over the obvious alternative: <...>

## Voice & tone
- Feels like: <3 adjectives>
- We say / we don't say: <do / don't list>
- Reading level: plain, buyer's own words.

## Aesthetic direction
- Token set: <chosen set name>
- Mood: <one line>
- Tokens: <paste chosen block from below>

## Offer architecture (from pid 03)
- Single: <price>
- Bundle / AOV lever: <2-pack / 3-pack / bundle — price + framing>
- Anchor / discount logic: <...>

## Claim discipline (from pid 04 — NON-NEGOTIABLE)
- Tier: <compliance tier>
- Allowed framing: <comfort / look-feel / lifestyle — per tier>
- Banned: medical/treatment/cure claims; unproven stats as fact.
- Category labeling: <e.g. FTC "rayon from bamboo">
- Proof rule: all ratings/counts/studies are EDITABLE PLACEHOLDERS until real data exists.
```

## Aesthetic direction — derive 3 sets for THIS brand (no fixed menu)

Do **not** offer a canned list. Read the pid (00 category, 02 competitor gap, 05 buyer language) + the brief, then **generate exactly 3 candidate token sets tailored to this specific brand/niche/buyer**. They must be genuinely different directions (not three shades of one idea) so the choice is meaningful, and each must fit the product's category and claim tier.

How to derive them:
- **Read the buyer & moment** (05) → what mood earns their trust (calm? clinical? indulgent? playful?).
- **Read the gap** (02) → lean the look *away* from how the obvious competitor looks, toward the gap you own.
- **Respect the claim tier** (04) → health/supplement/device niches skew evidence-forward and restrained; gifting/apparel can skew desire-led; homeware can skew editorial/human.
- Keep each palette high-contrast and reduced-motion safe.

Present the 3 as the aesthetic options (+ an "I'll describe it" path). Each candidate uses this exact shape so it flows straight into the outline styling notes and PART C/D prompts:

```
### <set name — evocative, brand-specific>
- Palette: <base #hex>, <surface #hex>, <accent #hex>, <muted #hex>
- Type: <headline feel> + <body feel>
- Mood: <one line> — why it fits <this brand/buyer/niche>
```

Rules:
- Base the names and moods on THIS brand, not generic labels.
- Never auto-apply dark-neon health-tech (or any single house look) unless the niche genuinely fits.
- If the user picks "I'll describe it", capture their words as a 4th custom block in the same shape.
- Lock the chosen block verbatim into `brand-brief.md` → Aesthetic direction → Tokens.
