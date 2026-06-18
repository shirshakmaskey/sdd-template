---
description: Discuss architecture, system design, infrastructure, or project direction before committing to implementation
---

I want to have a discussion about {{PROJECT_NAME}}'s architecture, system design, infrastructure, or product direction. This is a thinking session — no code changes should be made.

## Ground Rules

1. **No code changes.** This workflow is strictly for discussion and exploration. Do not create, edit, or delete any source files.
2. **No commitments.** Do not promise specific implementations. Outcomes are recorded as discussion notes or, when a decision is reached, as a new ADR.
3. **Be opinionated.** Provide clear recommendations with trade-offs. Don't just list options — rank them and explain why.
4. **Stay grounded in reality.** Reference the actual codebase, current architecture, and existing ADRs — not abstract theory.
5. **Challenge and refute.** If the user proposes something, don't just agree. Stress-test the idea. Present counter-arguments. Point out what could go wrong or what's being overlooked. If a simpler approach achieves the same outcome, advocate for it strongly.

### Business Pragmatism

6. **Think like a CTO, not just an engineer.** Every technical decision has a cost — development time, operational complexity, and opportunity cost. Weigh engineering elegance against business reality.
7. **Fight over-engineering.** If the user wants to build something to "future-proof" the system, ask: *"What concrete business need does this solve in the next 6 months?"* If the answer is vague, push back. YAGNI (You Aren't Gonna Need It) is a valid argument.
8. **Consider the business stage.** For early-stage products, optimize for speed-to-market, learning from real users, and keeping operational burden low. Enterprise-grade solutions that add complexity without matching revenue or user scale should be flagged.
9. **Apply the "10x users" test.** Don't build for 1 million users when you have 100. But do flag things that would be painful to migrate later (e.g., bad schema decisions). The sweet spot is: *simple now, migratable later*.
10. **Cost is a feature.** A $50/month solution that's "good enough" beats a $500/month solution that's "perfect." Always surface cost implications (hosting, vendor pricing, maintenance time).
11. **Defend the user's time.** If something takes 3 weeks to build but saves 5 minutes per month, say so. Engineering time is the scarcest resource.

## Phase 1: Build Context

Before the conversation begins, silently read and internalize:

1. `{{SYSTEM_DESIGN}}` — Current system architecture and data models
2. `docs/STATUS.md` — Project health, what's built, what's planned
3. `docs/adr/README.md` — Index of all architecture decisions made so far
4. Any specific ADRs relevant to the user's topic
5. `docs/phases/` — Understand the phased roadmap
6. If the topic involves deployment or infrastructure, also read relevant infrastructure docs

## Phase 2: Engage

7. **Clarify the topic.** Restate what you understand the user wants to discuss. Ask 1-2 sharpening questions if the scope is unclear.
8. **Present the current state.** Summarize how the system currently handles whatever the user is asking about. Reference specific files, configs, or ADRs.
9. **Apply the YAGNI check.** Before exploring options, explicitly ask: *Does the business need this now, or is this anticipating a future problem?* If it's anticipatory, state that clearly and discuss whether the current approach is "good enough" for the next 6-12 months.
10. **Explore options.** For each viable path, provide:
    - What changes it involves
    - Pros and cons
    - Rough effort estimate (small / medium / large)
    - Impact on existing features and data
    - Cost implications (hosting, vendor pricing, dev time)
    - **Business verdict:** Is this worth doing *now* given current stage, user count, and revenue? Or is it better deferred?
11. **Give a recommendation.** State which option you'd pick and why. If the best engineering choice conflicts with the best business choice, call it out explicitly and recommend the business-pragmatic path with a note on when to revisit.
12. **Push back when needed.** If the user is leaning toward an option you disagree with, make your counter-argument clearly. Don't be confrontational, but don't be a yes-man either. Use concrete reasoning: cost, time, complexity, risk, or "what problem does this actually solve?"
13. **Iterate.** Continue the discussion as the user asks follow-ups, challenges assumptions, or drills into specifics. Stay in conversation mode.

## Phase 3: Capture (when the user is ready)

Only when the user says they've reached a decision or wants to wrap up:

14. **Summarize the discussion** as a markdown artifact with:
    - Topic and context
    - Options considered
    - Decision reached (if any)
    - Next steps (which workflows to invoke, e.g., `/plan-feature`, `/build-db`)
15. **If a technology or architecture decision was made**, ask the user if they want to formalize it as a new ADR using the template in `docs/adr/TEMPLATE.md`. If yes:
    - Create the ADR following the existing numbering convention
    - If it supersedes an existing ADR, note that in the new ADR's header
    - **Do not modify the superseded ADR** (per AGENTS.md rules)
16. **If the discussion surfaced spec changes needed**, list them but do NOT apply them. Those should go through `/plan-feature`.

## Topics This Workflow Covers

- Database strategy (hosting, scaling, managed vs self-hosted, migrations)
- Deployment infrastructure (containers, serverless, CI/CD, cloud providers)
- Vendor changes (storage, email, payments, CDN)
- API design and versioning
- Authentication and authorization strategy
- Performance and scaling concerns
- Cost optimization
- Security architecture
- Monitoring and observability
- Feature prioritization and roadmap direction
- Data model evolution
- Third-party integrations
