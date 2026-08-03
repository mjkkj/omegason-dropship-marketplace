---
name: brand-builder
description: >
  Build a complete, investor-grade brand kit for any DTC e-commerce brand — from strategy through 9-month execution plan — delivered as structured .md files. Use this skill whenever the user asks to: build a brand, create brand strategy, develop brand guidelines, create a go-to-market plan, build a brand kit, write a brand playbook, plan a brand launch, create a DTC brand plan, or any request involving comprehensive brand building for an e-commerce or Shopify brand. Also trigger when user mentions: brand identity, brand positioning, brand voice guidelines, visual identity, content strategy + brand, launch plan, or "build me a brand from scratch." This skill works for ANY product category, ANY market — not just lingerie — by adapting research, positioning, and execution to the target niche.
---

# Brand Builder — Complete DTC Brand Kit Generator

## What This Skill Does

This skill guides you through building a **complete, execution-ready brand kit** for a DTC (direct-to-consumer) e-commerce brand. The output is 9 interconnected .md documents that together form a comprehensive brand playbook — from brand DNA through monthly action plans.

The skill is modeled on a proven methodology that combines market research, strategic positioning, and detailed execution planning. It treats brand-building not as an abstract exercise but as a business system: every brand decision connects to a revenue outcome.

## When to Use This Skill

Use when a user needs to build a brand from scratch or create a comprehensive brand strategy document set. The user typically provides: a brand name, a product category, a target market, a budget, and team size. The skill fills in everything else through research, strategic thinking, and structured planning.

## The 9 Deliverables

Every brand kit produces these 9 files, in this dependency order:

```
01-brand-strategy.md        → Foundation: why the brand exists, for whom, against whom
02-brand-voice-messaging.md → How the brand speaks, what it says, to whom
03-visual-identity.md       → How the brand looks (described for designer execution)
04-content-strategy.md      → What content to create, where, how often
05-go-to-market-plan.md     → Phased roadmap with monthly milestones
06-paid-ads-strategy.md     → Ad structure, audiences, creatives, scaling rules
07-seo-strategy.md          → Keywords, content hubs, technical checklist
08-email-marketing.md       → Automated flows, campaigns, segmentation
09-action-plan-team.md      → Who does what, KPI dashboard, contingency plans
```

Dependencies flow top-down: each file builds on the ones above it. Files 06-08 can be written in parallel since they're independent of each other.

---

## The Process: 5 Phases

### PHASE 1: DISCOVERY (Gather Requirements)

Before writing anything, you need 5 pieces of information from the user. Ask these as focused questions — don't proceed until you have clear answers:

**Question 1: Product & Customer**
What product/category? Who is the target customer (demographics, psychographics)? What need does the brand fulfill? Is this pre-launch or existing?

**Question 2: Brand Relationships**
Is this brand standalone or part of a portfolio? Does it need to relate to existing brands?

**Question 3: Scope of Deliverables**
Confirm the user wants the full 9-file kit, or identify which components they need. Some users only need strategy (files 01-03), others need the full execution plan.

**Question 4: Channels & Market**
Where will they sell (Shopify, Amazon, retail)? Which market (US, EU, global)? Which marketing channels (Meta Ads, TikTok, SEO, email)?

**Question 5: Resources**
Monthly marketing budget? Team size and roles? ROAS or revenue targets?

After receiving answers, synthesize into a **"Core Work & Target Outcomes"** summary — a concise brief that both you and the user confirm before proceeding. This prevents scope drift later.

**Example Core Work & Target Outcomes format:**

```
Brand: [Name] — [category] brand, positioned as [positioning], target [demo], market [geo].
Channels: [platform] → [marketing channels]. Budget $[X]/month, ROAS target [X]. Team [X] people.
Deliverables: [list of 9 files or subset]
```

---

### PHASE 2: RESEARCH (Market Intelligence)

Conduct web research across 3-4 parallel searches before proposing any strategy. The research informs every downstream decision — don't skip it.

**Research queries to run (adapt to the specific niche):**

1. **Market landscape:** "[category] market trends [current year] [target market] DTC brands growth"
2. **Competitor positioning:** "[top 3-5 competitor names] brand strategy positioning [current year]"
3. **Target customer behavior:** "[category] [target demo] buying behavior marketing strategy"
4. **Niche-specific opportunity:** "[unique angle the brand might own] [category] positioning strategy"

**What to extract from research:**
- Market size and growth rate
- Key competitors and their positioning (map them on a 2×2 grid)
- Whitespace / unoccupied positioning territory
- Customer behavior patterns and purchase triggers
- Price benchmarks across the market

