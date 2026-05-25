# {{PROJECT_NAME}} — Utilities Reference (The DRY Bible)

> **Important**: Always consult this file before writing a new helper or utility function. If it exists here, import and use it. Do not rewrite it.

---

## Backend Utilities (`{{BACKEND_SRC}}/utils/`)

<!-- BOOTSTRAP: Populated as utilities are created during development -->

### `errors.{{EXT}}`
<!-- Document error classes/hierarchy here -->

| Class | Status Code | Use When |
|-------|------------|----------|
| *Error classes will be documented as they are created* | | |

### `logger.{{EXT}}`
<!-- Document the project's logging utility here -->

---

## Frontend Utilities (`{{FRONTEND_SRC}}/utils/`)

<!-- BOOTSTRAP: Populated as utilities are created during development -->

| Utility | File | Function | Used By |
|---------|------|----------|---------|
| *Frontend utilities will be documented as they are created* | | | |

---

## How To Use This File

1. **Before writing any utility function**, search this file for an existing one.
2. **After creating a new utility**, add an entry here with:
   - File path
   - Function name and signature
   - Brief description of what it does
   - Which components/modules use it
3. **If you find a duplicate**, delete the duplicate and import from the canonical location.

## Why This Matters

Without this reference, AI agents and developers independently create duplicate helper functions (e.g., three different `formatDate()` implementations scattered across the codebase). This file is the single registry that prevents that drift.
