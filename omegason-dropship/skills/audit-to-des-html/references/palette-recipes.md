# Palette recipes by niche

Each recipe replaces the 8 CSS custom properties at the top of the template.
Tested for editorial feel + WCAG-safe text contrast.

## Intimates / Boudoir (dark wine)

```css
--ink:#0e0608; --paper:#f6efe8; --cream:#ede2d6;
--wine:#7a1f2b; --blush:#d9b3ae; --rose:#b07a7a;
--line:rgba(14,6,8,.10); --muted:#6b5b5e; --gold:#a88458;
```

## Clean skincare (sage + bone)

```css
--ink:#1d2a24; --paper:#f4efe6; --cream:#e7e0d2;
--wine:#3e5c4a; --blush:#cfd9c8; --rose:#8aa492;
--line:rgba(29,42,36,.10); --muted:#5d6a60; --gold:#b89968;
```

## Premium supplement (ink + bone)

```css
--ink:#111418; --paper:#f6f3ee; --cream:#e9e4dc;
--wine:#1f3a5f; --blush:#c8d4e4; --rose:#7a8ca0;
--line:rgba(17,20,24,.10); --muted:#5c6470; --gold:#a3884f;
```

## Fashion / lookbook (charcoal + cream)

```css
--ink:#1a1a1a; --paper:#fafaf7; --cream:#ece9e2;
--wine:#5a3624; --blush:#d8c6b0; --rose:#9a7a5e;
--line:rgba(26,26,26,.10); --muted:#5e5e5e; --gold:#a07a4a;
```

## Gadget / tech (paper + electric)

```css
--ink:#0b0c10; --paper:#f5f5f5; --cream:#e7e7e7;
--wine:#1a4ed8; --blush:#cdd9ff; --rose:#7892d6;
--line:rgba(11,12,16,.10); --muted:#5a5e6a; --gold:#6e6e76;
```

## Food / artisan (terracotta + cream)

```css
--ink:#2a1810; --paper:#fbf5ec; --cream:#f0e3cf;
--wine:#a8482b; --blush:#e8c8a6; --rose:#c98a5e;
--line:rgba(42,24,16,.10); --muted:#6b5a48; --gold:#b8884a;
```

## How to pick

1. Eyeball the existing PDP hero photo's dominant tone.
2. Match `--paper` to the brand's neutral background.
3. Match `--wine` to the brand's main accent button or logo.
4. If unsure, choose the niche's recipe above as starting point and tweak `--paper` + `--wine` only.
