# LumpiaMoo — Project Docs (Index)

## Description

Master registry and entry point for all Spec-Driven Development (SDD) documentation of the **LumpiaMoo** project — a static product-profile website for a UMKM (small business) selling beef spring rolls (*lumpia beef*).

## Important

- **Authority order:** project docs → codebase → agent judgment. When docs conflict, the owning doc wins.
- **Bootstrap tier:** Tier 1 (Lite Profile). No `foundation/phases/` and no `foundation/changelog.md` are tracked for this project.
- All project docs live under `docs/project-docs/`.

## Table of Contents

- [Scope](#scope)
- [Doc Inventory](#doc-inventory)
- [Authority & Ownership](#authority--ownership)

## Scope

Covers the documentation inventory, ownership map, and navigation rules for the LumpiaMoo project.

## Goals

- Give developers and AI agents one index to locate the owning document for any decision.
- Prevent cross-document drift by assigning a single owner per topic.

## Non Goals

- Does not restate project requirements or architecture detail — those live in their owning docs below.

## Doc Inventory

| Document | Layer | Owns | Status |
| :--- | :--- | :--- | :--- |
| [`foundation/prd.md`](foundation/prd.md) | foundation | Vision, personas, requirements, acceptance criteria | Active |
| [`foundation/architecture.md`](foundation/architecture.md) | foundation | Tech stack, architecture pattern, data flow, ADRs | Active |
| [`foundation/workflow.md`](foundation/workflow.md) | foundation | Local dev loop, branching, PR/review | Active |
| [`foundation/status.md`](foundation/status.md) | foundation | Execution plan, current state, roadmap | Active |
| [`getting-started.md`](getting-started.md) | root | Orientation and local setup | Active |

## Authority & Ownership

- Vision, personas, requirements → `foundation/prd.md`
- Stack and architecture → `foundation/architecture.md`
- Dev loop and PR process → `foundation/workflow.md`
- Execution plan and progress → `foundation/status.md`

## Related Documents

- [`../README.md`](../../README.md) — repository root readme (if present).

## Open Questions

- None.
