---
name: hook-tester
description: >
  Build a complete Meta Ads hook testing system for any DTC e-commerce brand — from hook library through testing framework to tracking dashboard — using the Angle-First Isolation methodology. Use this skill whenever the user asks to: test ad hooks, build a hook library, create a Meta Ads testing framework, optimize ad creatives, find winning hooks, test ad angles, build a creative testing system, or set up A/B testing for Facebook/Instagram ads. Also trigger when user mentions: hook testing, ad creative testing, Meta Ads optimization, finding winning creatives, ad angle testing, creative iteration framework, kill/scale rules for ads, or "help me find what works in my ads." This skill works for ANY DTC product category, ANY market — it adapts hook angles, creative formats, and testing parameters to the target niche and budget.
---

# Hook Tester — Meta Ads Hook Testing System Generator

## What This Skill Does

This skill guides you through building a **complete, execution-ready hook testing system** for Meta Ads. The output is 2 interactive deliverables + 1 reusable skill document:

1. **Hook Library** (React app) — 20-24 hooks organized by angle, each with full ad copy, creative briefs, captions, and editor notes
2. **Testing Framework + Tracking Dashboard** (React app) — 3-week testing plan with kill/scale rules, metric input, auto-recommendations, and final report
3. **Winning Hook Playbook** (generated after 3 weeks of live data) — confirmed winners ready to scale

The methodology is **Angle-First Isolation**: test psychological angles first (cheaper, faster insight), then drill into individual hooks within winning angles. This approach is optimized for budgets of $100-500/day.

## When to Use This Skill

Use when a user needs to:
- Find winning ad hooks/angles for Meta Ads (Facebook, Instagram)
- Build a structured creative testing system instead of random testing
- Create a hook library with coded hooks for performance tracking
- Set up kill/scale/hold/iterate rules for ad testing
- Design a 2-4 week testing sprint for ad creatives

The user typically provides: brand name, product category, target audience, daily test budget, current ad structure, creative assets available, pixel maturity, and KPI targets.

---

## The Process: 6 Phases

### PHASE 1: DISCOVERY (Gather Requirements)

Before building anything, collect these 5 inputs. Ask as focused questions — don't proceed until you have clear answers:

**Question 1: Product & Price**
What product/category? Average product price? AOV? Are you testing full catalog or specific hero products?

**Question 2: Budget & Structure**
Daily test budget? Current campaign structure (CBO, ABO, or none)? How experienced with Meta Ads?

**Question 3: Creative Assets**
What creative assets exist? (raw photos, videos, UGC, AI-generated) What needs to be created from scratch?

**Question 4: Pixel & Audience**
How mature is the pixel? (purchase events in last 30 days) Primary target audience? Geographic markets?

**Question 5: Success Metrics**
Which KPI is the primary decision metric? What are the specific thresholds? (CTR target, CPA ceiling, ROAS floor)

After receiving answers, synthesize into a **"Core Work & Target Outcomes"** brief:

```
Brand: [Name] — [category], avg price $[X], AOV $[X]
Target: [audience], [markets]
Budget: $[X]/day test, [structure]
Assets: [what's available]
Pixel: [maturity level, event count]
KPIs: CTR >[X]%, CPA <$[X], ROAS ≥[X]
Timeline: [X] weeks
Deliverables: Hook Library + Testing Framework + Tracking Dashboard
```

Get user confirmation before proceeding.

---

### PHASE 2: RESEARCH & APPROACH SELECTION

Present 2-3 testing approaches with pros/cons analysis. The three standard approaches are:

**Approach A: Wave Testing** — Sequential hook testing in waves, eliminating losers each round.
- Best for: Simple operation, clear decision points
- Weakness: Slower, tests fewer hooks total

**Approach B: Angle-First Isolation** (RECOMMENDED for most cases) — Test angle categories first, then drill into hooks within winning angles.
- Best for: Brands with defined customer psychology, $150-300/day budgets
- Weakness: Needs pre-built angle framework, first week has thin per-hook data

**Approach C: Hybrid DCT + ABO** — Dynamic Creative Testing for rough filtering, ABO for validation.
- Best for: High budgets ($300+/day), testing many hooks fast
- Weakness: Complex to manage, DCT reporting can be unreliable

Recommend Approach B (Angle-First) as default unless budget or context suggests otherwise. Get user to confirm approach before building.

### Adapting Angle-First to Any Niche

The 4 angles must be customized per niche. Use this framework to derive angles:

```
Step 1: Identify the PRIMARY BUYER (who pays) vs. PRIMARY USER (who uses)
Step 2: Map the buyer's 3-4 core psychological motivations for purchasing
Step 3: Translate each motivation into a content angle
Step 4: Create hook formulas for each angle
```

**Example angle mappings by niche:**

| Niche | Angle 1 | Angle 2 | Angle 3 | Angle 4 |
|-------|---------|---------|---------|---------|
| Lingerie (gift) | Visual Drive | Emotional Gifting | Exclusive Luxury | Novelty/Freshness |
| Skincare | Before/After Results | Expert Authority | Ingredient Science | Social Proof |
| Pet Food | Pet Health/Longevity | Convenience/Easy | Premium Quality | Community/Identity |
| Fitness Gear | Transformation | Performance Edge | Lifestyle/Identity | Value/Durability |
| Kids Products | Safety/Trust | Development Benefits | Ease for Parents | Social Proof |

