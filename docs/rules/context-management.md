# Context Management Rules

## Token Optimization

- **Prefer CLI tools over MCPs** when both achieve the same result. MCPs consume context window for tool definitions; CLIs do not.
- **Use targeted file reads.** Read specific line ranges instead of entire files. Only read full files on first encounter.
- **Minimize exploration context.** Research → save findings → compact → execute from plan. Don't carry research context into implementation.
- **Route to cheapest sufficient model** for subtasks. Use lighter models for formatting, summarization, and boilerplate generation.
- **Batch related tool calls.** Make independent tool calls in parallel rather than sequentially.

## Context Budget Awareness

- Be aware of the context window size (typically 200K tokens). Warn the user when approaching 70% capacity.
- After completing a major milestone, suggest compaction before starting new work.
- When context pressure is high (responses slow down, coherence drops), proactively suggest saving state and starting fresh.

## Strategic Compaction

- **Do not rely on auto-compaction.** It triggers at arbitrary points, often mid-task.
- **Compact at logical boundaries:**
  - After exploration, before execution
  - After completing a milestone, before starting the next
  - Before major context shifts (switching from backend to frontend work)
- **Before compacting, save state** — summarize what's been accomplished, what decisions were made, and what's next.

## MCP Discipline

- **Keep under 10 MCPs enabled at a time.** Each MCP's tool definitions consume context.
- **Prefer skills + CLI wrappers** over MCPs for version control, databases, and deployment platforms.
- **Disable unused MCPs** between sessions. Navigate to `/plugins` or `/mcp` to manage.

## Research-First Development

- **Always read existing code before writing new code.** Understand the current implementation.
- **Check the utilities reference** (`docs/UTILITIES_REFERENCE.md`) before creating any new helper function.
- **Verify spec contracts** (`docs/specs/`) before implementing. Field names, types, and status codes must match exactly.
- **Check the dead code tracker** (`docs/DEAD_CODE_REFERENCES.md`) to avoid depending on deprecated code.
