# 4 trụ đa dạng — bảng tham chiếu nhanh

| Trụ | Tuỳ chọn |
|---|---|
| Visual | Static, UGC, Podcast-style, Video Demo, Unboxing, Testimonial, Street interview |
| Messaging (cảm xúc) | Human, Nostalgia, Savings, Social Proof |
| Persona | Lấy từ avatar-research của pid (vd bận rộn / tối giản / mẹ bỉm) |
| Format/Placement | Feed, Reels, Stories |

## Công thức volume (mặc định)
- 1 mẫu thắng ≈ $1,000 doanh thu/ngày (~$30k/tháng).
- winners_needed = revenue_goal_thang / 30,000
- tests_needed = ceil(winners_needed / win_rate)   # win_rate mặc định 0.10
- weekly_quota = ceil(tests_needed / 4)

## Win-rate benchmark
- Trung bình 10–24% · Tốt 25–35% · Elite >35%

## Diversity tối thiểu (mặc định, override bằng thresholds.yaml)
visual ≥ 5 · messaging ≥ 4 · persona ≥ 3 · format ≥ 3
