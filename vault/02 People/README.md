# People

Relationship context. This can be a light CRM for collaborators, clients, mentors, suppliers, friends, community contacts, or anyone you want context on before a call or message.

> Before a call or message, a good person note should restore useful context in about 30 seconds.

## Privacy boundary

People notes can become sensitive quickly.

- Keep notes respectful, factual, and useful.
- Do not store secrets, credentials, or unnecessary sensitive personal data.
- Ask before sending or sharing person notes outside the vault.
- When unsure, write less and link to the relevant Project or Area instead.

## Structure — flat by default, folder when needed

**Default:** one Markdown file per person at the root of `02 People/`.

**Upgrade to a folder** when the person has extra files such as contracts, testimonials, recordings, or intake documents.

```text
02 People/
├── Example Person.md
└── Example Person/
    ├── Example Person.md
    └── supporting-files/
```

## Naming

Use a naming convention that lets you find people quickly.

Simple options:

- `First Last.md`
- `First LastInitial.md`
- `Organisation - Name.md`

If two people collide, extend the name until it is unambiguous.

Add aliases in frontmatter if your Markdown tool supports them.

## Recommended person note shape

```markdown
---
type: person
status: active
aliases:
  - Optional Full Name
---

# Person Name

## Context

Who this is and why the relationship matters.

## Contact

Where to find contact details, or a link to the external CRM/source of truth.

## Preferences

Useful preferences, pronouns, timezone, communication style, constraints.

## Current threads

- [ ] Open loop or follow-up.

## Notes

**2026-01-15**
- Dated interaction note, decision, or useful context.
```

## Workflows

- **Before an interaction:** skim the note for current threads and preferences.
- **After an interaction:** add a dated Notes entry while the context is fresh.
- **When work belongs elsewhere:** create or update a Project and link back to the person.
- **When a relationship becomes inactive:** keep the note unless there is a privacy reason to remove it.

## What doesn't belong

- Generic reference material → `04 Resources/`.
- Active project work → `01 Projects/<Project Name>/`, linked back to the person.
- Ongoing business or life responsibility → `03 Areas/`.
- Marketing list data or canonical contact databases → keep in the external system if one exists; link to it instead of duplicating everything.

## Agent instructions

- Do not invent relationship facts.
- Be careful with private details.
- Ask before creating notes for sensitive relationships.
- Prefer dated notes over vague summaries.
- Keep person context connected to Projects and Areas with links.

<!-- Add your preferred CRM fields here. -->
