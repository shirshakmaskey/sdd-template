# {{PROJECT_NAME}} — Agent Workflows

Agent workflows are step-by-step recipes triggered as slash commands in your AI coding assistant. They automate the most common development tasks while enforcing project standards.

## How Workflows Work

Each workflow file is a markdown document that your AI agent reads and follows when you invoke the corresponding slash command (e.g., `/build-endpoint`, `/debug`, `/test`).

## Workflow Index

| Workflow | Slash Command | Use When |
|----------|--------------|----------|
| [Build Database Migration](build-db.md) | `/build-db` | Creating any database schema change |
| [Build Endpoint](build-endpoint.md) | `/build-endpoint` | Implementing a new REST API endpoint |
| [Debug](debug.md) | `/debug` | Investigating and fixing a bug |
| [Plan Feature](plan-feature.md) | `/plan-feature` | Starting a new feature from scratch |
| [Write Tests](test.md) | `/test` | Writing E2E tests for recent changes |
| [Wrap Up](wrap-up.md) | `/wrap-up` | Finishing a feature with documentation |

## Platform Installation

These workflows are platform-agnostic. During bootstrap, they are copied to the correct location for your AI coding platform:

| Platform | Workflow Location | Config File |
|----------|------------------|-------------|
| **Gemini / Jules** | `.agents/workflows/` | — |
| **Cursor** | `.cursor/rules/workflows/` | `.cursorrules` |
| **Claude Code** | `.claude/workflows/` | `CLAUDE.md` |
| **Other** | Read directly from `docs/workflows/` | Reference in your agent's config |

> **Note:** The canonical source of truth for workflow content is always `docs/workflows/`. Platform-specific copies are generated during bootstrap.

## Placeholders

Workflows use `{{PLACEHOLDER}}` syntax for project-specific values. These are replaced during bootstrap:

| Placeholder | Description | Example |
|-------------|-------------|---------|
| `{{TEST_COMMAND}}` | Command to run all tests | `npm test`, `./gradlew test`, `pytest` |
| `{{LINT_COMMAND}}` | Command to run linter | `npx eslint src/`, `./gradlew detekt` |
| `{{BACKEND_SRC}}` | Backend source directory | `src/`, `app/`, `server/` |
| `{{FRONTEND_SRC}}` | Frontend source directory | `client/src/`, `frontend/src/` |
| `{{ORM_NAME}}` | ORM/data access tool name | `Prisma`, `TypeORM`, `SQLAlchemy` |
| `{{DB_ROLE}}` | Database role file name | `postgres-engineer.md`, `mysql-engineer.md` |
| `{{BACKEND_ROLE}}` | Backend role file name | `node-backend.md`, `kotlin-backend.md` |
| `{{FRONTEND_ROLE}}` | Frontend role file name | `react-frontend.md`, `nextjs-frontend.md` |
