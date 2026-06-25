# Tools

Use this as the practical routing map for external systems, tools, and cost-aware defaults.

This file answers: **when I need to do X, what should I use first?**

Detailed durable specs for external tools belong in [[06 Meta/Agent OS/tools/README|Agent OS tool registry]] only when repeated use proves they are worth preserving.

Last reviewed: YYYY-MM-DD.

---

## Preferred tool routing

Agents should prefer already-paid subscriptions, local tools, and low-cost pay-as-you-go routes before expensive APIs. Ask before using uncertain or high-cost paid routes, and name the trade-off when escalating from the cheaper default.

Replace these starter rows with your own defaults.

| Work type | Default | Fallback / escalation |
|-----------|---------|-----------------------|
| Copy | Current agent harness | External copy tools only if explicitly requested. |
| Images | Already-paid image subscription or local route | PAYG image APIs only when the default route is unsuitable. |
| Video cleanup | Preferred video cleanup workflow/tool | Manual editing or specialist tools only when needed. |
| Authored video, overlays, and motion graphics | Preferred composition/rendering tool | Specialist workflows when the work becomes repeated. |
| Music beds | Low-cost exact-duration instrumental generator | Higher-cost music tools only when quality/control justifies it. |
| Music with vocals or lyrics | Dedicated song-generation tool | Avoid for voiceover beds unless vocals are explicitly wanted. |

---

## External systems and access paths

Each row names the system of record, usual access path, and how agents should treat it.

| System | Access path | Owns / contains | Agent use |
|--------|-------------|-----------------|-----------|
| Life OS vault | Local files | Durable personal/project context | Read before answering vault-specific questions; write durable knowledge back to the natural vault location. |
| Agent harnesses | Claude Code / Codex / Pi / OpenCode / Cursor / other | Working surfaces for agent sessions | Treat as clients of the vault, not the source of truth. |
| Agent OS | [[06 Meta/Agent OS/README|Agent OS]] | Canonical skills, tool registry, workflows, and adapters | Use for reusable agent behaviour and architecture. |
| Agent OS tool registry | [[06 Meta/Agent OS/tools/README|Tool registry]] | Durable invocation details for external tools | Add entries only when repeated use proves a tool needs preserved setup, cost notes, or failure modes. |

---

## How to use this file

- If a task needs a tool choice, check this map first.
- If a system is listed but unavailable, say what is missing and offer the next best route.
- If a tool needs durable setup details, credentials-by-name, invocation examples, cost notes, or failure modes, add or update an entry in the [[06 Meta/Agent OS/tools/README|Agent OS tool registry]] rather than expanding this map indefinitely.
