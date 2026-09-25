# In-game scenarios, run by Pickle

This companion is development-only: it lives beside `Mod/`, never inside it, and Steam never receives it.
It turns the manual checks of `../../TESTING.md` into scenarios that set a scene up, assert, and leave a
person to read only the `@review` captures.

**Status: written, never run.** The suite compiles against the 1.6 game assemblies, and every step line
resolves to exactly one step (`Check-Steps.ps1`). Whether each step does what its scenario hopes is what the
first run settles; the list at the end names the assumptions it will confirm or break. Running the suite is
the work of `done -> tested`, not of `done`.

## What is in Gherkin, and why it needs a game

`../Test-Mod.ps1` and `../Test-Translations.ps1` already prove what a file can prove: the XML text, the
references, the anatomy repairs as XML, the translation inventory. Nothing below repeats them. Each feature
exists because the game itself has to act on the defs.

| Feature | What it shows | Why it cannot be an offline test |
|---|---|---|
| `01-loads` | The mod loaded; the principal defs survived the real loader; no error, no warning from the mod | In 1.6 a def whose `Class=` does not resolve is lost whole, and only the loader knows |
| `02`, `03` creatures (`@review`) | Both creatures draw; each body part is found **by the label the player reads**, exactly one per label; the health tab shows them | A label shared by two parts, or a claw on the wrong side, is invisible in XML that parses |
| `04-butchering` | Beetle: dark matter, no meat. Seraph: heavenly cloth and an angel core, no meat | Meat, leather and body part meet in the game's own `ButcherProducts` |
| `05-hairstyles` (`@review`) | Three of the forty-one hairstyles draw on a colonist | A missing texture is a pink square at most; the offline suite checks the files, not the draw |
| `06-research-and-machine` | The research is on the main tab at 18000; the propagator offers its five bills once it is done | The research window and a bench's bill list are the game acting on the defs |
| `07-production-chain` (`@slow`) | A colonist walks to the machine unprompted and finishes a bill: brain fragment to dark matter, volleyball to egg | The defect that leaves no log line: a new workbench needs its own work giver |
| `08-ranged-attacks` (`@slow`) | Each creature's own verb starts, its projectiles leave and every one lands | The original seraph shot never worked and logged nothing |
| `09-exotic-traders` | Built the way the game builds them, the exotic traders' stocks hold the first brain fragment; Empire variant under `@requires:Royalty` | The propagator cannot be built without it, and only a trader brings the first |
| `10-egg-hatching` (`@slow`) | An egg not laid in the colony, started at 95 percent of its incubation, hatches a wild beetle | The hatcher comp and the faction rule. Not a whole game day: 60000 ticks do not fit the 120 s the watchdog allows a scenario at 500 to 700 ticks a second (it tripped on the first run). That the hatcher takes one day is asserted offline |
| `11-save-reload` | Creatures, the machine with its bill, finished research, a hairstyle and an egg's incubation survive a round trip; the fixture colony, saved without this mod, is the mod added to an existing colony | Scribe behaviour |
| `15-animal-prosthetics` (`@requires:SamBucher.ADogSaidAnimalProsthetics2`) | With A Dog Said... Animal Prosthetics 2 mounted, the beetle is offered more recipes than the seraph, which is left out on purpose | The other mod copies its category lists into its surgery recipes in its own patch; this mod's name counts only if it was added before that copy, which is a matter of patch order and only the game shows it. Skipped, by design, in every pass that does not mount that mod |
| `12`, `13`, `14` labels | The labels and the activity texts **on the loaded defs**, in English, French and the preserved Chinese | A language folder the game does not find is silent, above all on Linux and the Steam Deck. The English feature adds nothing about the English text, which is the XML itself: it is the control that a pass claiming English really ran in English, as the French one is for French |

## What is deliberately not in Gherkin

A check the game does not need to run, or that only tests the game, does not belong here.

