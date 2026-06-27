# Agent OS Adapters

Adapters let tools consume the vault-owned Agent OS without becoming the source of truth.

## Source of truth

The vault root `README.md` is the universal operating guide.

Canonical skills live in:

```text
06 Meta/Agent OS/canonical/skills/
```

Adapters explain how a specific tool discovers or points to that canonical source.

## Startup adapters

| Tool / harness | Typical startup file | Purpose |
|---|---|---|
| Generic agents | `AGENTS.md` | Portable pointer to the root README. |
| Claude-based tools | `CLAUDE.md` | Claude-specific pointer to the root README. |
| Other tools | Tool-specific config | Point back to README and canonical skills. |

Keep startup adapters thin. If a rule belongs to the vault, put it in root `README.md`.

## Skill adapters

A tool may consume canonical skills through direct configuration, symlinks, import paths, package configuration, or manual instructions.

The adapter should document only:

- where the tool expects instructions or skills;
- how canonical skills are exposed;
- compatibility quirks;
- local setup steps that are safe to record.

## Rules

- Do not duplicate canonical skill content into tool folders.
- Prefer direct consumption or symlinks before generated copies.
- Keep tool-specific behaviour in adapters, not canonical skills.
- If an adapter accumulates workflow rules, move those rules back to canonical.
- Do not store secrets or credentials here.

<!-- Add tool-specific adapter notes in subfolders. -->
