# Projects

Time-bound work with a finish line — a clear outcome, bounded effort, and definition of done.

If the work is ongoing with no finish line, it belongs in `03 Areas/`. If it is reference material, it belongs in `04 Resources/`.

## What counts as a project

A project usually has:

- a goal;
- a start point;
- a next action;
- a definition of done;
- files, decisions, or deliverables worth keeping together.

Examples:

- launch a website;
- plan a trip;
- prepare taxes;
- create a course;
- clean up a digital system;
- write and launch a guide.

## Project shape

Every meaningful project should have its own folder:

```text
01 Projects/<Project Name>/
├── README.md
├── Log.md
├── Assets/      # optional
└── Drafts/      # optional
```

Use internal folders only when they help. Do not create structure just to look organised.

## `README.md` vs `Log.md`

- **`README.md`** — project definition and current state: what it is, why it exists, status, next action, key links, file map.
- **`Log.md`** — dated progress, decisions, learnings, handoffs, and meaningful context. Newest entries usually go first.

### Log entry format

```markdown
**2026-01-15**
- Wrote first draft.
- Decided to keep the scope small and ship v1 before adding automation.
```

## New project template

Create `README.md` with:

- frontmatter: `type: project`, `status`, `started`, `target`;
- one-line description;
- goal / definition of done;
- status;
- next action;
- file map;
- out of scope, if boundaries matter.

Create `Log.md` with the first dated entry.

## Agent instructions

- Read the project `README.md` and `Log.md` before acting.
- Update `Log.md` after meaningful progress, decisions, handoffs, or blockers.
- Do not silently expand scope; name the trade-off first.
- If a task belongs to an Area, link the Area rather than burying ongoing responsibility inside the Project.
- When complete or cancelled, add a closing summary before archiving.

## Archive

Completed or cancelled projects move to:

```text
05 Archive/Projects YYYY/
```

Do not delete project history just because the project is done.

<!-- Add your preferred status labels here, such as active, paused, waiting, completed, or cancelled. -->
