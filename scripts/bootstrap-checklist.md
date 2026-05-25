# SDD Bootstrap Checklist (Manual)

> Use this checklist if you're bootstrapping a project **without** an AI agent, or as a reference for what the guided bootstrap process produces.

## Prerequisites

- [ ] You have a clear idea of what you want to build
- [ ] You've created a new repo from this template
- [ ] You've cloned it locally

---

## Step 1: Product Requirements Document (PRD)

- [ ] Write your PRD covering:
  - [ ] Product overview and core principles
  - [ ] System architecture and tech stack
  - [ ] Core workflows (step-by-step user journeys)
  - [ ] API contracts (high-level endpoints)
  - [ ] Security and integration strategy
- [ ] Save as `docs/{project_name}_prd.md`

## Step 2: System Design

- [ ] Write system design covering:
  - [ ] High-level architecture diagram/description
  - [ ] Technology stack with rationale
  - [ ] Module/bounded context breakdown
  - [ ] Data models (tables, relationships)
  - [ ] Integration points (external APIs)
  - [ ] Security and reliability patterns
- [ ] Save as `docs/{project_name}_system_design.md`

## Step 3: Architecture Decision Records

- [ ] Identify all technology decisions
- [ ] For each decision, create an ADR using `docs/adr/TEMPLATE.md`:
  - [ ] ADR for web framework / runtime
  - [ ] ADR for database
  - [ ] ADR for message broker (if applicable)
  - [ ] ADR for auth strategy
  - [ ] ADR for data access / ORM
  - [ ] ADR for hosting / deployment
  - [ ] ADR for AI/ML providers (if applicable)
  - [ ] ADR for frontend framework (if applicable)
- [ ] Update `docs/adr/README.md` index

## Step 4: Engineering Specs

- [ ] Create `docs/specs/openapi.yaml` (if REST API)
  - [ ] Define all endpoints from PRD
  - [ ] Define request/response schemas
  - [ ] Define auth requirements per endpoint
- [ ] Create `docs/specs/asyncapi.yaml` (if async events)
  - [ ] Define all event channels
  - [ ] Define message schemas
- [ ] Create `docs/specs/schema.sql` (if database)
  - [ ] Define all tables, columns, types, constraints
  - [ ] Define indexes
  - [ ] Define enums
- [ ] Create prompt specs in `docs/specs/prompts/` (if LLMs)
  - [ ] System prompt files
  - [ ] Response schema files

## Step 5: Implementation Phases

- [ ] Identify natural phase boundaries
- [ ] Phase 1 must be infrastructure/foundation
- [ ] For each phase, create `docs/phases/phase-{N}-{name}/README.md` using `TEMPLATE.md`:
  - [ ] Feature checklist (numbered `{N}.{M}`)
  - [ ] "What Is NOT In This Phase" exclusions
  - [ ] E2E test table
  - [ ] Setup instructions
  - [ ] Completion criteria
- [ ] Update `docs/phases/README.md` index

## Step 6: Role Files

- [ ] Identify roles based on tech stack
- [ ] For each role, create `docs/roles/{role-name}.md` using `TEMPLATE.md`:
  - [ ] File organization conventions
  - [ ] Coding patterns with examples
  - [ ] Error handling patterns
  - [ ] Anti-patterns
  - [ ] Pre-submission checklist
- [ ] Update `docs/roles/README.md` index

## Step 7: Skill Files

- [ ] Identify common tasks for your project type
- [ ] For each skill, create `docs/skills/{skill-name}.md` using `TEMPLATE.md`:
  - [ ] Prerequisites
  - [ ] Numbered steps
  - [ ] Documentation update step (always last)
- [ ] Update `docs/skills/README.md` index

## Step 8: STATUS.md

- [ ] Replace all `{{PROJECT_NAME}}` placeholders in `docs/STATUS.md`
- [ ] Populate phase overview table
- [ ] Populate feature tables per phase
- [ ] Calculate total features and tests
- [ ] Set all statuses to ⬜

## Step 9: Utilities Reference & Dead Code Tracker

- [ ] Update `docs/UTILITIES_REFERENCE.md`:
  - [ ] Replace `{{PROJECT_NAME}}` with actual project name
  - [ ] Replace `{{BACKEND_SRC}}` and `{{FRONTEND_SRC}}` with project source directories
  - [ ] Replace `{{EXT}}` with primary file extension
  - [ ] Add initial utility entries (error classes, logger) if identified
- [ ] Update `docs/DEAD_CODE_REFERENCES.md`:
  - [ ] Replace `{{PROJECT_NAME}}` with actual project name
  - [ ] Tables start empty (populated during development)

## Step 10: Agent Workflows

- [ ] Determine AI coding platform(s) being used:
  - [ ] Gemini/Jules → `.agents/workflows/`
  - [ ] Cursor → `.cursor/rules/workflows/`
  - [ ] Claude Code → `.claude/workflows/`
  - [ ] Other → use `docs/workflows/` directly
- [ ] Replace all `{{PLACEHOLDER}}` values in `docs/workflows/*.md`:
  - [ ] `{{TEST_COMMAND}}` → your test runner command
  - [ ] `{{LINT_COMMAND}}` → your linter command
  - [ ] `{{BACKEND_SRC}}` → backend source directory
  - [ ] `{{FRONTEND_SRC}}` → frontend source directory
  - [ ] `{{ORM_NAME}}` → your ORM/data access tool
  - [ ] `{{DB_ROLE}}` → your database role file name
  - [ ] `{{BACKEND_ROLE}}` → your backend role file name
  - [ ] `{{FRONTEND_ROLE}}` → your frontend role file name
- [ ] Copy resolved workflow files to platform-specific directory
- [ ] Update platform config file if needed

## Step 11: Finalize AGENTS.md

- [ ] Replace `{{PROJECT_NAME}}` in `AGENTS.md`
- [ ] Add Technology Stack table (from ADRs)
- [ ] Add Feature → Skills Mapping table
- [ ] Add project-specific File Reading Priority
- [ ] Add worked Example Workflow
- [ ] Remove Bootstrap Workflow section

---

## Done! 🎉

Your project is now fully bootstrapped with SDD. Start building Phase 1.

**Before starting:**
- [ ] Commit all documentation: `git add -A && git commit -m "docs: bootstrap SDD documentation"`
- [ ] Create the `dev` branch: `git checkout -b dev`
- [ ] Create first feature branch: `git checkout -b feature/p1-foundation`
