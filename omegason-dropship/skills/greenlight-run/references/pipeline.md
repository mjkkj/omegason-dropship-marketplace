# Pipeline chi tiết 00→06 — tiêu chí bằng chứng & định nghĩa-xong

> Bản distilled từ agent specs v0.2 của Greenlight Engine. Nếu chạy trong repo greenlight: `agents/00`–`07` của repo là bản đầy đủ, thắng file này.

## 00 · Intake
- pid 4 chữ số kế tiếp (đọc portfolio nếu có), slug mô tả SẢN PHẨM không mô tả angle.
- Identity: tên, category, source URL, giá niêm yết, ảnh/video gốc (ghi rõ nếu là ảnh AI/không tin được), variant chuẩn. Nếu sản phẩm là add-on, tự quyết định **đơn vị đánh giá** hợp lý (vd xô rời → đánh giá cả kit) và ghi rõ lý do.
- Giả thuyết mua hàng CHƯA ĐẠT nếu: buyer là "mọi người"; wow không nhìn thấy được trong 3s; proof ghi chung chung ("reviews") thay vì proof thật hoặc "chưa có".
- Cờ đỏ sớm — checklist: category regulated (medical/supplement/kids/electronics pin-laser/weapon-adjacent)? bán brand có sẵn/dupe? nghi trend qua đỉnh? cồng kềnh/pin lithium/chất lỏng? store nguồn có dấu hiệu rác (copy trộn, ảnh AI, review giả)? Không có cờ → ghi "không thấy", đừng để trống.
- KHÔNG suy diễn số liệu ở bước này.
- **Xong khi**: đủ 4 mục, giả thuyết đạt chuẩn, dòng pid mới trong portfolio + SUMMARY khởi tạo.

## 01 · Demand Radar (fatal: demand)
- ≥2 nguồn độc lập, bảng `nguồn | tín hiệu (SỐ) | đọc-ra | ngày lấy`. "Có vẻ hot" không phải tín hiệu.
- Tín hiệu mạnh nhất: **tuổi ad** (ad chạy ≥6–12 tháng = có lời dài hạn) và **ad velocity** (số ad mới launch trong 4–10 tuần gần nhất — lọc theo ad_created window).
- demand_level: high (nhiều advertiser active + tín hiệu đa nguồn) / medium (có nhưng lệch nhau — ghi lệch chỗ nào) / low (yếu mọi nguồn — chưa chắc fatal, nhìn trajectory).
- trajectory: rising / peak (demand cao, growth chững, seller tăng nhanh hơn demand → báo 02) / flat (PHÂN BIỆT evergreen: search 5 năm ổn định + luôn có seller sống tốt) / dying (growth âm kéo dài + ad ngừng hàng loạt).
- Mùa vụ: Google Trends 5 năm; nếu mùa vụ → ghi cửa sổ còn lại, nó thành deadline ở 06.
- dying → hỏi "còn angle/mùa/ngách hồi sinh?" Có (ghi rõ) → không fatal, hạ điểm. Không → fatal.
- **Xong khi**: bảng ≥2 nguồn có số; level+trajectory có bằng chứng riêng; mùa vụ đã check.

## 02 · Competitor Gap (không dừng pipeline)
- ≥3–5 đối thủ trực tiếp, mỗi đối thủ 6 field: quy mô | angle chính (bóc từ ad thật, không đoán từ tên) | offer/price | audience/geo | tuổi ad+velocity | điểm yếu khai thác được (review xấu lặp, objection chưa xử, persona bỏ quên).
- Nên phủ đủ TẦNG thị trường: brand leader / mid / marketplace commodity / dropship mới vào — khe thường nằm GIỮA các tầng.
- Saturation: low / medium / high / red-ocean (số shop, tuổi ad, mật độ, giá tụ).
- Rà 5 khe: persona · occasion · geo · price-offer · angle-creative — mỗi khe trả lời có/không + bằng chứng ĐÃ SEARCH mà không thấy ai đánh (không phải "chưa thấy nên chắc chưa có").
- **Khe mạnh nhất — câu testable 4 phần**: "Đánh vào [persona] bằng [angle] với [offer], vì [bằng chứng cửa trống]". Không viết được → gap_found: weak/no, nói thẳng.
- Red-ocean không khe → điểm thấp kéo về REFINE/REWORK, KHÔNG tự KILL.

