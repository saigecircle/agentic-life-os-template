# Agent OS

Agent OS is the tool-agnostic layer for AI-agent instructions, reusable workflows, skill lifecycle, and adapters.

The Life OS is the system. AI tools are clients.

## Core pattern

> Canonical workflow knowledge lives in the Life OS. Tool-specific adapters point to it.

## Folders

```text
Agent OS/
├── canonical/skills/   # source-of-truth workflows and active skill surfaces
├── adapters/           # tool-specific instructions or discovery notes
├── tools/              # durable specs for repeated external tool use
└── external-skills.md  # registry for upstream-owned skill sources
```

## Tool routing

For preferred tool routing by work type, see `06 Meta/Tools.md`.

Keep defaults there. Use `06 Meta/Agent OS/tools/` only when repeated use proves a tool needs durable invocation details, cost notes, setup notes, or failure modes.

## Canonical vs adapter

- **Canonical** means source of truth.
- **Adapter** means tool-specific doorway.

If you change AI tools later, keep the canonical workflows and update the adapters.

## Skills lifecycle

Skills are the primary Agent OS artifact. If reusable behavior needs judgment, constraints, or an ordered process, put it in a skill first.

Canonical location:

```text
06 Meta/Agent OS/canonical/skills/<skill-name>/SKILL.md
```

Skill ownership is intentionally simple:

- `SELF-OWNED` — the vault owner maintains the skill. The canonical folder is the source of truth.
- `EXT` — an upstream-owned skill can be exposed directly. Preserve the upstream source unedited and point canonical discovery at it.
- `EXT-WRAPPER` — an upstream-owned skill needs a thin vault-owned wrapper for real operational reasons, such as invalid YAML, harness breakage, unsafe assumptions, or local routing guardrails.

Use `external-skills.md` only for upstream-owned `EXT` and `EXT-WRAPPER` sources. Self-owned skills do not need a separate registry.

## Setup workflow

Use `setup-skill` when adding a skill from a URL, repo, file, folder, archive, or pasted text.

`setup-skill` is the front door:

1. **Assess** the source.
2. **Recommend** the lightest setup path: `EXT`, `EXT-WRAPPER`, or `SELF-OWNED`.
3. **Confirm** concrete file, symlink, and manifest changes before editing.
4. **Canonicalize** the discovery surface.
5. **Wire** supported harnesses without duplicating content.
6. **Validate and smoke-test** when possible.
7. **Report** what changed and what still needs manual follow-up.

The lifecycle helpers remain independently useful:

- `assess-skill` — recommendation only; no installs, wiring, or rewrites.
- `canonicalize-skill` — create the approved canonical discovery surface.
- `wire-skill` — expose an existing canonical skill to supported AI tools through config or symlinks.

## Starter skills

The template includes these generic starter skills:

- `project-setup` — start a new project with a README and Log.
- `handoff` — preserve context before pausing or switching tools.
- `filing` — file loose notes into the right vault home.
- `setup-skill` — orchestrate skill assessment, setup, wiring, validation, and smoke tests.
- `assess-skill` — assess a possible skill and recommend the lightest safe setup path.
- `canonicalize-skill` — turn a useful workflow or approved external source into a portable canonical skill surface.
- `wire-skill` — expose a canonical skill to tool-specific adapters without copying it.

## Design rules

- The Life OS is the source of truth.
- AI tools are clients, not the home for durable context.
- Do not duplicate canonical judgment across harnesses.
- Keep preferred tool routing in `06 Meta/Tools.md`; keep detailed tool specs in `06 Meta/Agent OS/tools/` only when justified.
- Preserve external upstream skills unedited unless deliberately adopting or forking them.
- Prefer direct exposure before wrappers.
- Use wrappers only for real operational reasons.
- Prefer symlinks or configured discovery paths over copied skill folders.
- Keep adapters small and replaceable.
