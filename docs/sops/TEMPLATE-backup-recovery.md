# {{PROJECT_NAME}} — Backup & Recovery Procedures

> **Last Updated:** {{DATE}}
> **Owner:** {{TEAM_OR_PERSON}}

## Backup Strategy

| Component | Method | Frequency | Retention | Location |
|-----------|--------|-----------|-----------|----------|
| Database | {{DB_BACKUP_METHOD}} | {{FREQUENCY}} | {{RETENTION}} | {{LOCATION}} |
| Object Storage | {{STORAGE_BACKUP_METHOD}} | {{FREQUENCY}} | {{RETENTION}} | {{LOCATION}} |
| Application Config | Git repository | On every commit | Permanent | GitHub |
| Environment Variables | {{ENV_BACKUP_METHOD}} | On change | {{RETENTION}} | {{LOCATION}} |

## Automated Backup Verification

### Daily Check

```bash
# Verify latest backup exists and is recent
{{BACKUP_CHECK_COMMAND}}
```

**Expected:** Backup file from within the last {{BACKUP_WINDOW}} hours.

### Weekly Restore Test

1. Create a test environment: `{{CREATE_TEST_ENV}}`
2. Restore latest backup: `{{RESTORE_COMMAND}}`
3. Run health checks against restored database
4. Verify data integrity: `{{INTEGRITY_CHECK}}`
5. Tear down test environment: `{{TEARDOWN_COMMAND}}`

## Recovery Procedures

### Scenario 1: Database Corruption / Data Loss

**Severity:** 🔴 Critical
**Target Recovery Time:** < 1 hour

1. **Assess the damage.** Identify what data is affected and since when.
2. **Stop writes** to prevent further corruption:
   ```bash
   {{STOP_WRITES_COMMAND}}
   ```
3. **Identify the correct backup** (last known good state):
   ```bash
   {{LIST_BACKUPS_COMMAND}}
   ```
4. **Restore from backup:**
   ```bash
   {{RESTORE_COMMAND}}
   ```
5. **Verify restoration:**
   - [ ] Application connects to database
   - [ ] Core queries return expected results
   - [ ] Row counts match expected values
6. **Resume writes:**
   ```bash
   {{RESUME_WRITES_COMMAND}}
   ```
7. **Notify stakeholders** of any data loss window.

### Scenario 2: Object Storage Loss

**Severity:** 🟡 Medium
**Target Recovery Time:** < 4 hours

1. **Assess scope:** Which files/objects are missing?
2. **Check object versioning** (if enabled):
   ```bash
   {{CHECK_VERSIONS_COMMAND}}
   ```
3. **Restore from backup:**
   ```bash
   {{RESTORE_OBJECTS_COMMAND}}
   ```
4. **Verify:** Spot-check restored files via the application.

### Scenario 3: Complete Infrastructure Loss

**Severity:** 🔴 Critical
**Target Recovery Time:** < 4 hours

1. **Provision new infrastructure:** `{{PROVISION_COMMAND}}`
2. **Restore database** from latest backup
3. **Restore object storage** from latest backup
4. **Deploy application** from latest Git tag
5. **Update DNS** if infrastructure IP changed
6. **Run full smoke test suite**

## Post-Recovery Checklist

- [ ] Root cause identified
- [ ] Backup schedule verified (not impacted)
- [ ] Stakeholders notified
- [ ] Incident response document created (see `incident-response.md`)
- [ ] This runbook updated if procedures changed
