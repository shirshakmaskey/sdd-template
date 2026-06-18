# {{PROJECT_NAME}} — Agent Instructions

> This file is the **master instruction set** for any AI agent working on this project. Read this file FIRST before doing any work.

## How This Project Works

This project is built using **Spec-Driven Development (SDD)**. All engineering work is governed by documentation in the `docs/` folder:

```
docs/
├── CHANGELOG.md              ← Audit trail for all changes
├── STATUS.md                 ← Project health & feature tracker
├── UTILITIES_REFERENCE.md    ← DRY Bible — registry of all utility functions
├── DEAD_CODE_REFERENCES.md   ← Tracks deprecated code and unused mocks
├── adr/                      ← Architecture Decision Records (technology choices — FINAL)
├── agents/                   ← Subagent definitions for task delegation
├── phases/                   ← Phased implementation guides (scope + acceptance tests)
├── rules/                    ← Always-on behavioral guardrails
├── skills/                   ← Step-by-step recipes for common tasks
├── specs/                    ← Engineering contracts (API, events, database, prompts)
├── roles/                    ← Conventions and patterns per engineering domain
├── sops/                     ← Standard Operating Procedures (deployment, backup, incident)
├── templates/                ← Templates for session summaries, learned patterns
└── workflows/                ← Agent workflow recipes (platform-agnostic)
```

**The specs are the source of truth.** If the code disagrees with a spec, the code is wrong — unless the spec needs updating, in which case follow the deviation process in `docs/skills/update-documentation.md`.

---

## Mode Detection

This AGENTS.md operates in two modes:

- **Bootstrap Mode:** If `docs/STATUS.md` still contains `{{PROJECT_NAME}}`, the project has not been bootstrapped yet. Follow the Bootstrap Workflow below.
- **Development Mode:** If `docs/STATUS.md` has been populated with real project data, follow the Development Workflow below.

---

## Bootstrap Workflow (New Project Setup)

> **Trigger:** `docs/STATUS.md` contains the placeholder `{{PROJECT_NAME}}`

When you detect a new project, guide the user through these 9 steps **one at a time**. Generate each document, present it, wait for user approval, then proceed to the next step.

### Step 1: PRD Intake

**Goal:** Understand what the user wants to build.

1. Ask the user to provide their Product Requirements Document (PRD). They can:
   - Paste it directly
   - Point to a file
   - Describe the project verbally
2. Read and internalize the PRD completely.
3. Summarize back to the user:
   - What the product does (2-3 sentences)
   - Core workflows identified
   - Key integrations/dependencies
   - Target users
4. Save the PRD to `docs/{project_name}_prd.md`
5. **Wait for user confirmation** before proceeding.

### Step 2: System Design

**Goal:** Define the architecture, modules, and data models.

1. Based on the approved PRD, generate a system design document covering:
   - High-level architecture (how components connect)
   - Technology stack recommendations (with rationale)
   - Top-level modules/bounded contexts
   - Data models (high-level schema — tables, relationships)
   - Integration points (external APIs, services)
   - Security and reliability patterns
2. Save to `docs/{project_name}_system_design.md`
3. **Present to user for review.** Expect feedback on:
   - Technology choices (these become ADRs next)
   - Module boundaries
   - Data model shape

### Step 3: Architecture Decision Records (ADRs)

**Goal:** Lock in every technology decision with documented rationale.

1. From the approved system design, identify all technology decisions that need ADRs. Common categories:
   - Web framework / runtime
   - Database(s)
   - Message broker / event system (if applicable)
   - Authentication strategy
   - Data access / ORM layer
   - AI/ML providers (if applicable)
   - Hosting / deployment strategy
   - Frontend framework (if applicable)
2. Generate ADRs **one at a time**, using `docs/adr/TEMPLATE.md` as the format.
3. Name them `adr-{NNN}-{kebab-case-title}.md`
4. Update `docs/adr/README.md` index after each ADR.
5. **Present each ADR to the user for approval** before generating the next one.
6. Once all ADRs are accepted, confirm the full technology stack with the user.

