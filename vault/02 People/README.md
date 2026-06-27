# People

Relationship context. This can be a light CRM for collaborators, clients, mentors, suppliers, friends, community contacts, or anyone you want context on before a call or message.

> Before a call or message, a good person note should restore useful context in about 30 seconds.

## Relationship context boundary

People notes are for relationship context, not surveillance.

Keep what helps you show up well:

- how you know them;
- current threads and open loops;
- useful preferences they have shared;
- commitments, decisions, and follow-ups;
- dated interaction notes.

Leave out what does not help:

- gossip;
- assumptions about motives;
- unnecessary sensitive details;
- secrets, credentials, or private documents.

When work belongs elsewhere, link to the relevant Project or Area instead of turning the person note into a dumping ground.

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
- Keep notes grounded in useful relationship context.
- Link to Projects or Areas when the work belongs there.
- Prefer dated notes over vague summaries.
- Keep person context connected to Projects and Areas with links.

<!-- Add your preferred CRM fields here. -->
