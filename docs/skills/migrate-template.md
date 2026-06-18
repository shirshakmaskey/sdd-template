---
name: migrate-template
description: Migrate an existing SDD project to the upgraded template with ECC patterns
category: workflow
platforms: [claude, antigravity, cursor]
---

# Migrate to Upgraded SDD Template

Integrate the upgraded template (rules, agents, skills, SOPs, AI efficiency) into an existing project that was bootstrapped from the original SDD template.

## When to Use

- You have a project bootstrapped from the original SDD template (e.g., vellum)
- You want to add the ECC-absorbed components (rules, agents, new skills, SOPs, AI efficiency)
- The project already has its own AGENTS.md, roles, specs, phases, and project-specific skills

## What Can Be Safely Copied (No Conflicts)

These are **new directories** that don't exist in old SDD projects. They can be copied wholesale:

| Directory | Files | Notes |
|-----------|-------|-------|
| `docs/rules/` | 6 files (README + 5 rules) | Universal guardrails — no project-specific content |
| `docs/agents/` | 14 files (README + 13 agents) | Universal agent definitions |
| `docs/sops/` | 4 files (README + 3 templates) | SOP templates with `{{PLACEHOLDER}}` values |
| `docs/templates/` | 2 files (session-summary, learned-pattern) | Session management templates |
| `docs/GUIDE.md` | 1 file | Usage guide |
| `docs/skills/SKILL_FORMAT.md` | 1 file | Skill format definition |

### New Skills (copy all — no conflicts with existing project-specific skills)

| Category | Files |
|----------|-------|
| Core | `coding-standards.md`, `api-design.md`, `backend-patterns.md`, `frontend-patterns.md`, `tdd-workflow.md`, `deep-research.md`, `database-migration.md`, `mcp-server-patterns.md` |
| Workflow | `strategic-compact.md`, `session-handoff.md` |
| Verification | `verification-loop.md`, `security-review.md`, `code-review.md`, `e2e-testing.md` |
| AI Optimization | `continuous-learning.md`, `agent-introspection.md`, `context-optimization.md`, `eval-harness.md` |
| Business | `market-research.md`, `competitive-analysis.md`, `product-capability.md`, `brand-discovery.md`, `brand-voice.md`, `investor-materials.md`, `content-engine.md` |

## What Needs a Manual Merge

These files exist in old SDD projects with **project-specific content** and need section-level merging:

### 1. AGENTS.md — Add 3 sections (keep everything else)

**Add after the existing "File Reading Priority" section:**

```markdown
---

## AI Efficiency Protocol

> These rules optimize token usage, context management, and session productivity.

### Token Optimization
- Prefer CLI tools over MCPs when both achieve the same result.
- Use targeted file reads (specific line ranges, not entire files).
- Minimize exploration context: Research → save findings → compact → execute.
- Batch related tool calls in parallel, not sequentially.

### Context Management
- Compact at logical boundaries, not arbitrarily.
- Before compacting, always save state using the session-handoff skill.
- Monitor context budget. Warn at 70% capacity. Suggest compaction at 80%.

### Memory Handoff Protocol
- At session end: Generate a structured handoff summary.
- At session start: Check for previous session summaries in `.sessions/`.
- Storage: Claude uses `~/.claude/session-data/{project}/`. Antigravity uses knowledge system.

### Research-First Development
- Always read existing code before writing new code.
- Check the utilities reference before creating any new helper function.
- Verify spec contracts before implementing.
- Check the dead code tracker to avoid depending on deprecated code.

### Business Pragmatism
- Think like a CTO, not just an engineer.
- Fight over-engineering. YAGNI applies.
- Consider the business stage. Optimize for speed-to-market.
- Apply the "10x users" test.
- Cost is a feature. A $50/month "good enough" solution beats $500/month "perfect."
- Defend the user's time.
```

**Update "File Reading Priority" to include rules and agents:**

```markdown
1. `docs/STATUS.md`
2. Phase README
3. Relevant spec files
4. Relevant rule files (`docs/rules/`)      ← NEW
5. Relevant role files
6. Relevant skill files
7. `docs/UTILITIES_REFERENCE.md`
8. `docs/DEAD_CODE_REFERENCES.md`
9. Relevant agent files (`docs/agents/`)    ← NEW
10. Existing source code
```

**Update the docs/ tree** in the "How This Project Works" section to include:
```
├── agents/    ← Subagent definitions for task delegation
├── rules/     ← Always-on behavioral guardrails
├── sops/      ← Standard Operating Procedures
├── templates/ ← Templates for session summaries, learned patterns
```

### 2. CLAUDE.md — Expand (if it exists)

Replace the one-liner with the expanded version from the template. This is safe because the old CLAUDE.md only says "Read AGENTS.md for all project instructions."

### 3. .gitignore — Add entries

Add these lines to the existing `.gitignore`:

```
# ── AI Agent (Session Data) ──
.sessions/
*.session.md
.claude/homunculus/
.claude/session-data/
```

### 4. docs/skills/README.md — Merge indexes

The existing project has a simple skill index. Add the new categories (Core, Verification, AI Optimization, Business) to the index while keeping the existing project-specific skills listed.

### 5. docs/workflows/discuss.md — Copy and customize

Copy the `discuss.md` workflow and replace `{{PROJECT_NAME}}` and `{{SYSTEM_DESIGN}}` with project-specific values.

### 6. docs/workflows/plan-feature.md — Add Data Safety Assessment

If the project's `plan-feature.md` doesn't already include the Data Safety Assessment, add it to the "Plan & Approve" phase:

```markdown
11. **If the feature involves database changes:**
    - Include a Data Safety Assessment:
      - What existing production data is affected?
      - Risk level: 🟢 Low / 🟡 Medium / 🔴 High
      - For 🟡/🔴: describe preservation and rollback strategy
    - Do NOT write any migration SQL until the plan is approved.
```

## What Should NOT Be Copied

- `docs/STATUS.md` — project-specific
- `docs/CHANGELOG.md` — project-specific
- `docs/UTILITIES_REFERENCE.md` — project-specific
- `docs/DEAD_CODE_REFERENCES.md` — project-specific
- `docs/roles/*` — project-specific (generated during bootstrap)
- `docs/phases/*` — project-specific
- `docs/specs/*` — project-specific
- `docs/adr/*` — project-specific
- Project-specific skills (`add-endpoint.md`, `add-migration.md`, etc.) — already customized

## Execution Checklist

- [ ] Copy `docs/rules/` directory (6 files)
- [ ] Copy `docs/agents/` directory (14 files)
- [ ] Copy `docs/sops/` directory (4 files)
- [ ] Copy `docs/templates/` directory (2 files)
- [ ] Copy `docs/GUIDE.md`
- [ ] Copy `docs/skills/SKILL_FORMAT.md`
- [ ] Copy 21 new skill files to `docs/skills/`
- [ ] Copy `docs/workflows/discuss.md` and customize placeholders
- [ ] Merge: Add AI Efficiency Protocol + Business Pragmatism to AGENTS.md
- [ ] Merge: Update File Reading Priority in AGENTS.md
- [ ] Merge: Update docs/ tree in AGENTS.md
- [ ] Merge: Expand CLAUDE.md
- [ ] Merge: Add session entries to .gitignore
- [ ] Merge: Update docs/skills/README.md index
- [ ] Merge: Add Data Safety Assessment to plan-feature.md (if missing)
- [ ] Create `.sessions/` directory
- [ ] Verify: No existing files were overwritten
- [ ] Commit: `feat(template): integrate upgraded SDD template with ECC patterns`
