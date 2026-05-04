# {{PROJECT_NAME}} — Project Status & Feature Tracker

> **Last Updated:** {{DATE}}
> **Current Phase:** Not Started — Awaiting Bootstrap

This document is the single source of truth for the current state of the project. Both the developer and the AI agent reference this file to understand what exists, what's in progress, and what's next.

> **Note:** If you see `{{PROJECT_NAME}}` above, this project has not been bootstrapped yet. Start a conversation with your AI agent and it will guide you through the setup process.

---

## Project Health

| Metric | Status |
|--------|--------|
| Current Phase | ⬜ Not Started |
| Total Features Defined | 0 |
| Features Completed | 0 / 0 |
| E2E Tests Defined | 0 |
| E2E Tests Passing | 0 / 0 |
| Spec Files | ⬜ Not created |
| ADRs | ⬜ Not created |

---

## Phase Overview

<!-- BOOTSTRAP: This table is populated during bootstrap Step 8 -->

| Phase | Name | Status | Features | Tests |
|-------|------|--------|----------|-------|
| *Phases will be added during bootstrap* | | | | |

**Legend:** ⬜ Not Started · 🔨 In Progress · ✅ Complete · ❌ Blocked

---

<!-- BOOTSTRAP: Phase detail sections are generated during bootstrap Step 8 -->

## Infrastructure Status

| Component | Status | Notes |
|-----------|--------|-------|
| *Infrastructure components will be listed during bootstrap* | | |

---

## Port Interfaces Status

<!-- BOOTSTRAP: Only applicable if the project uses external service integrations -->

| Interface | Real Adapter | Mock Adapter | Phase |
|-----------|-------------|--------------|-------|
| *Port interfaces will be listed during bootstrap* | | | |

**Legend:** ⬜ Not Implemented · 🔨 In Progress · ✅ Real + Mock Complete

---

## Backlog (Future Features — Not In Any Phase)

> Features requested or identified that are not yet assigned to a phase. These require a new phase document before implementation.

| # | Feature | Requested By | Priority | Notes |
|---|---------|-------------|----------|-------|
| — | *No backlog items yet* | — | — | — |

---

## How To Update This File

This file must be updated when:

1. **Starting a feature** → Change status from ⬜ to 🔨, add notes
2. **Completing a feature** → Change status from 🔨 to ✅, update test counts
3. **Completing a phase** → Update phase overview table, update project health metrics
4. **Adding a backlog item** → Add row to Backlog table
5. **Blocking on something** → Change status to ❌, add blocking reason in notes

This file is referenced in the agent workflow (`AGENTS.md`) and should always reflect the true current state.
