# {{PROJECT_NAME}} — Engineering Specs

This directory contains the **engineering contracts** that all code must conform to. These are the source of truth — if the code disagrees with a spec, the code is wrong.

## Spec Files

<!-- BOOTSTRAP: These files are generated during bootstrap Step 4 -->

| File | Purpose | When to Create |
|------|---------|---------------|
| `openapi.yaml` | REST API contracts (endpoints, schemas, status codes) | If the project has a REST API |
| `asyncapi.yaml` | Async event contracts (channels, message schemas) | If the project has async events/messaging |
| `schema.sql` | Database schema (tables, columns, constraints, indexes) | If the project has a database |
| `prompts/` | LLM prompt specs (system prompts, response schemas) | If the project uses LLMs |

## Rules

1. **Specs are written before code.** The bootstrap process generates specs from the system design, and code is written to match.
2. **Deviations must be documented.** If you discover during implementation that a spec needs to change, update the spec and log a `[DEVIATION]` entry in `docs/CHANGELOG.md`.
3. **Field names are exact.** API field names, database column names, and event property names in the code must exactly match their spec definitions (including casing).
4. **Status codes are exact.** HTTP status codes in route handlers must match the OpenAPI spec.

## How to Read These Specs

### OpenAPI (`openapi.yaml`)
- **Paths:** Defines every REST endpoint (URL, method, auth, request/response schemas)
- **Components/Schemas:** Defines reusable data models (DTOs)
- **Security:** Defines authentication requirements

### AsyncAPI (`asyncapi.yaml`)
- **Channels:** Defines event streams/topics
- **Messages:** Defines event payload schemas
- **Operations:** Defines publish/subscribe patterns

### Schema SQL (`schema.sql`)
- **Tables:** All database tables with columns, types, and constraints
- **Indexes:** Performance indexes including any specialized indexes (e.g., vector, full-text)
- **Enums:** Custom database enum types
- **Comments:** Inline comments explaining each table's purpose

### Prompts (`prompts/`)
- **System prompts:** Exact text used as LLM system prompts
- **Response schemas:** JSON schemas that LLM responses must conform to
- **One file per prompt type:** Separate files for different LLM use cases
