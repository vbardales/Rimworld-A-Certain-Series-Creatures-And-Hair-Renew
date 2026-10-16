# Test scenarios

## Automated regression tests

From repository root, run:

```powershell
powershell -NoProfile -ExecutionPolicy Bypass -File Tests/Test-Mod.ps1
```

Standalone suite need only PowerShell, read mod without change, exit code 1 on failure. GitHub Actions run it on pushes and pull requests.
Use `-ModPath <folder>` to check other copy of published mod.

Coverage: XML parsing, names scoped by def type, ACS references and local parents,
GitHub metadata, custom texture files (directional and stack graphics too),
explosive projectiles, manhunter exclusion, repaired anatomy, corpse graphics,
workbench bill access, product references, trader bootstrap tags, egg hatching,
creatures', material's and machine's values (speed, wildness, meat, hunger, pack,
training, temperature, factors, costs), and all 41 hairstyles with Chinese labels.

Static regression checks, not RimWorld execution. They do not resolve
vanilla references, replay full XML inheritance, validate C# fields against game,
or validate every translation handle. Shared parent repository's
`scripts/Check-XmlFields.ps1`, `Check-DefRefs.ps1`, `Check-XmlClasses.ps1`,
`Check-TypeRefs.ps1`, `Check-ConfigErrors.ps1` and `Check-DefInjected.ps1`
give extra checks using installed game and must be rerun for
version migrations. In-game scenarios below still necessary.

## What `playTests` requires, and where this mod stands

Pickle scenarios written and played (`Tests/Pickle/`: 21 features, 43 local steps; its README say what is in
Gherkin, what deliberately not, and why; `scripts/Check-Steps.ps1` of protocols repository resolve every step line to exactly one step).
Passes ran on `f678f05` (2026-09-28, `STATUS.md` `tested_on`, `docs/runs/history.md`). `Mod/` changed since in `1.0.4` and `1.1.0` (texts and `About.xml`, no content): features 19 to 21 added and played in `1.0.4`, and non-regression of changed texts (features 02 and 03) ran green on published `1.1.0` (`b104320`). Earlier states of this section (the `tested` check of 2026-09-27) in `git log`.

| Check | Where this mod stands |
|---|---|
| No scenario left in `@wip`. | None carry `@wip`, `-IncludeWip` never passed. |
| Every conditional scenario ran. | Each `@requires` has own pass on map that mounts it (Animal Prosthetics 2, Nocturnal Animals): passes 4 and 5 below. |
| No manual test left to validate. | Every manual check automated and green, or listed as not applicable with reason, in table below. |

### Where each manual check went

| Manual check | Where it went |
|---|---|
| Mod loads; no red error; seven log strings | `01`, and reading `Player.log` from startup: `no errors were logged` cover a scenario, not the launch |
| Beetle draws, not pink box | `02` capture; missing texture is logged error, which `no errors were logged` catches |
| Front claws, each on own side | `02` and `03`: found by label, exactly one part per label, health tab captured |
| No hunger bar, certain taming, advanced training, speed, temperature, pack animal | `Test-Mod.ps1`, on leaf defs. Taming and caravans are vanilla code reading those values |
| Horn fires | `08` |
| Butchering beetle: dark matter, no meat | `04` |
| Corpse left to rot keeps drawing | not applicable, see README |
| Seraph draws; eight wings under eight labels; right leg on right | `02` and `03` |
| Seraph's ranged attack | `08` |
| No taming; butchering seraph | `Test-Mod.ps1` (wildness 1) and `04` |
| Manhunter packs never choose seraph | not applicable: `Test-Mod.ps1` assert flag, incident code vanilla |
| Research where it should be, at its cost | `06` capture |
| Propagator builds for one fragment | cost in `Test-Mod.ps1`; machine placed instantly in `06`, `07` and `11`, construction vanilla |
| Pawn walks to it unprompted; five bills run | `06` (five bills offered) and `07` (two recipes run to end) |
| Egg hatches in one day, wild; then taming | `10`; taming not applicable, see README |
| H1: crafted egg hatching | `07` make egg through its bill, `10` hatch egg and assert wild |
| T1: first brain fragment from trader | `09`, both Core routes and Empire variant. Trade window itself vanilla |
| S1: adding mod to existing colony | every scenario (fixture colony saved without mod) and `11` |
| S2: reloading colony holding mod's content | `11`. Upgrade variant not applicable: no previous revision |
| All forty-one hairstyles at styling station, generated on pawns | `05` show draw; tags asserted offline, station only filter on them |
| Names in English; original Chinese come back | `12` and `14` |
| French translation gate: labels, activity texts, keys | `13`, and `03` for layout; coverage stay in shared `Check-Translations.ps1` |
| Raw keys, English fallback, clipped text | raw key cannot sit in label `12` to `14` assert; clipping read on `@review` captures |
| Dark matter as material: no burn, barely wears, ten times hit points | `Test-Mod.ps1` |
| Beetle's temper | not automated: no pass or fail threshold, see "Subjective balance review" |

