# {{PROJECT_NAME}} — Roles

This directory defines the conventions, patterns, and rules for each engineering role in the project. These files serve as instruction sets that ensure consistency across all development work.

## How To Use

Before working on any area of the codebase, read the relevant role file. If a task spans multiple roles (e.g., adding a new endpoint with database access and tests), read all applicable role files.

## Roles

<!-- BOOTSTRAP: This table is populated during bootstrap Step 6 -->

| Role | File | Use When |
|------|------|----------|
| *Roles will be generated during bootstrap based on your tech stack* | | |

## Golden Rules (Apply To All Roles)

1. **Spec is the source of truth.** If the code disagrees with a spec file in `docs/specs/`, the code is wrong.
2. **Phase scope is sacred.** Never implement features from a future phase. Check the phase README.
3. **Mock everything external.** All external APIs go through port interfaces. No direct HTTP calls to third-party services outside of adapter implementations.
4. **ADRs are final.** Technology decisions in `docs/adr/` are settled. Don't introduce alternatives without a new ADR.
5. **Tests are acceptance criteria.** A feature is not done until its phase E2E tests pass.
