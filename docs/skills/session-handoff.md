---
name: session-handoff
description: Save and load context between sessions for continuity
category: workflow
platforms: [claude, antigravity, cursor]
---

# Session Handoff

Persist session context so the next session (or a different agent) can pick up seamlessly.

## When to Use

- Ending a long session with incomplete work
- Before context compaction to preserve state
- When context limits are approaching
- Switching between different tasks or phases
- Handing off work to another agent or developer

## Session Summary Format

Create a file at `.sessions/{date}-{topic}.md`:

```markdown
# Session Summary — {DATE}

## Project State
- Current phase: {phase number and name}
- Branch: {current git branch}
- Last commit: {hash and message}

## What Was Accomplished
- [Specific deliverable with file paths]
- [Specific deliverable with file paths]

## Key Decisions Made
- [Decision]: [Reasoning]
- [Decision]: [Reasoning]

## What Worked (with evidence)
- [Approach]: [Evidence it worked — test results, successful behavior]

## What Didn't Work
- [Approach]: [Why it failed — error message, wrong behavior]

## Blockers
- [Blocker]: [What's needed to unblock]

## Next Steps (prioritized)
1. [Most important next task]
2. [Second priority]
3. [Third priority]

## Files Modified
- `path/to/file` — [what changed]
- `path/to/file` — [what changed]

## Open Questions
- [Question for the user or next session]
```

## Save Protocol

1. At session end, generate the session summary.
2. Save to `.sessions/` (gitignored).
3. For Claude Code: also persist to `~/.claude/session-data/{project-name}/`.
4. For Antigravity: the knowledge system handles persistence automatically.

## Load Protocol

1. At session start, check for recent session summaries in `.sessions/`.
2. Read the most recent summary.
3. Confirm understanding with a brief status report to the user.
4. Continue from the prioritized next steps.
