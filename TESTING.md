# Test scenarios

## Automated regression tests

From the repository root, run:

```powershell
powershell -NoProfile -ExecutionPolicy Bypass -File Tests/Test-Mod.ps1
```

The standalone suite requires only PowerShell, reads the mod without changing it,
and exits with code 1 on failure. GitHub Actions runs it on pushes and pull requests.
Use `-ModPath <folder>` to check another copy of the published mod.

Coverage: XML parsing, names scoped by def type, ACS references and local parents,
GitHub metadata, custom texture files (including directional and stack graphics),
explosive projectiles, manhunter exclusion, repaired anatomy, corpse graphics,
workbench bill access, product references, trader bootstrap tags, egg hatching,
and all 41 hairstyles with their Chinese labels.

These are static regression checks, not RimWorld execution. They do not resolve
vanilla references, replay full XML inheritance, validate C# fields against the game,
or validate every translation handle. The shared parent repository's
`scripts/Check-XmlFields.ps1`, `Check-DefRefs.ps1`, `Check-XmlClasses.ps1`,
`Check-TypeRefs.ps1`, `Check-ConfigErrors.ps1` and `Check-DefInjected.ps1`
provide additional checks using the installed game and must also be rerun for
version migrations. The in-game scenarios below remain necessary.

## What `tested` requires

`../AUDIT.md`, stage 9 (done -> tested). Three of its checks decide whether this file is finished,
and each is measured here against what exists today.

| Check | Where this mod stands |
|---|---|
| No scenario left in `@wip`. A shelved scenario is repaired and replayed, or deleted with its reason. | Met vacuously: there is no Gherkin scenario yet, so none is shelved. It stops being vacuous the day the Pickle suite is written. |
| Every conditional scenario ran. Each `@requires:<packageId>` (optional mod, DLC, companion tool) had its own pass on a map that mounts it, and its report was read. A scenario skipped for a missing condition is not a pass. | One condition only: Royalty, for the Empire variant of T1. The About declares no `loadAfter`, no dependency and no `incompatibleWith`. |
| No manual test left to validate. What is still ticked by hand is either automated and green, or listed as not applicable with its reason. | **Not met, and this is the whole of the remaining work.** Every box and every scenario below (H1, T1, S1, S2) is manual today. |

In practice. `Tests/Test-Mod.ps1` already proves that the defs say what most boxes expect: claw
sides, eight distinct wing labels, the corpse-graphic entry, the manhunter exclusion, bill access
and the egg's parameters. What only a running game shows is the health tab drawing them, the shot
leaving and exploding, a pawn walking to the workbench unprompted, a trader offering the fragment,
the hatchling's faction, and the French and English labels on screen. Those are what a Pickle
scenario is for, and nothing a static test can prove belongs in Gherkin. A box that no scenario can
automate goes to a "not applicable" list with its reason; it cannot stay as an unticked box. The
subjective balance review at the end is one of those: it has no pass or fail threshold.

## Passes this mod needs

A mod whose TESTING.md does not say how many passes it needs is tried, not tested. For this one:

1. **English, no optional mod** (the launcher's default set: Core, the DLCs, Pickle and its own
   dependencies): the content checks, H1, and the two Core routes of T1.
2. **French, same set:** the translation checks and the labels pass 1 read.
3. **Existing-save reload, English then French:** S1 and S2.
4. **Royalty, English:** the Empire variant of T1. The only conditional pass.

Not needed: a pass with optional mods, since none is declared, and an incompatibility pass, since
none is declared either.

The machine is shared, so a run takes a ticket in the queue and waits for its turn. A Claude Code
session watches its ticket with the `Monitor` tool on a read-only poll of `scripts/Pickle-Status.ps1`,
which is what a heartbeat is under Codex (`../AUDIT.md`). Never a cron. A `Monitor` expires after
30 minutes at most, so a long queue means re-arming it.

## Evidence to keep

Raw Pickle reports live on disk in `Tests/Pickle/Evidence/<run>/`, which `.gitignore` excludes:
captures and `Player.log` grow without limit. Pass `-EvidenceDir` to the launcher so the report is
copied there before the lock is released, then check `exitReason` and the played and discovered
counts in each copy.

Keep, per scenario, the latest report for the revision now in the repository. Keep an older one only
when it is the sole proof of a check the latest run did not repeat. Delete every other report as soon
as a newer one replaces it, after listing what goes and what stays. Never delete a report that
`STATUS.md` still points to: repoint it first. The history is one text line per run in `docs/runs/`,
never a folder.

