---
name: store-intel
description: >
  Phân tích chuyên sâu một Shopify store từ link WinningHunter — bao gồm store info, creative strategy, hook framework, ad copy structure, ad format, audience demographics, geo strategy, tech stack — và xuất thành file HTML report chuyên nghiệp (light theme, dễ đọc, dễ lưu trữ). Sử dụng skill này bất cứ khi nào người dùng đưa link WinningHunter (app.winninghunter.com/sales-tracker-details/...), hoặc yêu cầu "phân tích store", "analyze store", "intel store", "mổ xẻ competitor", "deep dive store", "phân tích creative", "xem store này làm gì", "reverse engineer store này", hoặc bất kỳ yêu cầu nào liên quan đến competitive intelligence từ WinningHunter data. Cũng kích hoạt khi người dùng đề cập đến "store intel", "competitor analysis từ WH", hoặc nói "phân tích link này" kèm URL WinningHunter. Skill này hoạt động cho BẤT KỲ niche, BẤT KỲ store nào — tự adapt analysis theo category và data có sẵn.
---

# Store Intel — WinningHunter Deep Analysis → HTML Report

## What This Skill Does

Nhận một link WinningHunter sales tracker, tự động pull full data qua MCP tools, phân tích chuyên sâu có tính thực tiễn (actionable), và xuất thành 1 file HTML report chuyên nghiệp (light theme) để lưu trữ.

**Output:** 1 file HTML self-contained, ~10 sections, bao gồm:
1. Store overview + key metrics
2. Product portfolio analysis
3. Hook anatomy (reverse-engineer winning hooks)
4. Copy architecture (6-block framework analysis)
5. Ad format & media strategy
6. Multi-page / multi-account strategy
7. Audience demographics (age, gender, geo)
8. Geo expansion strategy
9. Tech stack & operations
10. Actionable takeaways (việc làm ngay cho Omegason)

---

## The Process: 4 Phases

### PHASE 1: EXTRACT STORE DOMAIN

Từ URL WinningHunter, xác định store domain bằng 1 trong 2 cách:

**Cách 1 — web_fetch URL:**
```
web_fetch URL → tìm trong HTML keyword= hoặc store domain references
```
Thường domain nằm trong query string `keyword=DOMAIN&searchkeyword=storeurl` hoặc trong meta tags.

**Cách 2 — Nếu web_fetch không ra data hữu ích:**
Hỏi user: "Mình không extract được domain từ link. Anh cho mình tên domain store (ví dụ: example.com)?"

### PHASE 2: PULL DATA

Dùng WinningHunter MCP tools theo thứ tự:

**Step 1 — brief_competitor:**
```
Winninghunter:brief_competitor(competitor="{domain}")
```
Tool này trả về TOÀN BỘ data cần thiết:
- `store_candidates[]` → store info, metadata, revenue estimates, traffic, bestsellers, apps, socials
- `store_candidates[].explore_wlads_ads[]` → top ads đang chạy (copy, hook, format, reach, age distribution, countries)
- `top_scaling_ads[]` → ads đang scale mạnh nhất (EU spend, views, countries, copy variations)
- `opportunities[]` → AI-generated insights

**Data map — Biết data nào nằm ở đâu:**

