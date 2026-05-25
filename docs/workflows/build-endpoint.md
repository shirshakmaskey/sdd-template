---
description: Implements a new REST endpoint based on the add-endpoint skill
---

Implement a new REST endpoint. Follow these steps precisely:

## Phase 1: Prep

1. Read `docs/skills/add-endpoint.md` for the step-by-step recipe.
2. Check `docs/specs/openapi.yaml` for the exact contract (path, method, request/response schema, status codes).
3. Read `docs/roles/{{BACKEND_ROLE}}` for backend conventions.
4. Read `docs/UTILITIES_REFERENCE.md` — check if any utility you need already exists.

## Phase 2: Build (following standards)

5. **Route file** — Thin route. Extract params, call service, return response. No business logic.
6. **Validation file** — Validate all request inputs using the project's validation library.
7. **Service file** — Business logic here. Use repositories for DB access, port interfaces for external calls.
8. **Repository file** — Wrap all {{ORM_NAME}} calls. Services never call {{ORM_NAME}} directly.
9. Use the project's structured logger — never `console.log`.
10. Use the project's standard error classes for all error responses.
11. Follow all naming conventions in `docs/roles/{{BACKEND_ROLE}}`.

## Phase 3: Verify

12. Run `{{TEST_COMMAND}}` — all tests must pass.
13. Run `{{LINT_COMMAND}}` — **0 errors, 0 warnings**.
14. Self-review against `docs/roles/code-reviewer.md` checklist.
15. If a new utility was created, add it to `docs/UTILITIES_REFERENCE.md`.
