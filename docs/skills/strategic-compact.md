---
name: strategic-compact
description: Manual context compaction at logical boundaries to preserve focus
category: workflow
platforms: [claude]
---

# Strategic Compact

Suggest manual context compaction at logical workflow boundaries instead of relying on arbitrary auto-compaction.

## When to Use

- Running long sessions approaching context limits (200K+ tokens)
- Working on multi-phase tasks (research → plan → implement → test)
- Switching between unrelated tasks within the same session
- After completing a major milestone and starting new work
- When responses slow down or become less coherent (context pressure)

## Why Strategic Compaction?

Auto-compaction triggers at arbitrary points:
- Often mid-task, losing important context
- No awareness of logical task boundaries
- Can interrupt complex multi-step operations

Strategic compaction at logical boundaries:
- **After exploration, before execution** — compact research context, keep implementation plan
- **After completing a milestone** — fresh start for next phase
- **Before major context shifts** — clear exploration context before different task

## Compaction Protocol

### Before Compacting

1. **Save state.** Write a session summary (use `session-handoff` skill) capturing:
   - What was accomplished
   - Key decisions made (with reasoning)
   - What approaches worked vs. didn't
   - What's next (prioritized)
2. **Verify the summary** is complete enough to resume from.

### When to Compact

- After research phase, before execution
- After completing a feature, before starting the next
- After debugging, before implementing the fix
- When context pressure is evident (slow responses, repetition)

### After Compacting

3. **Load the saved state** — read the session summary file.
4. **Confirm continuity** — verify you understand the current state and next steps.
5. **Continue execution** from the plan.

## Context Budget Guidelines

| Window Size | Suggest Compact At | Re-remind Every |
|-------------|-------------------|-----------------|
| 200K tokens | ~160K tokens | +60K tokens |
| 1M tokens | ~250K tokens | +100K tokens |
