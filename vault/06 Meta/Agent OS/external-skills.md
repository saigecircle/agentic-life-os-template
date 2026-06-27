# External Skills

Registry for upstream-owned skills exposed through this Life OS.

Use this when a skill comes from another person, repo, package, marketplace, or external source and you want to preserve where it came from.

## Policy

- Preserve upstream-owned skills unedited when possible.
- Prefer direct exposure (`EXT`) when the upstream skill is usable as-is.
- Use a wrapper (`EXT-WRAPPER`) only when local naming, constraints, routing, or compatibility require it.
- Adopt as self-owned (`SELF-OWNED`) only when you intend to maintain the skill yourself.
- Ask before running install scripts, publishing, deleting, or touching secrets.

## Ownership statuses

| Status | Meaning |
|---|---|
| `EXT` | Upstream-owned and exposed directly. |
| `EXT-WRAPPER` | Upstream-owned with a thin local wrapper. |
| `SELF-OWNED` | Maintained in this Life OS. Usually belongs under `canonical/skills/`. |

## Entry template

```markdown
## skill-name

- status: EXT | EXT-WRAPPER | SELF-OWNED
- upstream owner:
- source URL:
- local source path:
- current ref/version:
- installed/exposed to:
- last checked: YYYY-MM-DD
- wrapper path, if any:
- wrapper reason, if any:
- notes:
```

## Agent instructions

- Do not edit external sources casually.
- Do not copy external skill content into canonical unless adopting it intentionally.
- Keep wrapper notes thin and explicit.
- Record source, version, and exposure path so future agents can audit or update it.

<!-- Add external skills here only after setup and approval. -->
