---
description: Writes E2E tests for recent changes based on the write-e2e-test skill
---

Write End-to-End tests for our recent changes.

## Phase 1: Context

1. Read `docs/skills/write-e2e-test.md` for the step-by-step recipe.
2. Read `docs/roles/test-engineer.md` for test conventions.
3. Check the relevant phase README in `docs/phases/` for the test table — every test maps to a row.

## Phase 2: Write Tests

4. Use the `P{n}-T{nn}` naming format for test files and describe blocks.
5. Follow Arrange-Act-Assert pattern.
6. Assert **full response bodies** — not just status codes.
7. Test error cases: validation failures, unauthorized access, not found, conflicts.
8. Each test is independent — no shared state between tests.

## Phase 3: Coding Standards in Tests

Even test code must follow standards:

- **No `console.log`** — use test framework assertions, not debug output.
- **No hardcoded URLs** — use the project's test client/request pattern.
- **Use helpers** from the project's test helper directory for repetitive setup (auth, seeding, etc.).
- Follow all naming conventions from `docs/roles/test-engineer.md`.

## Phase 4: Verify

9. Run `{{TEST_COMMAND}}` — **all tests must pass** (0 failures, including all pre-existing tests).
10. Run `{{LINT_COMMAND}}` — **0 errors, 0 warnings** (your changes must not introduce warnings).
11. Verify the test count increased (new tests were actually added and run).
12. Ensure no temporary debug code, `console.log`, or `.only`/`.skip` modifiers are left in test files.

## Phase 5: Document

13. Update `docs/CHANGELOG.md` with a note about the tests added.
14. Check off the corresponding test entries in the phase README test table.
