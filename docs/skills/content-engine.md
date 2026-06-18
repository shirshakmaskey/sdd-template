---
name: content-engine
description: Platform-native content creation with source-first workflow and anti-slop filters
category: business
platforms: [claude, antigravity, cursor]
---

# Content Engine

Build platform-native content without flattening the author's voice into generic AI copy.

## When to Use

- Writing X posts or threads
- Drafting LinkedIn posts or launch updates
- Writing blog posts, essays, guides, or tutorials
- Scripting short-form video or YouTube explainers
- Repurposing articles, demos, docs, or internal notes into public content
- Building a launch sequence or content system around a product

## Non-Negotiables

1. **Start from source material,** not generic post formulas.
2. **Adapt the format for the platform,** not the persona.
3. **One post should carry one actual claim.**
4. **Specificity beats adjectives.**
5. **No engagement bait** unless the user explicitly asks for it.

## Source-First Workflow

Before drafting, identify the source set:
- Published articles or blog posts
- Notes or internal memos
- Product demos or screenshots
- Docs or changelogs
- Transcripts
- Prior posts from the same author

If the user wants a specific voice, build a voice profile first using `brand-voice` skill.

## Platform Formats

### X/Twitter
- Hook in first line (concrete, not clickbait)
- Thread structure: claim → evidence → insight → CTA
- 280 char limit per tweet; use threads for depth
- Embed images/screenshots when possible

### LinkedIn
- First 2-3 lines visible before "see more" — make them count
- Professional but not corporate
- Structure: insight → story/evidence → takeaway
- 1,300 char sweet spot

### Blog / Long-form
- Lead with the concrete thing (artifact, example, output)
- Explain after the example, not before
- Use proof instead of adjectives
- Include code examples, screenshots, or data when relevant
- Clear structure: H2 sections, short paragraphs

## Banned Patterns

Delete and rewrite any of these:
- "In today's rapidly evolving landscape"
- "game-changer", "revolutionary", "cutting-edge"
- "Here's why that matters"
- "Let's dive in" / "Let's unpack"
- "I'm thrilled to announce"
- "It's not just about X, it's about Y"
- "Buckle up"
- Any sentence that starts with "As a..."
- Lists of 3 with escalating adjectives
- Rhetorical questions that no one would actually ask

## Core Rules

1. **Lead with concrete things:** artifact, example, output, anecdote, number, screenshot, or code.
2. **Explain after the example, not before.**
3. **Keep sentences tight** unless the source voice is intentionally expansive.
4. **Use proof instead of adjectives.**
5. **Never invent facts, credibility, or customer evidence.**
