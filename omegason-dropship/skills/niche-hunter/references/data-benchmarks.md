# DTC Data Benchmarks Reference (2026)

Skill này yêu cầu data current — luôn web search trước khi cite trong output. File này là baseline reference khi không thể search hoặc để cross-check.

> **⚠️ Quan trọng:** Data dưới đây được capture April 2026. Web search trước khi dùng trong production output để có data mới nhất.

---

## CAC by Vertical (DTC, 2026)

Source: MHI Growth Engine 2026, EightX, Foundry CRO

| Vertical | CAC Range | Median | Notes |
|---|---|---|---|
| **Pet products** | $20-45 | **$23** | Lowest CAC, subscription-driven |
| **Food & Beverage** | $15-53 | $51 | Habitual repeat helps |
| **Fashion/Apparel** | $90-120 | $37 (CPA) | High visual platform performance |
| **Beauty/Skincare** | $90-130 | $42 (CPA) | Founder content reduces 12-18% |
| **Home goods** | $60-90 | $45 | High AOV ($142 avg) helps |
| **Fitness** | $60-90 | $67 | Visual + identity-driven |
| **Supplements/Wellness** | $89+ | **$89** | Education-heavy, skepticism barrier |
| **Electronics** | $100-377 | High variance | Research-heavy buying |
| **Luxury** | $175-400+ | $175 | Highest, justified by CLV $1500+ |

**Trend:** CAC inflated 40-60% từ 2023 đến 2025. Structural, not cyclical (iOS privacy + Temu auction inflation).

**Channel-specific (2026):**
- TikTok CPC: $0.50 median (40-50% cheaper Facebook)
- Pinterest CPC: $0.50-1.00 (40% lower Meta, 50% higher AOV)
- Google Shopping CPC: $0.66-0.71
- Meta CPC: $1.07-1.11
- Amazon Sponsored Products: $1.00-1.12

---

## Gross Margin by Category (DTC, 2026)

Source: Northstar Financial Advisory 2026, EightX SEC analysis (n=11 public DTCs)

| Category | Gross Margin Range | Notes |
|---|---|---|
| **Beauty/Cosmetics** | 50-70% | Skincare/haircare 60-70%, color cosmetics 50-58% |
| **Health/Supplements** | 55-70% | Capsules $6-15 → retail $30-60 |
| **Apparel/Fashion** | 40-60% | Wide variance; basics low, designer high |
| **Home goods** | 35-55% | Higher AOV but shipping eats |
| **Consumer electronics** | 15-25% | Lowest gross margin |

**DTC blended median (SEC public 10-Ks):** 57%
- 25th percentile: 46%
- 75th percentile: 64%

**Net margin DTC:** 10-20% Shopify channel; 5-15% Amazon channel.

---

## Repeat Purchase Rate by Category (2026)

Source: Foundry CRO 2026

| Category | Repeat Rate (12mo) | Subscription Adoption |
|---|---|---|
| **Pet supplies** | 30-35% | 61% (highest) |
| **Beauty** | 22-28% | 25-35% |
| **Food & Beverage** | 18-25% | 30-50% (replenishment) |
| **Home goods** | 15-22% | 8-15% |
| **Electronics** | 18% | <5% |
| **Luxury** | 9.9% | <5% |

**Cross-category benchmarks:**
- DTC blended retention rate 2026: 31% (top performers 45-55%)
- Subscription monthly churn: 3.4% avg (subscription box 10-12%)
- 2nd purchase within 60 days = 3x more likely to become long-term

---

## AOV Benchmarks (US DTC, 2026)

| Category | Avg AOV | Notes |
|---|---|---|
| Beauty | $55 | Lipstick effect driving |
| Pet | $52 | Bundle-friendly |
| Food | $65 | Subscription tier |
| Apparel | $85 | Bundle critical |
| Home goods | $142 | Higher absolute |
| Supplements | $67 (one-time), $58 (sub) | |
| Electronics | $180+ | High variance |

---

## Conversion Rate Benchmarks (Shopify, 2026)

Source: Polar Analytics 2026

| Tier | Conversion Rate |
|---|---|
| Average Shopify | 1.4-1.8% |
| Good benchmark | 2.5-3% |
| Top 10% | >4.7% |
| $100M+ brands | 6.29% |

**By vertical:**
- Food & Beverage: 3.21%
- Beauty: 2.98%
- Electronics: 2.71%
- Automotive: 1.12%

