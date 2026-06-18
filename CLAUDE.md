# Claude Code Instructions

Read `AGENTS.md` for all project instructions, rules, and workflows.

## Quick Reference

- **Rules:** `docs/rules/` — Always-on behavioral guardrails (security, coding style, context management, git, testing)
- **Skills:** `docs/skills/` — On-demand workflow recipes (32 skills across 5 categories)
- **Agents:** `docs/agents/` — Subagent definitions for task delegation (13 agents)
- **Workflows:** `docs/workflows/` — High-level agent workflows (plan-feature, build, debug, discuss, test, wrap-up)
- **SOPs:** `docs/sops/` — Standard Operating Procedures (deployment, backup, incident response)
- **Specs:** `docs/specs/` — Engineering contracts (API, database, events)

## Platform Config

During bootstrap, the following directories are generated for Claude Code:

```
.claude/
├── rules/                ← Copied from docs/rules/
├── skills/               ← Copied from docs/skills/
├── agents/               ← Copied from docs/agents/
├── hooks.json            ← Memory persistence + verification hooks
├── settings.json         ← MCP and permission config
└── homunculus/
    └── instincts/        ← Learned patterns (created during development)
```

## Session Management

- Session summaries: `.sessions/` (gitignored)
- Persistent memory: `~/.claude/session-data/{project-name}/`
- Use `strategic-compact` skill before manual compaction
- Use `session-handoff` skill at session end
