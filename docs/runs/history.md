# Runs, one line each

Newest last. The evidence itself is never kept as folders: only the latest report that still proves something stays
on disk (`Tests/Pickle/Evidence/`, ignored by git). A run that needs more than a line gets a file next to this one.

- 2026-09-24 21:04, pass 1 English, first run of the suite, on `56ef72d` (request 20260924-164530-619-a69c; the dispatcher's worker died mid-run, the game finished alone): `exitReason: watchdog-timeout`, 15 of 20 scenarios played, 8 passed, 7 failed, 5 never played. All 7 failures are one game error, `Tried 300 times to generate age` (both creature kinds set `maxGenerationAge` 0), the mod's own inherited defect, fixed in `a0fa40c`. The watchdog ended the run in the egg scenario (a whole game day does not fit 120 s), fixed in `a354f06`. Neither fix replayed. Superseded build: only `summary.json`, `summary.md`, `junit.xml` and `Player.log` kept in `Tests/Pickle/Evidence/2026-09-24-english/`; the 1.7 GB archive and its captures deleted, none opened.
