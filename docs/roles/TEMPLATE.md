# Role: {Role Name}

> Reference this file when: {one-line description of when to read this file, e.g., "Writing backend routes, services, or domain logic"}

---

## Conventions

### File Organization

```
src/
├── {module}/
│   ├── models/          ← DTOs and domain models
│   ├── routes/          ← HTTP route handlers (thin — delegate to services)
│   ├── service/         ← Business logic
│   └── repository/      ← Data access layer
```

- {Naming convention 1, e.g., "Files are named in PascalCase: UserService.kt"}
- {Naming convention 2, e.g., "One class per file, named after the class"}

### Coding Patterns

#### {Pattern 1 Name, e.g., "Route → Service Delegation"}

```
{code example showing the pattern}
```

**Why:** {Brief rationale for this pattern}

#### {Pattern 2 Name, e.g., "Port Interface Pattern"}

```
{code example showing the pattern}
```

**Why:** {Brief rationale}

### Error Handling

- {Error handling convention 1, e.g., "All errors use the ErrorResponse envelope"}
- {Error handling convention 2, e.g., "Never catch and swallow exceptions silently"}
- {Error handling convention 3, e.g., "Use typed exceptions for business logic errors"}

### Logging

- {Logging convention, e.g., "Use structured JSON logging"}
- {Log level guidance, e.g., "INFO for business events, DEBUG for internal state, ERROR for failures"}

---

## Anti-Patterns

❌ **Don't:** {Bad pattern description}
```
{code example of what NOT to do}
```

✅ **Do:** {Good pattern description}
```
{code example of what TO do}
```

---

❌ **Don't:** {Another bad pattern}

✅ **Do:** {The correct approach}

---

## Checklist

Before submitting work in this role, verify:

- [ ] Code follows the file organization conventions above
- [ ] All patterns match the examples in this document
- [ ] Error responses use the standard error envelope
- [ ] No direct calls to external APIs (use port interfaces)
- [ ] No business logic in route handlers (delegate to services)
- [ ] All new code has corresponding tests
- [ ] Documentation has been updated (`CHANGELOG.md`, phase README)
