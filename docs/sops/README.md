# Standard Operating Procedures (SOPs)

> Runbooks and playbooks for production operations. Generated during bootstrap with project-specific values.

## Purpose

SOPs document the exact steps to follow during operational events. They are written for humans (and agents assisting humans) who need to act quickly under pressure.

## SOP Index

| File | Purpose | When to Use |
|------|---------|-------------|
| `TEMPLATE-deployment-runbook.md` | Step-by-step deployment checklist | Every production deployment |
| `TEMPLATE-backup-recovery.md` | Backup verification and disaster recovery | Scheduled backup checks, data loss incidents |
| `TEMPLATE-incident-response.md` | Incident triage, escalation, and post-mortem | Production outages and critical bugs |

## How to Use

During bootstrap, copy each template and replace `TEMPLATE-` prefix with your project name:

```
TEMPLATE-deployment-runbook.md  →  deployment-runbook.md
TEMPLATE-backup-recovery.md    →  backup-recovery.md
TEMPLATE-incident-response.md  →  incident-response.md
```

Replace all `{{PLACEHOLDER}}` values with project-specific details (hosting provider, database, monitoring URLs, etc.).

## Writing Good SOPs

1. **Use numbered steps** — never prose paragraphs. Under stress, people scan numbered lists.
2. **Include exact commands** — copy-pasteable, not paraphrased.
3. **Include verification steps** — after each action, how to confirm it worked.
4. **Include rollback steps** — what to do if something goes wrong at each stage.
5. **Keep them current** — update SOPs every time the deployment process changes.
