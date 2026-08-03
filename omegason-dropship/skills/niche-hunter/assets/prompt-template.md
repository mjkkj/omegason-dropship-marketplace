# Re-Runnable Prompt Templates

Đây là các prompt templates user có thể copy-paste để delegate skill cho AI Agent khác.

---

## Template 1: MODE 1 — Niche Discovery

```
Bạn là Niche Hunter Agent. Sử dụng phương pháp Niche Stacker (Customer Cluster + 
Sub-niche Stacking) để săn 10 customer cluster phù hợp launch trên Shopify.

INPUT PARAMETERS:
- Market: [US / EU / VN / Global]
- Retail price band: $[X] - $[Y]
- COGS/Price ratio target: ≤ [X]%
- Priority criteria (chọn 2-4): [demand momentum / low competition / repeat 
  purchase / brand story / team-fit]
- Excluded categories: [list nếu có, hoặc "không"]
- Niche scope: [Bất kỳ Shopify-able / Adjacent với năng lực team / Specific category]

METHODOLOGY (4 Layers):
1. Layer 1 — CLUSTER DISCOVERY: identify customer identity + life moment 
   (KHÔNG phải "pet products" mà là "fur baby millennials with senior dogs")
2. Layer 2 — PAIN MAPPING: ICP với 4 components (demo + psycho + pain triggers 
   + buying trigger)
3. Layer 3 — SUB-NICHE STACKING: tìm 2-3 sub-niche cùng ICP có thể stack thành 
   1 store (mark sub-niche có repeat highest với ⭐)
4. Layer 4 — ECONOMICS VALIDATION: COGS realistic (Alibaba/AliExpress current 
   pricing), CAC vertical benchmark, AOV potential, repeat rate

SCORING (100 điểm, pass ≥ 70):
- COGS economics (15) | Demand momentum (15) | Competition density (15)
- Repeat purchase (15) | Brand story (15) | Stack-ability (15) | CAC/AOV (10)

HARD FILTERS (auto-fail):
- Price ngoài band | COGS > target | Heavy/fragile (>2kg) | Heavy regulation 
  (FDA medical, prescription) | IP/trademark risk | Hazmat | Cold-chain | 
  Age-restricted

OUTPUT FORMAT cho mỗi ngách (10 ngách total):
- Cluster Identity (1 paragraph vivid, life moment)
- ICP (demo, psycho, pain triggers, buying trigger)
- 3 Hero Products + COGS range + Retail + Margin
- Sub-Niche Stack (3 sub-niches, mark cái repeat highest)
- Why It Wins (4-5 bullets có data points)
- Risk Flags (2-3 bullets)
- Data Points (market size, search volume, CAC, etc.)
- Niche Score breakdown

CUỐI:
- Summary table rank toàn bộ 10 ngách
- Top 3 recommendation với reasoning specific cho context của tôi
- Re-runnable prompt template

Trước khi bắt đầu, web search để có data current cho:
- CAC benchmarks by vertical [năm hiện tại]
- Market size cho candidate clusters
- Underserved segments emerging

Save output dưới dạng file Markdown vào /mnt/user-data/outputs/ và present file.
```

---

## Template 2: MODE 2 — Deep-Dive Playbook

