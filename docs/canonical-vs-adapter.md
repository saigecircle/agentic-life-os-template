# Canonical vs Adapter

This is one of the most important ideas in the template.

## Canonical

Canonical files are the source of truth.

Examples:

- root `README.md`
- project `README.md` and `Log.md`
- reusable workflows in `06 Meta/Agent OS/canonical/skills/`
- personal context in `06 Meta/About Me.md`

Canonical content should be clear, durable, and tool-agnostic.

## Adapter

Adapters are tool-specific doorways into the canonical source.

Examples:

- `AGENTS.md` for tools that look for agent instructions there
- `CLAUDE.md` for Claude-based tools
- adapter notes under `06 Meta/Agent OS/adapters/`

Adapters should stay small. They explain how a specific tool should find and use the canonical source of truth.

## Why this matters

AI tools change quickly. If your workflows live only inside one app, they are fragile.

A canonical Life OS lets you switch tools while keeping the same durable context and workflow knowledge.
