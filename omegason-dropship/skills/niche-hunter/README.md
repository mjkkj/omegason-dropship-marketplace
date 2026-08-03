# 🎯 Niche Hunter Agent Skill

A reusable AgentSkills.io-compliant skill for hunting DTC e-commerce niches using the **Niche Stacker** methodology (Customer Cluster + Sub-niche Stacking).

**Built for:** Omegason team (Vietnam-based AI-powered DTC company)
**Validated on:** US market, $35-$75 price band, multiple verticals (pet, wellness, home)
**Version:** 1.0 | **Date:** April 2026

---

## 📦 What's in this skill

```
niche-hunter-skill/
├── SKILL.md                              ← Entry point (load this first)
├── references/
│   ├── methodology.md                    ← 4-Layer Framework deep-dive
│   ├── scoring-rubric.md                 ← 100-point scoring system
│   ├── data-benchmarks.md                ← CAC/Margin/Repeat by vertical (2026)
│   └── deep-dive-template.md             ← MODE 2 playbook structure (10 sections)
├── assets/
│   ├── niche-output-template.md          ← MODE 1 output format
│   └── prompt-template.md                ← Re-runnable prompts for delegation
└── examples/
    └── senior-dog-wellness-example.md    ← Worked example (real)
```

---

## 🚀 Quick Start

### Option 1: Use with Claude (skill triggered automatically)

If you've installed the `.skill` file into Claude:
- Just ask: *"Help me find 10 niches to launch on Shopify in US market"* → MODE 1
- Or: *"Deep-dive into senior dog wellness niche"* → MODE 2

The skill will trigger automatically based on the description in SKILL.md.

### Option 2: Copy the prompt to delegate to any AI Agent

Open `assets/prompt-template.md` → copy Template 1 (MODE 1) or Template 2 (MODE 2) → paste into any AI Agent (ChatGPT, Gemini, etc.) along with the relevant SKILL.md content.

### Option 3: Read SKILL.md and follow yourself

If you want to do the workflow manually, SKILL.md is human-readable and walks through the process step-by-step.

---

## 🎯 Two Modes

### MODE 1 — Niche Discovery
**Input:** Market + Price band + COGS target + Priority criteria
**Output:** File Markdown with **10 customer clusters ranked**, each with:
- Cluster identity + ICP (4 components)
- 3 hero products with COGS/Retail/Margin
- Sub-niche stack (3 layers)
- Niche Score (0-100) + risk flags

### MODE 2 — Deep-Dive Playbook
**Input:** 1 specific niche (from MODE 1 or user-provided)
**Output:** File Markdown 600+ lines, 10 sections:
1. Market Reality Check
2. Competitive Landscape
3. White Space & Positioning
4. Supplier Research (verified Alibaba data)
5. Product Strategy & Bundles
6. Brand Kit Framework
7. Ad Angles & Creative Playbook (60-hook library)
8. Funnel & Unit Economics
9. Launch Roadmap (Dropship → OEM → Private Label)
10. Kill/Scale Decision Rules

---

## 🧠 Why this methodology

The skill chốt phương pháp **Niche Stacker** sau khi compare với:

| Approach | Verdict |
|---|---|
| Trend Surfer (top-down only) | ❌ Saturated nhanh, no moat |
| Pain Hunter (bottom-up only) | ⚠️ Slow scale, narrow output |
| **Niche Stacker** | ✅ **Combine both + Customer Cluster lens for moat** |

Lý do Niche Stacker thắng:
- Build defensible moat (đối thủ phải copy cả cluster, không chỉ 1 SP)
- Phù hợp multibrand model (1 store = 1 cluster = 1 nhân viên)
- Cho phép Private Label phase với capital lock-in
- LTV gấp 2-3x single-product store qua sub-niche stacking

Đọc `references/methodology.md` để hiểu chi tiết 4-Layer Framework.

---

## 🛠 Installation Options

### Install as Claude Skill
1. Download `niche-hunter.skill` (zip file in same directory)
2. Upload via Claude.ai Settings → Skills → Upload `.skill` file
3. Skill triggers automatically when relevant queries detected

### Use as Plain Markdown
Just open the `.md` files directly. SKILL.md is the entry point — read it first, then dive into references as needed.

### Delegate to Another AI Agent
Copy `assets/prompt-template.md` (Template 1 or 2) → paste to any AI with web search capability. Recommend Claude Opus, GPT-4, or Gemini Pro for quality.

---

## ⚙️ Hard Rules (Non-negotiable)

1. **No generic clusters** — "Pet products" rejected; "Fur baby millennials with senior dogs" required
2. **No fabricated COGS** — Web search Alibaba/AliExpress real pricing
3. **No outdated data** — Web search current year for CAC/market benchmarks
4. **No skip elicit step** — Always confirm 5 input parameters before generating
5. **No skip phase economics** — Every hero product needs Phase 1/2/3 COGS breakdown
6. **No filter violations** — Hard filters auto-fail (price out of band, COGS over target, regulation, IP, hazmat, etc.)

See SKILL.md for full Hard Rules list.

---

## 📊 Quality Bar

For MODE 1 output, each niche must have:
- ✅ Vivid cluster name (5-10 words with life moment)
- ✅ ICP with 4 components (demo + psycho + pain + buying trigger)
- ✅ 3 hero products with specific names (not "supplements")
- ✅ COGS as range, not single number
- ✅ Sub-niche stack with ⭐ on repeat engine
- ✅ Why It Wins with ≥4 data-backed bullets
- ✅ ≥2 Risk Flags
- ✅ ≥3 specific data points (search volume, market size, CAC)

For MODE 2 output:
- ✅ All 10 sections present and complete
- ✅ Section 4 (Suppliers) with verified Alibaba data
- ✅ Section 7 with ≥50 hooks across categories
- ✅ Section 9 with 3-phase timeline + success thresholds
- ✅ File ≥600 lines

See `references/deep-dive-template.md` for full Quality Checklist.

---

## 🔄 Versioning & Maintenance

- **v1.0** (April 2026): Initial release. Validated for US market, lingerie/pet/wellness verticals.

**Refresh schedule:**
- Quarterly: Update `references/data-benchmarks.md` with new CAC/margin/repeat data
- Bi-annually: Re-validate methodology against major platform changes (Meta/TikTok policies)
- Annually: Re-test full skill on representative niche to verify quality

**Refresh triggers:**
- Major platform policy change (Meta/TikTok/Shopify)
- Tariff schedule changes (Section 301, de minimis)
- Major macro shift (recession, election, supply chain disruption)

---

## 📚 References

The skill is grounded in current research from:
- MHI Growth Engine (CAC benchmarks 2026)
- EightX (DTC margin data, SEC filings analysis)
- Foundry CRO (repeat purchase rates 2026)
- Northstar Financial Advisory (gross margin by category)
- eMarketer (TikTok Shop sales data)
- Cascadia Capital (pet industry overview)

See `references/data-benchmarks.md` for complete sources and current numbers.

---

## 🤝 Credits

**Created by:** Omegason Strategy Team via collaboration with Claude
**Methodology:** Niche Stacker (proprietary framework)
**License:** Internal use; modify and redistribute within Omegason ecosystem

---

**Quick reference:**
- Need niches? → MODE 1 → Use prompt template 1
- Have a niche, need playbook? → MODE 2 → Use prompt template 2  
- Need to validate one idea? → Use prompt template 3 (Quick Validation)
