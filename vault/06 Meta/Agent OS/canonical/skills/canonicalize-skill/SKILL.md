---
name: canonicalize-skill
description: Migrates an existing agent skill into the vault-owned canonical Agent OS skills layer. Use when turning a harness-local, non-compliant, external, or draft skill into a validated canonical skill before wiring it to supported harnesses.
metadata:
  argument-hint: "Skill name or source skill folder path"
---

# Canonicalize Skill

Turn an existing skill into a minimal, portable, spec-compliant canonical Agent OS skill without losing useful behavior.

## Role

Use this skill when:

- A loose, Inbox, harness-local, or pasted skill should become a vault-owned canonical skill.
- A skill needs frontmatter or body cleanup before migration.
- An external skill truly needs a thin wrapper before exposure through the canonical discovery layer.
- An already-canonical skill needs compliance or quality review.

Do not use this skill for:

- Writing an unrelated new skill from scratch.
- Wiring a validated canonical skill to harnesses; use `wire-skill` for that final step.
- Editing externally owned skill content unless the user explicitly decides the vault should take ownership.
- Creating wrappers for external skills that active harnesses can already load directly; use direct `EXT` exposure instead.
- Bulk-migrating multiple skills in one pass.

## Inputs

- Skill name or source skill folder path.
- Intended ownership/source type: `SELF-OWNED`, `EXT`, or `EXT-WRAPPER`, if already known.
- Current canonical skills folder.
- Current harness skill folders and symlink state.
- Migration tracker or project log when working in this vault.

## Process

1. Locate the source skill folder and confirm it contains `SKILL.md`.
2. Determine the intended ownership/source type: `SELF-OWNED`, `EXT`, or `EXT-WRAPPER`.
3. For `SELF-OWNED`, move or copy the skill into the canonical folder, then make the canonical folder the source of truth.
4. For `EXT`, create a canonical symlink to the external source unless the user explicitly asks for a wrapper or to take ownership. Do not normalize upstream source or wrap it only because strict validation dislikes harmless frontmatter.
5. For `EXT-WRAPPER`, preserve the external source unedited and create a thin canonical wrapper only for real operational reasons: invalid YAML or harness breakage, unsafe/non-portable upstream assumptions, local routing guardrails, or deliberate policy overlays.
6. Normalize only what is required for spec compliance, portability, and the canonical quality bar of self-owned or wrapper content; do not edit upstream external source for normalization.
7. Preserve useful non-standard frontmatter under `metadata` instead of dropping it, except legacy learning-sidecar fields.
8. Refactor the body when the existing body uses legacy wrappers, harness-specific structure, or avoidable formatting noise.
9. Run `uvx --from skills-ref agentskills validate` on the canonical skill folder.
10. If validation fails, fix and rerun; do not wire a failing skill.
11. If this is the top-level task, use `wire-skill` after validation passes. If called by another workflow, return the canonical discovery surface for the caller to wire.
12. Remove any empty canonical skill folder left behind by moving, replacing, or symlinking.
13. Update the migration tracker and log with ownership type, origin, validation result, wiring result when applicable, cleanup result, and any unresolved portability issues.

## Ownership and Migration State

Durable ownership/source types:

- `SELF-OWNED`: The vault owner or the vault owns the canonical skill. The canonical folder is the source of truth.
- `EXT`: externally owned source exposed directly by canonical symlink or discovery path. Do not edit by default.
- `EXT-WRAPPER`: externally owned source preserved unedited, with a thin canonical wrapper as the active skill surface.

Temporary migration state belongs in notes, not as the skill type:

- Origin: Inbox, harness-local, pasted, repo, archive, etc.
- Validation: valid, needs-fix, or unknown.
- Compliance fixes made: frontmatter normalized, body cleaned, harness assumptions removed, etc.

## Canonical Quality Bar

- Passes `agentskills validate`.
- No unnecessary Claude Code, OpenCode, Codex, Pi, or other harness assumptions in the canonical body.
- Minimal but complete enough for a fresh agent to execute safely.
- Role, scope, inputs, process, judgment rules, output, and failure modes are present when useful.
- Preferred section shape is `Role`, `Inputs`, `Process`, `Judgment Rules`, `Tools`, `Output`, and `Failure Modes`; omit sections only when they add no execution value.
- Heavy examples, references, scripts, and vendor details live in supporting files when they would bloat `SKILL.md`.
- Every sentence changes agent behavior, safety, or output; otherwise remove it.

## Judgment Rules

- Prefer the smallest correct migration over a rewrite.
- Preserve behavior unless it is obsolete, duplicate, or harness-specific noise.
- Treat legacy body wrappers such as XML-style tags, JSON-like scaffolding, and deeply nested pseudo-structure as format debt; convert them to the preferred Markdown section shape when the conversion is mechanical.
- For existing self-owned skills, modernization should be structural only: section headings, bullets, wording clarity, and portability notes. Do not redesign the workflow unless the user asks.
- Move non-standard fields such as `argument-hint`, `context`, `agent`, `model`, and `user-invokable` under `metadata` when they remain useful.
- Drop legacy `learning: true` fields and do not create or preserve `LESSONS.md` sidecars unless the user explicitly asks to keep a learning sidecar for that skill.
- Use `compatibility` only for genuine environment requirements such as required CLIs, network access, or specific runtimes.
- Keep `wire-skill` separate; this skill prepares and validates the canonical discovery surface, then either wires it when this is the top-level task or returns it to the caller.
- Keep wrappers super thin: add only trigger/route, source pointer, required compatibility guardrails, and output boundary.
- Do not restate, summarize, or improve upstream behavior in a wrapper unless the change is necessary for invalid YAML/harness compatibility, routing, unsafe upstream assumptions, or a user-approved local guardrail.
- If a wrapper exists only to preserve upstream version/frontmatter tracking, remove the wrapper and record `Current ref` plus `Upstream version` in `external-skills.md` instead.
- Do not edit upstream source directly unless the change comes from actual use plus the vault owner's explicit input.
- Empty canonical skill folders are invalid migration residue; remove them once the active source or symlink is in place.
- Preserve a real harness-local folder as `.legacy-YYYY-MM-DD` before replacing it with a symlink.
- Stop and ask before overwriting an existing canonical skill or taking ownership of an external source.

## Tools

- File read/search tools for source inspection and hidden harness assumptions.
- File move, symlink, and patch tools for migration.
- `uvx --from skills-ref agentskills validate` for official Agent Skills validation.
- `wire-skill` after validation passes.

## Output

Return a short migration report listing:

- Source path, origin, and ownership/source type.
- Canonical path created, updated, linked, or left unchanged.
- Validation command and result.
- Wiring result, or the canonical discovery surface to pass to `wire-skill`.
- Tracker/log updates made.
- Remaining issues or ownership decisions.

## Failure Modes

- Source skill missing: ask for the correct skill name or path.
- Existing canonical destination conflicts: stop and ask whether to replace, merge, or skip.
- Invalid YAML: normalize only the smallest necessary wrapper or self-owned section, then validate again.
- Unsupported but parseable upstream frontmatter: prefer direct `EXT` exposure plus a documented `EXT-WARN`, unless an active harness breaks.
- External source is not owned by the vault: link it without editing, or ask before forking.
- Validator unavailable: report that compliance is unverified and do not claim migration complete.
- Validation fails after cleanup: stop before wiring and report the exact validator issue.
