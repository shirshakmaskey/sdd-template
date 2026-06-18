# Testing Rules

## Test-Driven Development

- Write tests before or alongside implementation, not after.
- Follow the red-green-refactor cycle: write a failing test → make it pass → clean up.
- Every bug fix must include a regression test that would have caught the bug.

## Test Naming

- Use `P{n}-T{nn}` naming format for E2E tests (e.g., `P1-T03` = Phase 1, Test 3).
- Name test files to match: `tests/e2e/phase-{N}/P{N}-T{NN}-{description}.test.{ext}`
- Describe tests clearly: `should return 201 with photographer data when valid input provided`

## Test Quality

- Assert full response bodies, not just status codes.
- Test both success and error paths.
- Test edge cases: empty inputs, boundary values, malformed data, duplicate entries.
- Never use `console.log` in test files for debugging — use proper assertions.
- Clean up test data after each test (use `beforeEach`/`afterEach` hooks).

## Coverage Targets

- Target: 80% code coverage minimum for critical paths (auth, payments, data mutations).
- Focus coverage on business logic (services, repositories), not on boilerplate (routes, config).
- 100% coverage is not the goal — meaningful coverage is.

## Test Independence

- Tests must run independently — no test should depend on another test's outcome.
- Tests must be idempotent — running them twice should produce the same result.
- Use factories or builders for test data, not hardcoded fixtures.
- Mock external services at the port interface boundary, not at the HTTP level.

## Verification Pipeline

Before any PR or phase completion, run the full verification pipeline in order:

1. **Build** — Project compiles without errors
2. **Type check** — No type errors (if applicable)
3. **Lint** — 0 errors, 0 warnings
4. **Test suite** — All tests pass with target coverage
5. **Security scan** — No known vulnerabilities in dependencies