**Output:** A research summary (shared with user) that identifies the strategic opportunity — the gap in the market that this brand can own.

---

### PHASE 3: APPROACH SELECTION (Strategic Direction)

Based on research, propose **2-3 distinct strategic approaches** for the brand. Each approach should include:

- **Core idea:** The brand's central narrative in one sentence
- **Go-to-market logic:** How the brand enters the market and sequences its growth
- **Pros:** Why this approach could win
- **Cons:** What could go wrong

Present these to the user for discussion. The user picks one (or asks for a hybrid). This becomes the **locked strategic direction** that guides all 9 documents.

This step matters because it prevents the most common brand-building failure: writing documents that drift between multiple strategies instead of committing to one coherent approach.

---

### PHASE 4: PLANNING (Execution Blueprint)

Before writing any documents, create a detailed plan that maps each of the 9 files to:

- **What it contains** (specific sections and components)
- **Input data** (what information feeds into it)
- **Output** (what the finished document delivers)
- **Dependencies** (which files must be completed first)

Share this plan with the user for approval. This prevents having to rewrite documents because the scope was wrong.

**Document dependency chain:**

```
File 01 (Strategy)
  → File 02 (Voice) — needs positioning, personas, values from 01
    → File 03 (Visual) — needs voice attributes from 02
      → File 04 (Content) — needs voice, visual, personas from 01-03
        → File 05 (GTM) — needs everything from 01-04
          → Files 06, 07, 08 (parallel) — need GTM phases from 05
            → File 09 (Action Plan) — synthesizes everything from 01-08
```

---

### PHASE 5: EXECUTION (Write the Documents)

Write all 9 documents following the templates in `references/document-templates.md`. Key execution principles:

**Consistency enforcement:** Every document must reference and align with the chosen strategic approach. If the approach says "lead with gift buyers," then the content strategy, ad strategy, email flows, and team assignments must all reflect that — not default to generic best practices.

**Specificity over generality:** Don't write "create engaging content." Write "Post 4-5 times/week on Instagram: 25% product, 30% gift guides, 25% lifestyle, 15% UGC, 5% BTS." Every recommendation should be specific enough that the team can execute it without asking "but what exactly do we do?"

**Numbers everywhere:** Include specific targets, budgets, timelines, and KPIs. A brand plan without numbers is a wish list. Budget splits should add up to 100%. Revenue projections should connect to ad spend × ROAS. Monthly KPIs should ladder up to 9-month goals.

