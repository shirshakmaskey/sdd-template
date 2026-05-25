---
description: Creates a new database migration based on the add-migration skill
---

Create a new database migration. Follow these steps:

## Phase 1: Prep

1. Read `docs/skills/add-migration.md` for the step-by-step recipe.
2. Verify the required schema in `docs/specs/schema.sql`.
3. Read `docs/roles/{{DB_ROLE}}` for database conventions.

## Phase 2: Build

4. Use {{ORM_NAME}} to generate the migration.
5. Update the repository layer — ALL database access goes through repository classes.
6. Services call repositories. Middleware calls repositories. Nothing calls {{ORM_NAME}} directly.
7. Follow the coding conventions in `docs/roles/{{BACKEND_ROLE}}`.

## Phase 3: Verify

8. Run `{{TEST_COMMAND}}` — all tests must pass.
9. Run `{{LINT_COMMAND}}` — **0 errors, 0 warnings**.
10. If a new repository method was added, ensure it follows the existing patterns in `docs/roles/{{BACKEND_ROLE}}`.
