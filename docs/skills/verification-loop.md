---
name: verification-loop
description: Comprehensive verification pipeline — Build → Type → Lint → Test → Security
category: verification
platforms: [claude, antigravity, cursor]
---

# Verification Loop

Run a comprehensive verification pipeline before any PR, phase completion, or major milestone.

## When to Use

- After completing a feature or significant code change
- Before creating a PR or merge request
- After refactoring
- During phase completion

## Verification Phases

### Phase 1: Build Verification

```bash
{{BUILD_COMMAND}}
```

If build fails, **STOP and fix before continuing.** Do not proceed to subsequent phases.

### Phase 2: Type Check (if applicable)

```bash
# TypeScript
npx tsc --noEmit 2>&1 | head -30

# Python
pyright . 2>&1 | head -30
```

Report all type errors. Fix critical ones before continuing.

### Phase 3: Lint Check

```bash
{{LINT_COMMAND}}
```

Must produce **0 errors, 0 warnings.** Fix all issues.

### Phase 4: Test Suite

```bash
{{TEST_COMMAND}}
```

Report:
- Total tests: X
- Passed: X
- Failed: X
- Coverage: X% (target: 80% minimum)

All tests must pass. Fix any failures before continuing.

### Phase 5: Security Scan

```bash
npm audit --production
# OR
pip audit
```

Report any high/critical vulnerabilities. Fix or document with justification.

### Phase 6: Manual Checks

- [ ] No `console.log` or `console.error` in modified files
- [ ] No commented-out code
- [ ] No hardcoded secrets or API keys
- [ ] Self-review against `docs/roles/code-reviewer.md` checklist
- [ ] Documentation updated (CHANGELOG, specs, utilities reference)

## Report Format

```
## Verification Report — {DATE}
- Build: ✅ Pass / ❌ Fail
- Types: ✅ Pass / ❌ {N} errors
- Lint: ✅ 0 issues / ❌ {N} issues
- Tests: ✅ {N}/{N} pass ({X}% coverage) / ❌ {N} failures
- Security: ✅ No vulnerabilities / ⚠️ {N} advisories
- Manual: ✅ All checks pass / ❌ Issues found
```
