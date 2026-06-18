# Git Workflow Rules

## Commit Rules

- **Never run `git push`.** Only commit locally. The user controls when code goes to remote.
- **Only commit when the user explicitly asks.** Do not proactively commit after completing a task. Wait for the user to say "commit", "save your work", or similar.
- **Never switch branches without asking.** Always confirm with the user before running `git checkout` or `git switch`.

## Commit Message Format

Use conventional commit messages: `type(scope): description`

**Types:**
- `feat(scope):` — New feature
- `fix(scope):` — Bug fix
- `docs(scope):` — Documentation only
- `test(scope):` — Adding or updating tests
- `refactor(scope):` — Code restructuring without behavior change
- `chore(scope):` — Build, tooling, dependency changes

**Rules:**
- Subject line: max 72 characters
- Body: blank line, then bullet points explaining what changed and why
- Footer: reference phase and feature number if applicable
- Keep commit subjects concise (~70 characters)

**Example:**
```
feat(auth): add JWT validation middleware

- Implement token verification using RS256 public key
- Extract user claims from JWT payload
- Return 401 with error envelope for invalid/expired tokens

Phase: 1 | Feature: 1.3
```

## Branching Strategy

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
