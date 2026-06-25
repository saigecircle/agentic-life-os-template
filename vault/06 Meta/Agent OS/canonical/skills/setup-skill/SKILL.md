---
name: setup-skill
description: "Set up an Agent Skill end to end: assess, confirm, canonicalize the correct discovery surface, wire it, and smoke-test discovery."
metadata:
  argument-hint: "URL, repo, local path, archive, pasted skill text, or assessed skill"
---

# Setup Skill

Install or expose a candidate Agent Skill through the smallest safe path.

## Role

Use this skill when the user asks to set up, install, add, expose, or make available a skill from a URL, repo, local path, archive, pasted text, or prior `assess-skill` report.

Do not use this skill for:

- Recommendation-only work; use `assess-skill` and stop.
- Discovering unknown skills by topic; use `find-skills` first.
- Rewriting upstream skills for taste.
- Wiring an already-canonical skill with no setup decision left; use `wire-skill` directly.

## Process

1. **Assess.** Use `assess-skill` unless the current context already has a fresh recommendation.
2. **Recommend.** Present one path:
   - `EXT`: upstream-owned source, canonical discovery entry points at it.
   - `EXT-WRAPPER`: upstream-owned source plus a thin vault-owned wrapper.
   - `SELF-OWNED`: vault-owned canonical source of truth.
3. **Confirm.** Before edits, list the exact files, symlinks, and manifest entries that will change. Ask for approval unless the user has already approved those exact changes.
4. **Canonicalize.** Use `canonicalize-skill` to create the approved canonical discovery surface for the selected type.
5. **Wire.** Use `wire-skill` after the canonical discovery surface exists. If the canonicalize step reports wiring already happened, verify it instead of duplicating work.
6. **Check.** Validate with `uvx --from skills-ref agentskills validate <active-skill-folder>` when possible, then run or mark a read-only smoke test.
7. **Report.** Return what changed, validation result, wiring status, smoke-test status, and any deferred restart/manual check.

## Rules

- This is the orchestrator. `assess-skill`, `canonicalize-skill`, and `wire-skill` must stay independently invokable.
- Setup is approval-gated. Do not silently create symlinks, wrappers, manifest entries, or canonical files.
- Canonicalize the **discovery surface** for every setup path; canonicalize the **content** only for `SELF-OWNED` and `EXT-WRAPPER`.
- Preserve upstream-owned source unedited unless the vault owner explicitly adopts or forks it.
- Prefer `EXT` when direct upstream exposure works and no vault-owner-specific behavior is needed.
- Use `EXT-WRAPPER` only for real operational reasons: invalid YAML or harness breakage, unsafe/non-portable assumptions, local routing guardrails, or deliberate policy overlays.
- Use symlinks or configured discovery paths instead of copied skill content.
- Stop before overwriting a non-symlink destination, deleting a skill folder, running an install script, publishing, or touching secrets.

## Output

Return a short setup report:

- Source and selected status.
- Files or links changed.
- Validation result.
- Wiring result.
- Smoke-test status.
- Deferred risks or manual follow-up.

## Failure Modes

- Source cannot be assessed: stop and ask for a reachable source.
- Ownership changes the recommendation: ask whether the vault owner intends to own/maintain it.
- User has not approved concrete changes: ask before editing.
- Validation fails: fix self-owned/wrapper content, or document upstream failure and choose `EXT-WARN`, wrapper, or stop.
- Wiring fails: report the exact path and leave setup incomplete.