## 03 · Unit Economics (fatal: sourcing — CHỈ khi không thể source/ship bằng bất kỳ cách nào)
- Bảng landed cost đủ dòng, MỖI DÒNG CÓ NGUỒN: giá nguồn / ship tới khách (pin lithium = special line) / phí platform+payment ~6% / dự phòng return (cao hơn cho SP hiệu quả chậm).
- `cogs_confidence`: quoted (báo giá thật kèm ship+MOQ) / estimated (listing công khai hoặc anchor ngược từ retail) → **estimated = cap trục 4 ở 3 điểm + GO phải kèm điều kiện xác nhận báo giá**.
- Giá bán mục tiêu: anchor theo dải giá đối thủ (02) + khe price. Giá của store nguồn KHÔNG phải anchor.
- Margin @ CPA (bội số) = giá bán / landed cost, đọc trong bối cảnh target CPA (ước từ CPC/CVR category, ghi căn cứ).
- Leading indicators kỳ vọng CÓ NGƯỠNG SỐ (thumb-stop, CTR, CPC, ATC, cost/ATC) — baseline cho test sau này.
- Headroom: bảng đòn bẩy `hiện tại → có thể | căn cứ` (AOV bundle, báo giá volume, đổi supplier, US warehouse, price test, giảm CPA). high = ≥2 đòn bẩy có căn cứ số.

## 04 · Compliance (fatal: legality — chỉ blocked_legality)
- Rà ĐÚNG 3 nhóm, ghi kết quả kể cả "không thấy": weapon/weapon-adjacent (angle weapon-hoá → pivot, không đỏ) · trademark/IP nặng-counterfeit (đổi tên/copy tránh được → không đỏ) · phi pháp hoàn toàn/banned-seizure.
- tier: clear → main; pivot_needed → main/isolated + smart_pivot BẮT BUỘC đủ 5 phần (angle an toàn hơn / claims tránh NGUYÊN VĂN / claims viết lại NGUYÊN VĂN / proof-disclaimer / routing+lý do); blocked_legality → fatal.
- Nếu không blocked → viết 1 đoạn "vì sao route được thay vì kill" (chốt chống over-veto).
- Luôn check: có đang mượn brand/ảnh/™ của store nguồn không → cấm dùng trong output.

## 05 · Buyer Language (chỉ chạy khi chưa fatal)
- Nguồn theo hiệu quả/chi phí: comment ad đối thủ > review Amazon/Ali (ưu tiên 1–3 sao cho objection) > Reddit/TikTok/FB group > transcript ad chạy lâu.
- ≥15 verbatim NGUYÊN VĂN, tag [nguồn][pain/desire/objection][cường độ]. Thiếu sau khi quét đủ nguồn → dùng proxy category lân cận, KHAI BÁO "⚠proxy" đầu file + ghi việc bổ sung trước build.
- Cluster theo TẦN SUẤT; objection nào cũng kèm gợi ý proof xử lý.
- ≥5 hook seed đủ 3 phần (pattern interrupt + pain/desire bằng từ của khách + lời hứa/cơ chế), mỗi seed trace về verbatim nào.
- 2–4 angle xếp hạng (buyer + đau + lời hứa) + ĐỐI CHIẾU khe của 02 — ngôn ngữ khách không ủng hộ khe thì nói thẳng.
- Claim guardrail: hook không được hứa quá cái khách nói + tôn trọng claims-tránh của 04.

## 06 · Scorecard
- Fatal check TRƯỚC (3 gate, cite nguồn). Trip → KILL, bỏ qua điểm.
- 7 trục, bảng `trục | điểm | căn cứ (file + dữ kiện)`. Ràng buộc: trục 2 từ 01; trục 3 từ saturation+khe 02; trục 4 theo margin×headroom + CAP estimated; trục 5 trace cluster 05; điểm không căn cứ = không ghi.
- Two-pass khi pass 1 REFINE mà khe+angle đã rõ: lock angle → pass 2 với cột Δ + lý do; chỉ cộng ở trục angle mới thực sự thay đổi.
- Verdict theo ngưỡng; REFINE/REWORK BẮT BUỘC có "đường lên hạng": trục yếu + việc cụ thể + loop từ bước nào + deadline nếu mùa vụ.
- GO → stage `approved-pending-brief`, DỪNG chờ human duyệt. Cập nhật SUMMARY (radar + data điểm nhấn + run log) + portfolio.
