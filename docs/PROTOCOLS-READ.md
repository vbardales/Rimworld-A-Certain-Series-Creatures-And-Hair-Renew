# Protocols and documents read, and in which version

Rewritten 2026-09-30 by the session of this mod, repo HEAD `e44aa47`, at the owner's request after `AUDIT.md` moved.
Run `docs/Check-ProtocolsRead.ps1`: it prints the files whose SHA-256 (first 12 hex) differs from the table; read only those.
`AUDIT.md` and `MOD_SETTINGS.md` were read in full on 2026-09-30, as were `AGENTS.md`, `PUBLISHING.md` and `TRANSLATIONS.md`.
Read by outline only (headings and the sections bearing on this mod): `STYLE_RIMWORLD.md`, `WORKSHOP_COMMENTS.md`,
`scripts/SEARCHING.md`, `PickleTools/*`, `OPERATIONS.md`, `SUBMIT.md`, `WELCOME.md` (full).
Not useful for a published, settings-free, code-free mod: `SEARCHING.md`, `steps.md`, `STYLE_RIMWORLD.md`; do not re-read them when they move.

| File | Version | SHA-256 | Useful now |
|---|---|---|---|
| `AGENTS.md` | 7fd7475 2026-09-29 | `7a236f03ca15` | yes |
| `AUDIT.md` | protocols repo | `0fb60fdf8c87` | yes, every time |
| `MOD_SETTINGS.md` | b83933b 2026-09-23 | `404916bc99a7` | yes |
| `PUBLISHING.md` | e0411cc 2026-09-29 | `12d1667f797c` | yes |
| `TRANSLATIONS.md` | ebadb99 2026-09-30 | `e5197820fda1` | yes |
| `STYLE_RIMWORLD.md` | ef7e7a9 2026-09-29 | `d536a6addedd` | no (Preview done; ModIcon owner-only) |
| `WORKSHOP_COMMENTS.md` | 7fd7475 2026-09-29 | `3fb37586f04b` | marginal |
| `scripts/SEARCHING.md` | 50de695 2026-09-28 | `013075b06b89` | no |
| `PickleTools/README.md` | ff20d89 2026-09-29 | `a18a07fd2365` | marginal |
| `PickleTools/Headless/README.md` | ed4e73a 2026-09-26 | `2310bb974f68` | yes |
| `PickleTools/docs/steps.md` | da7c3b0 2026-09-28 | `df2b37a6aff2` | no |
| `Rimworld-Release-Admin/docs/OPERATIONS.md` | 3c03f51 2026-09-26 | `23fcf6423000` | yes |
| `Rimworld-Ticket-Dispatcher/docs/WELCOME.md` | 77ca9d7 2026-09-27 | `08b440a03f74` | yes |
| `Rimworld-Ticket-Dispatcher/docs/SUBMIT.md` | d07b2b8 2026-09-26 | `eaca3969c7eb` | yes |
| `ACertainSeriesCreaturesAndHairRenew/README.md` | own, repo HEAD | `d197735ba2fa` | read 2026-09-30 |
| `ACertainSeriesCreaturesAndHairRenew/ATTRIBUTION.md` | own, repo HEAD | `217b8d80f9a1` | read 2026-09-30 |
| `ACertainSeriesCreaturesAndHairRenew/Mod/ATTRIBUTION.md` | own, repo HEAD | `217b8d80f9a1` | read 2026-09-30 |
| `ACertainSeriesCreaturesAndHairRenew/Mod/About/About.xml` | own, repo HEAD | `b8053c534d79` | read 2026-09-30 |
| `ACertainSeriesCreaturesAndHairRenew/LICENSE` | own, repo HEAD | `f44cb6615b5c` | read 2026-09-30 |

## Retained (2026-09-30)

- Evidence: latest report per scenario for the current revision only; drop `report.html` and `messages.ndjson`; never copy the shared folder whole; delete own run's `pickle-reports-archive/` copy after selecting (respect `keep.txt`); delete with `robocopy <empty> <target> /MIR`; list what goes before deleting.
- `tested` needs: no `@wip`, every `@requires` played in a pass that mounts it, no manual test left. Already met (`TESTING.md`).
- Translations: plurals as `.One`/`.Many`/`.Zero`; French pawn switches three-segment; Virginie's French review is open (`FRENCH_REVIEW.md`).
- Settings `not_applicable` needs an inventory plus proof of no empty page and no shortcut.
- Upstream: a PR to the original's repository if one exists (BACKLOG); none found (see `STATUS.md`).
- The 1.0.0 production steps stay Virginie's; `steam-production` approval is hers alone.