---
name: code-review
description: Self-review checklist before submitting code
category: verification
platforms: [claude, antigravity, cursor]
---

# Code Review

Self-review checklist to catch common issues before requesting human review.

## When to Use

- After completing any feature implementation
- Before marking a task as done
- As the final step before creating a PR

## Review Checklist

### Correctness
- [ ] Does the implementation match the spec exactly? (field names, types, status codes)
- [ ] Are all edge cases handled? (empty inputs, null values, boundary conditions)
- [ ] Are error paths tested, not just happy paths?
- [ ] Does the code handle concurrent access correctly? (race conditions, locking)

### Architecture
- [ ] Does the code follow Route → Service → Repository layering?
- [ ] Are external calls going through port interfaces?
- [ ] Is business logic in services, not routes or repositories?
- [ ] Are there any circular dependencies?

### Code Quality
- [ ] No `console.log` or debug statements
- [ ] No commented-out code
- [ ] No magic numbers or strings (extract to constants)
- [ ] Functions are focused and under ~50 lines
- [ ] Files are under ~300 lines
- [ ] Variable names are descriptive and consistent
- [ ] No code duplication (check utilities reference)

### Security
- [ ] Inputs validated and sanitized
- [ ] No hardcoded secrets
- [ ] Sensitive data not logged
- [ ] Auth/authz properly enforced

### Testing
- [ ] Tests written for new functionality
- [ ] Tests follow P{n}-T{nn} naming
- [ ] Both success and error paths tested
- [ ] All tests pass (existing + new)

### Documentation
- [ ] Spec files updated if API changed
- [ ] CHANGELOG entry added
- [ ] Utilities reference updated if new utility created
- [ ] Phase README checklist updated
