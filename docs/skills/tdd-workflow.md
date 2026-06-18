---
name: tdd-workflow
description: Test-Driven Development red-green-refactor cycle
category: core
platforms: [claude, antigravity, cursor]
---

# TDD Workflow

Follow the red-green-refactor cycle for reliable, well-tested implementations.

## When to Use

- Implementing any new feature with clear acceptance criteria
- Fixing a bug (write the regression test first)
- When the user explicitly requests TDD approach

## The Cycle

### 🔴 Red: Write a Failing Test

1. Read the spec/requirement carefully.
2. Write a test that describes the expected behavior.
3. Run the test — it MUST fail. If it passes, the test is wrong or the feature already exists.
4. The test should assert the full expected output, not just a status code.

### 🟢 Green: Make It Pass

5. Write the minimum code to make the test pass.
6. Don't optimize, don't refactor, don't add features — just make it green.
7. Run the test — it MUST pass.
8. Run ALL tests — nothing else should have broken.

### 🔵 Refactor: Clean Up

9. Now improve the code: extract functions, remove duplication, improve naming.
10. Run ALL tests after each refactoring step — they must still pass.
11. Don't add new behavior during refactoring.

## Test Writing Standards

- **Name format:** `P{phase}-T{number}` (e.g., `P1-T03`)
- **File location:** `tests/e2e/phase-{N}/P{N}-T{NN}-{description}.test.{ext}`
- **Test structure:** Arrange → Act → Assert
- **Independence:** Each test runs independently — no shared state between tests
- **Cleanup:** Use `beforeEach`/`afterEach` to reset state

## When NOT to Use TDD

- Exploratory prototyping (write tests after)
- UI/visual work (use visual regression testing instead)
- Configuration-only changes
- Documentation-only changes