| Data cần | Nằm ở field | Ghi chú |
|---|---|---|
| Store name, domain, niche | `store_candidates[0].name`, `.domain`, `.category` | Có thể có nhiều store candidates, lấy candidate có `storeid` match URL hash |
| Location | `metadata.country`, `.city`, `.province` | |
| Revenue 30D | `30d_rev_estimated_min`, `30d_rev_estimated_max` | Đơn vị cents (÷100 = USD) |
| Revenue 1D | `1d_rev_estimated_min`, `1d_rev_estimated_max` | Đơn vị cents |
| Revenue change | `store_revenue_change_30d` | Phần trăm |
| Monthly visits | `monthly_visits` | Con số tuyệt đối |
| Traffic history | `monthly_visits_historical` | Object {month: visits} |
| Traffic growth | `visits_growth_pct_m1`, `_m3`, `_m6` | Phần trăm |
| Top countries (traffic) | `top_countries[]` | Array {countryCode, sharePercentage} |
| AOV | `aov` | USD |
| Bestsellers | `bestsellers[]` | Array products {title, price, compareatprice, tags, imagecount, variantcount} |
| Store created | `first_product_date` | ISO date |
| Currency | `currency` | |
| Myshopify domain | `metadata.myshopify_domain` | Cho biết tên gốc store |
| Published product count | `metadata.published_products_count` | |
| Tech stack / Apps | `.technologies` trong ads, `.apps` | |
| Trustpilot | `trustpilot_tp_data.ratings`, `.total_reviews` | |
| Socials | `socials[]` | |
| Ad copies | `explore_wlads_ads[].copy` | Full ad body text |
| Ad captions | `explore_wlads_ads[].caption` | Short caption/headline |
| Ad descriptions | `explore_wlads_ads[].description` | Link description |
| Ad format | `explore_wlads_ads[].display_format` | "video", "dco", "image" |
| Ad pages | `explore_wlads_ads[].pageName`, `.page_id` | Multi-page detection |
| Ad rank | `explore_wlads_ads[].ad_rank` | Lower = better |
| Days running | `explore_wlads_ads[].daysrunning` | Longevity signal |
| CTA type | `explore_wlads_ads[].cta_type` | LEARN_MORE, SHOP_NOW, etc. |
| Reach by age | `explore_wlads_ads[].reach_by_age` | Object {age_range: reach} |
| Reach by country | `explore_wlads_ads[].reach_by_country` | Object {country: reach} |
| Ad countries | `top_scaling_ads[].countries` | Array of country codes |
| EU ad spend | `top_scaling_ads[].total_eu_adspend` | EUR |
| EU views | `top_scaling_ads[].total_eu_views` | |
| Active ad count | `explore_lander_active_ad_count` | Tổng ads đang active |
| Product price on ad | `explore_wlads_ads[].shopify_productprice` | |

**Step 2 — Nếu cần thêm context (optional):**
```
Winninghunter:search_shopify_stores(keyword="{domain}")
```
Chỉ dùng nếu brief_competitor thiếu data. Thường brief_competitor đã đủ.

### PHASE 3: ANALYZE

Phân tích theo 10 sections. Mỗi section phải có:
- **Data facts** — con số, quotes, evidence
- **So what?** — insight / pattern recognition
- **Áp dụng** — action item cụ thể cho Omegason

#### Section Analysis Guides:

**1. Store Overview:**
- Tính store age từ `first_product_date`
- Revenue range format: "$X — $Y/mo"
- Revenue đơn vị cents → chia 100 → format USD
- Traffic trend: vẽ trajectory từ `monthly_visits_historical`
- Note myshopify domain nếu khác brand name (cho thấy operator history)

**2. Product Portfolio:**
- Số products published vs bestsellers → tính concentration
- Giá hero product vs AOV → margin analysis
- Compare at price vs price → discount depth %
- Tags → keyword/positioning strategy
- Variant count → product complexity

**3. Hook Anatomy (QUAN TRỌNG NHẤT):**
- Extract tất cả unique hooks từ `copy` field (thường câu đầu tiên)
- Phân loại hook type: Dialogue Quote / Question / Statement / Statistic / Story / Shock
- Identify hook FRAMEWORK (pattern structure) vs hook INSTANCE (specific wording)
- Đếm bao nhiêu ads dùng cùng 1 hook framework → winning hook signal
- Phân tích psychology layers: curiosity gap, emotion trigger, identity play, outcome framing
- Tạo hook template có slot fill-in để áp dụng cho brand khác
- Ví dụ áp dụng cho ít nhất 2 brands Omegason (Lacymate, LacyNighty, Kissoire, Ardent — tùy relevance)

**4. Copy Architecture:**
- Map copy thành blocks (Hook → Bullets → Reframe → Proof → CTA → Headline)
- Annotate mỗi block: psychology purpose, word count, emoji usage
- Identify fixed vs variable elements across ad variations
- Tạo fill-in template
- So sánh copy variations → what changes vs what stays

**5. Ad Format:**
- Đếm: bao nhiêu DCO vs Video vs Image
- Format nào rank cao nhất
- CTA types distribution
- Correlation: format × days running × rank

