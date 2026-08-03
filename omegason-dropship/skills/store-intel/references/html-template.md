# HTML Template Reference — Store Intel Report (Light Theme)

## Design System

Dùng hệ thống này cho MỌI report. Không thay đổi color scheme hay font stack.

### Fonts (Google Fonts import)
```html
<link href="https://fonts.googleapis.com/css2?family=JetBrains+Mono:wght@400;700&family=DM+Sans:ital,wght@0,400;0,500;0,600;0,700&family=Instrument+Serif:ital@0;1&display=swap" rel="stylesheet">
```

### CSS Variables
```css
:root {
  /* Backgrounds */
  --bg: #fafaf8;
  --surface: #ffffff;
  --surface-2: #f4f3f0;
  --surface-3: #eeedea;

  /* Borders */
  --border: #e0dfdb;
  --border-light: #ececea;

  /* Text */
  --text: #1a1a1a;
  --text-secondary: #5a5a5a;
  --text-dim: #8a8a8a;

  /* Accent colors */
  --accent: #d35400;        /* Primary orange — headers, labels, highlights */
  --accent-light: #fff4ec;  /* Orange tint for backgrounds */
  --green: #1a7a4c;
  --green-light: #edf7f0;
  --blue: #1565a0;
  --blue-light: #eef5fb;
  --purple: #6b3fa0;
  --purple-light: #f3eefb;
  --red: #c0392b;
  --red-light: #fdf0ee;
  --yellow: #b7860e;
  --yellow-light: #fdf8eb;

  /* Fonts */
  --mono: 'JetBrains Mono', monospace;
  --sans: 'DM Sans', sans-serif;
  --display: 'Instrument Serif', serif;
}
```

### Base Styles
```css
* { margin: 0; padding: 0; box-sizing: border-box; }

body {
  background: var(--bg);
  color: var(--text);
  font-family: var(--sans);
  font-size: 15px;
  line-height: 1.75;
  -webkit-font-smoothing: antialiased;
}

.container {
  max-width: 1060px;
  margin: 0 auto;
  padding: 0 28px;
}

@media print {
  body { font-size: 12px; }
  section { page-break-inside: avoid; }
  .no-print { display: none; }
}
```

## Component Library

### Hero Header
```css
.hero {
  padding: 72px 0 48px;
  border-bottom: 2px solid var(--border);
}

.hero-label {
  font-family: var(--mono);
  font-size: 11px;
  text-transform: uppercase;
  letter-spacing: 3px;
  color: var(--accent);
  margin-bottom: 12px;
}

.hero h1 {
  font-family: var(--display);
  font-size: clamp(34px, 5vw, 52px);
  font-weight: 400;    /* Instrument Serif is elegant at normal weight */
  line-height: 1.15;
  margin-bottom: 16px;
  color: var(--text);
}

.hero h1 em {
  color: var(--accent);
  font-style: italic;
}

.hero-sub {
  font-size: 16px;
  color: var(--text-secondary);
  max-width: 680px;
  margin-bottom: 20px;
}

.hero-meta {
  font-family: var(--mono);
  font-size: 11px;
  color: var(--text-dim);
  display: flex;
  gap: 20px;
  flex-wrap: wrap;
}

.hero-meta span {
  display: flex;
  align-items: center;
  gap: 5px;
}

.hero-meta span::before {
  content: '·';
  color: var(--accent);
  font-weight: 700;
}
```

### Metrics Bar
```css
.metrics-bar {
  display: grid;
  grid-template-columns: repeat(auto-fit, minmax(150px, 1fr));
  gap: 1px;
  background: var(--border);
  border: 1px solid var(--border);
  border-radius: 8px;
  overflow: hidden;
  margin: 36px 0;
}

.metric {
  background: var(--surface);
  padding: 20px 16px;
  text-align: center;
}

.metric-value {
  font-family: var(--mono);
  font-size: 24px;
  font-weight: 700;
  margin-bottom: 4px;
}

.metric-value.orange { color: var(--accent); }
.metric-value.green { color: var(--green); }
.metric-value.blue { color: var(--blue); }
.metric-value.purple { color: var(--purple); }

.metric-label {
  font-size: 11px;
  text-transform: uppercase;
  letter-spacing: 1.5px;
  color: var(--text-dim);
}
```

### Section Headers
```css
section {
  padding: 52px 0;
  border-bottom: 1px solid var(--border-light);
}

.section-num {
  font-family: var(--mono);
  font-size: 11px;
  color: var(--accent);
  text-transform: uppercase;
  letter-spacing: 3px;
  margin-bottom: 8px;
}

section h2 {
  font-family: var(--display);
  font-size: clamp(26px, 3.5vw, 38px);
  font-weight: 400;
  margin-bottom: 24px;
  line-height: 1.2;
  color: var(--text);
}

section h3 {
  font-size: 16px;
  font-weight: 700;
  margin: 28px 0 14px;
  color: var(--text);
  padding-left: 14px;
  border-left: 3px solid var(--accent);
}
```

