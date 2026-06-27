---
name: assess-skill
description: Assess a URL, GitHub repo, local file, folder, archive, or pasted text as a potential Agent Skill and recommend the lightest correct setup path before installing, wiring, wrapping, or canonicalizing.
metadata:
  argument-hint: "URL, repo, local path, archive, or pasted skill text"
---

# Assess Skill

Assess a potential Agent Skill source and recommend the smallest correct setup path.

## Role

Use this skill when:

- The user provides a URL, GitHub repo, local path, archive, gist, pasted text, or existing `SKILL.md` and asks to make it available as a skill.
- The user asks whether something should be `EXT`, `EXT-WRAPPER`, or `SELF-OWNED`.
- The user wants to avoid unnecessary canonicalization while still keeping skills portable across harnesses.
- A source might be an Agent Skill, skill-like prompt, plugin bundle, source snapshot, or upstream skill collection.

Do not use this skill for:

- Installing, cloning, symlinking, editing manifests, creating wrappers, or canonicalizing by default.
- Searching for unknown skills by topic; use `find-skills` for discovery across the skill ecosystem.
- Rewriting an upstream skill to make it cleaner unless the user explicitly decides to proceed after discovery.
- Wiring a known canonical skill; use `wire-skill`.
- Migrating, linking, or normalizing a known source after the user approves setup; use the setup workflow or `canonicalize-skill` for the canonical discovery step.

## Inputs

- Source: URL, repo, local file, local folder, archive, gist, pasted text, or `SKILL.md` path.
- User intent: assessment only, setup recommendation, or explicit approval to proceed.
- Ownership signal: whether the vault owner owns, maintains, or intends to maintain the skill.
- Vault context: canonical skills folder, external source registry, harness discovery paths, and current external-skills manifest when available.

## Process

1. Treat the default mode as assess and recommend only.
2. Identify the source type: `github-repo`, `url`, `local-folder`, `local-file`, `archive`, `pasted-text`, or `unknown`.
3. Inspect the source enough to answer whether it contains a `SKILL.md`, YAML frontmatter, references, scripts, assets, license, owner, and upstream update path.
4. Check Open Agent compliance as a setup-time assessment, not as persistent frontmatter.
5. When a local skill folder is available, prefer running `uvx --from skills-ref agentskills validate <path>` against the candidate skill or `SKILL.md` parent folder.
6. If validation cannot run, inspect manually for common blockers: missing `SKILL.md`, missing or invalid YAML frontmatter, unsupported top-level frontmatter fields, harness-specific assumptions, unsafe install behavior, and non-portable file references.
7. Decide the recommended setup status:
   - `SELF-OWNED` when the vault owner owns the source or intends to maintain it as the upstream.
   - `EXT` when the source is externally owned and can be exposed directly without vault-owned runtime adaptation.
   - `EXT-WRAPPER` when the source is externally owned but direct exposure is not clean enough, unsafe enough, portable enough, or local enough for the active skill surface.
8. Prefer `EXT` over `EXT-WRAPPER` when active harnesses can load the upstream source and no vault-owner-specific behavior is required. A harmless strict-validator warning, such as extra upstream frontmatter, is not enough by itself to justify a wrapper.
9. Prefer `EXT-WRAPPER` over full canonicalization when a thin wrapper can preserve upstream unedited and provide a harness-portable surface for invalid YAML, real harness breakage, unsafe/non-portable upstream assumptions, local routing guardrails, or deliberate policy overlays.
10. Recommend full canonical skill creation only when there is no meaningful external upstream, the vault owner is taking ownership, or the skill is inherently vault-owned.
11. For `EXT` and `EXT-WRAPPER`, plan to track upstream in `external-skills.md` with `Current ref` plus `Upstream version` when the source declares one. Do not edit upstream just to preserve or remove version fields.
12. Stop after the recommendation unless the user explicitly says to proceed, set it up, wire, create the wrapper, or canonicalize.

## Decision Rules

- Open Agent compliance influences the recommendation; it is not itself frontmatter or a durable status.
- Keep ownership status simple: `EXT`, `EXT-WRAPPER`, or `SELF-OWNED`.
- Do not edit upstream-owned source during discovery.
- Do not create local copies when a symlink or configured discovery path would preserve a single source of truth.
- Preserve external snapshots as source material when they are useful but not directly invokable.
- Use wrappers for compatibility, routing, invalid upstream YAML, unsafe/non-portable assumptions, or local guardrails; do not use wrappers to rewrite upstream tastefully or to satisfy validator purism alone.
- Ask one short question only when ownership or user intent changes the status recommendation.
- Treat install scripts, network actions, secret handling, destructive setup steps, and changes to external systems as approval-gated risks.

## Discovery Report

Return an inline report. These fields are report content, not skill frontmatter:

```yaml
source: <input>
source_type: github-repo | url | local-folder | local-file | archive | pasted-text | unknown
contents: <what was found>
open_agent_check: pass | fail | not-applicable | not-run
recommended_status: EXT | EXT-WRAPPER | SELF-OWNED
recommended_exposure: direct | wrapper | reference-only | not-wired
reason: <short reason for the recommendation>
risks: []
next_step: <what to do if the user approves setup>
```

For simple cases, use a concise prose version instead of a YAML block, but keep the same facts.

## Setup Paths After Approval

If the user explicitly approves setup, hand off to the active setup workflow or proceed according to the recommended status:

- `EXT`: preserve the external source unedited, create a canonical discovery entry, validate if possible, wire, update `external-skills.md` with `Current ref` and `Upstream version` when declared, and smoke test.
- `EXT-WRAPPER`: preserve the external source unedited, create a thin canonical wrapper, validate the wrapper when possible, wire, record the wrapper reason plus upstream `Current ref`/`Upstream version` in `external-skills.md`, and smoke test.
- `SELF-OWNED`: create or use a canonical skill source, validate it, wire it, and record ownership if it has an upstream repo.

## Tools

- File read/search tools for local sources, manifests, and existing skill patterns.
- Web or fetch tools for URLs and remote repositories when needed.
- `uvx --from skills-ref agentskills validate` for Open Agent compliance checks when a local candidate exists.
- An approval-gated setup workflow for execution after assessment.
- `canonicalize-skill` only after the recommendation is accepted and the canonical discovery surface should be created.
- `wire-skill` only after a canonical discovery surface exists and validation has passed or the user accepts the risk.

## Output

Return:

- A recommendation: `EXT`, `EXT-WRAPPER`, or `SELF-OWNED`.
- The Open Agent compliance finding and reason.
- The lightest safe setup path.
- Any approval-gated actions required before changes.
- One clear next step.

## Failure Modes

- Source cannot be accessed: report what could not be read and ask for a reachable source.
- Ownership is unclear and changes the recommendation: ask whether the vault owner intends to own or maintain it.
- Compliance cannot be checked: mark the check as `not-run` and explain the blocker.
- Source is unsafe or too broad: recommend `reference-only` or ask before any local setup.
- User asks to proceed but the recommendation implies non-trivial setup: restate the exact files/actions that will change before editing.
