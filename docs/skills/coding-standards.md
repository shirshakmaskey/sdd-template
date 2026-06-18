---
name: coding-standards
description: Enforce project-wide coding standards and patterns before writing any code
category: core
platforms: [claude, antigravity, cursor]
---

# Coding Standards

Enforce project-specific coding standards before and during implementation. This skill is loaded implicitly by other skills — you rarely invoke it directly.

## When to Use

- Starting any implementation work
- Reviewing code (self-review or peer review)
- Onboarding to a new codebase

## Standards Checklist

### Before Writing Code

1. **Read the role file** for the relevant domain (`docs/roles/*.md`).
2. **Read the utilities reference** (`docs/UTILITIES_REFERENCE.md`) — never create a utility that already exists.
3. **Read the dead code tracker** (`docs/DEAD_CODE_REFERENCES.md`) — never depend on deprecated code.

### While Writing Code

4. **Architecture:** Routes → Services → Repositories. No shortcuts.
5. **External calls:** Always through port interfaces. Never direct.
6. **Error handling:** Use standard error classes. Never swallow errors silently.
7. **Logging:** Use the project's structured logger. Never `console.log`.
8. **Validation:** Use the project's validation library. Trim strings, enforce max length.
9. **Naming:** Follow the project's naming conventions (see `docs/rules/coding-style.md`).
10. **File size:** If a file exceeds ~300 lines, split by responsibility.

### After Writing Code

11. **Self-review** against `docs/roles/code-reviewer.md` checklist.
12. **Remove debug artifacts** — no `console.log`, no commented-out code, no TODO without a ticket.
13. **Update utilities reference** if you created any new utility function.
