---
name: canonicalize-skill
description: Turn a draft, pasted, external, or tool-specific workflow into a portable canonical Agent OS skill. Use before adding a reusable workflow to the canonical skills layer or adapting it for multiple AI tools.
---

# Canonicalize Skill

Turn a useful workflow into a small, portable, source-of-truth skill under `06 Meta/Agent OS/canonical/skills/`.

## When to use

Use when you have:

- a workflow that worked well and should be reused;
- a pasted or local-only agent instruction that should become portable;
- an external skill you want to reference or wrap safely;
- a tool-specific skill that should be separated from its adapter.

Do not use this for one-off notes or temporary task state.

## Procedure

1. Decide ownership:
   - **Self-owned:** this Life OS owns and edits the skill.
   - **External:** the source lives elsewhere; link to it or document where it came from.
   - **Wrapper:** keep the external source unchanged and write a thin local wrapper.
2. Create a folder:
   - `06 Meta/Agent OS/canonical/skills/<skill-name>/`
3. Add `SKILL.md` with frontmatter:
   - `name:` short kebab-case name
   - `description:` one sentence saying when to use it
4. Keep the body practical and portable:
   - what the skill does;
   - when to use it;
   - required inputs;
   - step-by-step procedure;
   - verification checks;
   - failure modes or safety rules.
5. Remove tool-specific assumptions unless they belong in an adapter.
6. Keep private or environment-specific details out of public template skills.
7. Validate if your environment has an Agent Skills validator:

```bash
uvx --from skills-ref agentskills validate "06 Meta/Agent OS/canonical/skills/<skill-name>"
```

8. Once valid, wire it into tool-specific adapters with `wire-skill` if needed.

## Verification

The skill is ready when:

- it has a valid `SKILL.md`;
- a fresh agent can understand when and how to use it;
- it does not depend on one AI tool unless clearly stated;
- it contains no private personal data or secrets;
- validation passes, if a validator is available.

## Notes

Canonical skills are the source of truth. Tool-specific files should point to them rather than copying their content.
