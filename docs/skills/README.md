# Skills — Step-by-Step Workflow Recipes

> Skills are on-demand workflow recipes that agents invoke when a specific task pattern is needed. Unlike rules (always active), skills are loaded only when relevant.

## Skill Format

All skills follow the standard format defined in [SKILL_FORMAT.md](SKILL_FORMAT.md). Each skill has YAML frontmatter with `name`, `description`, `category`, and `platforms`.

## How Skills Are Used

- **Claude Code:** Skills are copied to `~/.claude/skills/` and invoked via `/skill-name`
- **Antigravity/Gemini:** Skills are referenced in AGENTS.md and read on demand
- **Cursor:** Skills can be referenced in `.cursor/rules/`

---

## Skill Index

### Core Development

| Skill | Description |
|-------|-------------|
| [coding-standards](coding-standards.md) | Project-wide coding standards and patterns |
| [api-design](api-design.md) | RESTful API design and validation |
| [backend-patterns](backend-patterns.md) | Route → Service → Repository architecture |
| [frontend-patterns](frontend-patterns.md) | Component architecture and API service layer |
| [tdd-workflow](tdd-workflow.md) | Test-Driven Development red-green-refactor cycle |
| [deep-research](deep-research.md) | Research-first investigation pattern |
| [database-migration](database-migration.md) | Safe migration workflow with Data Safety Assessment |
| [mcp-server-patterns](mcp-server-patterns.md) | MCP integration patterns and context optimization |

### Workflow & Execution

| Skill | Description |
|-------|-------------|
| [strategic-compact](strategic-compact.md) | Context compaction at logical boundaries |
| [session-handoff](session-handoff.md) | Save/load context between sessions |
| [add-endpoint](add-endpoint.md)* | Step-by-step endpoint creation |
| [add-migration](add-migration.md)* | Database migration creation |
| [add-port-interface](add-port-interface.md)* | External service integration |
| [add-worker-job](add-worker-job.md)* | Background job creation |
| [add-frontend-component](add-frontend-component.md)* | Frontend component creation |
| [update-documentation](update-documentation.md)* | Documentation sync after code changes |
| [run-phase-completion](run-phase-completion.md)* | Phase gate verification |

*Generated during bootstrap with project-specific values

### Verification & Quality

| Skill | Description |
|-------|-------------|
| [verification-loop](verification-loop.md) | Build → Type → Lint → Test → Security pipeline |
| [security-review](security-review.md) | Security vulnerability checklist |
| [code-review](code-review.md) | Self-review checklist |
| [e2e-testing](e2e-testing.md) | E2E test writing patterns |
| [write-e2e-test](write-e2e-test.md)* | Step-by-step test creation |

*Generated during bootstrap with project-specific values

### AI Optimization

| Skill | Description |
|-------|-------------|
| [continuous-learning](continuous-learning.md) | Extract patterns into reusable skills |
| [agent-introspection](agent-introspection.md) | Debug agent behavior |
| [context-optimization](context-optimization.md) | Token budget management |
| [eval-harness](eval-harness.md) | Quality evaluation framework |

### Business & Marketing

| Skill | Description |
|-------|-------------|
| [market-research](market-research.md) | Market sizing, competitor comparisons, technology scans |
| [competitive-analysis](competitive-analysis.md) | Competitor set definition, tiering, and benchmarking |
| [product-capability](product-capability.md) | PRD → engineering constraints translation |
| [brand-discovery](brand-discovery.md) | Structured brand identity interview |
| [brand-voice](brand-voice.md) | Durable voice profile from real source material |
| [investor-materials](investor-materials.md) | Pitch decks, memos, financial models |
| [content-engine](content-engine.md) | Platform-native content creation |

---

## Creating New Skills

1. Use [TEMPLATE.md](TEMPLATE.md) as the starting point
2. Follow [SKILL_FORMAT.md](SKILL_FORMAT.md) for the required structure
3. Place the file in this directory
4. Update this README index
5. Add to the Feature → Skills Mapping in `AGENTS.md` if applicable
