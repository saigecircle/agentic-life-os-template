# AI Agent Usage

Agents work best when they know where to start.

In this template, the root `README.md` is the universal entry point. Tool-specific instruction files such as `AGENTS.md` and `CLAUDE.md` are deliberately small and point back to the README.

## Recommended first prompt

```text
Read README.md first. Then help me understand this vault structure and ask before moving or deleting anything.
```

## Project continuity

For projects, agents should read:

1. the project `README.md`;
2. the project `Log.md`;
3. the specific files relevant to the task.

This makes it easier to resume work without relying on one long chat thread.