| Check | Where it went | Why |
|---|---|---|
| Speed, wildness, meat, hunger, pack, training and temperature of the creatures; the dark matter's factors; the propagator's and the research's cost | `Test-Mod.ps1` | Each is written in the leaf def, so it is read from the XML text. A first draft of this suite had a feature for them, removed as redundant: the game's stat worker adds nothing to a number the def states itself |
| Taming the hatchling | `Test-Mod.ps1` asserts the wildness stat | Taming is vanilla arithmetic on that stat; replaying it tests the game |
| Manhunter packs never choosing the seraph | `Test-Mod.ps1` asserts `canArriveManhunter` | The incident code that reads the flag is vanilla |
| A caravan accepting the beetle, loading it | `Test-Mod.ps1` asserts `packAnimal` | The caravan dialog is vanilla |
| "Outruns everything", comfortable at any temperature | `Test-Mod.ps1` asserts the stats | Comparing with other animals is a balance judgement, not a check |
| The beetle's temper (manhunter on any damage) | none | Subjective; it has no pass or fail threshold |
| The corpse graphic falling back | `Test-Mod.ps1` asserts the entry is gone | The repair was removing a def entry; the fallback is vanilla, taken by any animal without one |
| The trade window, buying the fragment | `09` asserts what the stock holds | The window is vanilla |
| Every hairstyle listed at the styling station | `Test-Mod.ps1` asserts gender and tags | The station filters on those; `05` shows the draw |
| The beetle facing every direction | `Test-Mod.ps1` asserts the three texture files | A missing frame is a logged error, which `no errors were logged` catches; `02` shows one facing |
| An upgrade from a previous revision | none | The only earlier upload, 0.1.0, held the same `Mod/`: there is no previous revision |
| An incompatibility pass | none | The mod declares no `incompatibleWith` |
| The other mod's own surgeries, and whether they work on the beetle's legs | none | They name vanilla body parts; the legs, claws and horn are this mod's own defs, so no surgery names them. Nothing to test until a patch adds them to the other mod's recipes, which is not done |

## The local steps

`Source/AcsSteps.cs`, 20 steps, all prefixed `A Certain Series:` because Pickle matches on text alone across
every suite loaded. Each exists because no stock or shared step does it:

- **power a bench**: the propagator draws 5000 W and a pawn never walks to an unpowered bench. The step
  switches the component on; it tests the bench, its bills and its work giver, not the grid;
- **select, injure and read a creature by body part label**, one part per label or the step fails;
- **fire the creature's own verb and watch every tick** until its projectiles are gone;
- **build a trader's tag stock two hundred times** and count the brain fragment. Only tag generators are used,
  because the others build pawns that are not meant to be thrown away unspawned;
- **wait for an egg**, read its incubation by reflection on a private field (failing loudly if it is renamed),
  and assert a hatchling has no faction;
- **butcher a generated animal** and list what it yields;
- **give and read a hairstyle**, and read whether a research is finished;
- **read a label by def type**, because Pickle's own field step refuses a name several types share (three here);
- **compare the recipes two races are offered** (`ThingDef.AllRecipes`), which shows what another mod's patches
  gave a creature without naming a recipe that is written nowhere this suite can read.

Build with `dotnet build Source/ACertainSeriesCreaturesAndHairRenew.PickleSteps.csproj -c Release`. The output
is `Mod/Pickle/Assemblies/`, which is tracked, and the intermediates go to `.build/`, which is not. Rebuild
before every run: Pickle loads step DLLs when the game starts.

## Passes

Three languages on one mod set, and a fourth pass with the one optional mod. The mod declares no dependency, no
`loadAfter`, no `incompatibleWith`, so the minimal map is `wsl-deps.sans-facultatifs.map`, which stages the two
shared tools the features use. `wsl-deps.avec-ads2.map` adds A Dog Said... Animal Prosthetics 2 to it. Royalty
is one of the DLCs the default set already mounts, so the Empire scenario runs inside every pass. Feature 15
(`@requires` on that optional mod) is skipped in the first three, by design.

Tags decide what runs where: `@en-only`, `@fr-only`, `@zh-only` follow the language of the labels they name,
and `@slow` (production chain, shots, egg) is played once, in English, because none of it depends on the
language.

### Which ticket, in which order

Tickets go through the TicketDispatcher, never through `Run-PickleWsl.ps1` by hand and never with a watcher of
ours: it wakes the session at `START`, `END` and `RUN_DONE` (`Rimworld-Ticket-Dispatcher/docs/WELCOME.md`). The
owner prefers **three small tickets to one large one**, and two kinds:

