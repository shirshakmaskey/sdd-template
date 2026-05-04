# {{PROJECT_NAME}} — Phased Implementation Guide

This directory contains the phased implementation plan. Each phase is a self-contained, deployable, testable milestone.

## Rules

1. **No phase starts until the previous phase passes ALL its E2E tests.**
2. **Every external API dependency is behind an interface** with a mock implementation available via configuration.
3. **Each phase is independently testable** — a new developer can run any completed phase locally.
4. **Tests are the acceptance criteria** — if all tests pass, the phase is done.
5. **Scope is sacred** — if a feature isn't in the phase document, it doesn't get built yet.

## External Dependency Mocking Strategy

All external services should be abstracted behind interfaces (ports). The active implementation is selected via environment variable or configuration profile:

| Profile | Behavior |
|---------|----------|
| `dev` | All external APIs use **mock** implementations with deterministic responses |
| `integration` | Uses real **local** infrastructure but mocks all **remote** APIs |
| `staging` | Uses real infrastructure and real APIs with test API keys |
| `production` | Uses real everything with production API keys |

### Mocked Services

<!-- BOOTSTRAP: This table is populated during bootstrap Step 5 -->

| Service | Interface (Port) | Real Adapter | Mock Adapter |
|---------|-------------------|--------------|--------------| 
| *Services will be listed during bootstrap* | | | |

## Phase Index

<!-- BOOTSTRAP: This table is populated during bootstrap Step 5 -->

| Phase | Name | Key Deliverable |
|-------|------|-----------------|
| *Phases will be generated during bootstrap* | | |
