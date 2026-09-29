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
