# {{PROJECT_NAME}} — Incident Response Playbook

> **Last Updated:** {{DATE}}
> **Owner:** {{TEAM_OR_PERSON}}

## Severity Levels

| Level | Definition | Response Time | Examples |
|-------|-----------|---------------|----------|
| 🔴 **SEV-1** | Complete outage or data loss | < 15 minutes | App down, database unresponsive, payment processing broken |
| 🟡 **SEV-2** | Degraded service, partial outage | < 1 hour | Slow responses, feature broken, intermittent errors |
| 🟢 **SEV-3** | Minor issue, workaround exists | < 4 hours | UI bug, non-critical feature broken, cosmetic issues |

## Incident Response Steps

### Step 1: Detect & Triage (First 5 minutes)

1. **Confirm the incident.** Is this a real issue or a false alarm?
   - Check monitoring: {{MONITORING_URL}}
   - Check error tracking: {{ERROR_TRACKING_URL}}
   - Check logs: `{{LOG_COMMAND}}`
2. **Assign severity** using the table above.
3. **Open an incident channel** (Slack/Discord/etc.) and post:
   ```
   🚨 INCIDENT: [brief description]
   Severity: SEV-X
   Impact: [what's affected]
   Status: Investigating
   Lead: [your name]
   ```

### Step 2: Investigate (SEV-1: 15 min, SEV-2: 30 min, SEV-3: as needed)

4. **Identify the scope:**
   - Which users are affected?
   - Which features/endpoints are broken?
   - When did it start? (check deployment history, recent changes)
5. **Check recent changes:**
   ```bash
   git log --oneline -10
   ```
6. **Check infrastructure:**
   - Database: `{{DB_STATUS_COMMAND}}`
   - Application health: `curl {{HEALTH_URL}}`
   - Queue health: `{{QUEUE_STATUS_COMMAND}}`

### Step 3: Mitigate

7. **If caused by a recent deployment → rollback:**
   - See `deployment-runbook.md` § Rollback Procedure
8. **If caused by infrastructure → scale or restart:**
   ```bash
   {{RESTART_COMMAND}}
   ```
9. **If caused by external dependency → activate fallback:**
   - Check if a mock/fallback adapter exists for the failing service
   - Temporarily switch to the fallback if available
10. **Update the incident channel** with mitigation status.

### Step 4: Resolve

11. **Confirm resolution:**
    - [ ] Health checks pass
    - [ ] Error rate returned to baseline
    - [ ] Affected users can perform core actions
12. **Update incident channel:**
    ```
    ✅ RESOLVED: [brief resolution description]
    Duration: [X minutes/hours]
    Root Cause: [brief]
    ```

### Step 5: Post-Mortem (within 48 hours)

13. **Write a post-mortem document** including:

    ```markdown
    # Incident Post-Mortem — {{DATE}}

    ## Summary
    [1-2 sentence description of what happened]

    ## Timeline
    | Time | Event |
    |------|-------|
    | HH:MM | First alert triggered |
    | HH:MM | Incident confirmed |
    | HH:MM | Root cause identified |
    | HH:MM | Mitigation applied |
    | HH:MM | Resolved |

    ## Root Cause
    [Detailed technical explanation]

    ## Impact
    - Users affected: [number/percentage]
    - Duration: [total downtime]
    - Revenue impact: [if applicable]

    ## What Went Well
    - [Things that helped resolve quickly]

    ## What Went Poorly
    - [Things that slowed resolution]

    ## Action Items
    | # | Action | Owner | Deadline | Status |
    |---|--------|-------|----------|--------|
    | 1 | [Prevent recurrence] | [Name] | [Date] | ⬜ |
    | 2 | [Improve detection] | [Name] | [Date] | ⬜ |
    | 3 | [Update runbooks] | [Name] | [Date] | ⬜ |
    ```

14. **Schedule a post-mortem review** with the team.
15. **Update SOPs** if this incident revealed gaps in the procedures.

## Escalation Path

| Step | Action | Contact |
|------|--------|---------|
| 1 | On-call engineer investigates | {{ON_CALL}} |
| 2 | Escalate to tech lead if unresolved in 30 min | {{TECH_LEAD}} |
| 3 | Escalate to CTO if SEV-1 unresolved in 1 hour | {{CTO}} |
| 4 | Notify customers if outage exceeds 1 hour | {{COMMS_LEAD}} |