## Passes this mod needed

**Current state of six passes** (`STATUS.md`, `docs/runs/history.md`): English `a013`, Animal Prosthetics 2 `5558`, Nocturnal Animals `d901`, French `45e1`, Chinese `6ad3` on `f678f05` (2026-09-28); gallery `cdfc` and `a6f3` on `eb2bbf4` (2026-09-27). `1.0.1` (`2234e57`) changed seven French hairstyle labels, About description and Preview: no scenario read them, so no pass replayed.

Mod whose TESTING.md not say how many passes needed is tried, not tested. This one needed six:
three languages on minimal set, one for each of two optional mods, and gallery. Mod declare no
dependency, no `loadAfter`, no `incompatibleWith`, so minimal set is `Tests/Pickle/wsl-deps.sans-facultatifs.map`,
and no incompatibility pass apply. Optional integrations, A Dog Said... Animal Prosthetics 2 and Nocturnal
Animals, have fourth and fifth passes (below). In three language passes that mod absent, so its patch must stay inert: green
run with no error and no warning show guard holds.

1. **English**: every feature except French and Chinese ones, slow ones included: production
   chain, shots and egg not depend on language, so played once, here.
2. **French**: French features and language-neutral fast ones (`@slow` excluded).
3. **Chinese** (`ChineseSimplified`): Chinese labels and language-neutral fast ones.
4. **With Animal Prosthetics 2** (`wsl-deps.avec-ads2.map`, English, `@slow` excluded): minimal set plus that
   optional mod, so feature 15 played and other fast features show mod still loads beside it. Item
   (Workshop 3238353862) in Windows Workshop folder and WSL cache, no download needed. **Map
   must name this mod ahead of optional one** (staging load mod under test after every mod of map):
   first run of this pass red for that reason alone.
5. **With Nocturnal Animals** (`wsl-deps.avec-nocturnal.map`, English, `@slow` excluded): same, with
   [XND] Nocturnal Animals (Continued) (2269731409) mounted, so feature 16 played.
6. **Gallery** (`wsl-deps.galerie.map`, English, features 17 and 18): feature 18 show beetle, seraph and propagator close up; feature 17 three hairstyles at one cell's height in
   zen studio, `@review`.

Exact commands, with filters, in `Tests/Pickle/README.md`. Empire variant of T1 is
scenario tagged for Royalty inside these passes, not own pass: Royalty is one of DLCs
default set already mounts.

Machine shared, so run is request to TicketDispatcher (`Submit-PickleRun.ps1`), which hold the
ticket, copy report to evidence folder and wake session by message. Session run no watcher
of own: no `Monitor`, no heartbeat, no cron, no loop (`Rimworld-Ticket-Dispatcher/docs/WELCOME.md`).

**Order of tickets.** Three small tickets, not one large, of two kinds. **Fix or exploration
ticket** play fewest scenarios that show point: after run leaves scenarios red, or after step or
feature rewritten, only red features, one ticket each. **Complete pass**, initial or final, play every
scenario of its pass, queued **only once fix tickets made red scenarios green**. Commands in `Tests/Pickle/README.md`, "Which ticket, in which order". Neither kind stand in for other: fix ticket never move stage, and **stage move only after complete pass entirely green**, which
is also non-regression check of scenarios already green. `tested` need those passes, on
revision now in repository.

## Evidence to keep

Raw Pickle reports live on disk in `Tests/Pickle/Evidence/<date>-<pass>/`, which `.gitignore` exclude:
captures and `Player.log` grow without limit. Pass `-EvidenceDir` to launcher so report copied
there before lock released, then check `exitReason` and played and discovered counts in each
copy. Rules are collection's (`../AGENTS.md`, "Test evidence"; `../PickleTools/TESTING.md`, "What to
keep after a test, and what to delete").

