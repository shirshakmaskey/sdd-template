---
name: agent-introspection
description: Debug and improve agent behavior patterns
category: optimization
platforms: [claude, antigravity, cursor]
---

# Agent Introspection

Diagnose and fix patterns where the agent is underperforming, looping, or making systematic mistakes.

## When to Use

- Agent keeps making the same mistake repeatedly
- Agent is stuck in a loop (trying the same approach, failing, retrying)
- Agent misunderstands project conventions despite rules being documented
- Output quality has degraded over a long session

## Diagnostic Steps

### 1. Identify the Symptom
- **Repetition loop:** Agent tries the same fix multiple times
- **Convention violation:** Agent ignores documented patterns
- **Context loss:** Agent forgets decisions made earlier
- **Scope creep:** Agent does more than asked
- **Hallucination:** Agent invents APIs, files, or features that don't exist

### 2. Root Cause Analysis

| Symptom | Likely Cause | Fix |
|---------|-------------|-----|
| Repetition loop | Missing context about why previous attempt failed | Save failure analysis, compact, retry with explicit constraints |
| Convention violation | Rules too far back in context / not loaded | Re-read the relevant rule file explicitly |
| Context loss | Context window pressure | Compact and reload state from session summary |
| Scope creep | Vague instructions | Provide explicit boundaries ("only modify X, don't touch Y") |
| Hallucination | No grounding in actual code | Force file reads before generating code |

### 3. Corrective Actions

- **Add to rules:** If a convention is being violated, it may need to be in `docs/rules/` (always loaded) instead of just in a role file.
- **Add to skills:** If a workflow keeps going wrong, create or update a skill with explicit steps.
- **Improve prompts:** If instructions are being misunderstood, rewrite them to be more explicit.
- **Create a learned pattern:** Use `continuous-learning` skill to capture the fix.

### 4. Verify Fix

- Test the corrected behavior in the current or next session.
- Monitor for regression in subsequent sessions.
