# Skill File Format

> Standard format for all skill files in this project. Skills are workflow recipes that agents invoke on demand.

## Structure

Every skill file must begin with YAML frontmatter:

```yaml
---
name: skill-name
description: One-line description of what this skill does
category: core|workflow|verification|optimization|business
platforms: [claude, antigravity, cursor]
---
```

## Required Sections

### 1. Title (H1)

The skill name as a readable title.

### 2. When to Use

Bullet list of situations where this skill should be invoked. Be specific — agents use this to decide whether to activate the skill.

### 3. Steps or Workflow

Numbered steps with detailed instructions. Include:
- Exact commands to run
- Files to read or create
- Verification checks after each step
- Conditional branches (if X, do Y)

### 4. Non-Negotiable Rules (optional)

Hard constraints that must never be violated while executing this skill.

### 5. Documentation Update (always last)

Every skill must end with a documentation update step — what to update in CHANGELOG, STATUS, utilities reference, etc.

## Categories

| Category | Purpose | Examples |
|----------|---------|---------|
| `core` | Fundamental development patterns | coding-standards, api-design, backend-patterns |
| `workflow` | Task execution recipes | plan-feature, build-endpoint, session-handoff |
| `verification` | Quality gates and review processes | verification-loop, security-review, code-review |
| `optimization` | AI efficiency and learning | strategic-compact, continuous-learning, context-optimization |
| `business` | Market research, positioning, fundraising, content | market-research, competitive-analysis, investor-materials |

## Platform Compatibility

- `claude` — Works in Claude Code (can leverage hooks, subagents)
- `antigravity` — Works in Antigravity/Gemini IDE
- `cursor` — Works in Cursor IDE
- Most skills work on all platforms. Note platform-specific features in the skill body.
