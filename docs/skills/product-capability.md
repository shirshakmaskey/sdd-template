---
name: product-capability
description: Translate PRD intent into explicit engineering constraints and capability contracts
category: business
platforms: [claude, antigravity, cursor]
---

# Product Capability

Turn product intent into explicit engineering constraints. Use when the gap is not "what should we build?" but "what exactly must be true before implementation starts?"

## When to Use

- A PRD, roadmap item, or discussion exists, but implementation constraints are implicit
- A feature crosses multiple services/repos and needs a capability contract before coding
- Product intent is clear, but architecture, data, lifecycle, or policy implications are fuzzy
- Engineers keep restating the same hidden assumptions during review
- You need a reusable artifact that survives across sessions

## Non-Negotiable Rules

- **Do not invent product truth.** Mark unresolved questions explicitly.
- **Separate user-visible promises from implementation details.**
- **Call out what is fixed policy, what is architecture preference, and what is still open.**
- **If the request conflicts with existing repo constraints, say so clearly** instead of smoothing it over.
- **Prefer one reusable capability artifact** over scattered ad hoc notes.

## Capability Template

```markdown
# Capability: {Feature Name}

## User-Visible Promise
[What the user experiences — written as acceptance criteria]

## Invariants (Must Always Be True)
- [Invariant 1]
- [Invariant 2]

## Constraints
### Fixed Policy (non-negotiable)
- [Constraint from business rules, legal, or compliance]

### Architecture Preference (negotiable with justification)
- [Preferred approach with reasoning]

### Open (needs decision)
- [Unresolved question with options]

## Interfaces
### Inputs
- [What data/events trigger this capability]

### Outputs
- [What data/events this capability produces]

### Dependencies
- [Other services/capabilities this depends on]

## Data Requirements
- [New tables, columns, or data transformations needed]

## Edge Cases
- [What happens when X fails?]
- [What happens with concurrent access?]
- [What happens at scale?]
```

## Workflow

1. **Read product intent** — PRD, issue, discussion, roadmap note, founder message.
2. **Read current architecture** — relevant repo docs, system design, existing capabilities.
3. **Extract invariants** — what must always be true for this feature to be correct?
4. **Identify interfaces** — what goes in, what comes out, what does it depend on?
5. **Surface unresolved questions** — explicitly mark what needs a decision.
6. **Save the capability artifact** to `docs/capabilities/` or update existing `PRODUCT.md`.
