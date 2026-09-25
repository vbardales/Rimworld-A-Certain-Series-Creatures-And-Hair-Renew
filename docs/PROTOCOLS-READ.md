# Protocols and documents read, and in which version

Written by the session of this mod on 2026-09-25 (session `local_62b40a02-9527-4bdd-a977-f6bbd6de409d`), at repository
`HEAD` `196fe15`, at the request of the owner, so that a document that has not moved is not read twice.

**How to use it.** `docs/Check-ProtocolsRead.ps1` recomputes the SHA-256 (first 12 hex) of every file in the table below and
prints the ones that moved. Read again only those, and the ones marked "read every time". A document git tracks in the
protocols repository has no useful `git log` from the monorepo (`WELCOME.md`, point 5): the *version* column was read with
`git --git-dir=../rimworld-protocols.git --work-tree=. log -1` for them, and with `git log -1` in the repository that carries
the others.

Paths are relative to the collection root, `Documents\rimworld`. "Read" is `full` unless said otherwise. **Useful now** means
useful for what this mod needs at its present stage, `done` with the suite being run (`STATUS.md`): "no" is a judgement about
today, not about the document.

## Protocols (repository `vbardales/Rimworld-protocols`, work tree = the collection root)

| File | Version (commit, date) | SHA-256 | Useful now | What was retained |
|---|---|---|---|---|
| `AGENTS.md` | `3a1d2cb` 2026-09-24 12:08 | `36631e730433` | yes, every session | Evidence rules (keep the latest report per scenario for the revision in the repository; delete an archive of one's own run, leave the others; one text line per run in `docs/runs/`; never delete a report a `STATUS.md` field points to). The CI rules that never bend. Missing checks are pending work |
| `AUDIT.md` | `49cd841` 2026-09-25 17:09 | `f46fe88e5ec0` | yes, read every time | The eleven transitions; `done` needs the Pickle scenarios *written*, `tested` needs them *run and green* with the `@review` captures opened, the logs read, every `@requires` played in a pass that mounts it, no `@wip`; the request path (`Submit-PickleRun.ps1`), no watcher, no `SHA` carried by a request, tree frozen until `RUN_DONE`; `prepublished` needs `PUBLICATION.md`, thanks messages, a green dry-run; **fail fast** (owner, 2026-09-25): publish once no red is open, non-regression after; the session title is `<mod name> / <stage>`; never launch a RimWorld |
| `PUBLISHING.md` | `0743ff9` 2026-09-25 17:52 | `d3660c50cf84` | later (transition 10) | The description is sent once, at creation; it ends with `[url=...]Source code on GitHub[/url]` and carries `IF I GO QUIET`, `AI-GENERATED` (name the tools: "Claude", not "an AI tool"), `THANKS` (**every integration named or exercised has its author thanked**, Pickle and PickleTools included, "development only"); `PUBLICATION.md` holds the drafts and the change note under `### <version>`; one thanks comment per Workshop page across the whole collection (`WORKSHOP_COMMENTS.md`, not read); documentation, commits and comments in English; the two copies of `ATTRIBUTION.md` must be compared, not assumed; `PublishedFileId.txt` committed at once; visibility and the 1.0.0 production steps are Virginie's, by hand; a pathspec on `git commit`, never `--amend` without reading `git log -1` |
| `TRANSLATIONS.md` | `b83933b` 2026-09-23 20:46 (file dated 09-13) | `3368579d01dc` | yes, already applied | Inventory of every player-facing text, English source in Defs, French in DefInjected, `Check-DefInjected`, the three `STATUS.md` fields; runtime display is tracked as `unverified` until played |
| `STYLE_RIMWORLD.md` | `7311308` 2026-09-25 15:50 | `de13cbe5e1f9` | no (the Preview is done) | Only for a regenerated Preview: engraved title over a veil, colours taken from the image, contrast 4.5:1, top-left or bottom-right anchor, 896 x 504, under 1 MB. The icon is the owner's alone |
| `scripts/SEARCHING.md` | `372c447` 2026-09-23 21:01 (file dated 09-17) | `9dbd52b2bcd4` | no | Use `scripts/Search-Workshop.sh` for a corpus search, never a hand-rolled `grep -r`; the session's own Grep tool times out at 20 s on the corpus |

`MOD_SETTINGS.md`, `WORKSHOP_COMMENTS.md` and `EXTERNAL_TOOLS.md` were named by these documents and **not read** in this pass:
`settings_audit` is `not_applicable` and was justified from the source at the `options` transition (2026-09-24 audit in
`STATUS.md`); the other two matter at transition 10.

## Pickle and dispatcher documents (their own repositories)

| File | Version (commit, date) | SHA-256 | Useful now | What was retained |
|---|---|---|---|---|
| `PickleTools/README.md` | `2b7b6d0` 2026-09-25 17:22 | `6ea974180eb8` | partly | The tools are companion mods staged by one line of a pass map; this suite stages `inspecttabs` and `research`. The `Elsewhere/` ledger exists (this mod's steps are noted there) |
| `PickleTools/Headless/README.md` | `b2712fc` 2026-09-25 15:03 | `988dbf0dcee7` | yes, read when a run surprises | Launcher exit codes (0 is not a validation; 3 includes Pickle's own watchdog; 5 is an incomplete run; 7 an abandoned queue), the filter terms (a mod name **picks** the whole suite; exclusions win; a filter of exclusions only keeps every suite), one pass per `-DepMap`, `-EvidenceDir`, a game can hang at shutdown, the built-in waits and the five-second default of a custom step |
| `PickleTools/docs/steps.md` | `d6d8db1` 2026-09-25 17:44 | `61750eca84d2` | no, unless a step is missing | Generated catalogue of the tools' steps; only `ResearchSteps` and `InspectTabs` are staged here. Pickle's own steps live in Pickle's catalogue, not here |
| `Rimworld-Release-Admin/docs/OPERATIONS.md` | `70fe895` 2026-09-25 18:38 | `d038bcb32952` | later (transitions 10 and 11) | Dry-run for the exact commit, run ID and SHA recorded; `publish` with a 40-character SHA, approved by Virginie only; "documented mode" reads the change note under `### <version>` of `PUBLICATION.md` and the notes from `CHANGELOG.md`; the description is sent from `PUBLICATION.md`; the gallery is manual; credentials never in a repository, a log or a chat |
| `Rimworld-Ticket-Dispatcher/docs/WELCOME.md` | `fea3728` 2026-09-25 18:32, **modified, not committed** | `e8e02cc1e3b1` | yes, read every time | Small fix tickets, a complete pass only when the reds are green (the owner's wording); `Submit-PickleRun.ps1`; no monitor; a request carries no SHA (put it in `-Label`); delete evidence with `robocopy <empty> <target> /MIR`; keep `summary.json` and `junit.xml`, not `report.html`; point 5, this very note |
| `Rimworld-Ticket-Dispatcher/docs/SUBMIT.md` | `79668cc` 2026-09-25 17:16 | `9ac5e37bb64c` | yes | Every option; **`-DepMap` takes a file name, not a relative path**; `-Extra '-pickle-scenario-timeout=N'` for a long scenario, and **`@timeout:N` counts only on a `Scenario`, not on a `Feature`**; the launcher's exit codes; `-Cancel` only before the start |

## This mod's own documents

| File | Version | SHA-256 (n/a: changes with every session, not tracked) | Status |
|---|---|---|---|
| `ACertainSeriesCreaturesAndHairRenew/STATUS.md` | `196fe15` | n/a | Kept by this session; not re-read for this pass |
| `ACertainSeriesCreaturesAndHairRenew/README.md` | `86aa7ca` | `590166d42fb1` | Read. Accurate today; says "an AI assistant", to name at transition 10 |
| `ACertainSeriesCreaturesAndHairRenew/CHANGELOG.md` | `0aa961c` | n/a | Kept by this session |
| `ACertainSeriesCreaturesAndHairRenew/ATTRIBUTION.md` | `f85bac9` | `ec52e82f2c69` | Read. **Behind the code**, see below |
| `ACertainSeriesCreaturesAndHairRenew/Mod/ATTRIBUTION.md` | `f85bac9` | `ec52e82f2c69` | Identical to the root copy (compared by hash) |
| `ACertainSeriesCreaturesAndHairRenew/LICENSE` | `ef43f29` | `f44cb6615b5c` | Read. Accurate |
| `ACertainSeriesCreaturesAndHairRenew/TESTING.md` | `79d5fad` | n/a | Kept by this session |
| `ACertainSeriesCreaturesAndHairRenew/BACKLOG.md` | `196fe15` | n/a | Written by this session (the monorepo has its own, not this one) |
| `ACertainSeriesCreaturesAndHairRenew/docs/runs/history.md` | `fc3e1b1` | n/a | Kept by this session, one line per run |
| `ACertainSeriesCreaturesAndHairRenew/Tests/Pickle/README.md` | `0aa961c` | n/a | Kept by this session |
| `ACertainSeriesCreaturesAndHairRenew/Mod/About/About.xml` | `56ef72d` | `021c2caf33eb` | Read. Description not yet in the structure `PUBLISHING.md` asks for |

Named in the request and **absent from this repository**: `PUBLICATION.md` (required at transition 10, nothing to do before),
`NOTES.md`, `BUGS.md` (not required by any protocol read).

## What this changes for the mod, found by reading (2026-09-25)

None of it is done: the tree of the mod is frozen while a request waits (`WELCOME.md`, point 4), and all of it concerns
`prepublished` or a copy of a document that lives in `Mod/`.

1. **`ATTRIBUTION.md` is behind the code.** Its list of corrected defects stops at the manhunter draw. Two more were
   found in a game on 2026-09-25 and fixed: the creature kinds' `minGenerationAge` / `maxGenerationAge` of 0, and the
   verbs' `forcedMissRadius` (5 and 10). The optional Animal Prosthetics 2 patch is not mentioned either. `Mod/ATTRIBUTION.md`
   must be recopied at the same time: the two are identical today and a copy that drifts is a publication defect.
2. **`THANKS`.** The integration named in `About.xml` (Animal Prosthetics 2, by SamBucher) needs its author thanked; so do
   Pickle and PickleTools ("development only", never a dependency), and the AI tool has to be named, not called "an AI
   assistant". The Steam description, the `PUBLICATION.md` drafts and the entry in `WORKSHOP_COMMENTS.md` all follow.
3. **`PUBLICATION.md`** does not exist: the order of the gallery images, the thanks comments, the dependencies (none required;
   Animal Prosthetics 2 is optional and `loadBefore`), the answer to the adult-content boxes, the change note for `1.0.0`.
4. **The Steam item was created with the early description** (a bare GitHub URL): only the page can change it, by hand.
5. **Fail fast** applies to the `1.0.0` of this item (the `0.1.0` was only the act that created it): before `publish`,
   no red without a green replay, the gallery, the owner's manual validations, a rollback target chosen beforehand.
6. **A scenario tag** `@timeout:N` is read on a `Scenario` only; the suite now carries it on scenarios (07, 08). The feature-level
   tags were noise, as the first English run showed.
7. **Pass four** (with Animal Prosthetics 2) is what `tested` still needs beyond the three languages, since feature 15 is a
   `@requires`; it needs the item in the WSL Workshop cache first, under the machine lock.