### Cards (5 color variants)
```css
.card {
  background: var(--surface);
  border: 1px solid var(--border);
  border-radius: 8px;
  padding: 24px;
  margin: 16px 0;
  border-left: 3px solid var(--border);
}

.card.orange { border-left-color: var(--accent); background: var(--accent-light); }
.card.green { border-left-color: var(--green); background: var(--green-light); }
.card.blue { border-left-color: var(--blue); background: var(--blue-light); }
.card.purple { border-left-color: var(--purple); background: var(--purple-light); }
.card.red { border-left-color: var(--red); background: var(--red-light); }
.card.yellow { border-left-color: var(--yellow); background: var(--yellow-light); }

.card-title {
  font-family: var(--mono);
  font-size: 11px;
  text-transform: uppercase;
  letter-spacing: 2px;
  margin-bottom: 10px;
}

.card.orange .card-title { color: var(--accent); }
.card.green .card-title { color: var(--green); }
.card.blue .card-title { color: var(--blue); }
.card.purple .card-title { color: var(--purple); }
.card.red .card-title { color: var(--red); }
.card.yellow .card-title { color: var(--yellow); }
```

### Hook Block (for quoting hooks)
```css
.hook-block {
  background: var(--surface-2);
  border: 1px solid var(--border);
  border-radius: 6px;
  padding: 24px;
  margin: 16px 0;
}

.hook-quote {
  font-family: var(--display);
  font-size: 20px;
  font-style: italic;
  color: var(--accent);
  margin-bottom: 12px;
  padding-left: 16px;
  border-left: 3px solid var(--accent);
  line-height: 1.4;
}

.hook-annotation {
  font-family: var(--mono);
  font-size: 11px;
  color: var(--text-dim);
  text-transform: uppercase;
  letter-spacing: 1px;
}
```

### Template Block (for copy templates)
```css
.template {
  background: var(--surface-2);
  border: 1px solid var(--border);
  border-radius: 8px;
  padding: 24px;
  margin: 16px 0;
  font-family: var(--mono);
  font-size: 13px;
  line-height: 2.2;
  color: var(--text-dim);
  white-space: pre-line;
}

.template .slot {
  color: var(--accent);
  font-weight: 700;
  background: var(--accent-light);
  padding: 2px 6px;
  border-radius: 3px;
}

.template .fixed {
  color: var(--text);
}
```

### Data Table
```css
.data-table {
  width: 100%;
  border-collapse: collapse;
  margin: 16px 0;
  font-size: 14px;
}

.data-table th {
  font-family: var(--mono);
  font-size: 11px;
  text-transform: uppercase;
  letter-spacing: 1.5px;
  color: var(--text-dim);
  text-align: left;
  padding: 10px 14px;
  border-bottom: 2px solid var(--border);
  background: var(--surface-2);
}

.data-table td {
  padding: 10px 14px;
  border-bottom: 1px solid var(--border-light);
  vertical-align: top;
}

.data-table tr:hover td {
  background: var(--surface-2);
}
```

### Tags
```css
.tag {
  display: inline-block;
  font-family: var(--mono);
  font-size: 10px;
  text-transform: uppercase;
  letter-spacing: 1px;
  padding: 3px 8px;
  border-radius: 3px;
}

.tag.t-orange { background: var(--accent-light); color: var(--accent); }
.tag.t-green { background: var(--green-light); color: var(--green); }
.tag.t-blue { background: var(--blue-light); color: var(--blue); }
.tag.t-purple { background: var(--purple-light); color: var(--purple); }
.tag.t-red { background: var(--red-light); color: var(--red); }
.tag.t-yellow { background: var(--yellow-light); color: var(--yellow); }
```

### Action Items
```css
.action {
  background: var(--green-light);
  border: 1px solid var(--green);
  border-radius: 8px;
  padding: 20px 20px 20px 44px;
  margin: 14px 0;
  position: relative;
}

.action::before {
  content: '→';
  position: absolute;
  left: 18px;
  top: 20px;
  color: var(--green);
  font-weight: 700;
  font-size: 16px;
}

.action-label {
  font-family: var(--mono);
  font-size: 11px;
  color: var(--green);
  text-transform: uppercase;
  letter-spacing: 2px;
  margin-bottom: 6px;
}
```

### Two-Column Layout
```css
.two-col {
  display: grid;
  grid-template-columns: 1fr 1fr;
  gap: 16px;
  margin: 16px 0;
}

@media (max-width: 700px) {
  .two-col { grid-template-columns: 1fr; }
}
```