**6. Multi-Page Strategy:**
- List tất cả unique `pageName` + `page_id`
- Identify vai trò mỗi page (brand, generic, product-specific, geo-specific)
- Phân tích naming pattern
- Recommendation cho Omegason

**7. Audience Demographics:**
- Age distribution từ `reach_by_age` — tính % share
- Identify primary age bucket
- Gender inference từ copy angles
- Surprising segments (ví dụ: 65+ buying intimacy products)

**8. Geo Strategy:**
- Map `reach_by_country` → rank by reach
- Identify CPM strategy (low CPM countries = testing, high CPM = scaling)
- Cross-reference với `top_countries` traffic → where ads run vs where revenue comes from
- Phasing recommendation

**9. Tech Stack:**
- Map technology codes: SH=Shopify, PP=PayPal, GM=Google Merchant, KV=Klaviyo, CO=Checkout Optimizer, TP=TrustPilot, etc.
- List apps
- Note what's MISSING (ví dụ: no review app = dùng custom solution)

**10. Action Plan:**
- 5 specific action items
- Mỗi action: what to do, why, deadline suggestion, expected output
- Tailor cho Omegason context (multi-brand operator, DTC, Meta Ads focus)

### PHASE 4: GENERATE HTML REPORT

Xuất toàn bộ analysis thành 1 file HTML self-contained. Đọc template tại:
```
references/html-template.md
```

**Quy tắc HTML output:**

1. **Light theme** — nền trắng/sáng, text đen, dễ đọc trên màn hình và khi in
2. **Self-contained** — tất cả CSS inline trong `<style>`, không external dependencies ngoài Google Fonts
3. **Responsive** — đọc được trên mobile
4. **Print-friendly** — có thể Ctrl+P
5. **Filename:** `{brand-name}-intel-{YYYY-MM-DD}.html` (ví dụ: `vireon-intel-2026-06-04.html`)
6. **Save to:** `/mnt/user-data/outputs/` → dùng `present_files` để giao cho user

**KHÔNG BAO GIỜ:**
- Dùng dark theme (khó đọc khi in, khó lưu trữ)
- Dùng framework (React, Tailwind CDN)
- Bỏ qua section nào — nếu data thiếu thì ghi "Data không khả dụng" thay vì bỏ section
- Viết analysis chung chung — mọi insight phải có số liệu hoặc evidence
- Bỏ qua phần "Áp dụng cho Omegason" — đây là phần giá trị nhất

---

## Edge Cases

**Store mới / ít data:**
Nếu store quá mới (chưa có traffic data, chưa có ads), vẫn phân tích product portfolio, pricing strategy, store setup. Ghi rõ "Store chưa có đủ data cho section X" và recommend khi nào nên re-check.

**Multiple store candidates:**
`brief_competitor` có thể trả về nhiều `store_candidates`. Match bằng `storeid` với hash trong URL WinningHunter, hoặc lấy candidate có `explore_lander_active_ad_count` cao nhất.

**Không có ad data:**
Nếu `explore_wlads_ads` rỗng, skip sections 3-7 và focus vào store/product analysis. Note: "Store này không có ads data trên WinningHunter — có thể chưa chạy Meta Ads hoặc chạy dưới page khác."

**Niche nhạy cảm:**
Một số store bán products sensitive (intimacy, health, etc.). Phân tích objectively, focus vào marketing strategy không phải product judgment.

---

## Quality Checklist

Trước khi xuất HTML, verify:

- [ ] Tất cả revenue numbers đã chia 100 (cents → USD)
- [ ] Store age tính đúng từ `first_product_date` đến today
- [ ] Discount depth tính đúng: `(compare_at - price) / compare_at × 100`
- [ ] Hook analysis có template fill-in
- [ ] Copy analysis có annotated blocks
- [ ] Age distribution tính % đúng (sum = 100%)
- [ ] Geo reach sorted by reach descending
- [ ] Action items có deadline và expected output
- [ ] Filename đúng format: `{brand}-intel-{date}.html`
- [ ] File saved to `/mnt/user-data/outputs/` và `present_files` called
