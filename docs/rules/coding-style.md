# Coding Style Rules

## Code Organization

- One module per file. If a file exceeds ~300 lines, consider splitting by responsibility.
- Group imports: external packages first, then internal modules, then relative imports. Separate groups with a blank line.
- Export public API at the bottom of the file or via an `index` barrel file.
- Name files descriptively: `user.service.js`, `auth.middleware.js`, `payment.repository.js`.

## Code Quality

- Prefer immutability: use `const` over `let`, avoid `var`. Use `Object.freeze()` for config objects.
- Prefer pure functions over stateful methods when possible.
- Avoid deep nesting (max 3 levels). Extract early-return guards.
- Avoid magic numbers and strings — extract to named constants.
- Keep functions focused: one function, one responsibility, under 50 lines.

## Logging & Debugging

- **Never use `console.log` or `console.error` in production code.** Use the project's structured logger.
- Remove all debug logs before completing a task.
- Log at appropriate levels: `error` for failures, `warn` for recoverable issues, `info` for significant events, `debug` for development-only detail.
- Include contextual data in log messages (request ID, user ID, operation name).

## Error Handling

- Always use the project's standard error classes (e.g., `AppError` subclasses).
- Never swallow errors silently — always log or re-throw.
- Use specific error types: `NotFoundError`, `ValidationError`, `AuthenticationError`, `ConflictError`.
- Return structured error responses matching the spec's error envelope format.

## Architecture Patterns

- **Thin routes, fat services.** Routes extract params and return responses. Zero business logic.
- **Services use repositories.** Services never call the ORM/database directly.
- **Port interfaces for external calls.** Never call external APIs directly — always through an adapter behind a port interface.
- **Middleware uses repositories.** Middleware never calls the ORM directly.

## Naming Conventions

- Variables and functions: `camelCase`
- Classes and types: `PascalCase`
- Constants: `UPPER_SNAKE_CASE`
- Files: `kebab-case` or `dot-separated` (e.g., `auth.service.js`)
- Database columns: `snake_case`
- API endpoints: `kebab-case` (e.g., `/api/v1/user-profiles`)

## Comments

- Don't comment *what* the code does — make the code self-documenting.
- Do comment *why* — rationale, trade-offs, non-obvious constraints.
- Use `// TODO:` for planned improvements, `// HACK:` for known workarounds, `// FIXME:` for known bugs.
- Keep JSDoc/docstrings on public API functions and exported modules.
