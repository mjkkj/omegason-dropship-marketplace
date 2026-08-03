// Run via browser tool: action=act, kind=evaluate, fn=<this entire arrow fn>
// Returns up to 15 product image URLs from a Shopify PDP gallery.
() => {
  const sel = '.product__media img, [class*=gallery] img, [class*=product-media] img, [class*=ProductGallery] img';
  const imgs = Array.from(document.querySelectorAll(sel));
  const seen = new Set();
  const out = [];
  for (const i of imgs) {
    const src = (i.currentSrc || i.src || '').split('&width=')[0];
    if (!src || seen.has(src)) continue;
    seen.add(src);
    out.push({ src: i.currentSrc || i.src, alt: i.alt || '' });
    if (out.length >= 15) break;
  }
  return out;
}
