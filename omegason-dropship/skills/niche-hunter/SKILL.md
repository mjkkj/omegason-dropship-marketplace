---
name: niche-hunter
description: Săn lùng và đánh giá các ngách sản phẩm DTC e-commerce có thể launch trên Shopify, sử dụng phương pháp Niche Stacker (Customer Cluster + Sub-niche Stacking) cho cả 2 cấp độ output - Cấp 1 List 10 ngách ranked và Cấp 2 Deep-dive playbook cho 1 ngách cụ thể. Sử dụng skill này bất cứ khi nào người dùng yêu cầu tìm ngách kinh doanh, niche research, brainstorm sản phẩm dropshipping, đánh giá thị trường ngách DTC, lựa chọn ngách Shopify, tìm customer cluster, hoặc xây lộ trình Dropship → OEM → Private Label. Cũng kích hoạt khi người dùng nói "tìm cho tôi ngách", "săn niche", "ngách nào tốt", "research thị trường ecommerce", "ý tưởng kinh doanh online", "deep dive vào ngách X", "competitive analysis cho ngách", hoặc bất kỳ yêu cầu nào liên quan đến niche selection và validation cho DTC/Shopify business — kể cả khi họ không nói rõ từ "niche hunter".
---

# Niche Hunter Agent

Một skill chuyên săn lùng các customer cluster có pain point rõ ràng + sản phẩm COGS thấp + có thể stack 2-3 sub-niche để build moat dài hạn — phục vụ lộ trình **Dropship → OEM → Private Label** trên Shopify.

Skill này được phát triển và validated cho Omegason — một AI-powered DTC e-commerce company vận hành multibrand model trên thị trường US/EU/Vietnam. Phương pháp đã được chốt qua nhiều vòng iteration với founder.

## Triết lý cốt lõi

> **"Đừng bán 1 sản phẩm. Sở hữu 1 customer cluster. Stack sub-niche bên trong nó."**

Đây không phải skill tìm "trending products". Đây là skill xác định **customer cluster** — cụm người có chung identity/lifestyle/life-moment — sau đó tìm 2-3 sản phẩm bổ trợ để build LTV và defensibility.

Lý do: thị trường DTC 2026 saturated, CAC tăng 40-60% từ 2023, không thể thắng bằng cách bán cùng SP với hooks khác nữa. Phải own cluster.

## Khi nào dùng skill này

**Trigger ngay khi user nói:**
- "Tìm cho tôi ngách [bất kỳ thứ gì]"
- "Săn niche / niche research / niche selection"
- "Ý tưởng sản phẩm dropshipping/Shopify"
- "Phân tích thị trường ngách"
- "Nên bán gì online"
- "Deep-dive vào ngách X"
- "Build playbook cho ngách"
- Hoặc bất kỳ câu hỏi nào về DTC/Shopify niche strategy

**KHÔNG dùng skill này khi:**
- User chỉ hỏi về 1 sản phẩm cụ thể đã chọn (lúc đó dùng skill brand-builder hoặc hook-tester)
- User hỏi về marketing tactics chung (không liên quan niche selection)
- User cần technical Shopify dev (theme, code, backend)

## Hai cấp độ output

Skill này có 2 mode operate, dựa trên ý định user:

### MODE 1 — Niche Discovery (Cấp 1)

**Trigger:** User chưa có ngách, cần list ngách để chọn.
**Output:** File Markdown chứa **10 customer cluster ranked** với scoring + ICP + hero products + economics.
**Time investment:** 1 conversation (sau khi đã elicit input parameters).

### MODE 2 — Deep-Dive Playbook (Cấp 2)

**Trigger:** User đã chọn 1 ngách (từ MODE 1 hoặc tự đề xuất), cần playbook execution.
**Output:** File Markdown chứa **operational playbook đầy đủ** — competitive analysis, supplier research, ad angles, brand kit framework, launch roadmap.
**Time investment:** 1 conversation (research-heavy, 4-8 web searches).

User có thể request Mode 1 trước, sau đó Mode 2 cho ngách đã pick. Hoặc đi thẳng Mode 2 nếu đã có ngách trong đầu.

## Workflow chuẩn

### Bước 0 — Elicit Input Parameters

**KHÔNG BAO GIỜ skip bước này.** Bất kể user request nghe rõ ràng đến đâu, luôn dùng `ask_user_input_v0` để confirm 5 thông số sau (hoặc đọc từ chat history nếu đã có):

1. **Thị trường mục tiêu**: US / EU / VN / Global
2. **Retail price band**: $X - $Y (mặc định $35-$75 nếu user không rõ)
3. **COGS/Price ratio target**: ≤ X% (mặc định ≤25%)
4. **Tiêu chí ưu tiên** (chọn 2-4): demand momentum / low competition / repeat purchase / brand story / team-fit
5. **Phạm vi ngách**: Bất kỳ Shopify-able / Adjacent với năng lực hiện tại / Loại trừ category nào