| Keep, per pass | Why |
|---|---|
| `summary.json` and `summary.md` | Verdict: `exitReason`, counts, scenario names. Read `exitReason` first |
| `junit.xml` and `messages.ndjson` | Per-step outcome and failure messages |
| `Player.log` | Startup, load order, dropped mods, errors outside scenarios: only newest one per pass |
| `evidence-complete.txt` or `no-report.txt` | Say copy whole, or launcher left no report |
| `@review` captures, **minified to JPEG** | Human review outcome. `scripts/Minify-Evidence.ps1 -Folder <copy>` of protocols repository re-encode them (quality 80, max 1280 px wide) and drop `report.html` and `messages.ndjson`. Keep original of capture that must be measured, not read |
| One line in `docs/runs/` | History, one text line per run, never a folder |

Delete report that newer one supersede for same scenario and same revision, unless only proof of check newer run did not repeat (a language, a pass). Delete report of failed or infrastructure-error attempt once its line written and cause recorded in `STATUS.md`. Delete any report on superseded build: prove nothing about current one. Never keep `screenshots/` folder copied whole from shared report folder, which carry every other mod's captures. List what goes and what stays before deleting, and **never delete report that `STATUS.md` or tracked file points to: repoint it first.**

Captures this mod's scenarios produce, only ones worth keeping:

- `02`: both creatures on clean map; beetle's health tab with front claws; seraph's health
  tab with wings and right leg, in English;
- `03`: same two health tabs in French, where labels longer;
- `05`: three hairstyles on three colonists;
- `06`: research window on main tab.

Nothing else take capture. Shots, production chain, egg, save round trip and labels
asserted, so proof is report and `Player.log`.

## Manual validation

**Superseded where map above says so.** These checklists were specification of what scenarios
now assert. Not ticked by hand; run results recorded in `STATUS.md` and `docs/runs/`.
What person still do is read `@review` captures.

### Translation gate and language checks

Before game run, execute source-based coverage check:

```powershell
powershell -NoProfile -ExecutionPolicy Bypass -File .github/scripts/Check-Translations.ps1 -ModRoot . -Language French -SourceLanguage English -RejectCjk -NoKeyed -Strict -RejectIdentical
```

It check owned English Def text against French resources, including nested labels
and inherited recipe job string. Re-audit inventory's field list when adding
new Def types, patches, UI code or grammar resources. Also run shared
`../scripts/Check-DefInjected.ps1 -TransMod ./Mod` to validate engine injection paths.
CI run standalone coverage test; shared validator need game.

In **each of English and French**, do following checks during scenarios
below. These checks not yet performed:

- [ ] Inspect both creatures, all health-tab body parts, left/right claws, eight
      distinct wings, and melee/ranged attack labels.
- [ ] Inspect materials, brain fragment, volleyball, egg, workbench and research
      labels/descriptions, including generated corpse and minified-item labels.
- [ ] Open all five bills, start each job and inspect its activity text; inspect
      work priorities and the work giver's generated activity text.
- [ ] Check egg hatching/temperature/rotting text and material-based item names.
- [ ] Browse all 41 hairstyles at styling station.
- [ ] Check for raw keys, unintended English fallback in French, broken grammar,
      missing accents, malformed formatting and clipped text. Record actual results
      in `STATUS.md`; proper character names and power nicknames may be identical.

No scenario below played. Game did load mod at least once, on 2026-09-23, when
it wrote 141 `.dds` texture caches beside PNGs, but no log read and nothing checked, so
that not a test. Everything below is what first run must settle.

**Clean log not an answer.** 123 defs, no assembly, no patch operations, no
required third-party dependencies. Test new colony and existing-save reloads in both languages;
optional DLC cases recorded separately. Five
of six defects this extraction repairs **cannot be seen in log**. Swapped left and right
claws, eight wings sharing one label, leg filed under wrong side, corpse graphic falling
back: all load without word, and read in health tab of living creature instead.

Content checks below share dev-mode colony. Save-regression scenarios need
separate reloads. Mark each scenario PASS, FAIL or NOT RUN and record actual observations.

---

## Before starting

- [ ] `nelim.acertainseriescreaturesandhair` added to mod list. No dependencies, no
      load-order constraint, no DLC required.
- [ ] Previous `ModsConfig.xml` saved beside itself first.
- [ ] Archive previous `Player.log` before starting; keep separate log for each run.
      It sits in
      `%USERPROFILE%\AppData\LocalLow\Ludeon Studios\RimWorld by Ludeon Studios\Player.log`.
- [ ] Colony started with development mode on.

## The load

- [ ] Game reach main menu with no red error naming `ACS_`.

Seven strings to search log for. They are what 1.6 assembly writes, read out of
`Assembly-CSharp.dll` not remembered, and each mean something different here.

