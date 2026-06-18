---
name: context-optimization
description: Token budget management and context efficiency techniques
category: optimization
platforms: [claude, antigravity, cursor]
---

# Context Optimization

Manage token budget efficiently to maintain productive sessions longer.

## When to Use

- Starting a long session with complex multi-phase work
- When context pressure is noticeable (slow responses, repetition)
- When planning how to approach a large task
- When debugging inefficient agent behavior

## Token Budget Strategies

### 1. Targeted File Reads
- Read specific line ranges instead of entire files
- Only read files relevant to the current task
- Use grep/search first, then read the relevant sections

### 2. Research → Compact → Execute
- **Research phase:** Explore broadly, read specs, understand the problem
- **Save findings:** Write a summary of research conclusions
- **Compact:** Clear research context
- **Execute:** Work from the saved summary, not from memory of exploration

### 3. CLI Over MCP
- MCPs register tool definitions that consume context permanently
- CLI commands are one-shot — they don't persist in context
- Wrap common CLI operations into skills instead of keeping MCPs enabled

### 4. Lean Prompts
- Be specific in requests — vague prompts cause exploration loops
- Provide file paths and line numbers when asking about specific code
- Reference skill names instead of re-explaining workflows

### 5. Subagent Delegation
- Delegate bounded tasks to subagents to keep main context clean
- Good delegates: code review, test writing, documentation updates
- Bad delegates: tasks requiring full codebase context

## Context Budget Monitoring

| Signal | Meaning | Action |
|--------|---------|--------|
| Responses are slower | Context pressure | Consider compacting |
| Agent repeats itself | Context confusion | Save state, compact, reload |
| Agent forgets earlier instructions | Context overflow | Critical — compact immediately |
| Tool calls return truncated results | Window full | Save state, start new session |

## Anti-Patterns

- ❌ Reading entire large files "just to understand"
- ❌ Keeping 20+ MCPs enabled simultaneously
- ❌ Long chains of exploratory tool calls without saving findings
- ❌ Re-reading the same files multiple times in one session
- ❌ Carrying debug output in context after the bug is fixed
