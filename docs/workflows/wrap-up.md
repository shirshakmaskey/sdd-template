---
description: Finishes up a feature by updating documentation based on the update-documentation skill
---

We are done with the code and tests. Follow this wrap-up process:

## Phase 1: Quality Gate (must pass before documenting)

1. Run `{{TEST_COMMAND}}` — verify **all tests pass** (0 failures).
2. Run `{{LINT_COMMAND}}` — verify **0 errors, 0 warnings**.
3. Verify no `console.log` or `console.error` in any modified source file.
4. Self-review against `docs/roles/code-reviewer.md` checklist.

## Phase 2: Documentation Updates

5. Follow `docs/skills/update-documentation.md` recipe.
6. Update any modified spec files (`openapi.yaml`, `schema.sql`, `asyncapi.yaml`).
7. Check off the completed feature in the phase README.
8. Add a detailed entry to `docs/CHANGELOG.md`.
9. Update `.env.example` if any new environment variables were added.

## Phase 3: Reference Files

10. If any new utility function was created → add to `docs/UTILITIES_REFERENCE.md`.
11. If any code was deprecated or marked for removal → add to `docs/DEAD_CODE_REFERENCES.md`.
12. If any mock adapter or endpoint was removed → update `docs/DEAD_CODE_REFERENCES.md`.

## Phase 4: Summary

13. Give the user a summary of:
    - What was built (features, files created/modified)
    - What tests were added (count, P-T numbers)
    - What docs were updated
    - Any deviations from specs (tagged `[DEVIATION]`)
    - Final test count and lint status
    - Any open questions or follow-ups