The proofs worth keeping for this mod, and only these:

- the beetle's health tab in English: front left claw on the left, front right claw on the right;
- the seraph's health tab: eight wings under eight different labels, the right leg on the right;
- one frame of each creature's shot, in flight or exploding;
- the propagator with a bill in progress and a pawn working at it;
- the styling station's hairstyle list, once in English and once in French;
- the `Player.log` of each pass, already searched for the seven strings in "The load": only the
  newest one per pass.

A capture is minified before it is kept: drop the ones the verdict does not rest on, crop to the
panel that proves the point, and re-encode without loss. Never retouch one. The text reports
(`summary.md`, `junit.xml`) are small and stay whole.

## Manual validation

### Translation gate and language checks

Before a game run, execute the source-based coverage check:

```powershell
powershell -NoProfile -ExecutionPolicy Bypass -File Tests/Test-Translations.ps1
```

It checks owned English Def text against French resources, including nested labels
and the inherited recipe job string. Re-audit the inventory's field list when adding
new Def types, patches, UI code or grammar resources. Also run the shared
`../scripts/Check-DefInjected.ps1 -TransMod ./Mod` to validate engine injection paths.
CI runs the standalone coverage test; the shared validator requires the game.

In **each of English and French**, perform the following checks during the scenarios
below. These checks have not yet been performed:

- [ ] Inspect both creatures, all health-tab body parts, left/right claws, eight
      distinct wings, and melee/ranged attack labels.
- [ ] Inspect materials, brain fragment, volleyball, egg, workbench and research
      labels/descriptions, including generated corpse and minified-item labels.
- [ ] Open all five bills, start each job and inspect its activity text; inspect
      work priorities and the work giver's generated activity text.
- [ ] Check egg hatching/temperature/rotting text and material-based item names.
- [ ] Browse all 41 hairstyles at the styling station.
- [ ] Check for raw keys, unintended English fallback in French, broken grammar,
      missing accents, malformed formatting and clipped text. Record actual results
      in `STATUS.md`; proper character names and power nicknames may be identical.

No scenario below has been played. The game did load the mod at least once, on 2026-09-23, when
it wrote 141 `.dds` texture caches beside the PNGs, but no log was read and nothing was checked, so
that is not a test. Everything below is what the first run has to settle.

**A clean log would not be an answer.** 123 defs, no assembly, no patch operations, no
required third-party dependencies. Test a new colony and existing-save reloads in both languages;
optional DLC cases are recorded separately. Five
of the six defects this extraction repairs **cannot be seen in a log**. Swapped left and right
claws, eight wings sharing one label, a leg filed under the wrong side, a corpse graphic falling
back: all of it loads without a word, and is read in the health tab of a living creature instead.

The content checks below share a dev-mode colony. The save-regression scenarios require
separate reloads. Mark each scenario PASS, FAIL or NOT RUN and record actual observations.

---

## Before starting

- [ ] `nelim.acertainseriescreaturesandhairrenew` added to the mod list. No dependencies, no
      load-order constraint, no DLC required.
- [ ] The previous `ModsConfig.xml` saved beside itself first.
- [ ] Archive the previous `Player.log` before starting; preserve a separate log for each run.
      It sits in
      `%USERPROFILE%\AppData\LocalLow\Ludeon Studios\RimWorld by Ludeon Studios\Player.log`.
- [ ] A colony started with development mode on.

## The load

- [ ] The game reaches the main menu with no red error naming `ACS_`.

Seven strings to search the log for. They are what the 1.6 assembly writes, read out of
`Assembly-CSharp.dll` rather than remembered, and each means something different here.

| String in the log | Written by | What it would mean for this mod |
|---|---|---|
| `Adding duplicate` | `DefDatabase.Add` | A `defName` collision. Every name here carries the `ACS_` prefix, so this would mean another mod chose the same prefix. |
| `Could not resolve cross-reference` | `DirectXmlCrossRefLoader` | A `defName` pointing at nothing: a leather or butcher product, a projectile, a research prerequisite, a recipe user. |
| `Error while resolving references for def` | `DefDatabase.ResolveAllReferences` | Same family, thrown during resolution, and it names the def. |
| `Could not find type named` | the `Class=` resolver | A `Class="..."` that does not exist. Every one here is vanilla, and in 1.6 this loses the whole def rather than degrading it. |
| `Could not find a type named` | `ParseHelper.ParseType` | A type named in element text rather than in `Class=`. Different message, different code path, same cause. |
| `Failed to find any textures at` | the graphic loader | A `texPath` with nothing behind it. This is what the beetle's dried-out corpse entry produced in the original, which is why it was dropped. |
| `Config error in` | `ThingDef.ConfigErrors` | The consistency rules the game applies only at load, which no offline checker replays. This is the line most likely to be the one that appears. |

