---
name: avatar-research
description: Deep avatar research for any product. Mines Amazon reviews, Reddit, YouTube comments, and Quora/forums. Returns structured bullet points like a $100M Facebook ad marketer. Use when the user wants avatar research, customer-language mining, pain/desire mapping, ad angles, or a swipe file for a product. Usage: avatar-research [product name] | [description] | [amazon url 1] [amazon url 2]
---

# Avatar Research

You are performing deep avatar research for a Facebook ad marketer. Your job is to mine real customer language from multiple sources and synthesise it into actionable intelligence.

The user will provide: product name, description, and one or more Amazon URLs.

Parse the input. The format is typically:
- Product name | description | Amazon URL(s)
- Or they may provide them in natural language — extract what you need.

Work through every step below in order. Do not skip any step. Do not ask for permission between steps — execute the full pipeline autonomously.

---

## STEP 1 — AMAZON REVIEW MINING

For each Amazon URL provided:

> **Browser tool:** Use the **Claude in Chrome** MCP. Its tools are deferred, so load them first in ONE call:
> `ToolSearch` → `select:mcp__claude-in-chrome__tabs_create_mcp,mcp__claude-in-chrome__navigate,mcp__claude-in-chrome__javascript_tool,mcp__claude-in-chrome__get_page_text,mcp__claude-in-chrome__read_page`
> Open pages with `navigate`, run the JavaScript snippets below with `javascript_tool`. If the browser MCP is unavailable, fall back to `WebFetch` on the review URLs and extract what you can.

1. Open the URL in a new tab (`tabs_create_mcp`) and `navigate` to it.
2. Wait for the page to load.
3. Run this JavaScript (via `javascript_tool`) to extract product metadata:
```javascript
() => ({
  title: document.querySelector('#productTitle')?.innerText.trim(),
  rating: document.querySelector('#acrPopover .a-icon-alt')?.innerText,
  reviewCount: document.querySelector('#acrCustomerReviewText')?.innerText,
  bullets: Array.from(document.querySelectorAll('#feature-bullets li span.a-list-item')).map(e => e.innerText.trim()).filter(t => t.length > 10)
})
```

4. Extract reviews visible on the product page:
```javascript
() => {
  const reviews = Array.from(document.querySelectorAll('[data-hook="review"]'));
  return reviews.map(r => {
    const lines = r.innerText.split('\n').filter(l => l.trim());
    const bodyStart = lines.findIndex(l => l.includes('Verified Purchase') || l.includes('Vine')) + 1;
    return {
      rating: r.querySelector('[data-hook="review-star-rating"] .a-icon-alt')?.innerText,
      title: r.querySelector('[data-hook="reviewTitle"]')?.innerText?.trim(),
      body: lines.slice(bodyStart).join(' ').trim().slice(0, 1000)
    };
  }).filter(r => r.body);
}
```

5. Then navigate to the all-reviews page sorted by critical (1-star) reviews:
   URL pattern: `https://www.amazon.com/product-reviews/[ASIN]/ref=cm_cr_dp_d_show_all_btm?ie=UTF8&reviewerType=all_reviews&filterByStar=critical&sortBy=recent`
   Extract the ASIN from the product URL.

6. Scrape 1-star and 2-star reviews using the same JavaScript above.

7. Then navigate to 5-star reviews:
   URL pattern: `https://www.amazon.com/product-reviews/[ASIN]/ref=cm_cr_dp_d_show_all_btm?ie=UTF8&reviewerType=all_reviews&filterByStar=five_star&sortBy=helpful`

8. Scrape 5-star reviews.

9. If Amazon redirects to a login page, skip that filter and use the reviews already collected from the product page.

**Collect and store:**
- All review titles and bodies
- Star ratings for each
- Note exact phrases customers use — do not paraphrase

---

## STEP 2 — REDDIT MINING

Use the WebSearch tool to find Reddit threads. Run all searches in parallel where possible.

Search queries to run:
1. `site:reddit.com "[product name]" pain OR problem OR frustrated OR doesn't work`
2. `site:reddit.com "[product category/problem]" recommend OR best OR tried everything`
3. `site:reddit.com "[product name]" review OR experience OR results`
4. `site:reddit.com "[main pain point from Amazon reviews]" help OR advice`

For each result:
- Use WebFetch to read the full thread content
- Extract comments where people describe: their pain, what they've tried, what failed, what worked, and how they feel
- Note exact language — slang, metaphors, emotional expressions

**Priority comments to extract:**
- "I've tried everything and nothing works"
- "Finally something that worked"
- "Don't bother with X because..."
- "I wish I knew this before..."
- "The real problem is..."
- Questions people ask that reveal confusion or objection

---

## STEP 3 — YOUTUBE COMMENT MINING

Use WebSearch to find relevant YouTube videos.

Search queries:
1. `site:youtube.com "[product name]" review`
2. `site:youtube.com "[problem this product solves]" how to fix`
3. `site:youtube.com "[product category]" best OR worst OR honest review`

