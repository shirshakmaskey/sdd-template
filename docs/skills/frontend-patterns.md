---
name: frontend-patterns
description: Frontend component architecture, API service layer, and shared utilities
category: core
platforms: [claude, antigravity, cursor]
---

# Frontend Patterns

Enforce consistent frontend architecture with component hierarchy, API service layer, and shared utilities.

## When to Use

- Implementing any frontend feature
- Creating new components or pages
- Reviewing frontend code

## Architecture

### API Service Layer
- **All HTTP calls go through the project's API service module.** Never use raw `fetch()` in components.
- Centralize base URL, auth headers, error handling, and response parsing.
- One method per endpoint: `api.getUsers()`, `api.createPost(data)`.

### Component Hierarchy
```
pages/          ← Route-level components (lazy-loaded)
components/     ← Reusable UI components
  common/       ← Shared across features (Button, Modal, Input)
  {feature}/    ← Feature-specific components
hooks/          ← Custom React hooks
contexts/       ← React context providers
services/       ← API service layer
utils/          ← Shared utility functions
```

### Component Rules
- **One component per file.** Name file same as component.
- **Props interface defined** at the top of the file (TypeScript) or documented with JSDoc.
- **Memoize heavy components** — use `React.memo()` for list items rendered in loops.
- **Code-split routes** — use `React.lazy()` for page-level components.
- **No inline styles** — use CSS modules, Tailwind, or the project's styling solution.

### State Management
- Local state: `useState` for component-specific state
- Shared state: Context API or the project's state management solution
- Server state: React Query / SWR or equivalent
- **Avoid prop drilling** beyond 2 levels — use context or composition

### Shared Utilities
- Import from the project's shared utility files. Never redefine inline.
- Check `docs/UTILITIES_REFERENCE.md` before creating any new utility.
- Common utilities: `formatDate`, `formatCurrency`, `debounce`, `truncate`

## Anti-Patterns
- ❌ Raw `fetch()` calls in components
- ❌ Business logic in components (extract to hooks or services)
- ❌ `console.log` left in committed code
- ❌ Inline utility functions that duplicate shared utilities
- ❌ Uncontrolled re-renders (missing dependency arrays, missing memoization)
