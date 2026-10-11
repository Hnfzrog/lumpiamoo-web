# Getting Started — LumpiaMoo

## Description

Orientation and local setup instructions for the LumpiaMoo static website. This is a native HTML + CSS site with **no build step, no dependencies, and no backend**.

## Important

- There is **nothing to install** — the site is plain HTML/CSS served as static files.
- Opening `index.html` directly in a browser is enough for local preview.
- Product photos are placeholders and must be replaced with real UMKM photos before going live.

## Table of Contents

- [Prerequisites](#prerequisites)
- [First Steps](#first-steps)
- [Local Setup](#local-setup)
- [Verification](#verification)
- [Troubleshooting](#troubleshooting)

## Prerequisites

- Any modern web browser (Chrome, Firefox, Safari, Edge).
- *(Optional)* A local static server for accurate relative-path testing, e.g. `python3 -m http.server`.
- *(Optional)* Git, if version control is used.

## First Steps

1. Open the repository root (`lumpia-beef/`).
2. Read [`foundation/prd.md`](foundation/prd.md) for the product scope.
3. Read [`foundation/architecture.md`](foundation/architecture.md) for the stack rules.

## Local Setup

No installation required. Two ways to preview:

```bash
# Option A — open the file directly
open index.html          # macOS

# Option B — serve locally (recommended for accurate paths)
python3 -m http.server 8000
# then browse to http://localhost:8000
```

## Verification

- The page loads without console errors.
- All sections render: Hero, Tentang, Produk, Keunggulan, Kontak, Footer.
- Run the structural check (narrowest applicable validation):

```bash
bash tests/validate-structure.sh
```

## Troubleshooting

| Symptom | Likely Cause | Fix |
| :--- | :--- | :--- |
| Images show broken icon | Missing placeholder file in `assets/img/` | Add the file or update the `src` path |
| Styles not applied | Wrong relative path to `style.css` | Verify `<link href="assets/css/style.css">` |
| Page looks cramped on phone | Viewport meta missing | Confirm `<meta name="viewport" ...>` is present |
| Logo not showing | `assets/svg/logo.svg` missing | Ensure the SVG file exists at that path |

## Related Documents

- [`index.md`](index.md) — documentation inventory.
- [`foundation/architecture.md`](foundation/architecture.md) — stack and file structure.

## Open Questions

- Where will the site be hosted (GitHub Pages, Netlify, cPanel, etc.)? `TBD`