1. **A fix or exploration ticket: the fewest scenarios that show the point.** After a run leaves scenarios red,
   or after a step or a feature was rewritten, submit **only the red features**, one small ticket each
   (`-Filter '02-creatures-en'`, `'08-ranged-attacks'`, `'10-egg-hatching'`, or `'::<part of a scenario name>'`
   for one scenario; a comma in a scenario name is a comma in the filter, so name a file instead). Name **no
   mod** in a picking filter: the mod's display name picks the whole suite.
2. **A complete pass, initial or final: every scenario of the pass, no `-Filter` beyond the language
   exclusions below.** It is queued **only once the fix tickets have turned the red scenarios green**. A
   complete pass over a suite that is still red spends the machine's time to learn what a fix ticket learns in a
   minute, and a run that ends on the watchdog loses the scenarios after it.

**The complete pass must come back entirely green before the stage moves.** It is also the non-regression check:
a fix ticket shows that the red scenarios are now green, and says nothing about the scenarios that were already
green, which a fix can break (the age fix and the egg step both touch what the production and shot scenarios
use). A fix ticket therefore never moves a stage on its own, and a complete pass that ends red sends the session
back to fix tickets, then to a new complete pass. `tested` needs the complete passes, green, on the revision now
in the repository, with the `@review` captures opened.

The complete passes, one request each (`-Owner local_<session id>`, the id from `get_session` with `self`, also
written in the label; `-EvidenceDir` relative to the collection root):

```powershell
powershell.exe -ExecutionPolicy Bypass -File Rimworld-Ticket-Dispatcher/scripts/Submit-PickleRun.ps1 -Mod ACertainSeriesCreaturesAndHairRenew -Owner local_<id> -Label "ACertainSeries local_<id> pass 1 English" -DepMap wsl-deps.sans-facultatifs.map -Language English -Filter 'A Certain Series - Creatures and Hair Renew - Pickle tests,!@fr-only,!@zh-only' -RunTimeoutMinutes 90 -EvidenceDir ACertainSeriesCreaturesAndHairRenew/Tests/Pickle/Evidence/<date>-english
powershell.exe -ExecutionPolicy Bypass -File Rimworld-Ticket-Dispatcher/scripts/Submit-PickleRun.ps1 -Mod ACertainSeriesCreaturesAndHairRenew -Owner local_<id> -Label "ACertainSeries local_<id> pass 2 French" -DepMap wsl-deps.sans-facultatifs.map -Language French -Filter 'A Certain Series - Creatures and Hair Renew - Pickle tests,!@en-only,!@zh-only,!@slow' -EvidenceDir ACertainSeriesCreaturesAndHairRenew/Tests/Pickle/Evidence/<date>-french
powershell.exe -ExecutionPolicy Bypass -File Rimworld-Ticket-Dispatcher/scripts/Submit-PickleRun.ps1 -Mod ACertainSeriesCreaturesAndHairRenew -Owner local_<id> -Label "ACertainSeries local_<id> pass 3 Chinese" -DepMap wsl-deps.sans-facultatifs.map -Language ChineseSimplified -Filter 'A Certain Series - Creatures and Hair Renew - Pickle tests,!@en-only,!@fr-only,!@slow' -EvidenceDir ACertainSeriesCreaturesAndHairRenew/Tests/Pickle/Evidence/<date>-chinese
powershell.exe -ExecutionPolicy Bypass -File Rimworld-Ticket-Dispatcher/scripts/Submit-PickleRun.ps1 -Mod ACertainSeriesCreaturesAndHairRenew -Owner local_<id> -Label "ACertainSeries local_<id> pass 4 with Animal Prosthetics 2" -DepMap wsl-deps.avec-ads2.map -Language English -Filter 'A Certain Series - Creatures and Hair Renew - Pickle tests,!@fr-only,!@zh-only,!@slow' -EvidenceDir ACertainSeriesCreaturesAndHairRenew/Tests/Pickle/Evidence/<date>-ads2
```

The fourth needs the other mod in the WSL install's Workshop cache first (item 3238353862), a download taken
under the machine lock and not yet made. Its report must show feature 15 *played*.

Read `exitReason` before the counts, and compare the scenarios played with the scenarios discovered for the
filter. **The 120 seconds of the watchdog bound a scenario, whatever its `@timeout` tag on the feature line**
(seen on the first run): a scenario has to fit in them, or it ends the whole run.

## Before queuing

