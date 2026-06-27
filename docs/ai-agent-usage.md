# AI Agent Usage

Agents work best when they know where to start.

In this template, the root `README.md` inside the installed vault is the universal entry point. Tool-specific instruction files such as `AGENTS.md` and `CLAUDE.md` are deliberately small and point back to that README.

## The basic rule

Ask the agent to read `README.md` first.

The README tells the agent how the vault is organised, which files matter, and what it should avoid doing.

## Safe starter prompts

```text
Read README.md first. Then summarise how this vault is organised.
```

```text
Read README.md first. Then help me create a project note for [project name]. Ask before creating files.
```

```text
Read README.md first. Then review 00 Inbox and suggest where each item belongs. Do not move anything yet.
```

```text
Read README.md first. Then help me continue the project in 01 Projects/[project name]. Read the project README and Log before suggesting next actions.
```

## Safety rules for agents

Agents should:

- read local README files before acting in a folder;
- ask before deleting, publishing, or making large reorganisations;
- explain assumptions before moving files;
- prefer small, reversible changes;
- keep private data out of public repos;
- update project logs when meaningful work happens.

## Project continuity

For projects, agents should read:

1. the project `README.md`;
2. the project `Log.md`;
3. the specific files relevant to the task.

This makes it easier to resume work without relying on one long chat thread.

## Works with many AI tools

This pattern does not depend on one AI app. Claude, Codex, Cursor, Pi, OpenCode, and future tools can all use the same Markdown context if they can read files.

## Advanced: reusable skills

When an agent is asked to add, install, expose, or adapt a reusable workflow, start with `setup-skill` if your environment supports it.

The intended lifecycle is:

- `assess-skill` chooses the lightest safe path.
- `canonicalize-skill` creates the canonical discovery surface.
- `wire-skill` exposes it to supported tools without duplicating source content.

Do not copy the same skill into multiple tool folders unless there is no cleaner adapter path.
