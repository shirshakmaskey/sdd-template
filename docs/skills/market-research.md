---
name: market-research
description: Conduct market research with source attribution and decision-oriented summaries
category: business
platforms: [claude, antigravity, cursor]
---

# Market Research

Produce research that supports decisions, not research theater.

## When to Use

- Researching a market, category, company, or technology trend
- Building TAM/SAM/SOM estimates
- Comparing competitors or adjacent products
- Pressure-testing a thesis before building, funding, or entering a market
- Validating PRD assumptions with market data

## Research Standards

1. **Every important claim needs a source.** URL, report name, or data origin.
2. **Prefer recent data** and call out stale data (>2 years old).
3. **Include contrarian evidence** and downside cases.
4. **Translate findings into a decision,** not just a summary.
5. **Separate fact, inference, and recommendation** clearly.

## Research Modes

### Market Sizing (TAM/SAM/SOM)
1. Define the market boundaries
2. Top-down estimate (industry reports, public data)
3. Bottom-up estimate (unit economics × addressable customers)
4. Compare the two — if they diverge significantly, investigate why
5. Present conservative, moderate, and optimistic scenarios

### Competitor Comparison
1. Identify 5-10 relevant competitors
2. Score against defined criteria (features, pricing, target market, traction)
3. Identify gaps and opportunities
4. Map on a 2×2 positioning matrix
5. Use `competitive-analysis` skill for deep benchmarking

### Technology Scan
1. Identify technologies/approaches for the problem
2. Evaluate maturity (experimental → emerging → established → declining)
3. Assess ecosystem (community, documentation, maintenance, adoption)
4. Estimate switching cost if chosen
5. Recommend with trade-offs

## Output Format

```markdown
# Market Research — {Topic}

## Executive Summary
[2-3 sentences: key finding + recommendation]

## Key Findings
[Numbered findings with source citations]

## Data
[Tables, charts, or structured data]

## Contrarian View
[What could be wrong about these findings?]

## Recommendation
[Clear decision recommendation with reasoning]

## Sources
[Numbered list of sources]
```
