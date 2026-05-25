---
description: Helps me debug and fix an issue following project conventions
---

I have encountered a bug. Please help me investigate and fix it.

## Phase 1: Understand

1. Read the error details, stack trace, and any reproduction steps.
2. Read the relevant role in `docs/roles/` to ensure the fix follows domain conventions:
   - Backend issue → `docs/roles/{{BACKEND_ROLE}}`
   - Frontend issue → `docs/roles/{{FRONTEND_ROLE}}`
   - Database issue → `docs/roles/{{DB_ROLE}}`
3. Read `docs/UTILITIES_REFERENCE.md` — the fix may involve a utility that already exists.
4. Read `docs/DEAD_CODE_REFERENCES.md` — the bug may involve deprecated code.

## Phase 2: Diagnose

5. Identify the root cause. Look at the full call chain (route → service → repository).
6. Check if the issue involves any known anti-patterns:
   - Direct {{ORM_NAME}} calls outside repositories
   - Raw HTTP calls outside the API service layer
   - `console.log` instead of structured logger
   - Duplicated utility functions instead of shared imports
   - Missing input validation
   - Hardcoded URLs or secrets

## Phase 3: Fix

7. Apply the fix following ALL coding standards:

### Backend Standards
- Routes are thin — business logic goes in services
- Services use repositories for ALL database access (never call {{ORM_NAME}} directly)
- Middleware uses repositories (never call {{ORM_NAME}} directly)
- External calls go through port interfaces
- Use the project's structured logger — never `console.log`/`console.error`
- Use the project's standard error classes for error responses

### Frontend Standards
- All HTTP calls go through the project's API service layer — never raw `fetch()`
- Check `docs/UTILITIES_REFERENCE.md` before writing any formatting helper
- No `console.log` in production code (remove after debugging)

## Phase 4: Test & Verify

8. Follow `docs/skills/write-e2e-test.md` to write a **regression test** using the `P{n}-T{nn}` naming format.
9. Run `{{TEST_COMMAND}}` — **all tests must pass** (0 failures).
10. Run `{{LINT_COMMAND}}` — **0 errors, 0 warnings**.
11. Verify no `console.log` or `console.error` left in any modified file.
12. Remove any temporary debug code, test scripts, or scratch files.

## Phase 5: Document

13. Use `docs/skills/update-documentation.md` to document the fix in `docs/CHANGELOG.md`.
14. If the fix involved creating a new utility, add it to `docs/UTILITIES_REFERENCE.md`.
15. If the fix involved deprecating code, add it to `docs/DEAD_CODE_REFERENCES.md`.
16. Update any specs if the fix deviated from the original contract.
