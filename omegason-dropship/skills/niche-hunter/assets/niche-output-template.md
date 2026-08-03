# Niche Output Template (MODE 1)

Đây là template output cho mỗi niche trong list 10 ngách. Skill sẽ render output theo cấu trúc này.

---

## Template per niche

```markdown
### [RANK EMOJI] #[N] — "[CLUSTER NAME IN QUOTES]" — [Sub-niche descriptor] | Score: XX/100

**Cluster Identity:**
[1 paragraph vivid mô tả cluster, life moment, identity họ tự nhận. Phải đủ specific để vẽ được 1 ngày trong đời họ. 60-100 từ.]

**ICP (Ideal Customer Profile):**
- **Demo:** [Female X% / Male X%, age X-X, HHI $X+, location pattern]
- **Psycho:** [Identity họ tự gọi, brand/creator follow specific names, belief system, communities active]
- **Pain triggers:** [3-5 pain points cụ thể, observable, không vague]
- **Buying trigger:** [Specific moment quyết định mua, không generic]

**Hero Products & Economics:**

| Product | COGS (Alibaba/AliExpress) | Retail | Margin |
|---|---|---|---|
| [Specific product name 1] | $X-Y | $Z | XX% |
| [Specific product name 2] | $X-Y | $Z | XX% |
| [Specific product name 3] | $X-Y | $Z | XX% |

**Sub-Niche Stack:**
1. **[Sub-niche 1 name]** ([entry/discovery/etc.]) — entry product
2. **[Sub-niche 2 name]** ([repeat/subscription]) — repeat consumable ⭐
3. **[Sub-niche 3 name]** ([emotional/cross-sell]) — emotional cross-sell

**Why It Wins:**
- ✅ [Bullet 1 với data point hoặc benchmark]
- ✅ [Bullet 2 với competitive insight]
- ✅ [Bullet 3 với platform/distribution advantage]
- ✅ [Bullet 4 với brand story angle]
- ✅ [Bullet 5 với scale/trend insight]

**Risk Flags:**
- ⚠️ [Risk 1: regulatory, supplier, competition specific]
- ⚠️ [Risk 2 nếu có]

**Data Points:**
- [Market size data]
- [Specific CAC vertical benchmark]
- [Search volume hoặc community size]
- [Other relevant numbers]

---
```

---

## File-level template (MODE 1 full output)

```markdown
# 🎯 NICHE HUNTER OUTPUT — [Market] [Date]

**Approach:** Niche Stacker (Customer Cluster Method)
**Market:** [US / EU / VN / Global]
**Price band:** $X - $Y
**COGS target:** ≤ X%
**Priority criteria:** [list]

---

## 🏆 10 NGÁCH ĐƯỢC ĐỀ XUẤT (RANKED)

[10 niches theo template per niche ở trên, ranked descending by score]

### 🥇 #1 — ...

### 🥈 #2 — ...

### 🥉 #3 — ...

### #4 — ...

[... through #10]

---

## 📈 SUMMARY TABLE — RANK & PICK

| Rank | Cluster | Score | CAC est. | AOV est. | Repeat | Brand Story Strength |
|---|---|---|---|---|---|---|
| 1 | [Cluster name] | XX | $X-X | $X-X | High/Med/Low | ⭐⭐⭐⭐⭐ |
| 2 | ... | | | | | |

---

## 🎯 TOP 3 RECOMMENDATIONS FOR [USER CONTEXT]

Dựa trên năng lực hiện tại của team ([describe team strengths from context]):

### 🥇 Pick #1: [Cluster Name] (Score)
**Tại sao:** [2-3 lý do specific to user's context, không generic]

### 🥈 Pick #2: [Cluster Name] (Score)
**Tại sao:** [...]

### 🥉 Pick #3: [Cluster Name] (Score)
**Tại sao:** [...]

---

## 🔁 RE-RUNNABLE PROMPT

> Copy-paste prompt dưới đây vào Claude bất cứ khi nào cần re-run với input khác.

[Insert re-runnable prompt template]

---

## ✅ NEXT STEPS

Suggest 3-4 next actions cho user, ví dụ:
1. Deep-dive 1 ngách cụ thể → MODE 2 playbook
2. Build interactive React tool để team filter/rank
3. Adapt skill brand-builder cho ngách đã chọn
4. Adapt skill hook-tester để test ad angles
```

---

## Quality bar cho mỗi niche entry

Trước khi finalize, verify mỗi niche pass:

- [ ] Cluster name vivid (5-10 từ, có life moment)
- [ ] ICP có đủ 4 components (demo + psycho + pain + buying trigger)
- [ ] 3 hero products specific (không generic như "supplements")
- [ ] COGS có range, không 1 số duy nhất (vd: $4-7, không $5)
- [ ] Margin tính đúng từ COGS/Retail
- [ ] Sub-niche stack có ⭐ đánh dấu repeat engine
- [ ] Why It Wins có ≥4 bullets với data
- [ ] Risk Flags không bỏ trống (luôn có 2+ risk)
- [ ] Data Points có ≥3 numbers cụ thể (search volume, market size, CAC)
- [ ] Score breakdown có thể derive từ rubric

---

## Common output quality issues to avoid

| Issue | Fix |
|---|---|
| Cluster: "Pet parents" | Add life moment: "Pet parents with newly diagnosed senior dogs" |
| Pain: "Want healthy dog" | Make observable: "Watching dog struggle with stairs" |
| Hero: "Dog supplements" | Specific: "Senior Hip & Joint Soft Chews (90-day)" |
| COGS: "$10" | Range: "$8-12 from Alibaba 100-MOQ" |
| Why wins: "Big market" | Data: "Pet CAC $23 (lowest), 30-35% repeat rate" |
| Risk: "Competition" | Specific: "Big Barker dominates premium bed segment" |
| Data: "Trending" | Number: "Search volume 40k/month, +28% YoY" |

---

**Template version:** 1.0
