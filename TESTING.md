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

## Manual validation

This mod has never been loaded by RimWorld. Everything below is what the first run has to settle.

**A clean log would not be an answer.** 123 defs, no assembly, no patch operations, no
dependencies: there is no modlist interaction to enumerate, so one run covers the lot. But five
of the six defects this extraction repairs **cannot be seen in a log**. Swapped left and right
claws, eight wings sharing one label, a leg filed under the wrong side, a corpse graphic falling
back: all of it loads without a word, and is read in the health tab of a living creature instead.

The boxes below are in the order of a single dev-mode run, so nothing needs reloading. Copy the
list into your answer and mark what failed.

---

## Before starting

- [ ] `nelim.acertainseriescreaturesandhairrenew` added to the mod list. No dependencies, no
      load-order constraint, no DLC required.
- [ ] The previous `ModsConfig.xml` saved beside itself first.
- [ ] `Player.log` emptied, so the run starts clean. It sits in
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
- [ ] **The egg hatches a beetle in one day**, and the beetle that comes out is tame.

## The forty-one hairstyles

- [ ] **All of them appear at the styling station**, and pawns are generated wearing them.
- [ ] **Names read in English.**
- [ ] **Switching the game to 简体中文 brings the original Chinese back.** 200 translation keys
      were checked offline; only the game proves the injection.

## Dark matter as a material

- [ ] **Armour and blades made of it** are far better than their weight suggests, barely wear,
      and do not burn.

---

## Two questions, which are not tests

They have no expected result. They need a judgement made while playing.

1. **Does an exotic goods trader actually carry the brain fragment?** Building the propagator
   costs one, and only a propagator can grow another, so the first one has to be bought. Outlander
   caravan, orbital trader or the Empire. If none ever carries one, the mod is unbuildable, and
   that is a blocker rather than a detail.
2. **Does the beetle's temper read as fair?** Any damage turns it manhunter, without exception.
   That number is the original author's, kept as it was. If it plays badly it is a one-line
   change now, and a change of behaviour after publication.

## Sending the result back

Paste `Player.log` whole, and the list above with what failed. A clean log on its own tells us
nothing: not one of the six repairs is visible from a log.