---

### PHASE 3: PLANNING (Execution Blueprint)

Create a step-by-step plan with these 6 deliverable blocks:

| Step | Deliverable | Input | Output |
|------|-------------|-------|--------|
| 1 | Hook Library | Brand strategy, angles, product data | 20-24 coded hooks with full copy + briefs |
| 2 | Creative Brief Templates | Hook Library, available assets | Production-ready briefs per hook |
| 3 | Week 1 Framework | Budget, angles, audience | Campaign structure + angle-level rules |
| 4 | Week 2 Framework | W1 results, hook library | Hook-level test structure + rules |
| 5 | Week 3 Framework | W2 results | Validation structure + scale criteria |
| 6 | Tracking Dashboard | All hooks, KPI thresholds, rules | Interactive metric input + auto-recommendations |

Share plan with user for approval before executing.

---

### PHASE 4: EXECUTION — Hook Library (Steps 1-2)

Read `references/hook-library-template.md` for the complete hook data structure and example hooks.

#### Hook Library Structure

Each hook must contain ALL of these fields:

```
{
  id: "[ANGLE]-[##]",           // e.g., "VIS-01", "EMO-03"
  angle: "[ANGLE_KEY]",         // Maps to one of the 4 angles
  hookName: "Short Name",       // Human-readable identifier
  hookLine: "The actual hook",  // The 0-3s text/visual hook
  primaryText: "Full ad copy",  // Complete Meta Ads primary text
  headline: "Ad headline",      // Short headline for the ad
  format: "Video Reel 9:16",    // Recommended creative format
  risk: "LOW|MED|HIGH",         // Platform policy risk assessment
  visualBrief: "Full brief",    // Second-by-second production brief
  editorNotes: "Production notes", // Notes for the creative editor
  caption: "Organic caption",   // For organic social posting
  week: 1|2,                    // Which test week this hook enters
}
```

#### Hook Distribution Rules

- **20-24 hooks total**, evenly distributed across angles (5-6 per angle)
- **12 hooks for Week 1** (3 per angle) — these are priority hooks
- **8 hooks for Week 2** (2 per angle) — reinforcements for winning angles
- Each angle needs at least 2 different creative formats
- Risk rating: aim for 70%+ LOW risk hooks

#### Hook Quality Gates

Before finalizing, EVERY hook must pass these tests:

1. **Brand Voice Test:** Does the copy match the brand's established voice/tone?
2. **Buyer Test:** Would the target buyer want to purchase after seeing this?
3. **User Test:** Would the product USER feel respected (not objectified/patronized)?
4. **Policy Test:** Would Meta approve this? (check against platform guidelines)
5. **Price Test:** Are any prices mentioned accurate to the actual catalog?
6. **Specificity Test:** Could you swap in a competitor's name and the hook still works? If yes → too generic → rewrite.

If any hook fails any test, rewrite it before including in the library.

#### Creative Brief Requirements

Each brief must include:
- **Timestamp breakdown** (what happens at 0-3s, 3-10s, 10-20s, 20-30s for video)
- **Visual direction** (lighting, setting, camera angles, mood)
- **Text overlays** with exact copy
- **Audio direction** (music type, voiceover yes/no)
- **CTA placement and copy**
- **Technical specs** (dimensions, duration, format)

#### Output Format

Build as an interactive React (.jsx) app with:
- Filter by angle, by week, by search
- Expandable hook cards with tabbed sections (Brief, Ad Copy, Caption, Editor Notes)
- Color-coded by angle
- Brand-consistent design using the brand's color palette

---

### PHASE 5: EXECUTION — Testing Framework + Dashboard (Steps 3-6)

Read `references/testing-framework-template.md` for the complete framework structure.

#### Testing Framework Content

The framework must cover:

**Week 1 — Angle-Level Test:**
- Campaign structure diagram with naming convention
- Budget allocation per angle (equal split)
- Audience setup (identical across all angle ad sets)
- Angle-level kill/scale/hold rules with specific thresholds
- Decision matrix for end-of-week angle selection

**Week 2 — Hook-Level Deep Dive:**
- Budget reallocation scenarios (1 winner, 2 winners, no clear winner)
- Individual hook ad set structure
- Hook-level kill/scale/hold/iterate rules
- Iteration guidance (what to change when a hook has good CTR but bad CPA, etc.)

**Week 3 — Validate & Scale:**
- 3 variation types (format, audience, copy)
- Validation checklist (minimum days, minimum purchases, stability test)
- Scale readiness criteria
- Winning Hook Playbook structure

**Kill/Scale/Hold/Iterate Rules Template:**

Adapt these base rules to the user's specific KPIs:

