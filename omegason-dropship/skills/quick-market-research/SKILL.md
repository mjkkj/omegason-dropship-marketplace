---
name: quick-market-research
description: Run a quick, emotion-based market research report for any brand or product — a competitor snapshot plus real customer language mined from Amazon reviews, Reddit, and social media, delivered as a concise 3-5 page markdown report. Use whenever the user gives a brand website, product link, or product description and wants market research, competitor research, customer language, "voice of customer", pains and desires, objections, or to understand how a market talks — even if they just paste a URL and say "research this", "who am I selling to", "what are people saying about products like this", or "check out my competition".
---

# Quick Market Research

Produce a concise, emotion-based market research report for a brand or product. This is deliberately a QUICK version: the value is in speed and signal, not exhaustiveness. Target 3-5 pages of formatted content. Resist the urge to go deeper — a tight report the user actually reads beats a 25-page document they skim.

## Step 0: Get the product

If the user hasn't provided a brand website URL or a clear product description, ask for one before doing anything else. From the website (or description), note in 3-4 sentences: what the product is, the core desire or problem it addresses, its rough price point, and how it positions itself (superior product vs. identity marketing). This is context for the report intro, not a full brand analysis.

## Step 1: Competitor snapshot

Search the web to identify:

- **5 direct competitors** (similar products solving the same problem). For each: name + link, their main hook/headline angle, rough price, and one line on how they position themselves.
- **2-3 indirect alternatives** (different ways people satisfy the same desire — e.g. for a sleep supplement: white noise apps, prescription meds, weighted blankets). One line each on why people choose them instead.

Close the section with 2-3 sentences on the gap: what angle or positioning nobody in the snapshot is owning.

## Step 2: Customer language mining

This is the heart of the report. Search Amazon reviews, Reddit threads, and social media/YouTube comments for the product category (not the specific brand — the market). Collect **10-15 direct quotes** in customers' own words, spread across:

- Desires — what they want and what getting it would mean emotionally
- Pain points and frustrations — including failed products they tried before
- Objections and skepticism — what makes them hesitate to buy
- "A-ha" moments — how they describe it when something finally works

Quote verbatim, don't paraphrase — the exact phrasing is what makes this useful for ad copy. Link the source where you found each quote (thread, review page, video). If a direct link isn't practical for a particular quote, note where it came from (e.g. "Amazon review, [product name]") and move on — don't let sourcing slow the research down.

## Step 3: Key takeaways

Synthesize the research into:

- **Top 5 desires** in this market, ranked by how often and how intensely they came up
- **Top 5 pain points / objections**, ranked the same way
- **10 buzz words and phrases** the market uses that should appear in marketing copy
- A short paragraph on the market's emotional state (desperate, skeptical, hopeful, burned by past solutions?) and what proof this audience needs before believing a product works

## Output

Save the report as a markdown file and present it to the user. Use this structure:

```
# Quick Market Research: [Product/Brand]
## Product Snapshot
## Competitor Snapshot
### Direct Competitors
### Indirect Alternatives
### The Gap
## Customer Language
### Desires
### Pains & Frustrations
### Objections
### A-ha Moments
## Key Takeaways
### Top 5 Desires
### Top 5 Pains & Objections
### Buzz Words & Phrases
### Emotional State of the Market
```

Format source links as markdown hyperlinks. Keep the whole report to roughly 3-5 pages — if a section is ballooning, cut the weakest material rather than expanding the page count.
