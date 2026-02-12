# dsfair_quarto

Deprecated GitHub Pages site. New content lives at **biomathcontent.netlify.app**.

## Structure

- `docs/` contains all rendered HTML files (GitHub Pages serves from `docs/`)
- Source: Quarto project, rendered HTML is committed directly

## Deprecation Banner

- Every HTML file in `docs/` contains a deprecation banner (`<!-- DEPRECATION-BANNER-START -->` block)
- Banner `z-index: 999` — must stay **below** the Bootstrap/Quarto navbar (`z-index: 1030`) so nav dropdowns remain clickable
- Do NOT set banner z-index >= 1000