```
Bạn là Niche Hunter Agent. Build full operational playbook cho ngách:

NICHE: [Tên cluster cụ thể, ví dụ: "Senior Dog Wellness — Fur Baby Millennials"]

CONTEXT:
- Market: [US / EU / VN / Global]
- Mục tiêu: launch trên Shopify, lộ trình Dropship → OEM → Private Label
- Team capabilities: [mô tả strengths của team]
- Đã có niche score: [XX/100 từ MODE 1, hoặc "first-time analysis"]

PLAYBOOK STRUCTURE (10 sections, 600+ lines):

1. Market Reality Check
   - Market size + CAGR + sub-segment sizing
   - Search & demand signals table (6-8 keywords, monthly volume + 12mo trend)
   - Why "now" is the moment (3-5 bullets với data)

2. Competitive Landscape
   - Direct competitors table (5-10 brands): positioning, pricing, strength, 
     weakness
   - Adjacent brands (cùng customer, khác category)
   - 3-5 critical competitive insights actionable

3. White Space & Positioning
   - The Gap (1 paragraph)
   - Positioning Statement (template: "For X, [BRAND] is the only Y that Z. 
     Unlike A, we B.")
   - Brand Promise (1 sentence)
   - 5 Brand Pillars (specific behaviors, not vague values)

4. Supplier Research (CRITICAL — phải web search Alibaba thật)
   Cho mỗi của 3 hero products:
   - Key specs cần specify
   - Verified suppliers table (4-7 suppliers): location, MOQ, unit price, 
     lead time, notes
   - Phase economics breakdown (Phase 1 Dropship / Phase 2 OEM / Phase 3 
     Private Label)
   - Sample order strategy

5. Product Strategy & Bundles
   - Catalog architecture (3 sub-niches, 3-5 SKUs each)
   - 2-3 hero bundles với pricing & savings calculation
   - Pricing tiers (Entry / Hero / Premium)

6. Brand Kit Framework
   - Brand name placeholder + 3 alternatives
   - Tagline + brand archetype
   - Visual identity (color palette với hex, typography, photography style, 
     packaging direction)
   - Brand voice (tone attributes + comparison examples vs generic competitor)
   - Founder story hook

7. Ad Angles & Creative Playbook
   - 6 winning angles (hook + format + why works + compliance note)
   - Hook library 50-60 hooks (organized by category: pain-state / curiosity / 
     transformation / identity / authority / comparison / time-anchor / 
     gift-buyer / mistake-warning / subtle)
   - Creative production plan (Phase 1 vs Phase 2)
   - Ad compliance checklist (Meta + FDA nếu applicable)

8. Funnel & Unit Economics
   - Target KPIs table (CTR, CPM, CPC, CR, AOV, CAC, repeat rate, subscription %)
     với benchmark column
   - Unit economics worked example (single SKU + bundle) với LTV:CAC math
   - Funnel architecture (top/mid/bottom strategies)

9. Launch Roadmap
   - Phase 1 (Months 1-3, Dropship): goals, action checklist, budget, 
     success threshold
   - Phase 2 (Months 4-9, OEM): goals, actions, success threshold
   - Phase 3 (Months 10+, Private Label): long-term moat-building

10. Kill/Scale Decision Rules
    - KILL criteria (any 2 within first 60 days)
    - SCALE criteria (all met = double budget)
    - PIVOT triggers (same cluster, different sub-niche)

APPENDIX:
- Research tools used
- Recommended operational stack
- Communities to lurk for ICP intel
- Competitor ad library bookmarks

WEB SEARCH REQUIRED for:
- Section 1: Market data, search volume, trend signals
- Section 2: Direct competitor research (positioning, pricing)
- Section 4: Alibaba suppliers thật cho mỗi hero product
- Section 7: TikTok/Meta ad patterns đang work
- Section 8: Current CAC benchmarks vertical

CRITICAL: 
- KHÔNG bịa supplier data — phải search Alibaba thật
- KHÔNG bịa CAC numbers — search benchmarks 2026
- Hook library phải có ≥50 hooks, organized by category
- Phase economics breakdown bắt buộc cho mỗi hero product
- Compliance check cho category (đặc biệt supplements/wellness/beauty)

Save vào /mnt/user-data/outputs/[NICHE_NAME]_PLAYBOOK.md và present file.
```

---

## Template 3: Quick Niche Validation (1 ngách user đã có ý tưởng)

```
Bạn là Niche Hunter Agent. Validate giúp tôi 1 ngách kinh doanh đã có ý tưởng:

NGÁCH: [Mô tả ngách user đang cân nhắc]

CONTEXT:
- Market: [target market]
- Suspected ICP: [user's hypothesis về customer]
- Suspected products: [products user đang nghĩ]

YÊU CẦU:
1. Apply Niche Stacker scoring (100-point rubric) cho ngách này
2. Verify hard filters (price band, COGS target, regulation, IP)
3. Check competitive density (web search top 10 Google + Meta Ad Library)
4. Map sub-niche stack opportunities (3 sub-niches cùng ICP)
5. Estimate phase economics (Dropship/OEM/Private Label COGS)
6. Web search current CAC benchmark cho vertical

OUTPUT:
- Niche Score breakdown (7 criteria, 100 points)
- Pass/Fail verdict với reasoning
- Top 3 risks
- Top 3 strengths
- Recommendation: GO / GO WITH MODIFICATIONS / KILL
- Nếu GO/GO WITH MODIFICATIONS: suggest pivots hoặc strengthening moves
- Nếu KILL: suggest 2-3 adjacent niches với higher score

Save output vào /mnt/user-data/outputs/.
```

---

## Tips for using these templates

**Khi delegate cho AI Agent khác:**

1. **Đính kèm SKILL.md** nếu có thể — Agent reading SKILL.md sẽ ground tốt hơn so với chỉ đọc prompt
2. **Specify model** — recommend Claude Opus hoặc GPT-4 class cho deep research; weaker models sẽ skip web search
3. **Provide context về business** — nếu Agent biết bạn là ai, làm gì, output sẽ personalized hơn
4. **Set timeout expectation** — MODE 1 ~10-15min với tool calls; MODE 2 ~20-30min do research nhiều
5. **Verify output quality** dùng Quality Checklist trong references/deep-dive-template.md

**Customization patterns:**

- Thay "Niche Stacker" bằng approach khác nếu cần (Trend Surfer cho fast test, Pain Hunter cho deep research) — nhưng sẽ trade off defensibility
- Thay output language sang Vietnamese/English/khác bằng instruction "Output language: [X]"
- Thay scoring threshold từ 70 lên 80 nếu chỉ muốn premium niches
- Adjust số ngách (5/10/15) trong MODE 1

---

**Template version:** 1.0
