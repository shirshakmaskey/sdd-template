---
name: eval-harness
description: Quality evaluation framework for agent outputs
category: optimization
platforms: [claude, antigravity, cursor]
---

# Eval Harness

Evaluate the quality of agent-generated code and outputs against defined criteria.

## When to Use

- After completing a complex feature to assess quality
- When comparing different implementation approaches
- During phase completion to evaluate overall quality
- When calibrating agent behavior for a new project

## Evaluation Criteria

### Code Quality Score (1-5)

| Score | Meaning | Indicators |
|-------|---------|------------|
| 5 | Excellent | Clean architecture, comprehensive tests, docs updated, no issues |
| 4 | Good | Minor style issues, good test coverage, docs mostly updated |
| 3 | Acceptable | Works but has code smells, partial test coverage, docs need work |
| 2 | Needs Work | Architecture violations, missing tests, incomplete docs |
| 1 | Unacceptable | Broken, insecure, no tests, no docs |

### Dimensions

1. **Spec Conformance** — Does the implementation match the OpenAPI/schema spec exactly?
2. **Architecture Compliance** — Does it follow Route → Service → Repository?
3. **Test Coverage** — Are both happy and error paths tested?
4. **Security** — Are inputs validated, auth enforced, secrets protected?
5. **Documentation** — Are specs, CHANGELOG, and utilities reference updated?
6. **Token Efficiency** — Was the implementation achieved with minimal context waste?

## Evaluation Process

1. **Run verification loop** (`verification-loop` skill) — get objective metrics.
2. **Score each dimension** 1-5 based on the results.
3. **Calculate overall score** as the average.
4. **Identify the lowest-scoring dimension** — this is the priority fix.
5. **Document findings** for continuous learning.

## Quality Gates

| Gate | Minimum Score | When Applied |
|------|---------------|--------------|
| Feature completion | 3.0 average, no dimension below 2 | After every feature |
| Phase completion | 4.0 average, no dimension below 3 | At phase gate |
| Production release | 4.5 average, no dimension below 4 | Before deploy |
