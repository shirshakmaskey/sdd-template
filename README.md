# SDD Template — Spec-Driven Development Framework

A reusable project template that bootstraps **Spec-Driven Development (SDD)** for any new software project. Define your product, lock in your architecture, generate engineering specs — then let the specs drive all code.

## What is Spec-Driven Development?

SDD is a methodology where **documentation is the source of truth**, not the code. The workflow:

1. **Describe** what you want to build (PRD)
2. **Design** the architecture and make technology decisions (ADRs)
3. **Specify** the engineering contracts (OpenAPI, database schema, event specs)
4. **Phase** the work into ordered, testable milestones
5. **Build** code that conforms to the specs
6. **Test** against the specs
7. **Document** any deviations

If the code disagrees with a spec, the code is wrong.

## How to Use This Template

### Option 1: GitHub Template (Recommended)

1. Click **"Use this template"** on GitHub
2. Name your new repository
3. Clone it locally
4. Open in your IDE with an AI coding assistant
5. The `AGENTS.md` will detect it's a new project and guide you through bootstrapping

### Option 2: Manual Clone

```bash
git clone https://github.com/shirshakmaskey/sdd-template my-project
cd my-project
rm -rf .git
git init
```

## The Bootstrap Workflow

When you start a conversation with an AI agent in a fresh project, the `AGENTS.md` detects bootstrap mode and guides you through **11 interactive steps**:

| Step | What Happens | Output |
|------|-------------|--------|
| 1 | **PRD Intake** — Agent reads your product requirements | `docs/{name}_prd.md` |
| 2 | **System Design** — Agent generates architecture & data models | `docs/{name}_system_design.md` |
| 3 | **ADRs** — Lock in every technology decision | `docs/adr/adr-{NNN}-*.md` |
| 4 | **Specs** — Generate API, event, DB, and prompt contracts | `docs/specs/*` |
| 5 | **Phases** — Break work into testable milestones | `docs/phases/phase-{N}-*/README.md` |
| 6 | **Roles** — Define conventions per engineering domain | `docs/roles/*.md` |
| 7 | **Skills** — Create step-by-step task recipes | `docs/skills/*.md` |
| 8 | **STATUS.md** — Generate the project health tracker | `docs/STATUS.md` |
| 9 | **Utilities & Dead Code** — Generate DRY Bible and dead code tracker | `docs/UTILITIES_REFERENCE.md`, `docs/DEAD_CODE_REFERENCES.md` |
| 10 | **Agent Workflows** — Set up platform-specific workflow files | `docs/workflows/*.md` → platform dir |
| 11 | **Finalize** — Update AGENTS.md with project-specific rules | `AGENTS.md` |

Each step is interactive — the agent generates a document, you review and approve, then it moves to the next step.

## After Bootstrapping

Once all docs are generated, the `AGENTS.md` switches to **Development Mode** — the same workflow for every feature request:

```
Classify → Research specs → Plan → Build → Test → Document → Report
```

## Project Structure

```
your-project/
├── AGENTS.md              ← AI agent instructions (auto-configures during bootstrap)
├── docs/
│   ├── CHANGELOG.md       ← Audit trail
│   ├── STATUS.md          ← Project health tracker
│   ├── UTILITIES_REFERENCE.md  ← DRY Bible — utility function registry
│   ├── DEAD_CODE_REFERENCES.md ← Dead code & deprecated mock tracker
│   ├── adr/               ← Architecture Decision Records
│   ├── phases/            ← Phased implementation guides
│   ├── roles/             ← Engineering conventions per domain
│   ├── skills/            ← Step-by-step task recipes
│   ├── specs/             ← Engineering contracts (API, DB, events, prompts)
│   └── workflows/         ← Agent workflow recipes (platform-agnostic)
└── scripts/
    └── bootstrap-checklist.md  ← Manual fallback (no-AI version)
```

## Key Principles

- **Specs are the source of truth** — code conforms to specs, not the other way around
- **Phase scope is sacred** — never build features from a future phase
- **ADRs are final** — technology decisions are locked; create a new superseding ADR to change
- **Tests are acceptance criteria** — a feature is done when its E2E tests pass
- **Mock everything external** — all external APIs go through port interfaces
- **Every change has a doc update** — code changes and doc changes travel together

## License

MIT
