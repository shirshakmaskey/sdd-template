---
name: api-design
description: Design RESTful APIs that conform to project specs and best practices
category: core
platforms: [claude, antigravity, cursor]
---

# API Design

Design and validate RESTful API endpoints that conform to the project's OpenAPI spec.

## When to Use

- Designing a new endpoint or API surface
- Reviewing or modifying an existing endpoint
- Adding a new resource or action to the API

## Design Principles

1. **Spec-first.** Define the endpoint in `docs/specs/openapi.yaml` before writing code.
2. **RESTful conventions.** Use appropriate HTTP methods (GET for reads, POST for creates, PUT/PATCH for updates, DELETE for deletes).
3. **Consistent response format.** All responses follow the project's envelope format.
4. **Consistent error format.** All errors use the project's error envelope with `status`, `message`, and `code` fields.
5. **Versioned URLs.** Prefix with `/api/v1/` unless the project uses a different convention.
6. **Pluralized resources.** Use `/users`, not `/user`.

## Endpoint Design Checklist

### Request
- [ ] HTTP method is appropriate for the action
- [ ] URL follows RESTful conventions (`/resources/:id/sub-resources`)
- [ ] Query params for filtering/pagination on GET endpoints
- [ ] Request body schema defined with all required/optional fields
- [ ] Input validation with trim, max length, and type checks

### Response
- [ ] Success status code is correct (200 OK, 201 Created, 204 No Content)
- [ ] Response body schema matches the OpenAPI spec exactly
- [ ] Pagination metadata for list endpoints (`page`, `limit`, `total`, `totalPages`)
- [ ] Error responses use standard error envelope

### Security
- [ ] Authentication required? Which auth strategy?
- [ ] Authorization rules defined (who can access this endpoint?)
- [ ] Rate limiting considerations
- [ ] Sensitive data excluded from responses (passwords, internal IDs)

### Documentation
- [ ] Endpoint added to `docs/specs/openapi.yaml`
- [ ] Request/response examples included
- [ ] Error cases documented (400, 401, 403, 404, 409, 422, 500)