Nếu skip bước này, output sẽ generic và không actionable. **Không tự assume — luôn hỏi.**

### Bước 1 — Approach Confirmation

Skill này CHỐT dùng phương pháp **Niche Stacker** (combination top-down + bottom-up + sub-niche stacking). Đã so sánh kỹ với 2 alternative:

- ❌ **Trend Surfer** (top-down only): nhanh nhưng saturated nhanh, không build moat
- ❌ **Pain Hunter** (bottom-up only): defensive nhưng chậm scale
- ✅ **Niche Stacker**: kết hợp + identify customer cluster → stack 2-3 sub-niche

Nếu user thực sự muốn approach khác, accommodate — nhưng default luôn là Niche Stacker.

Đọc `references/methodology.md` để hiểu sâu phương pháp 4-Layer Framework.

### Bước 2 — Execute MODE 1 hoặc MODE 2

#### MODE 1: Niche Discovery

1. **Research giai đoạn 1** — Web search 2-3 queries để có:
   - CAC benchmark by vertical (current year)
   - Underserved customer segments
   - Trending sub-niches (TikTok/Pinterest/Reddit)

2. **Research giai đoạn 2** — Web search 1-2 queries cho data thị trường:
   - Search volume cho keywords tiềm năng
   - Repeat purchase rate by category
   - Margin benchmarks

3. **Generate 10 customer clusters** theo template trong `assets/niche-output-template.md`:
   - Mỗi cluster phải có vivid identity (không phải "pet products" mà là "fur baby millennials with senior dogs")
   - 3 hero products với COGS estimates (Alibaba/AliExpress reality)
   - Sub-niche stack 2-3 layers, mark sub-niche có repeat highest
   - Niche Score 0-100 dùng rubric trong `references/scoring-rubric.md`

4. **Apply hard filters** (auto-fail nếu vi phạm):
   - Price ngoài user's band
   - COGS > target ratio
   - Heavy/fragile (>2kg)
   - Heavy regulation (FDA medical devices, prescription)
   - IP/trademark risk

5. **Output**: 1 file Markdown structured theo `assets/niche-output-template.md` + summary table + top 3 recommendations với reasoning specific to user's context.

#### MODE 2: Deep-Dive Playbook

1. **Research giai đoạn 1** — 1-2 searches về suppliers thực tế:
   - Alibaba MOQ/price cho hero products
   - AliExpress alternatives cho dropship phase

2. **Research giai đoạn 2** — 2-3 searches về competitors:
   - Direct competitors trong cluster (positioning, pricing, ad angles)
   - Adjacent brands có thể overlap

3. **Research giai đoạn 3** — 1-2 searches về marketing landscape:
   - TikTok/Meta ad patterns đang work cho cluster
   - Compliance issues (đặc biệt nếu là supplements/wellness)

4. **Generate playbook** theo template trong `references/deep-dive-template.md` với 10 sections:
   - Market Reality Check (data sizing, search volume, demand signals)
   - Competitive Landscape (mapped table)
   - White Space & Positioning
   - Supplier Research (3 hero products với phase 1/2/3 economics)
   - Product Strategy & Bundles
   - Brand Kit Framework
   - Ad Angles & Creative Playbook (6 winning angles + 60-hook library)
   - Funnel & Unit Economics (KPIs, LTV:CAC math)
   - Launch Roadmap (Dropship → OEM → Private Label timeline)
   - Kill/Scale Decision Rules

5. **Output**: 1 file Markdown 600+ dòng đầy đủ, action-ready để team launch trong 14 ngày.

### Bước 3 — Deliver Files

Luôn save output vào `/mnt/user-data/outputs/` với naming convention:
- MODE 1: `NICHE_HUNTER_[market]_[date].md` (ví dụ `NICHE_HUNTER_US_2026-04.md`)
- MODE 2: `[NICHE_NAME]_PLAYBOOK.md` (ví dụ `SENIOR_DOG_WELLNESS_PLAYBOOK.md`)

Sau đó dùng `present_files` tool để user truy cập trực tiếp.

### Bước 4 — Suggest Next Step

Sau MODE 1, đề xuất:
- Deep-dive Mode 2 cho top 1-3 niche
- Build interactive React dashboard quản lý launch
- Adapt skill `brand-builder` cho ngách đã chọn
- Adapt skill `hook-tester` để test ad angles

Sau MODE 2, đề xuất:
- Validation Playbook 14 ngày
- Brand kit build via skill `brand-builder`
- Ad creative production via skill `hook-tester`

## Hard Rules — KHÔNG bao giờ vi phạm