| String in the log | Written by | What it would mean for this mod |
|---|---|---|
| `Adding duplicate` | `DefDatabase.Add` | `defName` collision. Every name here carry `ACS_` prefix, so would mean other mod chose same prefix. |
| `Could not resolve cross-reference` | `DirectXmlCrossRefLoader` | `defName` pointing at nothing: leather or butcher product, projectile, research prerequisite, recipe user. |
| `Error while resolving references for def` | `DefDatabase.ResolveAllReferences` | Same family, thrown during resolution, names the def. |
| `Could not find type named` | `Class=` resolver | `Class="..."` that not exist. Every one here vanilla, and in 1.6 this lose whole def rather than degrade it. |
| `Could not find a type named` | `ParseHelper.ParseType` | Type named in element text rather than `Class=`. Different message, different code path, same cause. |
| `Failed to find any textures at` | graphic loader | `texPath` with nothing behind it. This is what beetle's dried-out corpse entry produced in original, why it dropped. |
| `Config error in` | `ThingDef.ConfigErrors` | Consistency rules game apply only at load, which no offline checker replay. Line most likely to appear. |

- [ ] None of those seven name an `ACS_` def. Lines naming other mods not ours to fix, and
      are worth leaving in the paste anyway.

## The white rhinoceros beetle

- [ ] **Spawn one.** Draw as pearl-white beetle, not pink box, from every direction.
- [ ] **Health tab: front claws.** *front left claw* on left, *front right claw* on
      the right. The original had the pair swapped, and this is the whole of that repair.
- [ ] **No hunger bar at all.** Never eat.
- [ ] **Taming read as certain**, training go to advanced.
- [ ] **Outrun everything** on map, comfortable in any temperature map reach.
- [ ] **Caravan accept it as pack animal** and load it.
- [ ] **Horn fires.** Provoke it: shot leaves, lands, explodes. Nothing about this
      worked in the original, on either creature.
- [ ] **Butchering give dark matter and no meat at all.**
- [ ] **Corpse left to rot past desiccation** go on drawing body, rotten. Pink box
      means the dropped graphic came back.

## God's Power, the seraph

- [ ] **Spawn one.** Draw correctly, eight wings and crystal arm.
- [ ] **Health tab: eight wings, eight different labels.** Wounded wing must be findable. In
      the original all eight read the same.
- [ ] **Health tab: right leg on right.** Was filed under left leg's group.
- [ ] **Ranged attack fires**: eight shots a burst, five-tile explosion each, at long
      range. This is the attack that never worked: its projectile asked for a class from a mod
      that was never shipped, so the def failed and the verb dangled.
- [ ] **Taming impossible**, butchering give heavenly cloth and one angel core.
- [ ] **Manhunter-pack incidents never choose it.** Run few in dev mode. At `combatPower`
      10000 the original left it in the draw, where vanilla takes Thrumbo out at 500.

## The propagator, and the chain through it

- [ ] **Research where it should be**: *dark matter propagation*, main tab, immediately
      right of advanced fabrication, 18000 points, wanting microelectronics, advanced
      fabrication and a multi-analyzer, researched at a hi-tech bench.
- [ ] **Propagator builds** once brain fragment in store.
- [ ] **Pawn walks to it on own** with bill queued. This is what new workbench needs
      and what vanilla work givers never provide: without it nobody ever approaches the machine.
- [ ] **Five bills run**: copy dark matter, grow brain fragment, produce dark matter from
      a brain fragment, make a volleyball, grow a beetle egg.
- [ ] Execute **H1: crafted egg hatching** below; expect wild beetle, then taming.

## The forty-one hairstyles

- [ ] **All appear at styling station**, pawns generated wearing them.
- [ ] **Names read in English.**
- [ ] **Switching game to 简体中文 bring original Chinese back.** 200 translation keys
      were checked offline; only the game proves the injection.

## Dark matter as a material

- [ ] **Armour and blades made of it** far better than weight suggest, barely wear,
      and do not burn.

---

## H1: crafted egg hatching

**Preconditions:** RimWorld 1.6, new test colony, this mod enabled, research unlocked,
powered propagator with accessible interaction cell, capable worker and
recipe ingredients. Keep test area at 20 C. No mods altering hatching or taming.
Run in English and French. Expected contract, not recorded game result.

**Actions:** Produce one ACS_EggBeetle through its bill (do not substitute spawned pawn
or egg assigned faction in dev tools). Record completion time; place egg in
safe test area and let one in-game day pass. Inspect hatchling's species and faction.
Order handler with appropriate food to complete taming attempt, then inspect faction
and training again.

