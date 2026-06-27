# Life OS

This is your universal entry point.

Read this file first before working anywhere else in the vault. It is written for both humans and AI agents.

## Purpose

This Life OS is a human-readable and AI-usable context layer. It helps you organise work, relationships, responsibilities, resources, archive material, and agent instructions in plain Markdown.

> Your vault is the durable home for context. AI tools are clients of that context, not the place where context should be trapped.

<!-- Customise this section with your own purpose, principles, and constraints. Keep it short enough that a human or agent can read it before acting. -->

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

## Project vs Area vs Resource

- **Project** — time-bound work with a finish line. Use `01 Projects/`.
- **Area** — an ongoing responsibility with no finish line. Use `03 Areas/`.
- **Resource** — reference material with no immediate action expected. Use `04 Resources/`.

A campaign, launch, cleanup, or improvement *for* an Area is usually a Project that links back to the Area.

## How humans should use this vault

- Capture quickly into `00 Inbox/` when you might otherwise lose the thought.
- Move important context to its natural home once it is clear.
- Use project `README.md` files for current state and project `Log.md` files for dated progress.
- Keep operating preferences, personal context, tools, and agent behaviour in `06 Meta/`.
- Prefer simple Markdown that you can still understand without a specific app.

## How AI agents should use this vault

1. Read this README first.
2. Check local folder README files before acting in a folder.
3. For project work, read the project `README.md` and `Log.md` before changing anything.
4. State assumptions before moving, deleting, publishing, or reorganising files.
5. Prefer small, reversible changes.
6. Update logs when meaningful project progress or decisions happen.
7. Treat `06 Meta/` as operating context, not as a dumping ground.

## Retrieval

For vault-specific questions — past work, people, decisions, projects, or notes — search the vault before answering.

If your tool has a search command, use it. If not, inspect likely folders and files directly. Name the files you used when giving an answer.

If nothing relevant is found, say so instead of guessing.

## Memory protocol

Durable knowledge belongs in Markdown:

- root `README.md` for vault-wide rules;
- folder `README.md` files for local rules;
- project `README.md` and `Log.md` files for project state;
- area notes for ongoing responsibilities;
- person notes for relationship context;
- `06 Meta/` for personal operating context and agent instructions.

Do not rely on chat history as the only home for important decisions.

## Canonical skills and adapters

Reusable agent workflows live in:

```text
06 Meta/Agent OS/canonical/skills/
```

Tool-specific adapter files are doorways only. They should point to canonical workflows, not become separate source-of-truth copies.

When adding or improving reusable workflows:

1. assess the lightest useful setup;
2. preserve the canonical source;
3. wire adapters only when a tool needs them;
4. edit the canonical workflow first.

See `06 Meta/Agent OS/README.md`.

## Tools

Use `06 Meta/Tools.md` for preferred tool routing and external system notes.

Use `06 Meta/Agent OS/tools/` only when a tool needs durable invocation details, setup notes, costs, or failure modes.

Do not store passwords, API keys, OAuth files, or secrets in this vault.

## File hygiene

- Everything should have a place.
- Reuse or update existing notes before creating duplicates.
- Link related notes when the link would be useful later.
- Use Markdown links for external URLs.
- Use wikilinks if your editor supports them and you want rename-safe internal links.
- Do not delete or publish without explicit confirmation.
- Archive inactive material instead of leaving active folders noisy.

## Privacy and safety

This starter vault is safe because it is generic. Your real vault may become private quickly.

Before sharing or publishing any adapted version, remove:

- real people/client notes;
- finance, health, journal, family, or legal material;
- credentials, tokens, `.env` files, OAuth files, cookies, or private infrastructure details;
- screenshots or logs that reveal private systems.

If you would not put it on a public website, do not put it in a public template repo.
