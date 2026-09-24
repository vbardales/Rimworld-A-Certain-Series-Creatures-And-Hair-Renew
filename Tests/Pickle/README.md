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
| `02-def-contracts` | Speed, wildness, meat, temperature, hunger, pack and training of the creatures, the propagator's cost, the research cost, **as loaded** | Inheritance and the stat worker decide the value, not the XML text |
| `03`, `04` creatures (`@review`) | Both creatures draw; each body part is found **by the label the player reads**, exactly one per label; the health tab shows them | A label shared by two parts, or a claw on the wrong side, is invisible in XML that parses |
| `05-butchering` | Beetle: dark matter, no meat. Seraph: heavenly cloth and an angel core, no meat | Meat, leather and body part meet in the game's own `ButcherProducts` |
| `06-hairstyles` (`@review`) | Three of the forty-one hairstyles draw on a colonist | A missing texture is a pink square at most; the offline suite checks the files, not the draw |
| `07-research-and-machine` | The research is on the main tab at 18000; the propagator offers its five bills once it is done | The research window and a bench's bill list are the game acting on the defs |
| `08-production-chain` (`@slow`) | A colonist walks to the machine unprompted and finishes a bill: brain fragment to dark matter, volleyball to egg | The defect that leaves no log line: a new workbench needs its own work giver |
| `09-ranged-attacks` (`@slow`) | Each creature's own verb starts, its projectiles leave and every one lands | The original seraph shot never worked and logged nothing |
| `10-exotic-traders` | Built the way the game builds them, the exotic traders' stocks hold the first brain fragment; Empire variant under `@requires:Royalty` | The propagator cannot be built without it, and only a trader brings the first |
| `11-egg-hatching` (`@slow`) | An egg not laid in the colony hatches a wild beetle after one game day | Time, the hatcher comp and the faction rule |
| `12-save-reload` | Creatures, the machine with its bill, finished research, a hairstyle and an egg's incubation survive a round trip; the fixture colony, saved without this mod, is the mod added to an existing colony | Scribe behaviour |
| `13`, `14`, `15` labels | The labels and the activity texts **on the loaded defs**, in English, French and the preserved Chinese | A language folder the game does not find is silent, above all on Linux and the Steam Deck |

## What is deliberately not in Gherkin

A check the game does not need to run, or that only tests the game, does not belong here.

| Check | Where it went | Why |
|---|---|---|
| Taming the hatchling | `02` asserts the wildness stat | Taming is vanilla arithmetic on that stat; replaying it tests the game |
| Manhunter packs never choosing the seraph | `Test-Mod.ps1` asserts `canArriveManhunter` | The incident code that reads the flag is vanilla |
| A caravan accepting the beetle, loading it | `02` asserts `packAnimal` | The caravan dialog is vanilla |
| "Outruns everything", comfortable at any temperature | `02` asserts the stats | Comparing with other animals is a balance judgement, not a check |
| The beetle's temper (manhunter on any damage) | none | Subjective; it has no pass or fail threshold |
| The corpse graphic falling back | `Test-Mod.ps1` asserts the entry is gone | The repair was removing a def entry; the fallback is vanilla, taken by any animal without one |
| The trade window, buying the fragment | `10` asserts what the stock holds | The window is vanilla |
| Every hairstyle listed at the styling station | `Test-Mod.ps1` asserts gender and tags | The station filters on those; `06` shows the draw |
| The beetle facing every direction | `Test-Mod.ps1` asserts the three texture files | A missing frame is a logged error, which `no errors were logged` catches; `03` shows one facing |
| An upgrade from a previous revision | none | The only earlier upload, 0.1.0, held the same `Mod/`: there is no previous revision |
| A pass with optional mods, an incompatibility pass | none | The mod declares neither |

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
- **give and read a hairstyle**, and read a race's hunger, pack and training values, and a research's state.

Build with `dotnet build Source/ACertainSeriesCreaturesAndHairRenew.PickleSteps.csproj -c Release`. The output
is `Mod/Pickle/Assemblies/`, which is tracked, and the intermediates go to `.build/`, which is not. Rebuild
before every run: Pickle loads step DLLs when the game starts.

