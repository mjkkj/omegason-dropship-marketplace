---
name: dtc-infographic-generator
description: Generate brand logos and DTC product-page infographics using Google's Banana Pro (Nano Banana Pro / Gemini 2.5 Flash Image) via Google AI Studio or the AI Studio API. Use when the user wants a brand logo, Facebook-ad style infographic image, ingredients diagram, comparison split image, "clinically proven" checklist visual, trust-bar hero, or batch image generation for a Shopify product page.
---

# DTC Infographic Generator

## When To Use This Skill

Load this skill whenever the user wants to:
- Generate a brand logo for a DTC product
- Create scroll-stopping Facebook ad infographics
- Spin up 10-15 product-page images that make a Shopify store look like a $1M/mo brand
- Batch-generate infographic images via the Google AI Studio API
- Replace expensive designers / Canva work with AI image generation
- Drop polished images into Accio store slots, Loox reviews, Meta ads, or Klaviyo emails

This skill assumes the model is **Google Banana Pro** (the production-grade upgrade to Nano Banana / Gemini 2.5 Flash Image), accessed through [Google AI Studio](https://aistudio.google.com/) or the AI Studio API.

---

## Why This Matters

Every winning DTC ad you see on Facebook is essentially the same infographic recipe: bold headline + product hero + benefit icons + press logos / star rating. Brands that stack 10-15 of these on a product page see conversion lift of 30-50% before they touch a single ad campaign.

Banana Pro replaces a $2K/month designer with one API call. Cost per infographic: ~$0.10-$0.30.

---

## The 8 Infographic Styles To Build

For a launch product page, generate 1-2 of each style so the page reads as a real brand:

| # | Style | Purpose | Reference Look |
|---|---|---|---|
| 1 | Pain → Promise Hero | Emotional hook + product + free gift + guarantee | "NO MORE SLEEPLESS NIGHTS" mug shot |
| 2 | Ingredients Diagram | Product center + ingredient callouts radiating out | RYZE Mushroom Coffee "No Bloating Guarantee" |
| 3 | Vs Competitor Split | Bad option vs your brand, side by side | Loop Dream vs noise-cancelling earphones |
| 4 | Clinically Proven Checklist | "Helps with X, Y, Z" + lifestyle photo | Posture pillow "Clinically Proven To Help With" |
| 5 | Press / Review Quote | 5-star quote + customer photo + press logo | Solawave wand with ALLURE quote |
| 6 | Trust Bar Hero | Trustpilot stars + customer count + product | Wide barefoot shoes "Excellent 4.6 / 100,000+ Customers" |
| 7 | Feature/Benefit Grid | 4 features side panel + product photo + press logo | Solawave 4-in-1 Skincare Wand |
| 8 | "Soothe Your X Naturally" | Pain-point headline + packshot + 3 benefit icons | Stomach Soothe gut supplement |

---

## The Logo Prompt

```
Generate a clean, premium DTC brand logo for [BRAND NAME].
Niche: [e.g. at-home LED skincare device]
Style: minimalist sans-serif wordmark, slightly condensed, modern,
feminine but not pink, premium feel.
Color: deep forest green (#0a3d2e) wordmark on transparent background.
Optional symbol: [single leaf / single droplet / single arc — pick one OR none].
Output: 4 variations on a transparent PNG, square 1024×1024, plus a
horizontal lockup version.
Negative: no gradients, no shadows, no 3D, no stock illustrations,
no clip-art icons, no AI hands.
```

---

## The 8 Master Infographic Prompts

### 1. Pain → Promise Hero

```
Create a Facebook-ad style infographic, 1:1 square, 1080×1080.
Background: dark moody [BRAND COLOR e.g. deep navy].
Top headline: "NO MORE [PAIN POINT]" — bold sans-serif white,
with "NO MORE" inside a yellow highlight bar.
Center: hero product shot — [describe product in one line].
Left side: small handwritten arrow + label "Free [BONUS GIFT]".
Right side: small handwritten arrow + label "30 Day money-back guarantee".
Bottom strip: 3 ingredient/benefit icons in a row with name +
one-line benefit each.
Output: photorealistic product, clean vector icons, clear hierarchy.
```

### 2. Ingredients Diagram

```
Create a 1:1 square 1080×1080 infographic with mint-green background.
Top headline: "[NO BLOATING / NO BREAKOUTS / NO X] GUARANTEE" —
bold black sans-serif, all caps.
Subheadline: "Our [PRODUCT] enriched with [CATEGORY]:" in normal weight black.
Center: hero packshot — [describe your product packaging].
Around the product: 6 ingredient/feature callouts, 3 on each side, with
photorealistic icons + ingredient name + one-line benefit.
(Examples: Cordyceps · All-day energy / Lion's Mane · Better focus /
Reishi · Stress relief / Turkey Tail · Gut health.)
Footer: light pill banner "🚚 FREE SHIPPING + [BONUS GIFT] 🎁".
Output: photorealistic packshot, clean isolated ingredient photos,
professional DTC ad layout.
```

### 3. Vs Competitor Split

```
Create a 1:1 square 1080×1080 split-screen infographic.
LEFT half (grey/cool tones): label "[Generic Competitor Product]" —
show competitor product photo. Below, 4 minus-icon bullet points listing
cons (e.g. Uncomfortable / Not made for [use case] / Falls out easily / Bulky).
RIGHT half (warm/branded tones): label "[YOUR BRAND NAME]" —
show lifestyle hero of your product in use (real person looking happy/relaxed).
Below, 4 chevron-icon bullet points listing pros (e.g. All-night comfort /
Designed for [use case] / Stays on all night / Comfortable for everyone).
Style: photorealistic, two parallel vertical panels, no border in the middle,
clean modern type, no logos.
```

### 4. Clinically Proven Checklist

```
Create a 1:1 square 1080×1080 infographic.
LEFT panel (light blue background, 40% width):
top headline "CLINICALLY PROVEN TO HELP WITH:" in dark teal bold sans-serif.
Below: 7 white-pill bullet rows, each with a black checkmark icon +
condition name (e.g. Neck Pain / Neck Hump / Herniated Disc / Poor Posture /
Shoulder Pain / Headaches / Injury Recovery).
Bottom: small grey text "& Many More…".
RIGHT panel (60% width): photorealistic lifestyle shot of a real person
(mid-30s, natural, happy) holding/using the product on a sofa
in soft natural light.
Style: editorial DTC ad, photorealistic person, clean type hierarchy.
```

### 5. Press / Review Quote

```
Create a 1:1 square 1080×1080 infographic.
Background: soft sky-blue gradient.
Center-left: 5 gold stars in a row, then a 4-line italic pull quote
in serif type ("[Customer testimonial, 25-30 words]").
Below the quote: customer name + age in regular sans-serif (e.g. "Peter, 29").
Tag line under that: "[Editorial credibility line, e.g.
Dermatologist reviewed at-home Micro-Infusion treatments]".
Right side: photorealistic close-up of a real person using/wearing the
product (eyes closed, peaceful, soft natural light).
Top-left circular badge: "50,000+ reviews" in dark green pill.
Bottom strip: 3 checkmark benefits in a row, e.g. ✅ See less visible fine lines /
✅ Reduced acne scars / ✅ Brighter complexion.
Style: editorial DTC ad, photorealistic skin texture, premium beauty feel.
```

### 6. Trust Bar Hero

```
Create a 1:1 square 1080×1080 infographic.
Top: green Trustpilot-style bar with 5 green star squares +
"Excellent 4.6 | 100,000+ Customers".
Headline: "[Big bold question hook in two lines, e.g. Is finding shoes
that are wide enough a nightmare?]" — black sans-serif with one keyword
highlighted in red/coral.
Subheadline (in white pill): "Why not try these [product descriptor,
e.g. ultra-lightweight, wide toe box barefoot shoes]"
Hero: photorealistic product shot, isolated, drop shadow.
Side callout: green hand-drawn circle around "[Authority claim,
e.g. Podiatrist Developed]" with a curved arrow pointing to product.
Bottom: repeat the green Trustpilot bar.
Background: cream/off-white.
Output: photorealistic product, clean DTC layout, no stock-art.
```

### 7. Feature/Benefit Grid

```
Create a 1:1 square 1080×1080 infographic.
LEFT panel (40%, cream background):
Top headline "The [N]-in-1 [PRODUCT TYPE]" — black serif, bold.
Below: 4 feature rows, each with a small line-icon (left) + bold red/coral
feature name + 2-line plain-text benefit.
Examples for an LED beauty wand:
• Red Light Therapy — Reduces appearance of fine lines and wrinkles
• Galvanic Current — Boosts serum absorption
• Facial Massage — Promotes circulation and boosts the skin's natural radiance
• Therapeutic Warmth — Helps de-puff skin
RIGHT panel (60%): photorealistic product shot held in a real hand against
a soft sky-blue background. Small cream pull-quote card overlay near the bottom:
5 gold stars + 3-line italic press quote + bold "ALLURE" attribution.
Bottom: dark navy footer bar with brand wordmark centered.
```

### 8. "Soothe Your X Naturally"

```
Create a 1:1 square 1080×1080 infographic.
Background: cream/off-white.
Top: pill banner "[ACTION] YOUR [BODY AREA] NATURALLY" — bold sans-serif,
with the last word highlighted in green (e.g. NATURALLY).
Center-left: photorealistic product packshot
(e.g. supplement pouch with botanical accents).
Center-right: 3 stacked circular icon cards, each with:
• small line-icon in a soft yellow circle
• bold benefit name + 2-3 sub-benefits underneath
Examples:
• 🔥 Heartburn / Indigestion / Bloat
• 🧬 Prebiotics & Amino Acids
• 🔄 Soothes & Repairs G.I.
Style: clean wellness/supplement DTC layout, photorealistic packshot,
soft warm lighting, no stock-art icons.
```

---

## Batch Mode — Google AI Studio API

For volume generation, hit the Google AI Studio API with the Banana Pro / Gemini 2.5 Flash Image endpoint.

### Workflow
1. Get a free Google AI Studio API key at [aistudio.google.com](https://aistudio.google.com/) (5 sec)
2. In Cursor or ChatGPT, write a small Python loop that posts each of the 8 prompts above to the endpoint
3. For each prompt, swap `[BRAND NAME]`, `[PRODUCT]`, `[PAIN POINT]`, `[BRAND COLOR]` dynamically
4. Output: 16-24 infographic images in under 5 minutes for under $5
5. Drop the best 10-15 into Accio's image slots, Loox review images, Klaviyo emails, and Meta ad creative

### Reference Python Script

```python
import os, json, base64, requests, time

API_KEY = os.environ["GOOGLE_AI_STUDIO_KEY"]
ENDPOINT = "https://generativelanguage.googleapis.com/v1beta/models/gemini-2.5-flash-image-preview:generateContent"

BRAND = {
    "name": "Reviva",
    "product": "7-in-1 LED Facial Sculptor",
    "pain": "DULL SKIN",
    "color": "deep forest green (#0a3d2e)",
    "bonus": "Acacia Spoon",
    "category": "Adaptogenic Mushrooms",
}

PROMPTS = {
    "pain-promise-hero": "Create a Facebook-ad style infographic, 1:1 square 1080×1080. Background: dark moody {color}. Top headline: 'NO MORE {pain}' — bold sans-serif white, with 'NO MORE' inside a yellow highlight bar. Center: hero product shot — {product}. Left side: small handwritten arrow + label 'Free {bonus}'. Right side: small handwritten arrow + label '30 Day money-back guarantee'. Bottom strip: 3 ingredient/benefit icons in a row.",
    "ingredients-diagram": "Create a 1:1 square 1080×1080 infographic with mint-green background. Top headline: 'NO BLOATING GUARANTEE'. Subheadline: 'Our {product} enriched with {category}:'. Center: hero packshot. Around the product: 6 ingredient callouts. Footer: 'FREE SHIPPING + {bonus}'.",
    # ... add the rest from the master prompt list above
}

def generate(prompt_text, out_path):
    body = {"contents": [{"parts": [{"text": prompt_text}]}]}
    r = requests.post(f"{ENDPOINT}?key={API_KEY}", json=body, timeout=120)
    r.raise_for_status()
    data = r.json()
    # The image is base64 inside the parts array
    for part in data["candidates"][0]["content"]["parts"]:
        if "inlineData" in part:
            img = base64.b64decode(part["inlineData"]["data"])
            with open(out_path, "wb") as f: f.write(img)
            return out_path
    raise RuntimeError("No image returned")

for name, template in PROMPTS.items():
    prompt = template.format(**BRAND)
    out = f"out/{BRAND['name'].lower()}-{name}.png"
    os.makedirs("out", exist_ok=True)
    print(f"→ generating {out}")
    generate(prompt, out)
    time.sleep(1)  # gentle rate-limit
```

---

## Where The Output Goes

| Asset | Use It On |
|---|---|
| Logo | Header, footer, favicon, packaging mockups, email templates |
| Pain → Promise Hero | Top of product page, Meta ad creative, Klaviyo welcome email |
| Ingredients Diagram | Mid-product page, Amazon A+ content (if multichannel) |
| Vs Competitor Split | "Why us" section, ad retargeting creatives |
| Clinically Proven Checklist | Above the fold on product page, landing page hero |
| Press / Review Quote | Social proof block, Loox carousel placeholder |
| Trust Bar Hero | Homepage hero, ad creative for cold traffic |
| Feature/Benefit Grid | Product spec section, post-purchase email |
| "Soothe Your X Naturally" | Top of category landing pages, organic Instagram posts |

---

## Pro Tips

- **Always specify dimensions** (1080×1080 for IG/FB, 1200×628 for FB feed, 1024×1024 for product-page images). Banana Pro defaults can drift.
- **Photorealistic > illustrated** for product hero shots — say "photorealistic" explicitly in the prompt.
- **Negative prompts matter.** Add "no AI hands, no extra fingers, no stock illustrations, no clip-art" to every people-shot prompt.
- **Keep one reference brand element** (palette, font, prop) constant across all 8 infographics so the page reads as one brand.
- **Iterate, don't perfect.** Cheaper to run a prompt 5 times and pick the best than to over-engineer one prompt.
- **Touch up in Canva Pro** if a generated image is 90% there — final headline overlay, brand logo placement, pricing pills.
- **Banana Pro is not Photoshop.** For complex composite work (real founder face onto a generated background), do the base in Banana Pro and finish in Photoshop or Canva.
- **For Accio:** export each infographic as PNG, then upload into Accio's image slots. Accio handles the layout, you provide the visual punch.
