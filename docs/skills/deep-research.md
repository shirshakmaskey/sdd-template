---
name: deep-research
description: Research-first investigation pattern — understand before implementing
category: core
platforms: [claude, antigravity, cursor]
---

# Deep Research

Thorough investigation before implementation. Use when the problem space is unclear, when multiple approaches exist, or when the stakes are high.

## When to Use

- Investigating a bug with unclear root cause
- Evaluating technology choices or architectural approaches
- Understanding an unfamiliar part of the codebase
- Before making changes to critical systems (auth, payments, data)

## Research Protocol

### Phase 1: Scope

1. **Define the question.** What exactly are we trying to understand or decide?
2. **Set boundaries.** What's in scope and out of scope for this research?
3. **Identify success criteria.** What does "done" look like?

### Phase 2: Gather

4. **Read existing documentation** — specs, ADRs, system design docs, relevant role files.
5. **Read existing code** — trace the execution path, understand current behavior.
6. **Read external sources** — official docs, GitHub issues, Stack Overflow, blog posts.
7. **Every claim needs a source.** Prefer recent data. Call out stale information.

### Phase 3: Analyze

8. **Separate fact from inference from recommendation.** Label each clearly.
9. **Include contrarian evidence.** Present the downsides and counterarguments.
10. **Identify unknowns.** What can't we determine from research alone? What requires experimentation?

### Phase 4: Synthesize

11. **Translate findings into a decision or recommendation,** not just a summary.
12. **Present options with trade-offs** (effort, risk, cost, complexity).
13. **Give your recommendation** and explain why.

## Research Standards

- Every important claim needs a source (URL, file path, or line number).
- Prefer recent data and call out when data may be stale.
- Include contrarian evidence and downside cases.
- Separate fact, inference, and recommendation clearly.

## Token Optimization During Research

- Use targeted file reads (specific line ranges) instead of reading entire files.
- Save research findings to a scratch file before compacting context.
- After research, compact context and execute from the saved findings.
