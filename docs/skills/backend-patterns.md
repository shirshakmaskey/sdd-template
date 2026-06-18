---
name: backend-patterns
description: Backend architecture patterns — Route → Service → Repository with port interfaces
category: core
platforms: [claude, antigravity, cursor]
---

# Backend Patterns

Enforce the Route → Service → Repository layered architecture for all backend code.

## When to Use

- Implementing any backend feature
- Reviewing backend code architecture
- Onboarding to the backend codebase

## Layer Responsibilities

### Routes (Controllers)
- Extract request parameters, body, query, headers
- Call the service layer
- Return the response with appropriate status code
- **Never contain business logic**

### Services
- Contain all business logic
- Call repositories for data access
- Call port interfaces for external services
- Handle error cases and throw appropriate error classes
- **Never call the ORM/database directly**
- **Never call external APIs directly**

### Repositories
- Wrap all database access (CRUD operations)
- Use the project's ORM (Prisma, TypeORM, etc.)
- Return plain data objects, not ORM models
- Handle database-specific errors and translate to application errors
- **The only layer that touches the database**

### Port Interfaces & Adapters
- Define interfaces for external service calls (storage, email, payments, AI)
- Real adapters implement the interface with actual API calls
- Mock adapters implement the interface with fake data (for dev/test)
- Selection based on environment profile (dev → mock, production → real)
- **All external calls must use timeouts**

## File Organization

```
src/modules/{feature}/
  {feature}.routes.{ext}       ← Route definitions
  {feature}.service.{ext}      ← Business logic
  {feature}.repository.{ext}   ← Database access
  {feature}.validation.{ext}   ← Input validation schemas
  {feature}.types.{ext}        ← Type definitions (if applicable)
```

## Anti-Patterns (Never Do This)

- ❌ Business logic in route handlers
- ❌ Direct ORM calls in services
- ❌ Direct `fetch()` calls to external APIs
- ❌ Hardcoded config values (use env vars)
- ❌ Circular dependencies between modules
- ❌ God services (single service doing everything)