### Step 4: Engineering Specs

**Goal:** Create the engineering contracts that code must conform to.

Based on the approved system design and ADRs, generate applicable specs:

1. **API Spec** (`docs/specs/openapi.yaml`) — if the project has REST endpoints:
   - Define all endpoints from the PRD
   - Include request/response schemas, status codes, auth requirements
   - Use OpenAPI 3.0+ format

2. **Event Spec** (`docs/specs/asyncapi.yaml`) — if the project has async events:
   - Define all event channels, message schemas
   - Use AsyncAPI 2.0+ format

3. **Database Schema** (`docs/specs/schema.sql`) — if the project has a database:
   - Define all tables, columns, types, constraints, indexes
   - Include comments explaining each table's purpose
   - Reference the data models from the system design

4. **Prompt Specs** (`docs/specs/prompts/`) — if the project uses LLMs:
   - System prompts with exact wording
   - Response JSON schemas
   - One file per prompt type

Generate each spec **one at a time**, present to user, wait for approval.

### Step 5: Implementation Phases

**Goal:** Break the project into ordered, testable milestones.

1. Analyze the system design and specs to identify natural phase boundaries.
2. **Rules for phasing:**
   - Phase 1 is always **infrastructure/foundation** (project scaffold, DB, auth, health checks)
   - Each phase builds on the previous — no forward dependencies
   - Each phase must be independently deployable and testable
   - Each phase has a clear, one-sentence goal
3. For each phase, generate a README using `docs/phases/TEMPLATE.md`:
   - Feature checklist (numbered `{phase}.{feature}`)
   - What is NOT in this phase (explicit exclusions)
   - E2E test table (numbered, with Action and Expected columns)
   - Setup instructions
   - Completion criteria
4. Save phases to `docs/phases/phase-{N}-{name}/README.md`
5. Update `docs/phases/README.md` with the phase index.
6. **Present the phase breakdown to user for review.** Key decisions:
   - Are the phase boundaries correct?
   - Is Phase 1 scope right?
   - Are the test tables comprehensive?

### Step 6: Role Files

**Goal:** Define coding conventions for each engineering domain.

1. Based on the tech stack from the ADRs, identify which roles are needed. Common roles:
   - **Backend Developer** — always needed (framework-specific conventions)
   - **Database Engineer** — if project has a database
   - **DevOps Engineer** — always needed (Docker, CI/CD, env config)
   - **AI/ML Engineer** — if project uses LLMs or ML models
   - **Frontend Developer** — if project has a frontend
   - **Test Engineer** — always needed
   - **Code Reviewer** — always needed
