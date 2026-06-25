# External Skills

This manifest tracks upstream-owned Agent Skills that are exposed through this Life OS without becoming self-owned canonical skills.

## Policy

- External skills remain upstream-owned.
- Do not edit external source folders directly unless deliberately adopting or forking the skill.
- Prefer symlinks or configured skill paths over copied content.
- Track both `Current ref` and `Upstream version` when upstream declares one.
- Prefer `EXT` direct exposure when active tools can load the upstream source and no local behavior is needed.
- Use `EXT-WRAPPER` only for real operational reasons: invalid YAML or harness breakage, unsafe or non-portable upstream assumptions, local routing guardrails, or deliberate policy overlays.
- Put vault-owner-specific behavior in a thin wrapper, not in upstream files.

## Entry template

```markdown
## owner/repo or source name

| Field | Value |
| --- | --- |
| Status | `EXT` or `EXT-WRAPPER` |
| Owner | External upstream |
| Source | https://example.com/source |
| Local source | `06 Meta/Agent OS/external/<source>/` |
| Current ref | commit, tag, release, checksum, or snapshot note |
| Upstream version | version or `not declared` |
| Installed | YYYY-MM-DD |
| Last checked | YYYY-MM-DD |
| Update cadence | Monthly manual check |
| Exposure | canonical discovery path, symlink, or configured skill path |
| Skills | `skill-name` |
| Wrapper | reason, if `EXT-WRAPPER` |
| Notes | anything important |
```
