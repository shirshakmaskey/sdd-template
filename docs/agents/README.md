# Agents — Specialized Subagent Definitions

> Subagent definitions for task delegation. Each agent has a focused responsibility, allowed tools, and specific skills it can invoke.

## How Agents Work

Agents are definitions that the orchestrator (main Claude session or Antigravity) can delegate tasks to. Each agent runs with limited scope and returns results.

- **Claude Code:** Agents are copied to `~/.claude/agents/` or `.claude/agents/` and invoked via subagent delegation
- **Antigravity/Gemini:** Agent definitions serve as reference for the main agent's delegation patterns
- **Cursor:** Agent definitions are referenced in task planning

## Agent Index

### Engineering Agents

| Agent | Responsibility | Delegated Skills |
|-------|---------------|-----------------|
| [planner](planner.md) | Feature planning & task breakdown | plan-feature, deep-research |
| [architect](architect.md) | System design decisions | api-design, backend-patterns |
| [tdd-guide](tdd-guide.md) | Test-driven development | tdd-workflow, e2e-testing |
| [code-reviewer](code-reviewer.md) | Quality & security review | code-review, security-review |
| [security-reviewer](security-reviewer.md) | Vulnerability analysis | security-review |
| [build-resolver](build-resolver.md) | Build error resolution | debug, verification-loop |
| [e2e-runner](e2e-runner.md) | E2E test execution | e2e-testing, verification-loop |
| [refactor-cleaner](refactor-cleaner.md) | Dead code cleanup & refactoring | continuous-learning |
| [doc-updater](doc-updater.md) | Documentation sync | wrap-up, update-documentation |
| [db-engineer](db-engineer.md) | Database operations | database-migration, build-db |
| [frontend-engineer](frontend-engineer.md) | Frontend development | frontend-patterns |

### Operations Agents

| Agent | Responsibility | Delegated Skills |
|-------|---------------|-----------------|
| [session-manager](session-manager.md) | Context & memory management | strategic-compact, session-handoff |

### Business Agents

| Agent | Responsibility | Delegated Skills |
|-------|---------------|-----------------|
| [business-strategist](business-strategist.md) | Market research, positioning, fundraising, GTM content | market-research, competitive-analysis, product-capability, brand-discovery, brand-voice, investor-materials, content-engine |

## Agent Design Principles

1. **Single responsibility.** Each agent does one thing well.
2. **Explicit scope.** Define what the agent should and should NOT do.
3. **Skill-based.** Agents execute skills — they don't freestyle.
4. **Sandboxed permissions.** Agents only have access to tools they need.
5. **Report back.** Agents return structured results to the orchestrator.
