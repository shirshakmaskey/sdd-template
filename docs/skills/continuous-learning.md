---
name: continuous-learning
description: Extract patterns from sessions into reusable skills and rules
category: optimization
platforms: [claude, antigravity, cursor]
---

# Continuous Learning

When a problem or pattern recurs, extract it into a durable, reusable skill or rule instead of re-discovering it.

## When to Use

- A prompt has been repeated multiple times with the same problem
- A debugging technique was discovered that isn't trivial
- A project-specific pattern keeps coming up
- A workaround was found for a known limitation

## Learning Protocol

### Detect
1. **Recognize repetition.** If you've solved the same problem twice, it's a pattern.
2. **Recognize novel insight.** If a debugging technique or workaround was non-obvious, capture it.

### Extract
3. **Create a learned pattern file** using the template at `docs/templates/learned-pattern.md`:
   ```yaml
   ---
   id: pattern-name
   trigger: "when X happens"
   confidence: 0.0-1.0
   domain: code-style|architecture|testing|debugging|performance
   ---
   ```
4. **Document the pattern:**
   - What to do (action)
   - Why it works (evidence from real experience)
   - Example code or commands

### Integrate
5. **If the pattern is universal,** add it to the relevant rule file in `docs/rules/`.
6. **If the pattern is workflow-specific,** add it to the relevant skill file in `docs/skills/`.
7. **If the pattern is project-specific,** add it to the relevant role file in `docs/roles/`.
8. **For Claude Code:** Patterns can be promoted to instincts in `.claude/homunculus/instincts/`.

### Prune
9. **Retire outdated patterns** when they're superseded by better approaches.
10. **Increase confidence scores** when patterns prove reliable over time.
11. **Decrease or retire** patterns that lead to false positives.

## What NOT to Learn

- Trivial patterns (import ordering, bracket style) — these belong in linter config
- One-off workarounds for temporary bugs
- User preferences that aren't generalizable