For the top 3 results:
- Use WebFetch to load the YouTube page
- Extract the video description (reveals what the creator knows about the audience)
- Use this JavaScript via the Claude in Chrome `javascript_tool` to extract visible comments:
```javascript
() => {
  const comments = Array.from(document.querySelectorAll('ytd-comment-thread-renderer #content-text'));
  return comments.map(c => c.innerText.trim()).filter(t => t.length > 30).slice(0, 50);
}
```
- If the browser comments don't load (YouTube requires scroll), use WebSearch instead:
  `site:youtube.com "[product]" review comments` and fetch the page via WebFetch

**Priority comments:**
- People sharing their own experience with the problem
- Questions asked under the video (reveal objections)
- "This worked for me because..."
- "The problem I had was..."
- Disagreements with the video (reveal real objections)

---

## STEP 4 — QUORA + FORUMS MINING

Use WebSearch and WebFetch.

Search queries:
1. `site:quora.com "[product name]" OR "[problem]"`
2. `site:quora.com "best [product category]" OR "does [product name] work"`
3. `"[problem this product solves]" forum OR community OR discussion`
4. `"[product name]" site:trustpilot.com OR site:g2.com OR site:capterra.com`

For each relevant page:
- Use WebFetch to read the full content
- Extract questions people are asking (reveals awareness level and objections)
- Extract answers that resonate (reveals what the market believes works)
- Note any mentions of competitor products and why they failed

---

## STEP 5 — SYNTHESIS (THE $100M MARKETER LAYER)

Now analyse everything you collected through the following 10 frameworks. This is the most important step. Think like a direct response marketer who has done $100M+ in Facebook ad revenue.

For each section below, use **exact customer quotes** wherever possible. Never paraphrase customer language — their words are the copy.

---

### OUTPUT FORMAT

Deliver the full research report in this exact structure:

---

# AVATAR RESEARCH REPORT: [Product Name]

## SOURCES MINED
- Amazon: [X reviews collected — X from 1-star, X from 5-star]
- Reddit: [X threads, X comments]
- YouTube: [X videos, X comments]
- Quora/Forums: [X pages]

---

## 1. WHO IS THE AVATAR

**Demographics (inferred from reviews/comments):**
- Age range:
- Gender skew:
- Life situation:
- How long they've had the problem:

**Psychographics:**
- What they've already tried:
- Their relationship with the problem (accepted it? frustrated? desperate?):
- What they believe about why nothing has worked:
- Their identity around this problem:

---

## 2. THE PAIN POINTS (In Their Exact Words)

List the top 7 pain points. For each one:
- **The pain:** [1 sentence in their language]
- **Their exact quote:** "[direct quote from reviews/comments]"
- **Emotional intensity:** Low / Medium / High / Desperate

---

## 3. THE DREAM OUTCOMES (In Their Exact Words)

List the top 5 desired outcomes. For each:
- **The desire:** [1 sentence]
- **Their exact quote:** "[direct quote]"
- **What this outcome means to their life:** [1 sentence deeper meaning]

---

## 4. WHAT THEY'VE ALREADY TRIED (And Why It Failed)

List every alternative solution mentioned. For each:
- **Product/solution tried:**
- **Why it failed (their words):**
- **How this creates an opportunity for your positioning:**

---

## 5. HIDDEN OBJECTIONS (What Stops Them Buying)

List the top 5 objections in order of frequency. For each:
- **The objection:**
- **The real fear behind it:**
- **How to handle it in ad copy:**

---

## 6. AWARENESS LEVEL MAPPING

Based on the language used in reviews and comments, determine:
- **Current awareness level of cold traffic:** [Unaware / Problem Aware / Solution Aware / Product Aware]
- **Evidence:** [2-3 quotes that prove this]
- **What this means for your hook:** [1-2 sentences on how to open your ad]

---

## 7. COMPETITOR GAPS (What No One Is Saying)

Based on what competitors are promising vs. what customers actually complain about:
- **Gap 1:** [What customers want that competitors aren't delivering]
- **Gap 2:**
- **Gap 3:**
- **Your positioning opportunity:** [1 sentence on how to own the gap]

---

## 8. THE WINNING AD ANGLES (Ready to Write From)

5 specific ad angles based purely on the research. For each:

**Angle [N]: [Name of angle]**
- **Hook:** [Opening line of the ad]
- **Core emotion:** [Fear / Hope / Frustration / Desire / Curiosity]
- **Awareness level targeted:**
- **Why this will work:** [1 sentence based on research evidence]
- **Best format:** [UGC / VSL / Static / Testimonial compilation]

---

## 9. POWER PHRASES (Swipe File)

List 15-20 exact phrases from customer reviews and comments that should be used word-for-word in ad copy. These are the phrases that will make the avatar feel like you read their mind.

- "[exact phrase 1]"
- "[exact phrase 2]"
- ...

---

## 10. THE ONE INSIGHT

The single most important thing you learned from this research that a surface-level marketer would miss. This is the insight that separates a $1K/day campaign from a $10K/day campaign.

---

End of report. Do not add any commentary after the report. The report is the deliverable.
