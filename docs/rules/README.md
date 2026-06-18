# Rules — Behavioral Guardrails

> Always-on behavioral rules that agents must follow in every session. These complement the rules in `AGENTS.md` with more granular, file-based instructions.

## How Rules Work

Rules are loaded automatically by the AI platform at session start:

- **Claude Code:** Copied to `.claude/rules/` during bootstrap → loaded every session
- **Antigravity/Gemini:** Referenced via `AGENTS.md` → read on first task
- **Cursor:** Copied to `.cursor/rules/` during bootstrap

Unlike skills (invoked on demand), rules are **always active**. Keep them concise and actionable.

## Rule Index

| File | Category | Purpose |
|------|----------|---------|
| [security.md](security.md) | Security | Prompt defense baseline, input sanitization, credential handling |
| [coding-style.md](coding-style.md) | Code Quality | Immutability, no debug logs, structured logging, file organization |
| [context-management.md](context-management.md) | AI Efficiency | Token optimization, MCP discipline, context budget awareness |
| [git-workflow.md](git-workflow.md) | Version Control | Conventional commits, branching strategy, push restrictions |
| [testing.md](testing.md) | Quality Assurance | TDD workflow, coverage targets, test naming conventions |

## Adding New Rules

1. Create a new `.md` file in this directory
2. Keep it focused on a single concern
3. Use imperative language ("Do X", "Never Y")
4. Update this README index
5. Rules are auto-copied to platform dirs during the next bootstrap or manual sync
