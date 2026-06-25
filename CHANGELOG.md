# Changelog

All notable changes to the Agentic Life OS Template will be documented here.

## 2026-06-26 — Cost-aware tool routing

Added the minimal tool-routing architecture for reliable, cost-aware agent tool choice.

### Added

- Added `vault/06 Meta/Tools.md` as the practical routing map for preferred tools, external systems, and cost-sensitive defaults.
- Added a simple three-layer explanation to the main README:
  - `06 Meta/Tools.md` for tool choice and defaults.
  - `06 Meta/Agent OS/tools/` for durable tool specs only when repeated use justifies them.
  - skills for workflow judgment and process.

### Changed

- Updated the vault README and Meta README so agents can find `Tools.md` when tool choice matters.
- Tightened `vault/06 Meta/Agent OS/tools/README.md` to clarify that the tool registry is for preserved invocation details, setup notes, cost notes, and failure modes — not everyday routing.
- Updated the Agent OS README to point preferred tool routing back to `06 Meta/Tools.md`.

### Why it matters

Agents can now choose the cheapest reliable default first, avoid surprise paid API usage, and only consult deeper tool specs when execution details are genuinely worth maintaining.

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