## Passes

One mod set, three languages. The mod declares no dependency, no `loadAfter`, no `incompatibleWith`, so the
only map is `wsl-deps.sans-facultatifs.map`, which stages the two shared tools the features use. Royalty is one
of the DLCs the default set already mounts, so the Empire scenario runs inside every pass.

Tags decide what runs where: `@en-only`, `@fr-only`, `@zh-only` follow the language of the labels they name,
and `@slow` (production chain, shots, egg) is played once, in English, because none of it depends on the
language. From the collection root, one at a time, each through the shared queue:

```powershell
powershell.exe -ExecutionPolicy Bypass -File scripts/Run-PickleWsl.ps1 -Mod ACertainSeriesCreaturesAndHairRenew -DepMap wsl-deps.sans-facultatifs.map -Language English -Filter 'A Certain Series - Creatures and Hair Renew - Pickle tests,!@fr-only,!@zh-only' -EvidenceDir ACertainSeriesCreaturesAndHairRenew/Tests/Pickle/Evidence/<date>-english
powershell.exe -ExecutionPolicy Bypass -File scripts/Run-PickleWsl.ps1 -Mod ACertainSeriesCreaturesAndHairRenew -DepMap wsl-deps.sans-facultatifs.map -Language French -Filter 'A Certain Series - Creatures and Hair Renew - Pickle tests,!@en-only,!@zh-only,!@slow' -EvidenceDir ACertainSeriesCreaturesAndHairRenew/Tests/Pickle/Evidence/<date>-french
powershell.exe -ExecutionPolicy Bypass -File scripts/Run-PickleWsl.ps1 -Mod ACertainSeriesCreaturesAndHairRenew -DepMap wsl-deps.sans-facultatifs.map -Language ChineseSimplified -Filter 'A Certain Series - Creatures and Hair Renew - Pickle tests,!@en-only,!@fr-only,!@slow' -EvidenceDir ACertainSeriesCreaturesAndHairRenew/Tests/Pickle/Evidence/<date>-chinese
```

A session waits for its ticket with the `Monitor` tool on a read-only poll of `scripts/Pickle-Status.ps1`,
which is what a heartbeat is under Codex (`../../../AUDIT.md`), never with a cron and never with a script
launched in the background from a shell. Read `exitReason` before the counts, and compare the scenarios played
with the scenarios discovered for the filter.

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

None of this was seen running. These are the assumptions a green first run confirms and a red one names.

1. `I spawn a "<PawnKindDef>" pawn at (x, z)` takes a pawn kind defName, as Pickle's own DLC feature does.
2. `def "<name>" field "label"` copes with a name shared by a ThingDef and a PawnKindDef. Both labels are
   equal in every language, so either would do, but the step may refuse the ambiguity.
3. `a "ACS_DarkMatterProduction" is built at (x, z)` builds a 1x2 building instantly, without material.
4. `I add bill "<recipe>" to the "<bench>"` refuses, or the bench refuses, a recipe it does not offer, so that
   the five bills of `07` prove availability and not only that a bill can be created.
5. Nothing resets a powered bench's `PowerOn` before the bill finishes.
6. A wild, unowned creature can start its own verb with `TryStartCastOn` and its AI does not cancel it.
7. `StockGenerator_Tag.GenerateThings` called with the map's tile and any non-player faction builds a stock
   like the one the game builds when a trader arrives.
8. The cells around x 140 to 152, z 153 to 155 of `test-colony` are open ground, as other suites' scenes suggest.
9. The scenario deadlines (`@timeout:300`, `180`, `900`) and the step deadlines (`120 s` for a shot, `900 s`
   for an egg) hold. The built-in `I wait for bill ... to finish` allows 120 real seconds; the two recipes run
   need a few thousand ticks each, and the launcher measured 500 to 700 ticks a second.
10. `-Language ChineseSimplified` resolves to the `ChineseSimplified (简体中文)` folder, as the launcher's
    ASCII-prefix rule says it should.