1. **KHÔNG generate generic niches** như "fitness products" hoặc "pet products". Phải là customer cluster có identity rõ ràng (5-10 từ).
2. **KHÔNG bịa COGS data**. Khi không chắc, dùng range hoặc nói "estimate based on Alibaba similar products". Nếu MODE 2, phải web search supplier thật.
3. **KHÔNG dùng data cũ**. Skill này yêu cầu CAC/market data trong vòng 6 tháng gần nhất → phải web search trước khi cite.
4. **KHÔNG skip elicit step**. Ngay cả khi user nói "cứ làm đi", vẫn confirm 5 inputs vì output sai parameters = waste effort.
5. **KHÔNG dùng MODE 2 khi chưa có cluster cụ thể**. Nếu user nói "deep-dive" mà chưa có ngách cụ thể, bắt buộc làm MODE 1 trước (hoặc clarify).
6. **KHÔNG output Hard Filter violations**. Nếu một ngách hấp dẫn nhưng vi phạm filter (vd: heavy regulation), loại khỏi list — không trade off.
7. **KHÔNG quên phase economics**. Mỗi hero product trong MODE 2 phải có COGS/Margin breakdown cho 3 phase (Dropship/OEM/Private Label).

## Data sources khuyến nghị (web search queries pattern)

Khi research, dùng các query patterns này (thay [year] bằng năm hiện tại):

**Cho CAC/Margin data:**
- "DTC ecommerce CAC benchmark [year] by category"
- "Shopify gross margin by vertical [year]"
- "DTC repeat purchase rate by category [year]"

**Cho underserved segments:**
- "underserved customer segment ecommerce [year]"
- "sub-niche stacking Shopify [year]"
- "untapped market [target market] [year]"

**Cho supplier research (MODE 2):**
- "[product name] Alibaba supplier MOQ price [year]"
- "[product category] OEM private label manufacturer"

**Cho competitive analysis (MODE 2):**
- "[niche] DTC competitor analysis [year]"
- "[product category] TikTok viral ad [year]"
- "[product] Meta ad creative compliance [year]"

## Reading order — file nào load khi nào

Khi skill này được trigger, **luôn đọc SKILL.md (file này) trước**. Sau đó tùy mode:

- **Cho MODE 1**: Đọc `references/methodology.md` (4-Layer Framework) và `references/scoring-rubric.md` (cách chấm điểm). Output dùng `assets/niche-output-template.md`.
- **Cho MODE 2**: Đọc `references/deep-dive-template.md` (10 sections). Tham khảo `references/data-benchmarks.md` cho CAC/margin baseline (nhưng vẫn web search current data).
- **Cho re-runnability**: Đọc `assets/prompt-template.md` để cung cấp re-runnable prompt cho user.
- **Cho ví dụ**: Tham khảo `examples/senior-dog-wellness-example.md` (đã làm thật trên thị trường US 2026).

## Re-runnable Prompt Template (Quick Copy)

Khi user muốn delegate skill này cho một AI Agent khác, đưa cho họ prompt sau:

```
Bạn là Niche Hunter Agent. Đọc SKILL.md trong skill folder niche-hunter/ trước khi
bắt đầu. Sử dụng phương pháp Niche Stacker để [MODE 1: săn 10 customer cluster phù
hợp launch trên Shopify | MODE 2: deep-dive playbook cho ngách [TÊN NGÁCH]].

INPUT:
- Market: [US / EU / VN / Global]
- Retail price band: $[X] - $[Y]
- COGS/Price ratio target: ≤ [X]%
- Priority criteria: [demand / competition / repeat / story / team-fit]
- Excluded: [list nếu có]

Tuân thủ Hard Rules trong SKILL.md. Output theo template trong assets/. Save vào
/mnt/user-data/outputs/. Dùng present_files để deliver.
```

## Failure modes — học từ lần trước

Trong dev process, các failure modes đã gặp và fix:

1. **Generic niches** ("pet products", "wellness") — Fix: bắt buộc cluster identity 5-10 từ với life-moment.
2. **No phase economics** — Fix: bắt buộc 3-phase COGS table cho mỗi hero product trong MODE 2.
3. **Missing search volume data** — Fix: bắt buộc web search Google Trends/Keyword Planner data.
4. **Ad angles thiếu compliance check** — Fix: cho supplements/wellness, luôn check Meta/FDA compliance trong MODE 2.
5. **Over-trust trends** — Fix: luôn áp competition density check (top 10 Google không bị Amazon/Walmart áp đảo).
6. **Skip ICP psycho** — Fix: ICP phải có 4 components: demo + psycho + pain triggers + buying trigger.

---

**Skill version:** 1.0 | **Validated on:** US market, lingerie + pet + wellness verticals | **Owner:** Omegason Strategy Team
