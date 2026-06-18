---
name: e2e-testing
description: End-to-end test writing patterns and conventions
category: verification
platforms: [claude, antigravity, cursor]
---

# E2E Testing

Write comprehensive end-to-end tests that validate full request-response cycles.

## When to Use

- After implementing any new endpoint or feature
- When fixing a bug (regression test)
- During phase completion (verify all phase tests pass)

## Test File Structure

```
tests/
  e2e/
    phase-1/
      P1-T01-health-check.test.{ext}
      P1-T02-user-registration.test.{ext}
    phase-2/
      P2-T01-create-resource.test.{ext}
  helpers/
    test-setup.{ext}      ← Database reset, server start
    factories.{ext}        ← Test data factories
    assertions.{ext}       ← Custom assertion helpers
```

## Naming Convention

- File: `P{phase}-T{number}-{kebab-description}.test.{ext}`
- Describe block: `Phase {N} — {Feature Name}`
- Test: `should {expected behavior} when {condition}`

## Writing Tests

### 1. Setup
- Use `beforeAll` for server startup and database connection
- Use `beforeEach` for database reset and seed data
- Use `afterAll` for cleanup

### 2. Assert Full Bodies
```javascript
// ❌ Bad — only checks status
expect(res.status).toBe(200);

// ✅ Good — checks status AND body structure
expect(res.status).toBe(200);
expect(res.body).toMatchObject({
  id: expect.any(String),
  email: 'test@example.com',
  name: 'Test User',
  createdAt: expect.any(String),
});
```

### 3. Test Error Paths
```javascript
// Test duplicate email
const res = await request(app)
  .post('/api/v1/auth/register')
  .send({ email: 'existing@example.com', password: 'password123', name: 'Test' });
expect(res.status).toBe(409);
expect(res.body.message).toContain('already exists');
```

### 4. Use Factories
```javascript
// ❌ Bad — hardcoded test data scattered everywhere
const user = { email: 'test@test.com', name: 'Test', password: 'pass123' };

// ✅ Good — centralized factory
const user = factories.user.build({ email: 'custom@test.com' });
```

## Reference Phase Test Table

Before writing tests, check the phase README's E2E test table to ensure your tests cover the required scenarios.
