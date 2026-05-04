# Architecture Decision Records (ADR)

This directory contains the Architecture Decision Records for this project.

ADRs document the key architectural decisions made during the design and development of the system.
We follow the [Michael Nygard format](https://cognitect.com/blog/2011/11/15/documenting-architecture-decisions).

## Rules

1. **ADRs are final once accepted.** To change a decision, create a new ADR that supersedes the old one.
2. **Every technology choice gets an ADR.** Framework, database, message broker, auth strategy, hosting — all of it.
3. **ADRs are created during bootstrap Step 3** and should not be modified during development unless a superseding ADR is needed.

## How to Create an ADR

Use `TEMPLATE.md` in this directory as the starting format. Name your ADRs:

```
adr-{NNN}-{kebab-case-title}.md
```

Examples:
- `adr-001-web-framework.md`
- `adr-002-database.md`
- `adr-003-authentication-strategy.md`

## Index

<!-- BOOTSTRAP: This table is populated during bootstrap Step 3 -->

| ADR | Title | Status | Date |
|-----|-------|--------|------|
| *ADRs will be generated during bootstrap* | | | |
