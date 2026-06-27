# Tools

Practical routing map for tools, external systems, and fit-for-purpose defaults.

Last reviewed: YYYY-MM-DD

<!-- Replace these starter rows with your own tools. Do not put passwords, API keys, OAuth files, tokens, or secrets here. Name the system; store credentials in a password manager. -->

## How to use this file

Use this file when a human or agent needs to know **which tool to use first**.

Keep it practical:

- preferred tools for common work;
- fallback tools when the default is unavailable;
- cost, privacy, or approval cautions;
- links to deeper tool specs only when repeated use justifies them.

If a tool needs detailed setup, invocation examples, or failure modes, create a durable entry under:

```text
06 Meta/Agent OS/tools/
```

## Tool routing principles

1. Prefer the simplest tool that can do the job well.
2. Prefer local/private tools for sensitive material.
3. Ask before using paid, destructive, publishing, or external-send actions.
4. Do not paste secrets into chats, prompts, or notes.
5. If a tool choice affects cost, privacy, quality, or reversibility, say so before acting.

## Preferred tool routing

| Work type | Default | Fallback / escalation | Notes |
|---|---|---|---|
| Search this vault | Editor/file search | AI-assisted search | Search before answering vault-specific questions. |
| File or triage notes | `filing` workflow, if available | Manual folder README rules | Ask before deleting or archiving important material. |
| Project setup | `project-setup` workflow, if available | Use `01 Projects/README.md` | Create README + Log; keep scope small. |
| Handoff / resume context | `handoff` workflow, if available | Project `Log.md` entry | Preserve goal, state, decisions, blockers, next action. |
| Writing in your voice | `Voice.md` | Recent examples you provide | Do not invent a voice profile from nothing. |
| Web research | Browser/search tool | Manual source review | Cite sources and separate facts from assumptions. |
| Sensitive data handling | Local files only | Ask owner | Avoid external tools unless explicitly approved. |

## External systems

Use this section to note where important systems live without storing credentials.

| System | Access path | Owns / contains | Agent use |
|---|---|---|---|
| Password manager | Your chosen password manager | Credentials and secure notes | Agents should never ask you to paste secrets into the vault. |
| Calendar | Your calendar app | Events, availability | Ask before creating or changing events. |
| Email | Your email app | Messages, threads | Ask before sending, forwarding, or deleting. |
| Task manager | Your task app, if any | Tasks and reminders | Clarify source of truth before duplicating tasks in Markdown. |

## Key vault locations

| Need | Location |
|---|---|
| Vault-wide operating rules | `README.md` |
| Folder-specific rules | Each folder's `README.md` |
| Project state | `01 Projects/<Project>/README.md` |
| Project history | `01 Projects/<Project>/Log.md` |
| Personal operating context | `06 Meta/About Me.md` |
| Voice / writing preferences | `06 Meta/Voice.md` |
| Agent workflows | `06 Meta/Agent OS/canonical/skills/` |
| Tool specs | `06 Meta/Agent OS/tools/` |

## When to create a tool registry entry

Create a file under `06 Meta/Agent OS/tools/` only when a tool has durable details worth maintaining, such as:

- setup steps;
- exact invocation patterns;
- cost limits;
- API quirks;
- recurring failure modes;
- related skills or workflows.

Do not create tool specs for one-off experiments.
