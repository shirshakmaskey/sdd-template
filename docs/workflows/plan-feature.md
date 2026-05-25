---
description: Helps plan and implement a new feature following project conventions
---

I want to start a new feature. Follow this exact process:

## Phase 0: Context & Scope

1. Read `docs/STATUS.md` and the relevant phase README in `docs/phases/` to confirm the feature is in scope. If it is not in any phase, make necessary changes to related documents to adjust it into scope.
2. Read `AGENTS.md` at the project root for the full development workflow.
3. Review the relevant specs in `docs/specs/` (openapi.yaml, schema.sql, or asyncapi.yaml).

## Phase 1: Standards Check

Before writing any code, read and internalize these standards:

4. **Role files** — Read ALL relevant roles in `docs/roles/`:
   - `{{BACKEND_ROLE}}` — Route → Service → Repository pattern, port interfaces
   - `{{FRONTEND_ROLE}}` — Component structure, API service pattern
   - `code-reviewer.md` — Review checklist (you must self-review against this)
   - `test-engineer.md` — E2E test conventions
5. **DRY Bible** — Read `docs/UTILITIES_REFERENCE.md`. Before writing ANY utility or helper function, check if it already exists. If it does, import it. Never duplicate.
6. **Dead Code Tracker** — Read `docs/DEAD_CODE_REFERENCES.md` to avoid depending on deprecated code.

## Phase 2: Coding Standards Enforcement

When writing code, enforce these rules at all times:

### Backend
- **Thin routes, fat services** — Routes extract params and return responses. Zero business logic.
- **Services use repositories** — Services never call {{ORM_NAME}} directly.
- **Middleware uses repositories** — Middleware never call {{ORM_NAME}} directly.
- **Port interfaces for external calls** — Never call external APIs directly.
- **Structured logging only** — Use the project's logger. Never use `console.log` or `console.error` in production code.
- **Standard error classes** — Use the project's error class hierarchy.
- **Input validation** — All request inputs validated with the project's validation library.

### Frontend
- **API service layer** — All HTTP calls go through the project's API service module. Never use raw `fetch()` in components.
- **Shared utilities** — Import from the project's shared utility files. Never redefine inline.
- **No debug logs** — Remove all `console.log` before completing work.

## Phase 3: Plan & Approve

7. Identify the required skills from the Feature-to-Skills mapping in `AGENTS.md`.
8. Provide a step-by-step task list for the user to approve before writing any code.
9. Include in the plan: which files will be created/modified, which specs govern them, and which utilities from `docs/UTILITIES_REFERENCE.md` will be reused.

## Phase 4: Verification Gate

After implementation, before reporting completion:

10. Run `{{TEST_COMMAND}}` — all E2E tests must pass (0 failures).
11. Run `{{LINT_COMMAND}}` — must produce **0 errors, 0 warnings**.
12. Self-review against `docs/roles/code-reviewer.md` checklist.
13. Verify no `console.log` or `console.error` in any modified file.
14. Update `docs/UTILITIES_REFERENCE.md` if any new utility was created.
15. Update `docs/CHANGELOG.md` and phase README.
