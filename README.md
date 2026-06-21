# Agentic Life OS Template

A lightweight Markdown Life OS template for humans and AI agents.

This repo gives you a clean starter vault for organising projects, people, areas, resources, archive material, and AI-agent instructions in a way that is both human-readable and agent-usable.

The core idea:

> Your Life OS is the durable home for context. AI tools are clients of that context, not the place where the context should be trapped.

## Who this is for

Use this if you want:

- a simple second-brain structure that works in plain Markdown;
- an Obsidian-friendly vault without depending on Obsidian;
- a project system with README files, logs, and handoffs;
- a tool-agnostic pattern for AI agents like Claude Code, Codex, Pi, OpenCode, Cursor, or future tools;
- a small Agent OS layer for canonical workflows and tool-specific adapters.

## Quick install

### macOS / Linux

From a cloned repo:

```bash
./install.sh ~/Documents/LifeOS
```

Or directly from GitHub once this repo is public:

```bash
curl -fsSL https://raw.githubusercontent.com/saigecircle/agentic-life-os-template/main/install.sh | bash -s -- ~/Documents/LifeOS
```

If you omit the destination, the installer will ask where to install the vault.

### Windows PowerShell

From a cloned repo:

```powershell
./install.ps1 -Destination "$HOME/Documents/LifeOS"
```

## What gets installed

The installer copies only the contents of `vault/` into your chosen folder.

```text
LifeOS/
├── 00 Inbox/
├── 01 Projects/
├── 02 People/
├── 03 Areas/
├── 04 Resources/
├── 05 Archive/
├── 06 Meta/
├── README.md
├── AGENTS.md
└── CLAUDE.md
```

## The folder architecture

- **00 Inbox** — capture-first parking zone for unsorted notes, links, screenshots, and rough ideas.
- **01 Projects** — time-bound work with a finish line.
- **02 People** — relationship context, collaborators, clients, mentors, suppliers, and community contacts.
- **03 Areas** — ongoing responsibilities with no finish line.
- **04 Resources** — reference material, frameworks, checklists, and saved research.
- **05 Archive** — completed or inactive material.
- **06 Meta** — the operating layer: about you, voice, rules, agent instructions, and Agent OS.

## What makes this agentic

This is not just a folder template.

It includes an opinionated pattern for making your context usable by AI agents:

1. **Universal entry point** — root `README.md` explains the vault to humans and agents.
2. **Tiny adapters** — `AGENTS.md`, `CLAUDE.md`, and tool-specific notes point back to the canonical README.
3. **Project continuity** — every project can have a README and Log so agents can resume work without guessing.
4. **Canonical workflows** — reusable workflows live in `06 Meta/Agent OS/canonical/skills/`.
5. **Tool-specific adapters** — `06 Meta/Agent OS/adapters/` explains how different AI tools can use the same canonical source of truth.

Read more:

- `docs/philosophy.md`
- `docs/folder-architecture.md`
- `docs/ai-agent-usage.md`
- `docs/canonical-vs-adapter.md`
- `docs/privacy-and-redaction.md`
- `docs/customization-guide.md`

## First 15 minutes

1. Install the starter vault into a folder you choose.
2. Open it in Obsidian, VS Code, Cursor, or any Markdown editor.
3. Read the root `README.md` in the installed vault.
4. Fill in `06 Meta/About Me.md`.
5. Create one real project using `templates/project-readme.md` and `templates/project-log.md` from this repo.
6. Add one ongoing area.
7. Drop one messy note into `00 Inbox`.
8. Ask an AI agent: “Read README.md first. Then help me file the note in 00 Inbox and explain your reasoning before moving it.”

## Privacy warning

Do not publish your real private vault.

This template is safe because it uses empty folders, generic templates, and fake examples. Keep real client notes, finances, credentials, health notes, journal entries, logs, and private infrastructure out of any public repo.

## License

Choose a license before publishing. MIT is simplest for a public template. CC BY or CC BY-NC may fit better if you want attribution or non-commercial use.
