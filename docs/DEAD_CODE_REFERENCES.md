# {{PROJECT_NAME}} — Dead Code & Mock References Tracker

> Track deprecated code, unused mocks, and dead endpoints here. Check this file before depending on or rewriting any mock implementation.

---

## Mock Adapters & Interfaces

<!-- List mock adapters that are temporary or scheduled for replacement -->

| Mock | File | Status | Replaces | Notes |
|------|------|--------|----------|-------|
| *Mock adapters will be listed as they are identified* | | | | |

**Status Legend:** 🟡 Active (dev-only) · 🔴 Deprecated · ⬜ Scheduled for removal

---

## Unused API Endpoints

<!-- List endpoints that are no longer needed or are dev-only -->

| Endpoint | File | Reason | Safe to Delete? |
|----------|------|--------|----------------|
| *Unused endpoints will be listed as they are identified* | | | |

---

## Deprecated UI Components

<!-- List frontend components that are no longer used -->

| Component | File | Replaced By | Notes |
|-----------|------|-------------|-------|
| *Deprecated components will be listed as they are identified* | | | |

---

## Unused Assets

<!-- List static files (images, fonts, etc.) that are no longer referenced -->

| Asset | Path | Notes |
|-------|------|-------|
| *Unused assets will be listed as they are identified* | | |

---

## How To Use This File

1. **Before depending on a mock adapter**, check if it's deprecated here.
2. **Before rewriting a component**, check if it's already been replaced.
3. **When deprecating code**, add it here instead of deleting immediately — this gives other developers/agents context.
4. **During phase completion**, audit this file and clean up anything marked safe to delete.