### Flow Diagram
```css
.flow {
  display: flex;
  align-items: center;
  gap: 0;
  margin: 20px 0;
  overflow-x: auto;
  padding-bottom: 8px;
}

.flow-step {
  background: var(--surface);
  border: 1px solid var(--border);
  border-radius: 6px;
  padding: 14px 18px;
  min-width: 120px;
  text-align: center;
  flex-shrink: 0;
}

.flow-step .step-num {
  font-family: var(--mono);
  font-size: 10px;
  color: var(--accent);
  text-transform: uppercase;
  letter-spacing: 1px;
}

.flow-step .step-label {
  font-size: 13px;
  font-weight: 700;
  color: var(--text);
}

.flow-arrow {
  color: var(--accent);
  font-size: 18px;
  flex-shrink: 0;
  padding: 0 4px;
}

@media (max-width: 600px) {
  .flow { flex-direction: column; }
  .flow-arrow { transform: rotate(90deg); }
}
```

### Footer
```css
.footer {
  padding: 36px 0;
  text-align: center;
  font-family: var(--mono);
  font-size: 11px;
  color: var(--text-dim);
  letter-spacing: 1px;
  border-top: 1px solid var(--border-light);
}
```

### Comparison Grid
```css
.compare-grid {
  display: grid;
  grid-template-columns: 1fr 1fr;
  gap: 1px;
  background: var(--border);
  border: 1px solid var(--border);
  border-radius: 8px;
  overflow: hidden;
  margin: 16px 0;
}

.compare-cell {
  background: var(--surface);
  padding: 18px;
}

.compare-cell.header {
  background: var(--surface-2);
  font-family: var(--mono);
  font-size: 12px;
  text-transform: uppercase;
  letter-spacing: 1.5px;
  color: var(--text-dim);
}

@media (max-width: 600px) {
  .compare-grid { grid-template-columns: 1fr; }
  .metrics-bar { grid-template-columns: repeat(2, 1fr); }
}
```

## HTML Skeleton

Dùng skeleton này cho mọi report, chỉ thay content:

```html
<!DOCTYPE html>
<html lang="vi">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>{BRAND} Intel — Omegason</title>
<!-- Google Fonts -->
<link href="https://fonts.googleapis.com/css2?family=JetBrains+Mono:wght@400;700&family=DM+Sans:ital,wght@0,400;0,500;0,600;0,700&family=Instrument+Serif:ital@0;1&display=swap" rel="stylesheet">
<style>
  /* Paste all CSS variables + component styles here */
</style>
</head>
<body>
<div class="container">

  <header class="hero">
    <div class="hero-label">Omegason Competitive Intelligence</div>
    <h1>{Brand Name} <em>Playbook</em></h1>
    <p class="hero-sub">{1-2 sentence summary of what this store does and why it's worth analyzing}</p>
    <div class="hero-meta">
      <span>{domain}</span>
      <span>{date}</span>
      <span>Niche: {category}</span>
      <span>Source: WinningHunter</span>
    </div>
  </header>

  <div class="metrics-bar">
    <!-- 5-6 key metrics -->
  </div>

  <!-- 10 sections -->
  <section>
    <div class="section-num">01 — {Section Label}</div>
    <h2>{Section Title}</h2>
    <!-- Content using cards, tables, hooks, templates, actions -->
  </section>

  <!-- ... repeat for all 10 sections ... -->

</div>
<footer class="footer">
  <div class="container">
    OMEGASON INTEL · {BRAND} PLAYBOOK · {MONTH YEAR} · CONFIDENTIAL
  </div>
</footer>
</body>
</html>
```

## Typography Rules

- **h1:** Instrument Serif, font-weight 400 (not bold — elegant at normal weight)
- **h2:** Instrument Serif, font-weight 400
- **h3:** DM Sans, font-weight 700, with left border accent
- **Body:** DM Sans, 15px, line-height 1.75
- **Mono labels:** JetBrains Mono, 11px, uppercase, letter-spacing 2-3px
- **Data values:** JetBrains Mono, 24px bold (in metrics bar)
- **Strong text:** color: var(--accent) — makes bold text stand out via color, not just weight

## Color Usage Rules

- **Orange (--accent):** Section numbers, labels, primary highlights, hook quotes, strong text
- **Green:** Positive metrics, action items, "scaled" tags, growth numbers
- **Blue:** Secondary metrics, tier 2 items, info cards
- **Purple:** Tertiary data, audience segments, interesting patterns
- **Red:** Warnings, pain points, "killed" tags
- **Yellow:** Neutral highlights, template slots, benchmark numbers
- **Never:** Don't use more than 3 colors in a single card. Don't colorize body text.