- [ ] None of those seven names an `ACS_` def. Lines naming other mods are not ours to fix, and
      are worth leaving in the paste anyway.

## The white rhinoceros beetle

- [ ] **Spawn one.** It draws as a pearl-white beetle, not a pink box, from every direction.
- [ ] **Health tab: the front claws.** A *front left claw* on the left, a *front right claw* on
      the right. The original had the pair swapped, and this is the whole of that repair.
- [ ] **No hunger bar at all.** It never eats.
- [ ] **Taming reads as certain**, and training goes to advanced.
- [ ] **It outruns everything** on the map, and is comfortable in any temperature the map reaches.
- [ ] **A caravan accepts it as a pack animal** and loads it.
- [ ] **The horn fires.** Provoke it: the shot leaves, lands and explodes. Nothing about this
      worked in the original, on either creature.
- [ ] **Butchering gives dark matter and no meat at all.**
- [ ] **A corpse left to rot past desiccation** goes on drawing the body, rotten. A pink box
      means the dropped graphic came back.

## God's Power, the seraph

- [ ] **Spawn one.** It draws correctly, eight wings and the crystal arm.
- [ ] **Health tab: eight wings, eight different labels.** A wounded wing must be findable. In
      the original all eight read the same.
- [ ] **Health tab: the right leg on the right.** It was filed under the left leg's group.
- [ ] **The ranged attack fires**: eight shots a burst, a five-tile explosion each, at long
      range. This is the attack that never worked: its projectile asked for a class from a mod
      that was never shipped, so the def failed and the verb dangled.
- [ ] **Taming is impossible**, and butchering gives heavenly cloth and one angel core.
- [ ] **Manhunter-pack incidents never choose it.** Run a few in dev mode. At `combatPower`
      10000 the original left it in the draw, where vanilla takes Thrumbo out at 500.

## The propagator, and the chain through it

- [ ] **The research is where it should be**: *dark matter propagation*, main tab, immediately
      right of advanced fabrication, 18000 points, wanting microelectronics, advanced
      fabrication and a multi-analyzer, researched at a hi-tech bench.
- [ ] **The propagator builds** once a brain fragment is in store.
- [ ] **A pawn walks to it on their own** with a bill queued. This is what a new workbench needs
      and what vanilla work givers never provide: without it nobody ever approaches the machine.
- [ ] **The five bills run**: copy dark matter, grow a brain fragment, produce dark matter from
      a brain fragment, make a volleyball, grow a beetle egg.
- [ ] Execute **H1: crafted egg hatching** below; expect a wild beetle, followed by taming.

## The forty-one hairstyles

- [ ] **All of them appear at the styling station**, and pawns are generated wearing them.
- [ ] **Names read in English.**
- [ ] **Switching the game to 简体中文 brings the original Chinese back.** 200 translation keys
      were checked offline; only the game proves the injection.

## Dark matter as a material

- [ ] **Armour and blades made of it** are far better than their weight suggests, barely wear,
      and do not burn.

---

## H1: crafted egg hatching

**Preconditions:** RimWorld 1.6, a new test colony, this mod enabled, research unlocked,
a powered propagator with an accessible interaction cell, a capable worker and the
recipe ingredients. Keep the test area at 20 C. No mods that alter hatching or taming.
Run in English and French. This is an expected contract, not a recorded game result.

**Actions:** Produce one ACS_EggBeetle through its bill (do not substitute a spawned pawn
or an egg assigned a faction in dev tools). Record completion time; place the egg in the
safe test area and let one in-game day elapse. Inspect the hatchling's species and faction.
Order a handler with appropriate food to complete a taming attempt, then inspect faction
and training again.

**Expected:** One white rhinoceros beetle hatches after one day of uninterrupted incubation.
It is initially wild, as stated in both shipped descriptions; it becomes a colony animal
following the completed taming attempt (Wildness is zero), with advanced training available.
No hatching error, missing texture or unresolved label appears. Failure to complete an
attempt because of access, food or handler conditions is a setup issue, not a taming roll.
A tame hatchling before any taming action is a contract mismatch to investigate, not a pass.

**Result:** NOT RUN. Record egg creation/hatch times, initial/final faction and log path.

## T1: obtain the first brain fragment through trade

