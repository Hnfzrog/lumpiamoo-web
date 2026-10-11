# Architecture — LumpiaMoo

## 1. Description

System architecture and technical constraints for the LumpiaMoo static website. A single-page static site built with native HTML and CSS, with no backend, no framework, and no build tooling.

## 2. Important

- **No framework, no backend, no build step.** Native HTML + CSS only; JavaScript optional and minimal.
- The file structure below is authoritative — implementation must not add runtime dependencies.
- This document owns the **design tokens (palette)** and **ADRs**.

## 3. Table of Contents

- [4. Scope](#4-scope)
- [5. Goals](#5-goals)
- [6. Non Goals](#6-non-goals)
- [7. Tech Stack Overview](#7-tech-stack-overview)
- [8. Architecture Pattern](#8-architecture-pattern)
- [9. System Flow](#9-system-flow)
- [10. Data Flow](#10-data-flow)
- [11. Tools Integration](#11-tools-integration)
- [12. Global Parameters and Constraints](#12-global-parameters-and-constraints)
- [13. Architecture Decision Records](#13-architecture-decision-records)
- [Success Metrics](#success-metrics)
- [Related Documents](#related-documents)
- [Open Questions](#open-questions)

## 4. Scope

The technical structure, file layout, design tokens, and decisions for the LumpiaMoo static website.

## 5. Goals

- Deliver a fast, dependency-free static site.
- Keep content editable by a non-developer.
- Establish reusable design tokens (colors) for brand consistency.

## 6. Non Goals

- Server-side rendering, APIs, or data persistence.
- Component frameworks, package managers, or bundlers.
- Analytics, CMS, or third-party embeds.

## 7. Tech Stack Overview

| Layer | Choice | Notes |
| :--- | :--- | :--- |
| Markup | **HTML5** | Single `index.html`, semantic landmarks |
| Styling | **CSS3** (one stylesheet) | `assets/css/style.css`, custom properties for tokens |
| Behavior | **Vanilla JS (optional)** | Only if needed (e.g., mobile nav); avoid otherwise |
| Assets | **SVG + raster images** | Custom logo SVG; placeholder photos |
| Runtime | **None** | Opens from filesystem or static host |

## 8. Architecture Pattern

**Single-Page Static Document.** One HTML document, one stylesheet, static assets. No application state, no routing, no server. Section anchors provide in-page navigation.

### File Structure

```
lumpia-beef/
├── index.html
├── assets/
│   ├── css/
│   │   └── style.css
│   ├── img/                 # product photos (license-free stock, JPG)
│   └── svg/
│       └── logo.svg         # custom logo (concept B: bitten lumpia + steam)
├── tests/
│   └── validate-structure.sh
└── docs/
    └── project-docs/        # this documentation set
```

## 9. System Flow

```
Browser  ──loads──▶  index.html
                      │
                      ├── <link rel="stylesheet" href="assets/css/style.css">
                      ├── <link rel="icon" href="assets/svg/logo.svg">
                      └── <img src="assets/img/*.jpg"> (placeholders)
```

No network calls beyond these static asset requests.

## 10. Data Flow

There is **no runtime data flow**. Content is authored statically in `index.html`. Product variant data (name, contents, price) lives in the markup as plain HTML — no JSON, no fetch.

## 11. Tools Integration

| Tool | Purpose | Required? |
| :--- | :--- | :--- |
| Web browser | Preview and manual check | Yes |
| `python3 -m http.server` | Local static serving | Optional |
| `bash tests/validate-structure.sh` | Structural validation | Yes (verification) |

## 12. Global Parameters and Constraints

### Design Tokens (Palette)

| Token | Hex | Role |
| :--- | :--- | :--- |
| `--color-chili` | `#C0392B` | Primary accent |
| `--color-golden` | `#E8A33D` | "Crispy" highlight |
| `--color-cocoa` | `#6B3E26` | Headings / text (earthy) |
| `--color-cream` | `#FFF8F0` | Background |
| `--color-scallion` | `#4E7A3A` | Fresh accent |

### Brand Constants

- **Name:** LumpiaMoo
- **Tagline:** "Kriuk di luar, juicy di dalam."
- **Logo:** SVG, concept B — bitten lumpia with steam.
- **Typography:** system font stack (no web-font dependency).

### Constraints

- No external CSS/JS libraries or web fonts.
- Responsive, mobile-first; target min width 360px.
- Semantic HTML landmarks (`header`, `main`, `section`, `footer`) with accessible labels.

## 13. Architecture Decision Records

| ADR | Decision | Rationale | Status |
| :--- | :--- | :--- | :--- |
| **ADR-001** | Native HTML + CSS, no framework | Requested by owner; minimal footprint; easy to host anywhere | Accepted |
| **ADR-002** | Single-page static site, no backend | Site is informational only; no dynamic data | Accepted |
| **ADR-003** | Custom SVG logo instead of a downloaded logo | Avoids copyright risk; scalable; free | Accepted |
| **ADR-004** | License-free stock photos as placeholders | Unblocks build before real photography exists | Accepted |
| **ADR-005** | No ordering/contact CTA | Scope decision: informational only | Accepted |
| **ADR-006** | UI style: "Liquid Glass" (iOS-modern glassmorphism) | Requested direction; frosted translucent surfaces (`backdrop-filter`) over a warm aurora backdrop, large radii, specular edge highlights. Solid fallback provided for browsers without `backdrop-filter` | Accepted |

## Success Metrics

- Zero external library requests at load.
- Validation script passes all structural checks.

## Related Documents

- [`prd.md`](prd.md) — requirements and acceptance criteria.
- [`../getting-started.md`](../getting-started.md) — local setup and verification.

## Open Questions

- Hosting target. `TBD`
- Whether optional JS navigation is needed or anchor links suffice.
