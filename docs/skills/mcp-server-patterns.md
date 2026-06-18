---
name: mcp-server-patterns
description: Model Context Protocol integration patterns and best practices
category: core
platforms: [claude, antigravity, cursor]
---

# MCP Server Patterns

Patterns for integrating Model Context Protocol (MCP) servers into your development workflow.

## When to Use

- Setting up MCP servers for database, deployment, or service integrations
- Evaluating whether to use an MCP vs CLI wrapper
- Optimizing context window usage with MCP tools

## MCP vs CLI Decision

| Use MCP When | Use CLI + Skills When |
|-------------|----------------------|
| Interactive data exploration | Automated deployment scripts |
| Complex multi-step queries | Simple CRUD operations |
| Tools with no good CLI | Version control (git) |
| Frequently switching contexts | Batch operations |

## Context Window Management

- **Keep under 10 MCPs enabled at a time.** Each MCP registers tools that consume context window.
- **Disable unused MCPs** between sessions.
- **Prefer CLI wrappers** for version control, deployment, and simple database operations.
- **Monitor tool count** — keep under 80 active tools total.

## Common MCP Patterns

### Database MCP
- Use for schema exploration and ad-hoc queries
- Prefer CLI migrations over MCP for schema changes
- Always use parameterized queries, never string interpolation

### Deployment MCP
- Use for status checks and log viewing
- Prefer CLI scripts for actual deployments (more auditable)

### Creating Custom MCPs
- Define clear tool boundaries — one tool per action
- Include input validation in tool definitions
- Return structured responses, not raw data
- Document required environment variables
