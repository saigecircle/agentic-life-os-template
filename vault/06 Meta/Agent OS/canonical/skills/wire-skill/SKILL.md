---
name: wire-skill
description: Wire a canonical Agent OS skill into tool-specific adapter locations without duplicating the source content. Use after creating or updating a canonical skill.
---

# Wire Skill

Expose a canonical skill to one or more AI tools while keeping `06 Meta/Agent OS/canonical/skills/` as the source of truth.

## When to use

Use after a canonical skill exists and you want tools such as Claude Code, Codex, Pi, OpenCode, Cursor, or another agent harness to discover it.

Do not use this to rewrite the skill itself. Use `canonicalize-skill` first when the skill is not yet clean and portable.

## Procedure

1. Confirm the canonical skill exists:

```text
06 Meta/Agent OS/canonical/skills/<skill-name>/SKILL.md
```

2. Identify which tools need access.

3. Prefer one of these adapter patterns:
   - **Direct discovery:** configure the tool to read `06 Meta/Agent OS/canonical/skills/`.
   - **Symlink:** create a symbolic link from the tool's expected skills folder to the canonical skill folder.
   - **Thin adapter:** write a small tool-specific note that points back to the canonical skill.

4. Avoid copying canonical skill content into multiple places. Copies drift.

5. If an adapter path already exists:
   - if it is the correct symlink, leave it alone;
   - if it is a broken symlink, fix it;
   - if it is a real folder or file, stop and decide whether to preserve, replace, or merge it.

6. Verify each adapter resolves to the canonical `SKILL.md`.

## Example symlink pattern

From the vault root:

```bash
mkdir -p .claude/skills
ln -s "../../06 Meta/Agent OS/canonical/skills/<skill-name>" \
  ".claude/skills/<skill-name>"
```

Adjust the relative path for each tool's adapter folder.

## Verification

Wiring is complete when:

- the canonical `SKILL.md` remains the only source-of-truth copy;
- each target tool can read or resolve the skill;
- no private local path is required unless the adapter is intentionally machine-specific;
- existing non-symlink content was not overwritten accidentally.

## Failure modes

- **Canonical skill missing:** create or canonicalize it first.
- **Existing adapter conflict:** stop and preserve the existing file/folder before replacing it.
- **Tool lacks skill discovery:** create a small adapter README that tells the tool to read the canonical skill.
- **Public template repo:** keep examples generic and avoid private paths, account names, or secrets.
