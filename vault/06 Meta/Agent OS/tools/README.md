# Tool Registry

Use this folder for durable specs about external tools, APIs, CLIs, and integrations.

Do not store secrets here.

## Purpose

The tool registry answers: **how exactly do I use this tool reliably?**

Preferred tool choices belong in `06 Meta/Tools.md`. Add a file here only when repeated use proves a tool needs preserved setup notes, invocation details, cost notes, inputs/outputs, or failure modes.

## File pattern

```text
06 Meta/Agent OS/tools/<tool-name>.md
```

A tool entry can include:

- purpose
- access path or invocation
- credentials by name only, never secret values
- key inputs and outputs
- cost notes
- known failure modes
- skills or workflows that depend on it

## Rule of thumb

If an agent only needs to choose a tool, use `06 Meta/Tools.md`.

If an agent keeps needing the same setup commands, API parameters, pricing caveats, or recovery steps, add a tool spec here.
