# Life OS

This is your universal entry point.

Read this file first before working anywhere else in the vault.

## Purpose

This Life OS is a human-readable and AI-usable context layer. It helps you organise your work, relationships, responsibilities, resources, archive material, and agent instructions in plain Markdown.

## Folder structure

```text
Life OS/
├── 00 Inbox/      # capture-first parking zone
├── 01 Projects/   # time-bound work with a finish line
├── 02 People/     # relationship context
├── 03 Areas/      # ongoing responsibilities
├── 04 Resources/  # reference material
├── 05 Archive/    # completed or inactive material
└── 06 Meta/       # operating layer and agent instructions
```

## How agents should use this vault

1. Read this README first.
2. Check local folder README files before acting in a folder.
3. For projects, read the project `README.md` and `Log.md` before changing anything.
4. Explain reasoning before moving, deleting, or reorganising files.
5. Treat `06 Meta/` as the operating layer.
6. Treat canonical workflows in `06 Meta/Agent OS/canonical/` as source-of-truth workflows.
7. Treat adapter files as tool-specific doorways, not as the canonical source.
8. Use `06 Meta/Tools.md` for preferred fit-for-purpose tool routing.

## Canonical skills and adapters

Reusable agent workflows live in `06 Meta/Agent OS/canonical/skills/`.

Tool-specific skill folders and adapter files are doorways only. They should point to canonical skills, not become separate source-of-truth copies.

When adding or improving reusable skills, use the skill lifecycle:

1. Use `setup-skill` as the orchestrator when bringing in a skill from a URL, repo, file, folder, archive, or pasted text.
2. `setup-skill` calls `assess-skill` to recommend the lightest path: `EXT`, `EXT-WRAPPER`, or `SELF-OWNED`.
3. Use `canonicalize-skill` to create the canonical discovery surface.
4. Use `wire-skill` to expose it to supported tools without duplicating source content.
5. Edit the canonical skill first; only adjust adapters when wiring or compatibility requires it.

## Working principles

- Capture first, organise later.
- Projects have finish lines.
- Areas continue over time.
- Resources are reference, not active commitments.
- Archive keeps active work calm.
- The vault is home; AI tools are clients.
- Use `06 Meta/Tools.md` to choose tools; use `06 Meta/Agent OS/tools/` only when repeated execution details need to be preserved.
