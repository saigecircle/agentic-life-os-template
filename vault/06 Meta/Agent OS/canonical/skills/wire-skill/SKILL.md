---
name: wire-skill
description: Wires a canonical Agent OS skill into supported harness discovery paths without duplicating skill content. Use after creating a canonical skill or when verifying skill availability across OpenCode, Claude Code, Codex, and Pi.
metadata:
  argument-hint: "Canonical skill folder name, e.g. 'handoff'"
---

# Wire Skill

Expose a canonical Agent OS skill to supported harnesses through direct discovery or symlinks.

## Role

Use this skill when:

- A new canonical skill has been created under `06 Meta/Agent OS/canonical/skills/`.
- An existing canonical skill, direct external symlink, or external wrapper needs to be made discoverable by supported harnesses.
- Skill wiring should be checked without copying canonical or external content.

Do not use this skill for:

- Creating or rewriting the skill content itself.
- Harness-specific custom behavior that belongs in an adapter.
- Duplicating canonical or external skill folders into harness directories.

## Inputs

- Canonical skill folder name.
- Vault root with supported harness directories.
- Current OpenCode config, when checking direct canonical discovery.

## Process

1. Confirm `06 Meta/Agent OS/canonical/skills/<skill>/SKILL.md` exists.
2. Resolve the canonical `SKILL.md` target and classify it as self-owned canonical, direct `EXT` symlink, or `EXT-WRAPPER` active surface.
3. For direct `EXT` and `EXT-WRAPPER`, check that `06 Meta/Agent OS/external-skills.md` records the external source, `Current ref`, `Upstream version` when declared, exposure, and wrapper reason when relevant.
4. Ensure harness skill directories exist or ask before creating missing harness structure.
5. Create or verify per-skill symlinks for Claude Code, Codex, and Pi.
6. Verify OpenCode can discover the canonical skills folder via `skills.paths`.
7. Read each wired `SKILL.md` path enough to confirm it resolves to the intended canonical, external, or wrapper content.
8. Log the wiring in the portability project log when working in this vault.

## Judgment Rules

- Use symlinks or direct config, not copied skill content.
- Treat the canonical skill folder as the active discovery surface. For direct `EXT`, the symlink target under `06 Meta/Agent OS/external/` remains the upstream-owned source of truth.
- If an existing harness path is a real folder, preserve it first or ask before replacing it.
- Make wiring idempotent where possible: skip correct links, fix broken links, and report conflicts.
- OpenCode does not need per-skill symlinks when `skills.paths` already points at the canonical skills folder.

## Tools

- File read/search tools for validation.
- Symlink and config-editing tools as needed.

## Output

Return a short wiring report listing:

- Canonical source checked.
- Harness paths created, already correct, or blocked.
- OpenCode config status.
- Any legacy copy preserved before replacement.

## Failure Modes

- Canonical source missing: stop and ask whether to create the skill first.
- Existing non-symlink harness folder: preserve or ask before replacement.
- OpenCode config missing: report that direct discovery is unverified rather than creating config silently.
- Symlink creation fails: report the exact path and do not claim the harness is wired.
