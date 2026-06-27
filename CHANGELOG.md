# Changelog

All notable changes to the Agentic Life OS Template will be documented here.

## 2026-06-27 — Richer starter vault operating docs

Made the installed starter vault more useful on day one by expanding its internal README and Meta files into practical operating guides.

### Added

- Added `vault/00 Inbox/README.md` with capture, triage, sweep, and agent filing rules.
- Added `vault/06 Meta/Agent OS/adapters/README.md` to explain the adapter layer before tool-specific stubs.

### Changed

- Expanded `vault/README.md` with retrieval, memory protocol, file hygiene, AI-agent rules, privacy, tools, and canonical skills guidance.
- Expanded folder READMEs for Projects, People, Areas, Resources, Archive, and Meta with what-belongs/what-doesn't-belong guidance, starter shapes, and agent instructions.
- Expanded `vault/06 Meta/Tools.md`, `Team.md`, `Voice.md`, and `About Me.md` with useful placeholders and operating context prompts.
- Expanded Agent OS, tool registry, external skills, and adapter notes while keeping them tool-agnostic and public-safe.

### Why it matters

The template now behaves more like a real Life OS: folder-level guidance is detailed enough for humans and agents to use without copying private vault specifics.

## 2026-06-27 — Beginner-friendly publishing cleanup

Improved the public template documentation so new users can understand, install, and safely try the Agentic Life OS without depending on any single AI tool.

### Added

- Added `docs/first-15-minutes.md` as a guided getting-started path.

### Changed

- Simplified the README onboarding flow and moved the first-use path near the top.
- Clarified that the installer copies only `vault/` and that `--force` / `-Force` can overwrite destination files.
- Clarified tool-agnostic AI-agent usage with safe starter prompts.
- Expanded canonical-vs-adapter guidance with plain-English do/don't rules.
- Expanded privacy guidance with practical redaction examples.
- Standardised the folder architecture docs around PPARAM plus `00 Inbox`.
- Updated the license section to match the MIT license in `LICENSE`.

### Why it matters

The template is easier for beginners to adopt, safer to share, and clearer about the principle that the vault is the source of truth while AI tools are interchangeable clients.

## 2026-06-26 — Fit-for-purpose tool routing

Added the minimal tool-routing architecture for reliable, fit-for-purpose agent tool choice. Cost awareness is included as one routing factor, not the main purpose.

### Added

- Added `vault/06 Meta/Tools.md` as the practical routing map for preferred tools, external systems, and fit-for-purpose defaults.
- Added a simple three-layer explanation to the main README:
  - `06 Meta/Tools.md` for tool choice and defaults.
  - `06 Meta/Agent OS/tools/` for durable tool specs only when repeated use justifies them.
  - skills for workflow judgment and process.

### Changed

- Updated the vault README and Meta README so agents can find `Tools.md` when tool choice matters.
- Tightened `vault/06 Meta/Agent OS/tools/README.md` to clarify that the tool registry is for preserved invocation details, setup notes, cost notes, and failure modes — not everyday routing.
- Updated the Agent OS README to point preferred tool routing back to `06 Meta/Tools.md`.

### Why it matters

Agents can now choose the tool that best fits the work, avoid unnecessary complexity or spend, and only consult deeper tool specs when execution details are genuinely worth maintaining.

## 2026-06-25 — Skill setup lifecycle

Major update to the Agent OS skills architecture.

### Added

- Added `setup-skill` as the main orchestrator for adding, installing, exposing, or adapting reusable skills.
- Added `assess-skill` to recommend the lightest safe setup path before making changes.
- Added `external-skills.md` as the registry template for upstream-owned skills.
- Documented the three supported skill ownership/setup paths:
  - `SELF-OWNED` — maintained by the Life OS owner.
  - `EXT` — upstream-owned and exposed directly.
  - `EXT-WRAPPER` — upstream-owned with a thin local wrapper for operational reasons.

### Changed

- Updated `canonicalize-skill` to focus on creating the canonical discovery surface rather than defaulting to full ownership or rewrites.
- Updated `wire-skill` to expose canonical skills to AI tools without duplicating source content.
- Updated the main README, vault README, Agent OS README, and docs to describe the new lifecycle:

```text
setup-skill → assess-skill → canonicalize-skill → wire-skill
```

### Why it matters

The Life OS remains the source of truth. AI tools are clients. Skills can now be assessed, preserved, wrapped, wired, and validated without copying the same workflow into every tool-specific folder.
