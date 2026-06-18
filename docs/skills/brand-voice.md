---
name: brand-voice
description: Build a durable voice profile from real source material for consistent content
category: business
platforms: [claude, antigravity, cursor]
---

# Brand Voice

Build a durable voice profile from real source material, then use that profile everywhere instead of re-deriving style from scratch.

## When to Use

- The user wants content or outreach in a specific voice
- Writing for X, LinkedIn, email, launch posts, or product updates
- Adapting a known author's tone across channels
- The existing content lane needs a reusable style system

## Source Priority

Use the strongest real source set available, in this order:

1. Recent original social posts and threads
2. Articles, essays, memos, launch notes, or newsletters
3. Real outbound emails or DMs that worked
4. Product docs, changelogs, README framing, and site copy

**Do not use generic platform exemplars as source material.**

## Collection Workflow

1. Gather 5-20 representative samples when available.
2. Prefer recent material over old unless the user says otherwise.
3. Separate "public voice" from "private working voice" if the source clearly splits.

## What to Extract

- Rhythm and sentence length
- Compression vs explanation
- Capitalization norms
- Parenthetical use
- Question frequency and purpose
- How sharply claims are made
- How the author handles uncertainty
- Emoji and formatting habits
- What they never say (anti-patterns)

## Voice Profile Output

```markdown
# Voice Profile — {Brand/Person}

## Core Attributes
- [3-5 adjectives that describe the voice]

## Sentence Rhythm
- [Average length, variation pattern]

## Vocabulary
### Preferred Words/Phrases
- [Words they use naturally]

### Banned Words/Phrases
- [AI slop: "game-changer", "revolutionary", "in today's landscape"]
- [Brand-specific bans]

## Tone Spectrum
- [When formal, when casual, when sharp]

## Examples
### Strong Example (matches voice)
> [Real quote with analysis]

### Anti-Example (does NOT match)
> [Example of what to avoid]
```

## Reuse

Once a voice profile exists, reference it from `content-engine`, `article-writing`, and any outreach workflows. Do not rebuild a voice model from scratch — always start from the profile.