**Preconditions:** RimWorld 1.6, Core plus this mod, a new colony with no propagator and no
ACS_KakineTeitokuBrain in storage. Have a friendly outlander faction, a negotiator, sufficient
silver for the displayed price, and transport/storage access. For the orbital variant,
provide a powered comms console and orbital trade beacon. Research may be unlocked and
100 plasteel plus 50 advanced components supplied for the subsequent construction test;
do not spawn the brain fragment or add it directly to trader stock.

**Actions:** Use dev mode to generate independent Caravan_Outlander_Exotic traders and
inspect their actual trade windows. Repeat for Orbital_Exotic. Record trader type, attempt
number and whether a fragment is offered. Use at most 30 independent stocks per type as a
bounded sampling session. When offered, buy one through the normal trade interface, haul
it to storage, and have a construction-capable pawn (Construction 12+) build the propagator.
Connect adequate power and queue a production bill with its required ingredients.

**Expected:** Each documented Core trader route can offer a purchasable fragment; the
purchase supplies the first propagator without an existing machine or spawned fragment.
Construction consumes one fragment, and a worker can execute a bill at the powered machine.
No trade, reference or production exception occurs. Availability is random: a single empty
stock is not a failure. Thirty empty stocks leave that route INCONCLUSIVE, not PASS and
not proof of impossibility; investigate generator eligibility or extend the recorded sample
before deciding. A fragment that is offered but cannot be bought/used despite satisfied
preconditions is FAIL. Record each route independently; one route does not prove the other.

**Optional Royalty variant:** Repeat at a friendly Empire settlement with trading permission
and Royalty enabled. Record the actual trader kind and DLC version. Without Royalty this
variant is NOT APPLICABLE; the two Core routes remain required. Keep the subjective balance
of price separate from whether the progression chain is accessible.

**Result:** NOT RUN. Record stocks sampled per route, purchases, construction/bill outcomes
and log paths. The automated trade-tag assertion proves eligibility data only, not stock
appearance or successful progression.

## S1: add the mod to an existing colony

**Preconditions:** A backed-up RimWorld 1.6 Core colony saved before enabling this mod;
record the save name, game version and mod list. Work only on a copy and keep the original
save, ModsConfig.xml and previous logs. Run separate English and French variants.

**Actions:** Enable the mod, load the copy and inspect existing pawns, buildings, inventory
and research. Unlock the mod research for this test; obtain its resources and create a
propagator, both creatures and a pawn wearing one of its hairstyles. Save to a new slot,
quit the game, restart and reload that slot. Inspect the same objects and run a bill.

**Expected:** Both loads complete; pre-existing colony objects remain intact. Added content
has resolved labels and graphics; the new save retains it, research and bills after restart.
No missing ACS defs, cross-reference failures or exceptions attributable to the mod occur.
This tests adding the mod, not removing it; removal from a save containing its content is
outside the claimed compatibility scope.

**Result:** NOT RUN. Record original/copy/reloaded save names, mod lists and logs.

## S2: reload a colony already containing mod content

**Preconditions:** A backed-up 1.6 save containing both creatures, a styled pawn, materials,
a powered propagator with bills/research and a crafted egg partway through incubation.
S1 can supply this fixture for same-version persistence. For an upgrade test, also record
and retain the actual previous mod revision used to create the fixture; do not call a
same-version reload an upgrade test. Keep an unmodified backup and run in both languages.

**Actions:** Record faction/health/training, hairstyle, resource counts, research, bill
settings and egg incubation progress. Save, exit, restart with the delivered revision and
reload. Compare the recorded values, resume a bill, and let the egg finish its remaining
incubation time. Save and reload once more.

**Expected:** Objects, factions, health, hairstyle, research, inventory and bill settings
persist; incubation continues from saved progress rather than resetting or duplicating
the egg. Production and hatching complete with the H1 outcome. No missing graphics, raw
translation keys or mod-related load/save exceptions occur. If no prior-version fixture
is available, mark the upgrade variant NOT RUN; same-version persistence remains required.

**Result:** NOT RUN. Record source/target revisions, before/after values, save names and logs.

## Subjective balance review

Does the beetle's temper read as fair? Its manhunter-on-damage chance is 1 in the shipped
definition. Record the gameplay assessment separately; it has no subjective pass/fail
threshold and cannot substitute for the functional scenarios above.

## Sending the result back

Paste `Player.log` whole, and the list above with what failed. A clean log on its own tells us
nothing: not one of the six repairs is visible from a log.
