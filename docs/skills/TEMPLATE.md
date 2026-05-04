# Skill: {Skill Name}

> {One-line description of when to use this skill, e.g., "Step-by-step recipe for adding a REST API endpoint that is spec-compliant, tested, and documented."}

## Prerequisites

- [ ] {What must exist before starting, e.g., "The endpoint is defined in docs/specs/openapi.yaml"}
- [ ] {Scope check, e.g., "The feature belongs to the current phase (check the phase README)"}

---

## Steps

### Step 1: {Read/Research}

{First step is usually reading the relevant spec or understanding the contract.}

- {What to look for}
- {What to note down}

### Step 2: {Create/Scaffold}

{Second step is usually creating the files or scaffolding the structure.}

```
{file path pattern}
```

- {Convention to follow}
- {Naming rule}

### Step 3: {Implement}

{Core implementation step with patterns to follow.}

```{language}
{code example showing the expected pattern}
```

- {Implementation rule 1}
- {Implementation rule 2}

### Step 4: {Wire/Connect}

{Integration step — connecting the new code to the existing system.}

- {How to register/wire the new component}
- {DI/configuration changes needed}

### Step 5: {Test}

Follow the project's E2E test skill. At minimum:
- Happy path test
- Error/rejection test
- Edge case test

### Step 6: {Verify Against Spec}

Manually verify the implementation matches the spec:
- {Check 1, e.g., "Field names match (exact casing)"}
- {Check 2, e.g., "Status codes match"}
- {Check 3, e.g., "Error envelope shape matches"}

### Step 7: Update Documentation

- [ ] Add entry to `docs/CHANGELOG.md`
- [ ] Update affected spec files (if any deviation occurred, tag with `[DEVIATION]`)
- [ ] Check off the feature in the phase README's feature checklist
- [ ] Update `docs/STATUS.md` feature status
