# Prompt templates — fal-ai/nano-banana-2/edit

Viết prompt bằng tiếng Anh (model bám tiếng Anh tốt hơn). Thay `<...>` bằng mô tả sản phẩm thật: loại sản phẩm, số nhân vật, tư thế, bộ phận, họa tiết. Ảnh trong `image_urls` được gọi là Image 1, Image 2… theo đúng thứ tự trong mảng.

## Request chung

```json
{"prompt": "...", "image_urls": ["<url1>", "<url2>"],
 "aspect_ratio": "1:1", "resolution": "2K", "num_images": 1, "output_format": "png"}
```

Kết quả: `images[0].url` → tải ngay bằng `curl -sS -o FILE URL` (link fal hết hạn).

## Khối chung (dán vào cuối mọi prompt)

```
FRAMING: square image, pure white #FFFFFF seamless background, no shadow, no props, no text. The whole product is centered horizontally and vertically, fully visible, uncropped, with generous even white space around it.
CASTING STYLE: real cast-and-polished jewelry photo, refined but not hyper-sharp CGI. Hair grouped into broad soft rounded locks; eyes are shallow relief in the same metal, no black pupils; small natural irregularity in recesses. ONE metal only: every element (faces, eyes, hair, clothes, patterns, hearts, stones, enamel) is the same metal — no gemstones, no enamel, no other colors.
AVOID: black patina, oxidized or dark brown recesses, black eye outlines, harsh contrast, sparkle stars, oversaturation, over-sharpening, extra parts, logos, brand marks.
```

## Bước 1 — Mẫu đúc cơ sở (gold)

`image_urls`: [ảnh góc chính, (các góc phụ…), gold-finish ref]

```
Image 1 is the product to recreate: <mô tả sản phẩm>. <Image 2..N-1 are extra angles of the SAME product, use them only to understand its structure.> The last image is a FINISH reference only: copy its metal tone, polish and softness of detail, never its shape, characters or ring design.
Recreate the product from Image 1 as a single-metal cast jewelry piece in warm polished yellow gold, keeping exactly its type, silhouette, number of figures, poses, parts, structural accessories and camera angle. Remove all screenshot UI, text, logos, watermarks and background. Soften hair, eyes and fabric folds into a cast-metal look.
<khối chung>
```

## Bước 2 — Luxury polished 18K gold

`image_urls`: [bước 1 đã đạt, gold-finish ref]

```
Image 1 is the approved product. Keep its shape, geometry, camera, scale and position exactly. Image 2 is a FINISH reference only (tone and polish) — do not copy its shape.
Change only the material to luxury high-polish 18K yellow gold: soft warm champagne-yellow, creamy bright highlights, gentle yellow midtones — not orange, not brass, no brown or black in recesses. Gold-on-gold everywhere.
Buff every raised surface to a mirror polish, especially hair, cheeks, arms, hands and clothing <hoặc: các bề mặt nổi tương ứng của sản phẩm>; areas that look matte or satin must become as glossy as the main band/body. Use smooth broad white-cream softbox reflection bands that follow the curves. Keep fill light inside recesses so they stay the same gold. Do not add detail, sharpen, add sparkle, or blow out the faces.
<khối chung>
```

## Bước 3 — Luxury polished silver (từ gold đã đạt)

`image_urls`: [gold bước 2 đã đạt, silver-finish ref]

```
Image 1 is the approved polished gold product. Keep its shape, geometry, camera, scale, position and polish level exactly; only change the metal. Image 2 is a FINISH reference only for the silver tone — copy its brightness and neutrality, but keep recesses lighter than in Image 2.
Convert to luxury high-polish sterling silver: neutral bright white silver, smooth mirror finish, crisp white softbox reflections — no blue steel cast, no remaining yellow tint, no oxidation, no dark grey or black recesses. Silver-on-silver everywhere. Do not redesign or sharpen details.
<khối chung>
```

## Sửa có mục tiêu (bước 4)

`image_urls`: [ảnh cần sửa]. Chỉ nêu đúng tiêu chí lỗi, mọi thứ khác giữ nguyên:

```
Image 1 is almost final. Keep everything exactly the same — shape, camera, scale, position, metal tone — except: <một lỗi cụ thể, ví dụ "the girl's hair still looks matte: polish it to the same mirror gloss as the band" / "recesses in the hair are dark grey: lift them to the same bright silver">.
<khối chung>
```

Không dùng prompt để sửa framing — `scripts/frame.py fix` lo phần đó.