```
KILL:
- CTR < [50% of target] after [budget = 1× target CPA] spend
- 0 conversions after [budget = 2× target CPA] spend
- Hook Rate < 20% (video only)

SCALE:
- CTR ≥ [target] AND CPA ≤ [target] AND ROAS ≥ [target]
- Stable for 2+ consecutive days
- Minimum 3 conversions

HOLD:
- CTR between [50%-100% of target] — promising but unproven
- CPA within 1.5× target — close but not there
- Insufficient conversion volume for confidence

ITERATE:
- High CTR but high CPA → change landing page/offer, keep creative
- High Hook Rate but low CTR → change CTA/text, keep hook visual
- Good metrics but unstable → extend test period, don't change
```

#### Dashboard Features

Build as an interactive React (.jsx) app with these tabs:

1. **Framework Tab:** All rules, structure, daily checklist (collapsible sections)
2. **Week 1 Tab:** Angle scoreboard + per-hook metric input + auto-recommendations
3. **Week 2 Tab:** Shows only active angles from W1 decisions + new hooks
4. **Week 3 Tab:** Shows only scale/iterate hooks from W2 + variation slots
5. **Final Report Tab:** Aggregate stats, angle rankings, confirmed winners list

Dashboard logic:
- 7 input fields per hook: Impressions, Reach, 3s Views, Link Clicks, Spend, Purchases, Revenue
- Auto-calculate: Hook Rate, CTR, CPA, ROAS
- Auto-recommend: SCALE / KILL / HOLD / ITERATE based on rules
- Color coding: green (scale), red (kill), blue (hold), yellow (iterate)
- Week-to-week flow: W1 angle decisions → W2 filters → W3 filters → Final Report

---

### PHASE 6: SELF-AUDIT (Quality Gate)

After completing both deliverables, perform a mandatory audit:

#### Audit Checklist

| Check | Question | Fix if failed |
|-------|----------|---------------|
| Brand alignment | Does every hook match the brand voice/tone/guidelines? | Rewrite mismatched hooks |
| Buyer/User respect | Would the buyer feel good? Would the user feel respected? | Remove objectifying/patronizing language |
| Price accuracy | Do all prices in ad copy match the actual catalog? | Correct prices |
| Policy compliance | Would Meta approve all hooks? Any HIGH risk? | Downgrade risk or rewrite |
| Copy length | Is primary text visible before "See more" on mobile? | Tighten long copy |
| KPI alignment | Do kill/scale rules use the user's confirmed thresholds? | Adjust rules |
| Internal consistency | Do hooks in the dashboard match hooks in the library? | Sync both files |
| Format diversity | Does each angle have 2+ creative formats? | Add variety |

If any check fails, fix it and re-verify. Present audit results to the user.

---

## Adapting to Different Niches

This skill works for ANY DTC brand. The angle research phase is what makes each output unique.

**Different product categories:** Change the 4 angles to match buyer psychology. A supplements brand has different purchase motivations than a jewelry brand.

**Different audiences:** Adjust voice, hook language, and cultural references. B2B hooks sound different from DTC consumer hooks.

**Different budgets:**
- $100-150/day: 3 angles instead of 4, fewer hooks per angle
- $150-300/day: Standard 4-angle framework (this skill's default)
- $300-500/day: Can add 5th angle or run more hooks simultaneously
- $500+/day: Consider Hybrid DCT+ABO approach instead

**Different markets:** Adjust language, cultural norms, platform preferences, and compliance rules.

**Different timelines:**
- 2 weeks: Compress to W1 (3 days) + W2 (4 days) + W3 (3 days)
- 3 weeks: Standard framework (5 days per week)
- 4 weeks: Extended W3 for more thorough validation

---

## Output Format

Two React (.jsx) files saved to the user's output directory:

```
hook-library.jsx               → Interactive hook library with full creative briefs
testing-framework-dashboard.jsx → Testing framework + tracking dashboard
```

Both files use the brand's color palette, typography, and design language for consistency.

---

## Common Mistakes to Avoid

1. **Writing generic hooks.** Every hook should be specific to the brand, product, and buyer. If you could swap the brand name and it still works, rewrite it.

2. **Objectifying the product user.** In gift-purchase categories (buyer ≠ user), hooks must respect both parties. The buyer is the hero, but the user is a person — not an object.

3. **Ignoring platform policy.** Meta rejects ads more than most platforms. Every hook needs a risk rating, and HIGH risk hooks need a LOW risk alternative.

4. **Inconsistent prices.** Any price in ad copy must match the actual catalog. Use "from $X" format when referencing ranges.

5. **Kill rules too slow.** At $200/day, every hour a dead hook runs costs $2-8. Kill rules should trigger at 1× target CPA spend, not 3×.

6. **Skipping the self-audit.** The audit catches brand misalignment, objectification, and price errors. Never skip it.

7. **Building the dashboard without flow logic.** W1 decisions must filter W2 display. W2 decisions must filter W3 display. Without this flow, the dashboard is just a spreadsheet.

8. **Subscription/feature assumptions.** Don't reference product features or pricing tiers (subscriptions, bundles) that haven't been confirmed by the user. If uncertain, add an editor note flagging it as a demand test.
