---
name: brand-discovery
description: Structured multi-session brand identity interview producing a master brandbook
category: business
platforms: [claude, antigravity, cursor]
---

# Brand Discovery

Conduct a structured, adaptive brand identity interview to produce a master brandbook.

## When to Use

- A brand is being created, repositioned, or needs a written identity reference
- Multiple sessions are expected — the conversation will span days or weeks
- Existing brand documentation is scattered, implicit, or founder-dependent
- The user wants a structured, repeatable method rather than an ad-hoc chat

## Interview Modules

| # | Module | Focus |
|---|--------|-------|
| 1 | Purpose & Origin | Why does this exist? What problem drove its creation? |
| 2 | Positioning | Who are you for? Who are you NOT for? What makes you different? |
| 3 | Audience | Who buys? Who uses? Who influences the decision? |
| 4 | Personality | If the brand were a person, how would they behave? |
| 5 | Voice & Tone | How does the brand speak? What words does it use/avoid? |
| 6 | Visual Identity | Colors, typography, imagery direction |
| 7 | Narrative & Story | The founding story, the future vision, the transformation promise |
| 8 | Founder-Brand Tension | Where does the founder's identity diverge from the brand's? |

## Interview Discipline

1. **One question at a time.** Never present a list of questions.
2. **After each answer:** short paraphrase → one deepening probe OR close the thread.
3. **Laddering:** for every "what" answer, follow with "Why does that matter to you?" until a core value surfaces.
4. **5 Whys:** for beliefs or positioning claims — push until the root reason surfaces.
5. **Detect thin answers:** if generic or vague, ask for a concrete example or story.
6. **Projective techniques** (use once per module):
   - "If the brand were a person, how would they walk into a room?"
   - "If the organization closed in five years, what would customers miss?"
   - "Name one peer you admire but would never want to become."
7. **Saturation signal:** when two consecutive probes produce no new information, close the module.

## Session Protocol

### At Session Start
1. Check for prior progress (saved module files and state).
2. Report: which module, its status, what remains.
3. Ask: "Continue here, or switch module?"

### At Module End
Write a structured module file with:
- `## Raw` — verbatim quotes and examples
- `## Synthesis` — interpretation, candidate formulations

### At Interview End
Produce `90_SYNTHESIS.md` — the master brandbook combining all modules into a coherent identity document usable by designers, writers, and collaborators.

## Output Location

Save brand identity files to `docs/brand/` or a project-specific directory:
```
docs/brand/
  01_purpose.md
  02_positioning.md
  ...
  90_SYNTHESIS.md
  state.json        ← Resume checkpoint
```