**Expected:** One white rhinoceros beetle hatch after one day of uninterrupted incubation.
Initially wild, as stated in both shipped descriptions; become colony animal
after completed taming attempt (Wildness zero), advanced training available.
No hatching error, missing texture or unresolved label appear. Failure to complete
attempt because of access, food or handler conditions is setup issue, not taming roll.
Tame hatchling before any taming action is contract mismatch to investigate, not pass.

**Result:** NOT RUN. Record egg creation/hatch times, initial/final faction and log path.

## T1: obtain the first brain fragment through trade

**Preconditions:** RimWorld 1.6, Core plus this mod, new colony with no propagator and no
ACS_KakineTeitokuBrain in storage. Have friendly outlander faction, negotiator, enough
silver for displayed price, and transport/storage access. For orbital variant,
provide powered comms console and orbital trade beacon. Research may be unlocked and
100 plasteel plus 50 advanced components supplied for later construction test;
do not spawn brain fragment or add directly to trader stock.

**Actions:** Use dev mode to generate independent Caravan_Outlander_Exotic traders and
inspect actual trade windows. Repeat for Orbital_Exotic. Record trader type, attempt
number and whether fragment offered. Use at most 30 independent stocks per type as
bounded sampling session. When offered, buy one through normal trade interface, haul
to storage, and have construction-capable pawn (Construction 12+) build propagator.
Connect adequate power and queue production bill with required ingredients.

**Expected:** Each documented Core trader route can offer purchasable fragment;
purchase supply first propagator without existing machine or spawned fragment.
Construction consume one fragment, and worker can execute bill at powered machine.
No trade, reference or production exception. Availability random: single empty
stock not failure. Thirty empty stocks leave that route INCONCLUSIVE, not PASS and
not proof of impossibility; investigate generator eligibility or extend recorded sample
before deciding. Fragment offered but cannot be bought/used despite satisfied
preconditions is FAIL. Record each route independently; one route not prove other.

**Optional Royalty variant:** Repeat at friendly Empire settlement with trading permission
and Royalty enabled. Record actual trader kind and DLC version. Without Royalty this
variant NOT APPLICABLE; two Core routes remain required. Keep subjective balance
of price separate from whether progression chain accessible.

**Result:** NOT RUN. Record stocks sampled per route, purchases, construction/bill outcomes
and log paths. Automated trade-tag assertion prove eligibility data only, not stock
appearance or successful progression.

## S1: add the mod to an existing colony

**Preconditions:** Backed-up RimWorld 1.6 Core colony saved before enabling this mod;
record save name, game version and mod list. Work only on copy and keep original
save, ModsConfig.xml and previous logs. Run separate English and French variants.

**Actions:** Enable mod, load copy and inspect existing pawns, buildings, inventory
and research. Unlock mod research for this test; obtain its resources and create
propagator, both creatures and pawn wearing one of its hairstyles. Save to new slot,
quit game, restart and reload that slot. Inspect same objects and run bill.

**Expected:** Both loads complete; pre-existing colony objects remain intact. Added content
has resolved labels and graphics; new save retain it, research and bills after restart.
No missing ACS defs, cross-reference failures or exceptions attributable to mod.
This test adding mod, not removing it; removal from save containing its content is
outside claimed compatibility scope.

**Result:** NOT RUN. Record original/copy/reloaded save names, mod lists and logs.

## S2: reload a colony already containing mod content

**Preconditions:** Backed-up 1.6 save containing both creatures, styled pawn, materials,
powered propagator with bills/research and crafted egg partway through incubation.
S1 can supply this fixture for same-version persistence. For upgrade test, also record
and retain actual previous mod revision used to create fixture; do not call
same-version reload upgrade test. Keep unmodified backup and run in both languages.

**Actions:** Record faction/health/training, hairstyle, resource counts, research, bill
settings and egg incubation progress. Save, exit, restart with delivered revision and
reload. Compare recorded values, resume bill, and let egg finish remaining
incubation time. Save and reload once more.

**Expected:** Objects, factions, health, hairstyle, research, inventory and bill settings
persist; incubation continue from saved progress rather than reset or duplicate
egg. Production and hatching complete with H1 outcome. No missing graphics, raw
translation keys or mod-related load/save exceptions. If no prior-version fixture
available, mark upgrade variant NOT RUN; same-version persistence remain required.

**Result:** NOT RUN. Record source/target revisions, before/after values, save names and logs.

## Subjective balance review

Does beetle's temper read as fair? Its manhunter-on-damage chance is 1 in shipped
definition. Record gameplay assessment separately; it has no subjective pass/fail
threshold and cannot substitute for functional scenarios above.

## Sending the result back

Paste `Player.log` whole, and list above with what failed. Clean log on its own tell us
nothing: not one of six repairs visible from log.