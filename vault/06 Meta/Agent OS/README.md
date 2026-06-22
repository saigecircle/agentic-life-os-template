# Agent OS

Agent OS is the tool-agnostic layer for AI-agent instructions, reusable workflows, and adapters.

## Core pattern

> Canonical workflow knowledge lives in the Life OS. Tool-specific adapters point to it.

## Folders

```text
Agent OS/
├── canonical/skills/   # source-of-truth workflows
├── adapters/           # tool-specific instructions
└── tools/              # notes about local tools and integrations
```

## Canonical vs adapter

- **Canonical** means source of truth.
- **Adapter** means tool-specific doorway.

If you change AI tools later, keep the canonical workflows and update the adapters.

## Starter skills

The template includes a few generic starter skills:

- `project-setup` — start a new project with a README and Log.
- `handoff` — preserve context before pausing or switching tools.
- `filing` — file loose notes into the right vault home.
- `canonicalize-skill` — turn a reusable workflow into a portable canonical skill.
- `wire-skill` — expose a canonical skill to tool-specific adapters without copying it.
