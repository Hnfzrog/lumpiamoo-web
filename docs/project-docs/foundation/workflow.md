# Workflow — LumpiaMoo

## 1. Description

Development workflow for the LumpiaMoo static website: local loop, version control, and review expectations.

## 2. Important

- There is **no build step** — edit files, refresh the browser. This keeps the loop instant.
- `Inferred from codebase`: this repository is **not yet a Git repository** (no `.git`). Git is recommended but optional for a site this small.
- Placeholder content must be replaced before any public launch.

## 3. Table of Contents

- [4. Scope](#4-scope)
- [5. Goals](#5-goals)
- [6. Non Goals](#6-non-goals)
- [7. Local Dev Loop](#7-local-dev-loop)
- [8. Branching Strategy](#8-branching-strategy)
- [9. PR & Code Review](#9-pr--code-review)
- [10. Issue Tracking](#10-issue-tracking)
- [Success Metrics](#success-metrics)
- [Related Documents](#related-documents)
- [Open Questions](#open-questions)

## 4. Scope

The day-to-day change loop, version-control approach, and review rules for the LumpiaMoo website.

## 5. Goals

- Keep iteration fast and frictionless (no tooling ceremony).
- Ensure content changes are reviewed before going live.

## 6. Non Goals

- Defining CI/CD pipelines (none exist for a static site of this size).
- Release management processes.

## 7. Local Dev Loop

1. Edit `index.html` and/or `assets/css/style.css`.
2. Refresh the browser (or reload the local server).
3. Run the structural check:

```bash
bash tests/validate-structure.sh
```

4. Check the page at a mobile width (~360px) and desktop width.

## 8. Branching Strategy

`Assumption` — recommended once Git is initialized:

- `main` — always deployable.
- `feat/<topic>` — for content or layout changes (e.g., `feat/real-product-photos`).

For a site this small, direct edits to `main` are acceptable if changes are reviewed before deploy.

## 9. PR & Code Review

- Keep changes scoped to content, structure, or styling.
- Verify against the Acceptance Criteria in [`prd.md`](prd.md#14-acceptance-criteria).
- Confirm no new external dependency (CSS/JS/font) was introduced.

## 10. Issue Tracking

- No tracker configured. `TBD` — a simple checklist in [`status.md`](status.md) is used meanwhile.

## Success Metrics

- Changes deployable by copying static files.
- No regression in structural validation.

## Related Documents

- [`architecture.md`](architecture.md) — stack and file structure.
- [`../getting-started.md`](../getting-started.md) — setup and verification.

## Open Questions

- Should Git be initialized for this project? `TBD`
- Where will the site be deployed? `TBD`
