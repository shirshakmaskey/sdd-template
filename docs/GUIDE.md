# SDD Template — Complete Usage Guide

> **What this is:** A personalized, spec-driven development environment with deep AI workflow integration, token optimization, and business/marketing capabilities. Built by synthesizing ECC (Everything Claude Code) battle-tested patterns with a clean spec-driven architecture.

> **Who this is for:** You (Shirshak), working across projects with AI coding agents — currently in Antigravity IDE, migrating to Claude Code.

---

## Table of Contents

1. [How the System Works](#1-how-the-system-works)
2. [Directory Map](#2-directory-map)
3. [Starting a New Project (Bootstrap)](#3-starting-a-new-project-bootstrap)
4. [Building Features (Development Mode)](#4-building-features-development-mode)
5. [Skills Reference](#5-skills-reference)
6. [Agents Reference](#6-agents-reference)
7. [Rules Reference](#7-rules-reference)
8. [Workflows Reference](#8-workflows-reference)
9. [Business & Marketing Tools](#9-business--marketing-tools)
10. [AI Efficiency & Token Optimization](#10-ai-efficiency--token-optimization)
11. [Session Management & Memory](#11-session-management--memory)
12. [Platform-Specific Notes](#12-platform-specific-notes)
13. [Quick Reference Card](#13-quick-reference-card)

---

## 1. How the System Works

The template operates in two modes, detected automatically by checking `docs/STATUS.md`:

| Mode | Trigger | What Happens |
|------|---------|--------------|
| **Bootstrap** | `STATUS.md` contains `{{PROJECT_NAME}}` | Agent walks you through 11 setup steps to scaffold a new project |
| **Development** | `STATUS.md` has real project data | Agent follows the classify → plan → build → test → document workflow |

### The Core Loop

Every piece of work follows the same pattern:

```
Understand → Plan → Build → Test → Document → Report
```

The agent never freestyles. It follows **specs** (source of truth), **roles** (coding conventions), **skills** (step-by-step recipes), and **rules** (always-on guardrails).

### The Document Hierarchy

```
AGENTS.md              ← Master instruction set (the agent reads this FIRST)
├── docs/rules/        ← Always-on behavioral guardrails (loaded every session)
├── docs/roles/        ← Coding conventions per domain (loaded per task)
├── docs/skills/       ← On-demand workflow recipes (loaded when needed)
├── docs/agents/       ← Subagent definitions (delegation patterns)
├── docs/workflows/    ← High-level agent workflows (slash commands)
├── docs/specs/        ← Engineering contracts (API, DB, events)
├── docs/phases/       ← Phased implementation milestones
└── docs/sops/         ← Standard Operating Procedures (production ops)
```

**Key principle:** `docs/` is the canonical source of truth. Platform-specific directories (`.claude/`, `.gemini/`) are generated copies during bootstrap.

---

## 2. Directory Map

```
your-project/
├── AGENTS.md                      ← Master agent instructions
├── CLAUDE.md                      ← Claude Code entry point (points to AGENTS.md)
├── .gitignore                     ← Includes .sessions/, .claude/homunculus/
│
├── docs/
│   ├── GUIDE.md                   ← This file
│   ├── CHANGELOG.md               ← Audit trail for all changes
│   ├── STATUS.md                  ← Project health & feature tracker
│   ├── UTILITIES_REFERENCE.md     ← DRY Bible — never duplicate utilities
│   ├── DEAD_CODE_REFERENCES.md    ← Tracks deprecated/dead code
│   │
│   ├── adr/                       ← Architecture Decision Records
│   │   ├── README.md              ← ADR index
│   │   └── TEMPLATE.md            ← ADR format template
│   │
│   ├── agents/                    ← Subagent definitions (13 agents)
│   │   ├── README.md              ← Agent index
│   │   ├── planner.md             ← Feature planning & task breakdown
│   │   ├── architect.md           ← System design decisions
│   │   ├── tdd-guide.md           ← Test-driven development
│   │   ├── code-reviewer.md       ← Quality & security review
│   │   ├── security-reviewer.md   ← Vulnerability analysis
│   │   ├── build-resolver.md      ← Build error resolution
│   │   ├── e2e-runner.md          ← E2E test execution
│   │   ├── refactor-cleaner.md    ← Dead code cleanup
│   │   ├── doc-updater.md         ← Documentation sync
│   │   ├── db-engineer.md         ← Database operations
│   │   ├── frontend-engineer.md   ← Frontend development
│   │   ├── session-manager.md     ← Context & memory management
│   │   └── business-strategist.md ← Market research, fundraising, GTM
│   │
│   ├── phases/                    ← Phased implementation guides
│   │   ├── README.md              ← Phase index
│   │   └── TEMPLATE.md            ← Phase format template
│   │
│   ├── roles/                     ← Coding conventions per domain
│   │   ├── README.md              ← Role index
│   │   └── TEMPLATE.md            ← Role format template
│   │
│   ├── rules/                     ← Always-on guardrails (5 rules)
│   │   ├── README.md              ← Rule index
│   │   ├── security.md            ← Prompt defense, credentials, input safety
│   │   ├── coding-style.md        ← Code quality, naming, error handling
│   │   ├── context-management.md  ← Token optimization, MCP discipline
│   │   ├── git-workflow.md        ← Commits, branches, push restrictions
│   │   └── testing.md             ← TDD, coverage, verification pipeline
│   │
│   ├── skills/                    ← On-demand workflow recipes (32 skills)
│   │   ├── README.md              ← Skill index (with categories)
│   │   ├── SKILL_FORMAT.md        ← Standard skill file format
│   │   ├── TEMPLATE.md            ← Skill creation template
│   │   ├── [8 core skills]
│   │   ├── [2 workflow skills]
│   │   ├── [4 verification skills]
│   │   ├── [4 AI optimization skills]
│   │   ├── [7 business/marketing skills]
│   │   └── [7 existing SDD skills]
│   │
│   ├── sops/                      ← Standard Operating Procedures
│   │   ├── README.md              ← SOP index
│   │   ├── TEMPLATE-deployment-runbook.md
│   │   ├── TEMPLATE-backup-recovery.md
│   │   └── TEMPLATE-incident-response.md
│   │
│   ├── specs/                     ← Engineering contracts
│   │   ├── README.md
│   │   └── prompts/               ← LLM prompt specs (if applicable)
│   │
│   ├── templates/                 ← Reusable templates
│   │   ├── session-summary.md     ← Cross-session handoff format
│   │   └── learned-pattern.md     ← Continuous learning system format
│   │
│   └── workflows/                 ← Agent workflow recipes
│       ├── README.md
│       ├── plan-feature.md        ← Feature planning (with Data Safety Assessment)
│       ├── build-endpoint.md      ← Endpoint creation
│       ├── build-db.md            ← Database operations
│       ├── debug.md               ← Debugging workflow
│       ├── discuss.md             ← Architecture discussion (no-code thinking)
│       ├── test.md                ← Test execution
│       └── wrap-up.md             ← Session wrap-up
│
├── .sessions/                     ← Session artifacts (gitignored)
└── .claude/                       ← Claude Code platform config (generated during bootstrap)
    ├── rules/                     ← Copied from docs/rules/
    ├── skills/                    ← Copied from docs/skills/
    ├── agents/                    ← Copied from docs/agents/
    ├── hooks.json                 ← Memory persistence + verification hooks
    └── homunculus/instincts/      ← Learned patterns (gitignored)
```

---

## 3. Starting a New Project (Bootstrap)

### Prerequisites

1. Clone or copy this template into a new directory
2. Open it in your AI coding IDE (Antigravity or Claude Code)
3. The agent detects `{{PROJECT_NAME}}` in `STATUS.md` and enters Bootstrap Mode

### The 11 Bootstrap Steps

| Step | What Happens | You Provide |
|------|-------------|-------------|
| 1. PRD Intake | Agent reads your product requirements | Your PRD (paste, file, or verbal description) |
| 2. System Design | Agent generates architecture doc | Review & feedback |
| 3. ADRs | Technology decisions locked as Architecture Decision Records | Approve each ADR |
| 4. Engineering Specs | API spec (OpenAPI), DB schema (SQL), event spec (AsyncAPI) | Review & approve |
| 5. Implementation Phases | Project broken into testable milestones | Confirm phase boundaries |
| 6. Role Files | Coding conventions per domain | Review patterns |
| 7. Skill Files | Task-specific recipes | Review & customize |
| 8. STATUS.md | Project health tracker populated | Confirm |
| 9. Utilities & Dead Code | DRY Bible and dead code tracker initialized | Confirm |
| 10. Agent Workflows | Platform-specific configs generated | Confirm platform choice |
| 11. Finalize AGENTS.md | Project-specific values inserted | Final approval |

### Tips for Bootstrap

- **Take your time on Steps 1-3.** These set the foundation — everything else flows from them.
- **Be specific in your PRD.** The more detail you give, the better the specs will be.
- **Challenge the ADRs.** Push back on technology choices if they don't fit your needs.
- **Review phase boundaries.** Make sure Phase 1 is achievable in 1-2 weeks.

---

## 4. Building Features (Development Mode)

Once bootstrapped, every feature follows this exact flow:

### Step 1: Classify
Tell the agent what you want to build. It will:
- Check which phase it belongs to
- Confirm it's in scope
- Identify relevant specs

### Step 2: Plan
The agent reads specs, roles, and skills, then produces a task list. **You approve before any code is written.**

> If the feature touches the database, the plan includes a **Data Safety Assessment** with risk level (🟢/🟡/🔴).

### Step 3: Build
The agent follows the relevant skills step by step:
- Routes → Services → Repositories (backend)
- Components → Hooks → Services (frontend)
- Always through port interfaces for external calls

### Step 4: Test
- Writes E2E tests following `P{n}-T{nn}` naming
- Runs the full verification pipeline (build → type → lint → test → security)

### Step 5: Document
- Updates CHANGELOG, STATUS, phase README
- Updates UTILITIES_REFERENCE if new utilities were created
- Notes any spec deviations with `[DEVIATION]` tag

### Step 6: Report
Summary of what was built, tested, and documented.

### Feature → Skills Mapping

Use this table to know which skills are invoked for each type of work:

| What You're Building | Skills Chain |
|---------------------|-------------|
| New REST endpoint | `add-endpoint` → `write-e2e-test` → `update-documentation` |
| New database table/column | `add-migration` → `write-e2e-test` → `update-documentation` |
| External service integration | `add-port-interface` → `add-endpoint` → `write-e2e-test` → `update-documentation` |
| Background job | `add-worker-job` → `write-e2e-test` → `update-documentation` |
| Frontend component | `add-frontend-component` → `update-documentation` |
| Full-stack feature | `add-migration` → `add-endpoint` → `add-frontend-component` → `write-e2e-test` → `update-documentation` |
| Bug fix | Read role → fix → `write-e2e-test` (regression) → `update-documentation` |
| Phase completion | `run-phase-completion` |

---

## 5. Skills Reference

Skills are on-demand workflow recipes organized by category. The agent loads them when a specific task pattern is needed.

### Core Development (8 skills)

| Skill | When to Use |
|-------|-------------|
| `coding-standards` | Before writing any code — enforces architecture and quality patterns |
| `api-design` | Designing or modifying REST endpoints |
| `backend-patterns` | Any backend implementation (Route → Service → Repository) |
| `frontend-patterns` | Any frontend implementation (component architecture, API service layer) |
| `tdd-workflow` | When you want test-driven development (red-green-refactor) |
| `deep-research` | Investigating unfamiliar codebases, evaluating technologies, debugging complex issues |
| `database-migration` | Any schema change — includes mandatory Data Safety Assessment |
| `mcp-server-patterns` | Setting up or optimizing MCP integrations |

### Workflow & Execution (9 skills)

| Skill | When to Use |
|-------|-------------|
| `strategic-compact` | Context window is filling up — compact at a logical boundary |
| `session-handoff` | Ending a session — save state for next time |
| `add-endpoint` | Creating a new API endpoint (project-specific, generated during bootstrap) |
| `add-migration` | Creating a database migration (project-specific) |
| `add-port-interface` | Integrating an external service |
| `add-worker-job` | Adding background job processing |
| `add-frontend-component` | Creating a new frontend component |
| `update-documentation` | Syncing docs after code changes |
| `run-phase-completion` | Verifying a phase is complete |

### Verification & Quality (4 skills)

| Skill | When to Use |
|-------|-------------|
| `verification-loop` | Full pipeline: Build → Type → Lint → Test → Security |
| `security-review` | Reviewing code that handles auth, payments, or sensitive data |
| `code-review` | Self-review checklist before marking work as done |
| `e2e-testing` | Writing end-to-end tests with full body assertions |

### AI Optimization (4 skills)

| Skill | When to Use |
|-------|-------------|
| `continuous-learning` | A problem or pattern keeps recurring — extract it into a reusable rule |
| `agent-introspection` | Agent is looping, violating conventions, or losing context |
| `context-optimization` | Planning a long session — manage token budget proactively |
| `eval-harness` | Evaluating quality of agent-generated code against defined criteria |

### Business & Marketing (7 skills)

| Skill | When to Use |
|-------|-------------|
| `market-research` | TAM/SAM/SOM estimates, competitor comparisons, technology scans |
| `competitive-analysis` | Building competitor sets, tiering, benchmarking for positioning |
| `product-capability` | Translating PRD into explicit engineering constraints |
| `brand-discovery` | Multi-session brand identity interview → master brandbook |
| `brand-voice` | Building a voice profile from real content for consistent writing |
| `investor-materials` | Pitch decks, memos, financial models, use-of-funds tables |
| `content-engine` | Platform-native content (X, LinkedIn, blogs) with anti-slop filters |

---

## 6. Agents Reference

Agents are specialized subagent definitions. They run with limited scope and return focused results.

### Engineering Agents

| Agent | What It Does | When to Delegate |
|-------|-------------|-----------------|
| **planner** | Breaks features into ordered task lists | Starting any new feature |
| **architect** | Evaluates designs, produces ADRs | Technology or architecture decisions |
| **tdd-guide** | Writes tests first, validates implementations | TDD workflow |
| **code-reviewer** | Reviews code for quality and security | Before merge/completion |
| **security-reviewer** | Focused vulnerability analysis | Auth, payments, sensitive data changes |
| **build-resolver** | Diagnoses and fixes build/lint errors | When builds break |
| **e2e-runner** | Executes test suites, reports results | Test verification |
| **refactor-cleaner** | Dead code cleanup, consolidation | Code hygiene sessions |
| **doc-updater** | Keeps docs in sync with code | After every code change |
| **db-engineer** | Schema design, migrations, optimization | Database work |
| **frontend-engineer** | Component development | Frontend features |

### Operations

| Agent | What It Does | When to Delegate |
|-------|-------------|-----------------|
| **session-manager** | Context budget monitoring, session handoffs | Long sessions, context pressure |

### Business

| Agent | What It Does | When to Delegate |
|-------|-------------|-----------------|
| **business-strategist** | Market research, competitive analysis, fundraising materials, content | Business/marketing tasks |

---

## 7. Rules Reference

Rules are **always active** — loaded every session, enforced at all times. Unlike skills (invoked on demand), you never need to "call" a rule.

| Rule | What It Enforces |
|------|-----------------|
| **security** | Prompt defense, credential handling, input validation, dependency safety, file system safety |
| **coding-style** | Code organization, immutability, structured logging, error classes, naming conventions, architecture patterns |
| **context-management** | Token optimization, targeted file reads, MCP discipline, research-first development, context budget awareness |
| **git-workflow** | Conventional commits, branching strategy, never push, never switch branches without asking |
| **testing** | TDD workflow, P{n}-T{nn} naming, full body assertions, test independence, verification pipeline |

### Non-Negotiable Rules (from AGENTS.md)

These are hard constraints that the agent must never violate:

1. Never implement features outside the current phase scope
2. Never call an external API directly (use port interfaces)
3. Never skip the documentation update step
4. Never modify an accepted ADR (create a superseding one)
5. Always use the consistent error response format
6. Always use `P{n}-T{nn}` naming for E2E tests
7. Never write database migrations without a Data Safety Assessment

---

## 8. Workflows Reference

Workflows are high-level agent recipes invoked as slash commands or explicit instructions.

| Workflow | Command | Purpose |
|----------|---------|---------|
| **Plan Feature** | `/plan-feature` | Full feature planning with scope check, standards, and task breakdown |
| **Build Endpoint** | `/build-endpoint` | Step-by-step endpoint implementation |
| **Build DB** | `/build-db` | Database schema and migration work |
| **Debug** | `/debug` | Systematic debugging workflow |
| **Discuss** | `/discuss` | No-code thinking session with business pragmatism (YAGNI, CTO mindset) |
| **Test** | `/test` | Test execution and verification |
| **Wrap Up** | `/wrap-up` | Session documentation and handoff |

### The Discuss Workflow

This is one of the most powerful workflows — a structured thinking session where **no code is written**:

- **Use it for:** Architecture decisions, technology evaluations, cost optimization, feature prioritization, deployment strategy
- **What makes it special:** The agent is required to challenge your ideas, apply YAGNI checks, estimate costs, and defend your time
- **Output:** Discussion summary + optional ADR if a decision was made

---

## 9. Business & Marketing Tools

These skills are designed to support you **during** project development — not as standalone marketing tools, but as integrated capabilities that feed into engineering decisions.

### Typical Use Cases

| Scenario | Skills to Use |
|----------|--------------|
| "Is this product idea viable?" | `market-research` → `competitive-analysis` |
| "How should I position this?" | `brand-discovery` → `brand-voice` |
| "I need to write a pitch deck" | `investor-materials` (reads from market-research + competitive-analysis outputs) |
| "Translate my PRD into engineering constraints" | `product-capability` |
| "Write a launch post for X/LinkedIn" | `content-engine` (uses `brand-voice` profile) |
| "Do a full competitive landscape" | `competitive-analysis` (tier competitors, score, positioning map) |

### Anti-Slop Guarantee

The `content-engine` skill includes a **banned patterns list** that prevents generic AI copy:

> ❌ "In today's rapidly evolving landscape"
> ❌ "game-changer", "revolutionary", "cutting-edge"
> ❌ "I'm thrilled to announce"
> ❌ "Let's dive in" / "Let's unpack"
> ❌ Any sentence starting with "As a..."

Instead, content starts from **real source material** (your posts, essays, product docs) and adapts to the platform format.

---

## 10. AI Efficiency & Token Optimization

These patterns are baked into AGENTS.md and the rules — the agent follows them automatically. But understanding them helps you get better results.

### Token Optimization

| Technique | What It Does | Impact |
|-----------|-------------|--------|
| **Targeted file reads** | Read specific line ranges, not entire files | Saves 50-80% tokens per file read |
| **CLI over MCP** | Prefer shell commands over MCP tools | MCPs consume context for tool definitions |
| **Batch tool calls** | Make independent calls in parallel | Reduces round-trips |
| **Research → Compact → Execute** | Save findings before compacting | Prevents losing research context |

### Context Budget Awareness

| Signal | What It Means | What to Do |
|--------|--------------|------------|
| Responses slow down | Context pressure | Ask agent to compact |
| Agent repeats itself | Context confusion | Save state, compact, reload |
| Agent forgets instructions | Context overflow | Start new session with handoff |
| Tool results truncated | Window full | Save state, new session |

### When to Compact

- ✅ After research, before implementation
- ✅ After completing a feature, before starting the next
- ✅ After debugging, before implementing the fix
- ❌ Mid-task (will lose context)
- ❌ Without saving state first (will lose decisions)

---

## 11. Session Management & Memory

### How Memory Works

| Platform | Mechanism | Location |
|----------|-----------|----------|
| **Claude Code** | Hooks (automated) | `~/.claude/session-data/{project}/` |
| **Antigravity** | Knowledge items (native) | `.gemini/antigravity-ide/knowledge/` |
| **Both** | Session summaries (manual) | `.sessions/` (gitignored) |

### Session Handoff Protocol

**At session end:**
1. Agent generates a session summary using the template at `docs/templates/session-summary.md`
2. Summary includes: what was done, key decisions, what worked/didn't, prioritized next steps
3. Saved to `.sessions/{date}-{topic}.md`

**At session start:**
1. Agent checks `.sessions/` for recent summaries
2. Loads context from the most recent one
3. Confirms understanding before proceeding

### Learned Patterns (Continuous Learning)

When a pattern recurs or a novel insight is discovered:
1. Agent creates a learned pattern file using `docs/templates/learned-pattern.md`
2. Pattern includes: trigger condition, action, evidence, anti-pattern
3. High-confidence patterns get promoted to rule files or instincts

---

## 12. Platform-Specific Notes

### Claude Code (Primary — migrating to next month)

**Config location:** `.claude/`

| Directory | Purpose | Source |
|-----------|---------|--------|
| `.claude/rules/` | Always-on guardrails | Copied from `docs/rules/` |
| `.claude/skills/` | Workflow recipes | Copied from `docs/skills/` |
| `.claude/agents/` | Subagent definitions | Copied from `docs/agents/` |
| `.claude/hooks.json` | Automated hooks | Generated during bootstrap |
| `.claude/homunculus/instincts/` | Learned patterns | Created during development (gitignored) |

**Hooks system:**
- `PreCompact` — Save session state before auto-compaction
- `Stop` — Generate session summary on session end
- `SessionStart` — Load previous session context
- `PostToolUse` — Verification checks after tool execution

**Entry point:** `CLAUDE.md` → reads `AGENTS.md`

### Antigravity / Gemini (Current)

**Config location:** `.gemini/antigravity-ide/`

| Feature | How It Works |
|---------|-------------|
| Rules | Read from `AGENTS.md` directly (no separate config) |
| Skills | Read from `docs/skills/` on demand |
| Session memory | Native knowledge system (`.gemini/antigravity-ide/knowledge/`) |
| Workflows | Referenced in `AGENTS.md`, read from `docs/workflows/` |

**No hooks system** — session management is manual (use `session-handoff` skill explicitly).

**Entry point:** `AGENTS.md` (read directly)

### Cursor (Secondary)

**Config location:** `.cursor/rules/`

Copy rules and workflows to `.cursor/rules/` manually or during bootstrap. Cursor reads from `.cursorrules` or the rules directory.

---

## 13. Quick Reference Card

### Starting a New Project
```
1. Clone sdd-template into new directory
2. Open in IDE
3. Agent detects {{PROJECT_NAME}} → enters Bootstrap Mode
4. Follow 11 steps (PRD → System Design → ADRs → Specs → Phases → Roles → Skills → STATUS → Utils → Workflows → AGENTS.md)
5. Commit and start Phase 1
```

### Building a Feature
```
1. Tell the agent what you want
2. Agent classifies → reads specs → produces task list
3. You approve the plan
4. Agent builds following skills
5. Agent tests (verification-loop)
6. Agent documents (CHANGELOG, STATUS, specs)
7. Agent reports summary
```

### Key Files to Know

| File | What It Does | When to Read |
|------|-------------|--------------|
| `AGENTS.md` | Master instructions | Agent reads first, you read for reference |
| `docs/STATUS.md` | Project health | Check current state of any phase |
| `docs/CHANGELOG.md` | Change history | Review what's been done |
| `docs/UTILITIES_REFERENCE.md` | DRY Bible | Before creating any utility function |
| `docs/DEAD_CODE_REFERENCES.md` | Dead code tracker | Before depending on old code |

### Commands to Remember

| Action | What to Say |
|--------|------------|
| Plan a feature | "Plan [feature] from Phase [N]" or `/plan-feature` |
| Discuss architecture | "Let's discuss [topic]" or `/discuss` |
| Debug an issue | "Debug [problem]" or `/debug` |
| Run tests | "Run all tests" or `/test` |
| End a session | "Wrap up" or `/wrap-up` |
| Market research | "Research the market for [product/category]" |
| Write a pitch deck | "Create investor materials for [project]" |
| Write launch content | "Write a launch post for [platform]" |
| Competitive analysis | "Analyze competitors for [product]" |
| Brand identity | "Start a brand discovery session" |

### Non-Negotiable Rules (Memorize These)

1. ❌ Never implement outside current phase scope
2. ❌ Never call external APIs directly (use port interfaces)
3. ❌ Never skip documentation updates
4. ❌ Never modify accepted ADRs
5. ✅ Always use error response format from specs
6. ✅ Always use `P{n}-T{nn}` test naming
7. ❌ Never run migrations without Data Safety Assessment

---

> **Last Updated:** June 2026
> **Template Version:** SDD + ECC Synthesis v1.0
> **Components:** 32 skills · 13 agents · 5 rules · 3 SOPs · 8 workflows
