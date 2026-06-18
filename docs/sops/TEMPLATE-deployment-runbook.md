# {{PROJECT_NAME}} — Deployment Runbook

> **Last Updated:** {{DATE}}
> **Owner:** {{TEAM_OR_PERSON}}

## Pre-Deployment Checklist

- [ ] All tests pass locally: `{{TEST_COMMAND}}`
- [ ] Lint passes: `{{LINT_COMMAND}}`
- [ ] No pending database migrations that haven't been reviewed
- [ ] `.env.example` is up to date with any new environment variables
- [ ] CHANGELOG.md is updated
- [ ] Feature branch merged to `dev` and tested

## Deployment Steps

### 1. Pull Latest Code

```bash
git checkout {{DEPLOY_BRANCH}}
git pull origin {{DEPLOY_BRANCH}}
```

### 2. Install Dependencies

```bash
{{INSTALL_COMMAND}}
```

### 3. Run Database Migrations (if applicable)

```bash
{{MIGRATION_COMMAND}}
```

**Verify:** Check that migrations completed without errors.

### 4. Build

```bash
{{BUILD_COMMAND}}
```

**Verify:** Build output shows no errors or warnings.

### 5. Deploy

```bash
{{DEPLOY_COMMAND}}
```

### 6. Post-Deployment Verification

- [ ] Health check endpoint responds: `curl {{HEALTH_URL}}`
- [ ] Smoke test critical user flows:
  - [ ] User login
  - [ ] Core feature #1: {{DESCRIBE}}
  - [ ] Core feature #2: {{DESCRIBE}}
- [ ] Check monitoring dashboard: {{MONITORING_URL}}
- [ ] Check error tracking: {{ERROR_TRACKING_URL}}

## Rollback Procedure

If issues are detected after deployment:

### 1. Revert to Previous Version

```bash
{{ROLLBACK_COMMAND}}
```

### 2. Revert Database Migrations (if applicable)

```bash
{{MIGRATION_ROLLBACK_COMMAND}}
```

### 3. Verify Rollback

- [ ] Health check passes
- [ ] Smoke test critical flows
- [ ] Error rate returns to baseline

### 4. Post-Mortem

- [ ] Document what went wrong
- [ ] Document root cause
- [ ] Create action items to prevent recurrence
- [ ] Update this runbook if the process needs to change

## Emergency Contacts

| Role | Person | Contact |
|------|--------|---------|
| Tech Lead | {{NAME}} | {{CONTACT}} |
| DevOps | {{NAME}} | {{CONTACT}} |
| Product Owner | {{NAME}} | {{CONTACT}} |
