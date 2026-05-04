# Prompt Specs

This directory contains the LLM prompt specifications for this project. Each prompt used in the system has two files:

1. **System prompt** (`{name}_system_prompt.md`) — The exact text sent as the system/instruction prompt
2. **Response schema** (`{name}_response_schema.json`) — The JSON schema that the LLM response must conform to

## Why Spec Prompts?

Prompts are engineering contracts just like API specs. By defining them here:

- **Consistency:** The same prompt is used in development, testing, and production
- **Testability:** Mock LLM providers can return responses matching the schema
- **Versioning:** Prompt changes are tracked in git alongside code changes
- **Review:** Prompt quality can be reviewed before code is written

## Rules

1. **Never hardcode prompts in source code.** Load them from this directory or embed them at build time.
2. **Every prompt has a response schema.** The schema is used to validate LLM responses at runtime.
3. **Prompt changes are spec changes.** Update the CHANGELOG with a `[DEVIATION]` tag if a prompt changes after initial approval.
4. **Test prompts with mocks first.** The mock LLM provider should return responses matching the schema.

## Template

### System Prompt (`{name}_system_prompt.md`)

```markdown
# {Prompt Name}

## System Prompt

You are {role description}.

### Rules
1. {Rule 1}
2. {Rule 2}

### Input Format
{Description of what the user/system will provide}

### Output Format
{Description of expected JSON structure}
```

### Response Schema (`{name}_response_schema.json`)

```json
{
  "$schema": "http://json-schema.org/draft-07/schema#",
  "type": "object",
  "properties": {
    "field1": { "type": "string" },
    "field2": { "type": "array", "items": { "type": "object" } }
  },
  "required": ["field1"]
}
```

## Index

<!-- BOOTSTRAP: Prompt specs are generated during bootstrap Step 4 (if the project uses LLMs) -->

| Prompt | System Prompt | Response Schema | Used By |
|--------|--------------|-----------------|---------|
| *Prompts will be listed during bootstrap (if applicable)* | | | |
