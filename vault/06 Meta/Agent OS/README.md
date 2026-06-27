# Agent OS

Tool-agnostic layer for reusable AI-agent behaviour.

The Life OS is the source of truth. AI tools are clients.

## Core principle

Workflow knowledge should live in the vault, not be trapped inside one AI app.

Canonical workflows live here once. Tool-specific adapters point to them.

## Folder map

```text
Agent OS/
├── README.md
├── canonical/
│   └── skills/
├── adapters/
├── tools/
└── external-skills.md
```

## Layers

| Layer | Purpose | Examples |
|---|---|---|
| Vault docs | Durable human + agent context | root README, folder READMEs, project logs |
| Skills | Reusable workflow judgment | filing, project setup, handoff |
| Adapters | Tool-specific discovery and wiring | Claude Code, Codex, Pi, OpenCode |
| Tools | Durable external tool invocation details | APIs, CLIs, paid services |
| External skills registry | Upstream-owned skills exposed to this Life OS | `external-skills.md` |

## Canonical vs adapter

A **canonical workflow** is the source of truth.

An **adapter** is a doorway that helps one tool find or use the canonical workflow.

Do not copy full skill content into every tool's folder. If the rule belongs to the workflow, put it in canonical. If the rule only helps a specific tool discover the workflow, put it in an adapter.

## Skill ownership model

Use the lightest ownership path that works.

| Status | Meaning | Use when |
|---|---|---|
| `SELF-OWNED` | You maintain the skill in this Life OS | The workflow is yours or heavily customised. |
| `EXT` | Upstream-owned, exposed directly | The external skill is usable as-is. |
| `EXT-WRAPPER` | Thin local wrapper around upstream | You need local naming, routing, or constraints without forking the skill. |

## Skill lifecycle

When adding, installing, exposing, or adapting a reusable skill:

1. **Assess** — decide whether it should be `EXT`, `EXT-WRAPPER`, or `SELF-OWNED`.
2. **Canonicalize** — create the approved canonical discovery surface.
3. **Wire** — expose it to the tools that need it.
4. **Validate** — confirm the tool can discover and use it without duplicating source content.

Starter workflow names in this template:

```text
setup-skill → assess-skill → canonicalize-skill → wire-skill
```

## Starter skills

The template includes small generic skills under:

```text
06 Meta/Agent OS/canonical/skills/
```

Useful starters:

- `filing` — decide where notes/files belong.
- `project-setup` — create a project README and Log.
- `handoff` — preserve current state for later continuation.
- `setup-skill` — orchestrate skill setup safely.
- `assess-skill`, `canonicalize-skill`, `wire-skill` — skill lifecycle helpers.

## Tools vs skills

- Use `06 Meta/Tools.md` to decide which tool fits a task.
- Use `06 Meta/Agent OS/tools/` for detailed repeated invocation notes.
- Use skills for workflow judgment: when to ask, what to preserve, what not to do.

## Adapter rules

- Keep startup files like `AGENTS.md` and `CLAUDE.md` tiny.
- Point tools back to the root README and canonical skills.
- Prefer direct configuration or symlinks over copying skill folders.
- If an adapter accumulates workflow judgment, move that judgment back to canonical.

## Design rules

- Human-readable first.
- Tool-agnostic by default.
- Fake examples only in public templates.
- No secrets or credentials.
- Add structure only when it reduces future confusion.

<!-- Add supported agent tools and local discovery/config notes under adapters/. -->