**Cart-to-purchase:**
- Cross-industry median: 24.12%
- Pets: 48.6% (highest)
- Retail: 9.7% (lowest)

---

## Market Size (Reference, 2026)

| Market | Size | CAGR |
|---|---|---|
| Global DTC | $319.57B (2026) | 7.8% to 2035 |
| US DTC | $239.75B (2025), 19.2% of retail | |
| US Pet industry | $147B → $200B+ (2030) | 6%+ |
| US senior pet products | ~$8B | 11.4% |
| US Postpartum care | $5.2B | 8% |
| US men's grooming | $26B | 6.8% |
| US adult ADHD products | Emerging | High |
| US digital nomad pop. | 17.3M | +131% since 2019 |

---

## Marketing Channel Mix Benchmarks (2026)

| Channel | Revenue Share | Notes |
|---|---|---|
| Email + SMS combined | 38-45% (P90) | Automated flows = 41%+ of email |
| Paid social (Meta+TikTok) | 25-40% | CPMs up 12-18% YoY |
| Organic social | 5-15% | TikTok Shop 18.2% social commerce |
| Affiliate/Referral | 10-20% | Lowest CAC channel ($15-50) |
| Direct/Brand | 15-25% | Loyal customers convert 60-70% |

**Key 2026 facts:**
- TikTok Shop: $15.82B US sales (2025), +108% YoY
- Health/Beauty/Wellness = 79.3% of TikTok Shop sales
- Loyalty programs deliver 4.8-5.2x ROI
- Loyal customer convert rate: 60-70% vs 5-20% prospect

---

## Hard Filter Reference (Auto-fail criteria)

Khi đánh giá ngách, auto-loại nếu vi phạm:

### Pricing filters
- Retail price ngoài user's band (vd: <$35 hoặc >$75 nếu user yêu cầu sweet spot)
- Cannot achieve COGS ≤ user's target ratio (vd: ≤25%)

### Shipping filters
- Item weight > 2kg (ship cost prohibitive cho free-ship economics)
- Fragile (glass, ceramic uncoated)
- Hazmat (large lithium batteries, chemicals, flammable)
- Dimensional weight > 10 lbs
- Required cold chain (frozen food, raw pharma)

### Regulatory filters
- FDA medical device (Class II/III)
- Prescription required
- Hormonal supplements (testosterone Rx, etc.)
- Controlled substances
- Age-restricted (alcohol, tobacco, vape, CBD in some states)

### IP/legal filters
- Trademarked characters (Disney, Marvel, sports leagues)
- Branded reproductions
- Counterfeitable in China (high enforcement risk)
- Patents (vd: dyson tech replicas)

### Platform filters
- Meta/Google ads ban (alcohol some, weapons, adult)
- Shopify Payments restrictions
- TikTok Shop restricted categories

---

## Common Vertical Pitfalls

### Pet supplements
- ❌ Claim "cures arthritis" → Meta auto-reject
- ✅ "Supports joint comfort"
- 🚨 NASC seal cost ~$5K nhưng raise CR 18-22%

### Beauty/Skincare
- ❌ Before/after weight loss → restricted
- ❌ Specific medical claims → restricted
- 🚨 Founder content reduces CPA 12-18%

### Supplements (human)
- ❌ Disease prevention claims
- 🚨 47% supplement customers subscribe; retention 5.4 months avg
- 🚨 Non-subscription customers reorder every 8-10 weeks

### Home goods
- 🚨 In-room visualization + before/after content drives CR
- 🚨 Bulky items kill margin via shipping

### Apparel
- 🚨 Returns 20-40% (sizing) — model into economics
- 🚨 UGC + size inclusivity reduces CAC

---

## When data might be stale

Re-search if:
- Major platform policy change (Meta/TikTok/Shopify update)
- Tariff schedule change (Section 301, de minimis)
- Major macro shift (recession, election, supply chain)
- It's been 6+ months since this file's last update

**Pattern of search queries to refresh:**
```
"DTC ecommerce CAC benchmark [year] by category"
"Shopify gross margin by vertical [year]"  
"DTC repeat purchase rate by category [year]"
"[platform] CPC CPM [year]"
"TikTok Shop sales [year]"
```

---

**Reference last updated:** April 2026 | **Sources:** MHI Growth Engine, EightX, Foundry CRO, Northstar Financial, Polar Analytics, eMarketer, Cascadia Capital
