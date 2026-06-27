# Tool Registry

Durable specs for repeated external tool use.

Use this folder for tool details that are too specific for `06 Meta/Tools.md` but useful enough to preserve.

## What belongs here

- Setup notes for tools you use repeatedly.
- Exact invocation patterns.
- Inputs and outputs.
- Cost or rate-limit cautions.
- Failure modes and recovery steps.
- Links to related skills.

## What belongs in `06 Meta/Tools.md` instead

- High-level tool routing.
- Which tool to try first.
- External system names and access paths.
- Cost/privacy cautions that affect tool choice.

## Tool entry template

````markdown
---
type: tool
status: active
last_reviewed: YYYY-MM-DD
---

# Tool Name

## Purpose

What this tool is for.

## Access

Where it is used or launched. Name credential storage only; never paste secrets.

## Inputs

What the tool needs.

## Outputs

What it produces.

## Common commands or calls

```text
example command here
```

## Cost / limits

Any cost, quota, privacy, or approval cautions.

## Failure modes

Known errors and recovery steps.

## Related skills

-
````

## Safety

- Do not store secrets here.
- Refer to credentials by name only, such as “password manager entry: Example Tool”.
- Ask before paid, destructive, or external-send actions.

<!-- Add tool specs only after repeated use proves they are needed. -->