**Write in batches:** Files 01-02 first (they're foundational). Then 03-04 (they depend on voice/strategy). Then 05 (synthesizes everything). Then 06-07-08 in parallel. Then 09 last.

---

### PHASE 5B: SELF-AUDIT (Quality Gate)

After completing all documents, perform a mandatory self-audit against the original Core Work & Target Outcomes. Check every deliverable against 5 criteria:

1. **Approach alignment:** Does this document reflect the CHOSEN approach, not a different one?
2. **Completeness:** Does it contain everything promised in the plan?
3. **Internal consistency:** Do numbers, personas, and strategies match across all 9 files?
4. **Specificity:** Could a team execute this tomorrow without asking clarifying questions?
5. **Uniqueness:** Does this read like it was written for THIS brand, or could you swap in any brand name?

If any document fails any criterion, identify the specific issue, fix it, and re-verify. Present the audit results to the user as a transparency measure — it builds trust.

**Common audit failures to watch for:**
- Persona priority doesn't match approach (e.g., approach says "lead with Him" but personas list "Her" as primary)
- Content/ad budget splits don't reflect the strategic priority
- Hero product or key differentiator is mentioned as a footnote instead of being central
- Known risks of the chosen approach aren't addressed with mitigation strategies
- Generic advice that could apply to any brand (lacks niche-specific insight)

---

## Document Quality Standards

### File 01: Brand Strategy
Must include: purpose statement, mission, vision, 3-5 core values (with explanations, not just words), positioning statement (using the For/Who/Is/That/Unlike/Because framework), competitive positioning map (visual text diagram), 2+ detailed customer personas (with psychographics, pain points, purchase triggers, discovery channels), price architecture with tiers and rationale, and brand promise.

### File 02: Brand Voice & Messaging
Must include: 3 voice attributes (with behavioral examples for each), tone spectrum showing how voice adapts across channels, 3-4 messaging pillars with variations, tagline options with pros/cons analysis, do's & don'ts with specific example sentences, messaging frameworks per persona per funnel stage, power words list and banned words list, and writing templates for key content types (social, email, ads, product descriptions).

### File 03: Visual Identity
Must include: primary + secondary + neutral color palette with hex codes and usage ratios, typography stack with specific font recommendations and hierarchy rules, photography direction (mood, lighting, model direction, cropping, do's & don'ts), packaging concept, social media grid pattern, logo direction brief (for designer), brand textures/patterns, and website visual direction.

### File 04: Content Strategy
Must include: 4-5 content pillars with percentage allocation, platform-by-platform strategy (purpose, frequency, format), weekly content rhythm template, monthly content themes mapped to 9 months, content type templates (carousel, reel, blog, email), UGC strategy, production workflow with team assignments, and content KPIs by month.

### File 05: Go-to-Market Plan
Must include: phased roadmap (typically 3 phases across the timeline), month-by-month actions for each channel (ads, content, email, SEO, PR), budget allocation per month, revenue targets per month (conservative/target/optimistic), pre-launch checklist, decision checkpoints with go/adjust/pivot criteria, risk & mitigation table, and financial summary.

### File 06: Paid Ads Strategy
Must include: budget allocation by phase and funnel stage, campaign architecture diagram with naming convention, audience strategy (prospecting + retargeting + retention) per persona, ad funnel with creative concepts per stage (including specific hooks, body, CTA), creative testing framework and cadence, scaling rules (when to increase, decrease, kill), KPI targets by phase, and platform policy compliance notes.

### File 07: SEO Strategy
Must include: 4-5 keyword clusters with estimated volume/difficulty/intent, priority keyword list (top 30), on-page SEO playbook (title tag, meta, H1, URL templates), content hub architecture (pillar + cluster model), blog content calendar for entire timeline, technical SEO checklist, link building plan (10 tactics), and monthly SEO KPIs.

### File 08: Email Marketing
Must include: list building tactics (5+), segmentation strategy, 5-7 automated flows (each with email count, timing, subject line, content brief, CTA), campaign calendar mapped to seasonal events, email design guidelines, A/B testing plan, and email KPIs vs. industry benchmarks.

### File 09: Action Plan & Team Assignment
Must include: team role matrix (who does what, weekly deliverables), weekly meeting rhythm, monthly KPI dashboard with specific targets per month, budget breakdown by category and phase, tool stack with costs, timeline/Gantt chart, decision checkpoints with detailed criteria, contingency plans for top failure scenarios, and reporting cadence with templates.

---

## Adapting to Different Niches

This skill works for any DTC brand. The research phase is what makes each output unique. Here's how to adapt:

**Different product categories:** Change research queries, competitor set, and keyword clusters. A skincare brand researches different competitors than a pet food brand, but the 9-document structure remains identical.

**Different markets:** Adjust price points, cultural references, platform preferences (e.g., LINE for Japan, WeChat for China), and regulatory considerations.

**Different budgets:** Scale the plan accordingly. A $10K/month budget gets a simpler ad structure and heavier organic focus. A $500K/month budget gets multi-platform paid strategy and dedicated team roles.

**Different team sizes:** Solo founder? Combine roles and simplify the weekly rhythm. 20-person team? Add specialization and approval workflows.

**B2B vs. B2C:** Adjust personas (buyer vs. user), channels (LinkedIn vs. Instagram), content types (whitepapers vs. reels), and sales cycle assumptions.

---

## Output Format

All files are written as .md (Markdown) and saved to a dedicated folder (e.g., `[BrandName]-Brand/`) in the user's workspace. Each file follows this header convention:

```markdown
# [BRANDNAME] — [Document Title]

> **Document version:** 1.0
> **Date:** [Date]
> **Foundation:** [Which previous documents this builds on]
> **Approach:** [The chosen strategic approach name]

---

[Content follows]
```

---

## Common Mistakes to Avoid

1. **Writing generic documents.** Every section should feel like it was written specifically for this brand, this market, this customer. If you could swap the brand name and the document still works, it's too generic.

2. **Defaulting to "Her as primary" for fashion/beauty.** The approach selection should determine persona priority — not category assumptions. If the approach says "lead with gift buyers," the Him persona leads.

3. **Treating the hero product as an afterthought.** Whatever the brand's key differentiator is (e.g., a gift box, a subscription, a customization tool), it should be prominent in strategy, content, ads, email, and action plan — not buried in a bullet point.

4. **Ignoring the chosen approach's weaknesses.** Every approach has known risks. The GTM plan must address them with specific mitigation strategies, not just acknowledge them.

5. **Budget math that doesn't add up.** Monthly allocations should sum to the total budget. Revenue projections should connect logically to ad spend × ROAS. Team assignments should match available headcount.

6. **Skipping the self-audit.** The audit phase catches ~70% of alignment issues. Never skip it.
