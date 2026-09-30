# Runs, one line each

Newest last. The evidence itself is never kept as folders: only the latest report that still proves something stays
on disk (`Tests/Pickle/Evidence/`, ignored by git). A run that needs more than a line gets a file next to this one.
**Trimmed 2026-09-29, now the mod is published:** development-era runs (2026-09-24 to 2026-09-27, the first run
through the fix tickets) no longer prove anything about the current `Mod/`; `git log -- docs/runs/history.md` has
the detail, this file keeps only what still describes the published state.

- 2026-09-27, **`tested` reached**: all five complete passes (English `95f8`, French `ccbd`, Chinese `af3e`, with
  Animal Prosthetics 2 `5b9d`, with Nocturnal Animals `e028`) and both gallery tickets (`cdfc`, `a6f3`) green on the
  tree of `eb2bbf4`, every `@review` capture opened. One reserve, not a defect: the Chinese research-window capture
  shows every project's cost number with no text at all (a font-rendering gap in that capture path, flagged to
  PickleTools, every project affected).
- **`Art/Workshop/` built from `cdfc` and `a6f3`**, full 1920x1080 captures re-encoded to JPEG (ffmpeg `-q:v 3`):
  2 MB total for six images, no neighbour bleed, no indoor background, no vignette.
- 2026-09-28, **post-publication regression on the published tree** (`f678f05`, after the packageId change):
  English `a013`, with Animal Prosthetics 2 `5558`, with Nocturnal Animals `d901`, all green first try. French
  (`20b8`) and Chinese (`3402`) came back red the same day, both on game-logged errors Pickle's own
  `FailOnLoggedError` turns into failures ("off main thread" reads, a null faction relation), not exceptions in
  this suite's steps. TicketDispatcher found two orphan `find /` processes paging the WSL out in the window; Pickle
  Core was the same version on the green and red days. Both replayed green on the unchanged tree: French `45e1`,
  Chinese `6ad3` (2026-09-28, 20:43). **Every pass is now green; the two reds were machine load, not a defect.**
- 2026-09-23, **prepublication `0.1.0`** by hand from the game: item `3806708754` created (private), `PublishedFileId.txt` committed in `8437ae0`; `Mod/` as at `3db914f`, with 141 `.dds` caches the game had written (not in git since).
- 2026-09-27, gallery development: feature 17 at 3 cells (`a90d`, pawn too small), then 1 cell (`e4c3`); feature 18 neighbours bled into frame (fixed by spacing 10/25/40 cells, `9bf6`); hairstyle backgrounds fixed by moving each colonist onto the studio meadow (`cdfc`, `a6f3`); features 15 and 16 first played alone (`b7f4` 2026-09-25, `51fc` 2026-09-26).
- 2026-09-28, **`1.0.0` published by the CI**: run `36393488106`, SHA `f678f051bcea3ed5fa13eaa6026ece9016f295f8`, dry-run `36392137035` on the same SHA (185 files, 1.36 MB), approved by the owner, tag `v1.0.0` and release created. `packageId` shortened to `nelim.acertainseriescreaturesandhair` beforehand (item still private). Change note said "English and Simplified Chinese": French was shipped too. Thanks comments posted by the owner (某系列MOD, Nocturnal Animals Continued with its original author, Animal Prosthetics 2; Pickle and RimLogging already).
- 2026-09-29, `.github/` regenerated to template `82de20b8aa50` (`3cfcd47`); `Preview.png` recomposed with the cut-out `ModIcon` at the owner's rule, gallery gains a copy of it in position 0.
- 2026-09-30, **`AUDIT.md` reapplied**: stage `published` confirmed; the 16 changed protocol documents re-read (`docs/PROTOCOLS-READ.md`); no upstream repository for the original (search repeated); `.dds` untracked, evidence ignored and minified (5.5 MB), no `@wip`, every `@requires` played, no manual check left.
- 2026-09-30, **French review** generated (`FRENCH_REVIEW.md`) and validated by the owner at `d3983505273d88b9c3b0484beeba0b2844e30f49`: no gender switch needed; seven HairDef labels set to the source's form (fr.wikipedia keeps the God's Right Seat titles and Level 5 names in English: `Vento of the Front`, `Acqua of the Back`, `Fiamma of the Right`, `Terra of the Left`, `Dark Matter`, `Knight Leader`, and `Aogami Pierce` for the character).
- 2026-09-30, **`1.0.1` published by the CI**: run `36777976468`, SHA `2234e57eabd079127d1e825f90dff5c3f5eb2fca`, dry-run `36777795874` on the same SHA (185 files, 1.37 MB), approved by the owner, tag `v1.0.1` and release created. `update_preview`, `update_description`, `update_title`, `update_tags` all off; the owner uploaded the gallery (`Art/Gallery/`, renamed `0-`..`6-` that day) by hand. The header image was not sent. No Pickle pass replayed: no scenario reads a hairstyle label.
- Steam change notes sent: `0.1.0` "First private upload."; `1.0.0` "First public release. Adds the white rhinoceros beetle and the seraph, the dark matter propagator with its production chain and its research project, and forty-one hairstyles, brought forward from 某系列MOD to RimWorld 1.6. New since the private 0.1.0: the beetle is offered Animal Prosthetics 2's surgeries and is nocturnal with Nocturnal Animals (both optional), and the mod is tested in English, French and Chinese. English and Simplified Chinese."