```powershell
dotnet build Tests/Pickle/Source/ACertainSeriesCreaturesAndHairRenew.PickleSteps.csproj -c Release
powershell -NoProfile -ExecutionPolicy Bypass -File Tests/Pickle/Check-Steps.ps1
powershell -NoProfile -ExecutionPolicy Bypass -File Tests/Test-Mod.ps1
```

`Check-Steps.ps1` compiles every local pattern with Pickle's own expression engine, and matches every step
line of every feature against Pickle's vocabulary, the shared tools in the pass map and this suite's own.
It fails on an undefined step, an ambiguous one, an invalid pattern (an unescaped `(` makes the **whole run**
play zero scenarios) and a duplicate. It proves a step's text exists, not that it does what a scenario hopes.
It was checked against a deliberately wrong feature and a deliberately invalid pattern before being trusted.

## Evidence

Raw reports go to `Evidence/` under this folder, which `.gitignore` excludes. What to keep and what to
delete is in `../../TESTING.md`, "Evidence to keep". `Minify-Evidence.ps1` shrinks a copied report in place:
screenshots become JPEG (quality 80, at most 1280 px), and `report.html` and `messages.ndjson` go.

## What the first run has to confirm

These are the assumptions a green first run confirms and a red one names. Seen so far (English pass cut short and
French pass, 2026-09-24): 1, 3, 5 and 7 held (creatures spawned by kind, the machine built and worked, the trader
stocks offered the fragment); 2 and 9 broke (below); 4, 6, 8, 10, 11 and 12 are still to be seen.

1. `I spawn a "<PawnKindDef>" pawn at (x, z)` takes a pawn kind defName, as Pickle's own DLC feature does.
2. ~~`def "<name>" field "label"` copes with a name shared by several def types.~~ **Broken by the French run of
   2026-09-24:** it refuses (`'ACS_AngelCore' names more than one def (BodyPartDef, BodyPartGroupDef, ThingDef)`),
   and Pickle has no typed variant. Features 12 to 14 now read the three shared names (the angel core, the beetle,
   the seraph) with a local step that names the type, and check the race and the kind of each creature both.
3. `a "ACS_DarkMatterProduction" is built at (x, z)` builds a 1x2 building instantly, without material.
4. `I add bill "<recipe>" to the "<bench>"` refuses, or the bench refuses, a recipe it does not offer, so that
   the five bills of `06` prove availability and not only that a bill can be created.
5. Nothing resets a powered bench's `PowerOn` before the bill finishes.
6. A wild, unowned creature can start its own verb with `TryStartCastOn` and its AI does not cancel it. **Held
   (tickets `ca7f` and `4f41`, 2026-09-25):** the creature accepted the cast; the first time the game threw on
   every tick because of the mod's `forcedMissRadius`, and once that was dropped both bursts ran, their
   projectiles left and none was left in flight. The log of that second run also held four start-up config errors
   the scenarios cannot see, which is why `forcedMissRadius` is now 0.5 (not replayed).
7. `StockGenerator_Tag.GenerateThings` called with the map's tile and any non-player faction builds a stock
   like the one the game builds when a trader arrives.
8. The cells around x 140 to 152, z 153 to 155 of `test-colony` are open ground, as other suites' scenes suggest.
9. The scenario deadlines (`@timeout:300` and `180`, on the feature and now on each scenario) and the step
   deadlines (100 s for a shot and for the egg) hold. **Seen on the first run:** the feature-level
   `@timeout:900` did not stop the watchdog from ending the egg scenario after 120 s, so either that tag is not
   read from the feature line or the watchdog ignores it; the egg no longer waits a whole day for that reason,
   and whether the scenario-level tags of `07` and `08` are honoured is still to be seen. The built-in
   `I wait for bill ... to finish` allows 120 real seconds; the two recipes run passed in 32 and 46 seconds.
10. `-Language ChineseSimplified` resolves to the `ChineseSimplified (简体中文)` folder, as the launcher's
    ASCII-prefix rule says it should.
11. `@requires:SamBucher.ADogSaidAnimalProsthetics2` matches that package whatever its case, and skips cleanly
    when it is absent. `ThingDef.AllRecipes` includes a recipe whose abstract parent's `recipeUsers` was copied
    from the category lists by that mod's own patch, and the beetle ends up with strictly more recipes than the
    seraph. The map's package id is written in lower case, as the other maps write theirs.
12. This mod's patch really is applied before that mod's own copy of the category lists, which `loadBefore`
    is meant to guarantee. Only a game run can show it.