2. Generate each role file using `docs/roles/TEMPLATE.md`:
   - File organization conventions
   - Coding patterns with code examples (in the project's language)
   - Error handling patterns
   - Anti-patterns
   - Pre-submission checklist
3. Name them descriptively (e.g., `kotlin-backend.md`, `nextjs-frontend.md`, `postgres-engineer.md`)
4. Update `docs/roles/README.md` index.
5. **Present to user for review.**

### Step 7: Skill Files

**Goal:** Create step-by-step recipes for common tasks.

1. Based on the project type and tech stack, identify needed skills. Universal skills:
   - **Write E2E Test** — always needed
   - **Update Documentation** — always needed
   - **Run Phase Completion** — always needed
2. Project-specific skills (identify from the system design):
   - **Add Endpoint** — if project has an API
   - **Add Migration** — if project has a database
   - **Add Port Interface + Adapters** — if project integrates external services
   - **Add Stream Event** — if project has async pipelines
   - **Debug Pipeline** — if project has background processing
   - **Add Frontend Component** — if project has a frontend
3. Generate each skill file using `docs/skills/TEMPLATE.md`:
   - Prerequisites checklist
   - Numbered steps with detailed instructions
   - Every skill ends with a documentation update step
4. Update `docs/skills/README.md` index.
5. **Present to user for review.**

### Step 8: STATUS.md

**Goal:** Generate the project health tracker.

1. Replace all `{{PROJECT_NAME}}` placeholders in `docs/STATUS.md` with the actual project name.
2. Populate the tracker with:
   - Phase overview table (from Step 5)
   - Feature tables per phase (from Step 5)
   - Infrastructure status
   - Port interfaces status (if applicable)
3. Set all statuses to ⬜ Not Started.
4. Calculate total features and total tests.
5. **Present to user for confirmation.**

### Step 9: Utilities Reference & Dead Code Tracker

**Goal:** Generate the DRY Bible and dead code tracker.

1. Update `docs/UTILITIES_REFERENCE.md`:
   - Replace `{{PROJECT_NAME}}` with the actual project name.
   - Replace `{{BACKEND_SRC}}` and `{{FRONTEND_SRC}}` with the project's source directories.
   - Replace `{{EXT}}` with the project's primary file extension (e.g., `.js`, `.ts`, `.kt`).
   - Add initial utility entries if any were identified during system design (e.g., error classes, logger).
2. Update `docs/DEAD_CODE_REFERENCES.md`:
   - Replace `{{PROJECT_NAME}}` with the actual project name.
   - Tables start empty — they are populated during development.
3. **Present to user for confirmation.**

### Step 10: Agent Workflows

**Goal:** Set up agent workflow files for the user's AI coding platform.

1. **Detect or ask the user's AI platform(s).** Common platforms:
   - **Gemini / Jules** → workflows go in `.agents/workflows/`
   - **Cursor** → workflows go in `.cursor/rules/workflows/`
   - **Claude Code** → workflows go in `.claude/workflows/`
   - **Other/Unknown** → workflows stay in `docs/workflows/` (manual reference)

2. **Replace all `{{PLACEHOLDER}}` values** in `docs/workflows/*.md` with project-specific values:
   - `{{TEST_COMMAND}}` → e.g., `npm test`, `./gradlew test`, `pytest`
   - `{{LINT_COMMAND}}` → e.g., `npx eslint src/`, `./gradlew detekt`, `flake8`
   - `{{BACKEND_SRC}}` → e.g., `src/`, `app/`, `server/`
   - `{{FRONTEND_SRC}}` → e.g., `client/src/`, `frontend/src/`
   - `{{ORM_NAME}}` → e.g., `Prisma`, `TypeORM`, `SQLAlchemy`
   - `{{DB_ROLE}}` → e.g., `postgres-engineer.md`, `mysql-engineer.md`
   - `{{BACKEND_ROLE}}` → e.g., `node-backend.md`, `kotlin-backend.md`
   - `{{FRONTEND_ROLE}}` → e.g., `react-frontend.md`, `nextjs-frontend.md`

3. **Copy the resolved workflow files** from `docs/workflows/` to the platform-specific directory identified in step 1.

4. **Generate platform-specific config:**

   **For Claude Code (`.claude/`):**
   - `.claude/rules/` — Copy rule files from `docs/rules/`
   - `.claude/skills/` — Copy skill files from `docs/skills/`
   - `.claude/agents/` — Copy agent files from `docs/agents/`
   - `.claude/hooks.json` — Memory persistence hooks (PreCompact, Stop, SessionStart) + verification hooks
   - `.claude/settings.json` fragment — MCP recommendations and tool permissions
   - `.claude/homunculus/instincts/` — Learned pattern files (created during development)

   **For Antigravity/Gemini (`.gemini/`):**
   - Reference skills via AGENTS.md (Antigravity reads it directly)
   - Session memory via `.gemini/antigravity-ide/knowledge/` (native persistence)
   - Skill-file equivalents of Claude hooks embedded in workflow files

5. **Generate operational infrastructure:**
   - Create `.sessions/` directory (gitignored) for session artifacts
   - Populate SOPs from `docs/sops/TEMPLATE-*` with project-specific values

6. **Present to user for confirmation.**

### Step 11: Finalize AGENTS.md

**Goal:** Update this file with project-specific information.

1. Replace `{{PROJECT_NAME}}` in the title with the actual project name.
2. Add a **Technology Stack** table in the Rules section (from ADRs):
   ```
   | Component | Choice | ADR |
   |-----------|--------|-----|
   | ... | ... | ... |
   ```
3. Add a **Feature → Skills Mapping** table:
   ```
   | Feature Type | Skills To Follow (in order) |
   |--------------|----------------------------|
   | ... | ... |
   ```
4. Add project-specific **File Reading Priority**.
5. Add a worked **Example Workflow** showing the classify → build → test → document flow for a realistic feature from this project.
6. Remove the Bootstrap Workflow section (it's no longer needed).
7. **Present final AGENTS.md to user for approval.**

### Bootstrap Complete! 🎉

After all 11 steps, confirm to the user:
- Total documents generated
- Summary of tech stack, phases, and roles
- Agent workflows installed for their AI platform
- Recommendation to commit all docs before starting Phase 1

---

## Development Workflow (Ongoing Feature Work)

> **Trigger:** `docs/STATUS.md` is populated with real project data

When a user asks you to build, modify, or fix something, follow this exact workflow:

### Phase 0: Understand & Classify

1. **Read the request carefully.** Identify what the user is asking for.
2. **Determine which phase it belongs to.** Read `docs/phases/README.md` and the relevant phase README to confirm the feature is in scope.
3. **If the feature is NOT in any phase:** Stop and ask the user. It may need to be added to a phase document or be a new phase entirely.

### Phase 1: Research & Plan

4. **Read the relevant specs:**
   - `docs/specs/openapi.yaml` — Does this endpoint already exist? What's the contract?
   - `docs/specs/asyncapi.yaml` — Does this involve async events?
   - `docs/specs/schema.sql` — Does this need database changes?
   - `docs/specs/prompts/` — Does this involve LLM calls?

5. **Read the relevant roles** to understand conventions.

6. **Identify which skills you'll need** from the Feature → Skills Mapping table below.

7. **Create a task list** breaking down the work into ordered steps. Present it to the user for approval.

### Phase 2: Build

8. **Execute each task** following the relevant skill's step-by-step instructions.
9. **Follow the conventions** defined in the relevant role files.
10. **Check against specs** as you build — ensure field names, types, status codes, and schemas match exactly.

### Phase 3: Test

11. **Write E2E tests** following the project's test skill.
    - Use `P{n}-T{nn}` naming format
    - Reference the phase test table
    - Assert full response bodies, not just status codes
12. **Run all tests** to verify your changes work AND nothing is broken (regression).
13. **Verify mock-only operation** — if the project uses mock profiles, everything must work with the dev profile.

### Phase 4: Document

14. **Update documentation** following the update-documentation skill:
    - [ ] Update affected spec files
    - [ ] Update `.env.example` if new environment variables were added
    - [ ] Check off completed features in the phase README
    - [ ] Add entry to `docs/CHANGELOG.md`
    - [ ] Update `docs/UTILITIES_REFERENCE.md` if any new utility was created
    - [ ] Update `docs/DEAD_CODE_REFERENCES.md` if any code was deprecated
15. **If any spec deviated from the original**, document the deviation in the CHANGELOG with a `[DEVIATION]` tag.

### Phase 5: Report

16. **Summarize what you did:**
    - What was built
    - What tests were added
    - What docs were updated
    - Any deviations from specs
    - Any open questions or follow-ups

---

## Quick Reference: Feature → Skills Mapping

<!-- BOOTSTRAP: This table is populated during Step 9 of the bootstrap workflow -->

| Feature Type | Skills To Follow (in order) |
|--------------|----------------------------|
| New REST endpoint | `add-endpoint` → `write-e2e-test` → `update-documentation` |
| New database table/column | `add-migration` → `write-e2e-test` → `update-documentation` |
| New external service integration | `add-port-interface` → `add-endpoint` (if API-facing) → `write-e2e-test` → `update-documentation` |
| New background job | `add-worker-job` → `write-e2e-test` → `update-documentation` |
| New frontend component | `add-frontend-component` → `update-documentation` |
| Full-stack feature (endpoint + DB + UI) | `add-migration` → `add-endpoint` → `add-frontend-component` → `write-e2e-test` → `update-documentation` |
| Bug fix | Read relevant role → fix → `write-e2e-test` (regression test) → `update-documentation` |
| Phase completion | `run-phase-completion` |

---

## Rules You Must Always Follow

### Non-Negotiable

1. **Never implement features outside the current phase scope.** Check the phase README.
2. **Never call an external API directly.** Always go through a port interface.
3. **Never skip the documentation update step.** Every code change has a matching doc change.
4. **Never modify an accepted ADR.** Create a superseding ADR instead.
5. **Always use the consistent error response format** defined in the specs for error responses.
6. **Always use `P{n}-T{nn}` naming** for E2E tests.
7. **Never write or run database migrations without presenting a plan first.** All schema changes must include a Data Safety Assessment with risk level (🟢 Low / 🟡 Medium / 🔴 High). Present the plan, identify risks to existing data, and get explicit user approval.

### Architecture

7. **Routes delegate to services.** Routes never contain business logic.
8. **Services use port interfaces.** Never inject concrete adapters.
9. **Repositories wrap all DB access.** Services never call the ORM/database directly.
10. **All external calls use timeouts.** No unbounded API calls.
11. **Profile-based adapter selection.** Dev profile always uses mocks.

### Technology Stack

<!-- BOOTSTRAP: This table is populated during Step 9 of the bootstrap workflow -->

| Component | Choice | ADR |
|-----------|--------|-----|
| *Populated after bootstrap* | | |

### Git Rules

12. **Never run `git push`.** Only commit locally. The user controls when code goes to remote.
13. **Only commit when the user explicitly asks.** Do not proactively commit after completing a task. Wait for the user to say "commit", "save your work", or similar.
14. **Never switch branches without asking.** Always confirm with the user before running `git checkout` or `git switch`.
15. **Use conventional commit messages.** Format: `type(scope): description`
    - `feat(scope): add new feature`
    - `fix(scope): fix bug description`
    - `docs(scope): update documentation`
    - `test(scope): add test description`
    - `refactor(scope): restructure code`
    - `chore(scope): build/tooling changes`

16. **Generate descriptive commit messages.** When the user asks to commit:
    1. Run `git diff --cached --stat` to see what's staged
    2. Construct a commit message with:
       - **Subject line:** `type(scope): concise summary` (max 72 chars)
       - **Body:** blank line, then bullet points explaining what changed and why
       - **Footer:** reference the phase and feature number if applicable
    3. Example:
       ```
       feat(auth): add JWT validation middleware

       - Implement token verification using RS256 public key
       - Extract user claims from JWT payload
       - Return 401 with error envelope for invalid/expired tokens

       Phase: 1 | Feature: 1.3
       ```

### Branching Strategy

The project uses the following branch structure:

| Branch | Purpose | Merges Into |
|--------|---------|-------------|
| `main` | Stable, production-ready code | — |
| `dev` | Active development integration | `main` (when phase is complete) |
| `feature/{phase}-{name}` | New feature work | `dev` |
| `bugfix/{description}` | Bug fixes | `dev` |
| `hotfix/{description}` | Critical production fixes | `main` + `dev` |

**Branch naming examples:**
- `feature/p1-project-scaffold`
- `feature/p2-user-management`
- `bugfix/fix-auth-token-expiry`
- `hotfix/fix-critical-crash`

**Workflow:**
1. Create a feature branch from `dev`
2. Build and test on the feature branch
3. User merges into `dev` when ready
4. User merges `dev` into `main` at phase completion

**The agent NEVER creates or switches branches without user approval.**

---

## File Reading Priority

When starting work on any task, read these files in order:

1. **`docs/STATUS.md`** — understand the current state of the project
2. **Phase README** — confirms scope and identifies relevant tests
3. **Relevant spec files** — the contracts you must conform to
4. **Relevant rule files** (`docs/rules/`) — always-on behavioral guardrails
5. **Relevant role files** — the conventions you must follow
6. **Relevant skill files** — the step-by-step recipe to execute
7. **`docs/UTILITIES_REFERENCE.md`** — check for existing utilities before writing new ones
8. **`docs/DEAD_CODE_REFERENCES.md`** — avoid depending on deprecated code
9. **Relevant agent files** (`docs/agents/`) — delegation patterns
10. **Existing source code** — understand what's already built

---

## AI Efficiency Protocol

> These rules optimize token usage, context management, and session productivity. Derived from battle-tested patterns.

### Token Optimization

- **Prefer CLI tools over MCPs** when both achieve the same result. MCPs consume context window for tool definitions.
- **Use targeted file reads.** Read specific line ranges instead of entire files. Only read full files on first encounter.
- **Minimize exploration context.** Research → save findings → compact → execute from plan.
- **Route to cheapest sufficient model** for subtasks (formatting, summarization, boilerplate).
- **Batch related tool calls.** Make independent calls in parallel, not sequentially.

### Context Management

- **Compact at logical boundaries,** not arbitrarily. Good boundaries: after research, after milestone completion, before context shifts.
- **Before compacting, always save state** using the session-handoff skill.
- **Monitor context budget.** Warn at 70% capacity. Suggest compaction at 80%.
- **After compacting, load saved state** and confirm continuity before proceeding.

### Memory Handoff Protocol

- **At session end:** Generate a structured handoff summary (use `docs/templates/session-summary.md`).
- **At session start:** Check for previous session summaries in `.sessions/` and load context.
- **Format:** What was accomplished, key decisions, what worked vs. didn't, prioritized next steps.
- **Storage:** Claude uses `~/.claude/session-data/{project}/`. Antigravity uses its knowledge system.

### Research-First Development

- **Always read existing code before writing new code.** Understand the current implementation.
- **Check the utilities reference** before creating any new helper function.
- **Verify spec contracts** before implementing. Field names, types, and status codes must match exactly.
- **Check the dead code tracker** to avoid depending on deprecated code.

### Business Pragmatism

- **Think like a CTO, not just an engineer.** Every technical decision has a cost — development time, operational complexity, and opportunity cost.
- **Fight over-engineering.** YAGNI: *"What concrete business need does this solve in the next 6 months?"*
- **Consider the business stage.** Optimize for speed-to-market and learning from real users.
- **Apply the "10x users" test.** Don't build for 1M users when you have 100. But flag things painful to migrate later.
- **Cost is a feature.** A $50/month "good enough" solution beats a $500/month "perfect" one.
- **Defend the user's time.** If it takes 3 weeks to build but saves 5 minutes per month, say so.

---

## Example Workflow

<!-- BOOTSTRAP: This section is populated during Step 9 with a project-specific example -->

**User says:** *"Add [feature X] from Phase [N]."*

**Agent workflow:**

1. **Classify:** Identify the endpoint/feature and confirm it's in the current phase.
2. **Read specs:** Check openapi.yaml, schema.sql, etc. for the contract.
3. **Read roles:** Check the relevant role files for conventions.
4. **Identify skills:** Determine the skill chain (e.g., add-migration → add-endpoint → write-e2e-test → update-documentation).
5. **Create task list:** Break into ordered steps, present to user.
6. **Execute:** Follow each skill step by step.
7. **Test:** Run all tests (new + regression).
8. **Document:** Update CHANGELOG, check off phase feature.
9. **Report:** Summarize what was done.
