# PRD — LumpiaMoo

## 1. Description

Product Requirements Document for **LumpiaMoo**, a static one-page product-profile website for a UMKM selling beef spring rolls (*lumpia beef*). The site introduces the brand, its product variants, key selling points, and contact/location information.

## 2. Important

- The site is **informational only** — no ordering, no payment, no backend.
- Brand name, palette, and content are **locked** by this PRD; code must not add features beyond the scope here.
- Product variants and contact details are **example data** (`Assumption`) pending real UMKM data.

## 3. Table of Contents

- [4. Scope](#4-scope)
- [5. Goals](#5-goals)
- [6. Non Goals](#6-non-goals)
- [7. Vision Statement](#7-vision-statement)
- [8. Target Personas](#8-target-personas)
- [9. Core Business Value](#9-core-business-value)
- [10. User Journeys & App Flow](#10-user-journeys--app-flow)
- [11. Feature Workflows](#11-feature-workflows)
- [12. Functional Requirements](#12-functional-requirements)
- [13. Non-Functional Requirements](#13-non-functional-requirements)
- [14. Acceptance Criteria](#14-acceptance-criteria)
- [15. External Dependencies & Partners](#15-external-dependencies--partners)
- [Success Metrics](#success-metrics)
- [Related Documents](#related-documents)
- [Open Questions](#open-questions)

## 4. Scope

A single landing page (`index.html`) presenting brand, product variants, selling points, and contact information for the LumpiaMoo beef-lumpia UMKM.

## 5. Goals

- Give prospective buyers a clear, appealing overview of LumpiaMoo and its variants.
- Make prices, variants, and location easy to find on a mobile screen.
- Establish a lightweight brand presence (name, logo, palette, tagline).

## 6. Non Goals

- Online ordering, cart, checkout, or payment.
- User accounts or login.
- A backend, database, CMS, or any server-side logic.
- Framework usage, bundlers, or build tooling.

## 7. Vision Statement

> "LumpiaMoo — kriuk di luar, juicy di dalam."

A playful, modern brand that makes premium-tasting beef lumpia feel approachable and youthful. The website is the digital storefront: it should make a visitor hungry within seconds and tell them exactly what LumpiaMoo sells, why it's good, and where to find it.

## 8. Target Personas

| Persona | Description | Primary Need |
| :--- | :--- | :--- |
| **Cinta (Prospective Buyer)** | Young adult who found LumpiaMoo via Instagram/TikTok | See variants + prices fast, find location |
| **Budi (Gift/Family Buyer)** | Buys in bulk for gatherings | Understand pack sizes (Frozen Pack / Party Box) |
| **Rina (Local Regular)** | Nearby resident | Confirm opening hours and how to reach them |

## 9. Core Business Value

- **Product clarity:** every variant (name, contents, price) is visible at a glance.
- **Appetite appeal:** warm brand colors and appetizing placeholder photography.
- **Trust & reachability:** clear location and opening hours build confidence.

## 10. User Journeys & App Flow

Single-page scroll flow (top → bottom):

```
Hero  →  Tentang (About)  →  Produk (Variants)  →  Keunggulan (Why us)  →  Kontak (Contact)  →  Footer
```

- A visitor lands on the Hero, scrolls to browse variants and prices, then reads the contact section for opening hours and social channels.

## 11. Feature Workflows

| ID | Feature | Workflow |
| :--- | :--- | :--- |
| FW-1 | Brand hero | Visitor sees logo + tagline + hero photo immediately on load |
| FW-2 | About story | Visitor reads a short origin story of the UMKM |
| FW-3 | Product catalog | Visitor scans variant cards (name, contents, price) |
| FW-4 | Selling points | Visitor reads 3–4 reasons to choose LumpiaMoo |
| FW-5 | Contact & location | Visitor finds opening hours, Instagram, WhatsApp (street address deferred) |
| FW-6 | Navigation | Visitor jumps between sections via anchor links (optional, minimal JS or pure CSS) |

## 12. Functional Requirements

| ID | Requirement |
| :--- | :--- |
| FR-1 | The site is a single page: `index.html`. |
| FR-2 | Sections (in order): Hero, Tentang, Produk, Keunggulan, Kontak, Footer. |
| FR-3 | Each product variant renders as a card showing **name**, **contents**, and **price**. |
| FR-4 | The brand palette is applied consistently (see `architecture.md`). |
| FR-5 | The custom SVG logo (`assets/svg/logo.svg`) appears in the header and footer, and as the favicon. |
| FR-6 | Contact section displays opening hours, Instagram, and WhatsApp as **plain information** (no ordering CTA, no buttons that submit). The street address is **deferred** until the owner provides it. |
| FR-7 | Product photos are placeholders sourced from license-free stock, referenced by easily replaceable paths. |

## 13. Non-Functional Requirements

| ID | Requirement |
| :--- | :--- |
| NFR-1 | **Static:** runs from the filesystem or any static host; no server-side runtime. |
| NFR-2 | **No framework:** native HTML + CSS; JavaScript optional and minimal. |
| NFR-3 | **Responsive:** mobile-first; no horizontal scrolling at 360px width. |
| NFR-4 | **Performance:** no external JS/CSS libraries; images sized sensibly. |
| NFR-5 | **Maintainability:** content editable by a non-developer (plain HTML text). |
| NFR-6 | **Accessibility:** semantic landmarks, alt text on images, sufficient color contrast. |

## 14. Acceptance Criteria

| ID | Criterion |
| :--- | :--- |
| AC-1 | `index.html` contains all six sections in the specified order. |
| AC-2 | Every variant card shows name, contents, and price. |
| AC-3 | The brand palette tokens are defined and used. |
| AC-4 | Layout is usable on a 360px-wide viewport with no horizontal scroll. |
| AC-5 | No order button, no form, and no backend call exists anywhere. |
| AC-6 | The SVG logo is referenced in header/footer and as favicon. |
| AC-7 | The contact section shows opening hours, Instagram, and WhatsApp as text only (street address deferred; no address card yet). |
| AC-8 | Placeholder images load from `assets/img/` with replaceable paths. |

## 15. External Dependencies & Partners

- **Stock photo sources:** Pixabay / Pexels (license-free, no attribution required) — used for placeholder imagery.
- **Hosting:** not yet chosen. `TBD`

## Success Metrics

- Visitor can find a variant's price within one scroll.
- Contact details are reachable without leaving the page.
- Site loads with zero external library requests.

## Related Documents

- [`architecture.md`](architecture.md) — stack, file structure, palette, ADRs.
- [`status.md`](status.md) — current execution status.
- [`../getting-started.md`](../getting-started.md) — local setup.

## Open Questions

- Final product variants, prices, and contact details (currently example data).
- Street address not yet available — contact section ships without an address card until provided. `TBD`
- Hosting target and domain (`lumpiamoo.id` is a suggestion). `TBD`
- Whether real product photography is available to replace placeholders. `TBD`
