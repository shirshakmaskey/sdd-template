# Phase {N}: {Name}

**Goal:** {One sentence — what is deployable and testable after this phase is complete?}

---

## Prerequisites

- {Required tool or dependency, e.g., "JDK 21+", "Docker & Docker Compose", "Node.js 20+"}

## Setup Instructions

### 1. Start infrastructure

```bash
{Command to start local infrastructure, e.g., docker compose up -d}
```

This starts:
- {Service 1} (port XXXX)
- {Service 2} (port XXXX)

### 2. Configure environment

```bash
cp .env.example .env
```

Required variables for Phase {N}:
```env
# {Category}
VARIABLE_NAME=value
```

### 3. Run the application

```bash
{Command to start the app, e.g., ./gradlew run, npm run dev}
```

### 4. Run tests

```bash
{Command to run tests, e.g., ./gradlew test, npm test}
```

---

## Features

| # | Feature | Status | Notes |
|---|---------|--------|-------|
| {N}.1 | {Feature description} | ⬜ | |
| {N}.2 | {Feature description} | ⬜ | |
| {N}.3 | {Feature description} | ⬜ | |

### Mocking in This Phase

- {What external services are mocked and how, or "No external API mocks needed — Phase {N} only uses local infrastructure"}

---

## What Is NOT In This Phase

- {Explicit exclusion 1 — prevents scope creep}
- {Explicit exclusion 2}
- {Explicit exclusion 3}

---

## End-to-End Tests

### {Test Category 1}

| # | Test | Action | Expected |
|---|------|--------|----------|
| 1 | {Test name} | {What to do} | {Expected result with status code and body} |
| 2 | {Test name} | {What to do} | {Expected result} |

### {Test Category 2}

| # | Test | Action | Expected |
|---|------|--------|----------|
| 3 | {Test name} | {What to do} | {Expected result} |

---

## Phase {N} Completion Criteria

**Phase {N} is DONE when:**
1. {Infrastructure criterion, e.g., "docker compose up -d starts all services"}
2. {Application criterion, e.g., "Application starts on configured port"}
3. All {X} E2E tests pass via `{test command}`
4. {Performance criterion, if applicable}
