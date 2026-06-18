---
name: database-migration
description: Safe database migration workflow with Data Safety Assessment
category: core
platforms: [claude, antigravity, cursor]
---

# Database Migration

Safely create and execute database schema changes with mandatory risk assessment.

## When to Use

- Adding, modifying, or removing tables, columns, constraints, or indexes
- Data migrations (transforming existing data)
- Any change to `docs/specs/schema.sql`

## Non-Negotiable Rules

- **Never write or run migrations without presenting a plan first.**
- **Never modify production data without a rollback strategy.**
- **Always update the schema spec after migration.**

## Workflow

### Step 1: Data Safety Assessment

Before writing any migration SQL, complete this assessment:

1. **What existing production data is affected?**
2. **Risk level:**
   - 🟢 **Low** — New table, new nullable column, new index (no existing data affected)
   - 🟡 **Medium** — Column type change, adding NOT NULL constraint, renaming (existing data must be preserved)
   - 🔴 **High** — Dropping table/column, data transformation, destructive migration (data loss possible)
3. **For 🟡/🔴 risk:**
   - Describe the data preservation strategy
   - Describe the rollback strategy
   - Can the migration fail on existing data? How is that handled?
4. **Present the plan to the user and get explicit approval.**

### Step 2: Update Schema Spec

5. Update `docs/specs/schema.sql` with the new schema definition.
6. Include comments explaining each change.

### Step 3: Write Migration

7. Create the migration file using the project's migration tool:
   ```bash
   {{MIGRATION_CREATE_COMMAND}}
   ```
8. Write the UP migration (apply changes).
9. Write the DOWN migration (rollback changes).
10. For 🟡/🔴 migrations, include data preservation logic in the UP migration.

### Step 4: Test

11. Run migration against a test database.
12. Verify data integrity after migration.
13. Run the DOWN migration to verify rollback works.
14. Run all existing tests to check for regressions.

### Step 5: Document

15. Update `docs/CHANGELOG.md` with migration details.
16. Update `docs/STATUS.md` if this unblocks a feature.
