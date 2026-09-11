# Test scenarios

This mod has never been loaded by RimWorld. Everything below is what the first run has to settle.

**Why the log is not enough.** 123 defs, no assembly, no patch operations, no dependencies: there
is no modlist interaction to enumerate, so one run covers the lot. But five of the six defects
this extraction fixes **cannot be seen in a log**. A swapped left and right claw, eight wings
sharing one label, a leg filed under the wrong side, a corpse graphic falling back: all of that
loads without a word. It has to be read in the health tab of a living creature.

The mod was not in `activeMods` when this file was written. It has to be enabled first.

---

## Enabling it

```
nelim.acertainseriescreaturesandhairrenew        anywhere in the list
```

No dependencies, no load-order constraint, no DLC required. Save the current `ModsConfig.xml`
beside itself before editing the list, and empty `Player.log` so the run starts clean.

`Player.log` sits in
`%USERPROFILE%\AppData\LocalLow\Ludeon Studios\RimWorld by Ludeon Studios\Player.log`.

## What to search the log for

These are the exact strings the 1.6 assembly writes, read out of `Assembly-CSharp.dll` rather
than remembered. Each means something different here.

| String in the log | Written by | What it would mean for this mod |
|---|---|---|
| `Adding duplicate` | `DefDatabase.Add` | A `defName` collision. Every name here carries the `ACS_` prefix, so this would mean another mod chose the same prefix. |
| `Could not resolve cross-reference` | `DirectXmlCrossRefLoader` | A `defName` pointing at nothing: a leather or butcher product, a projectile, a research prerequisite, a recipe user. |
| `Error while resolving references for def` | `DefDatabase.ResolveAllReferences` | Same family, thrown during resolution, and it names the def. |
| `Could not find type named` | the `Class=` resolver | A `Class="..."` that does not exist. Every one here is vanilla, and in 1.6 this loses the whole def rather than degrading it. |
| `Could not find a type named` | `ParseHelper.ParseType` | A type named in element text rather than in `Class=`. Different message, different code path, same cause. |
| `Failed to find any textures at` | the graphic loader | A `texPath` with nothing behind it. This is exactly what the beetle's dried-out corpse entry produced in the original, which is why it was dropped. |
| `Config error in` | `ThingDef.ConfigErrors` | The consistency rules the game applies only at load, which no offline checker replays. This is the line most likely to be the one that appears. |

A clean run means **none of those naming `ACS_`**. Lines naming other mods are not ours to fix,
and are worth leaving in the paste anyway.

---

## The white rhinoceros beetle

Spawn one in dev mode, or buy one: it never spawns wild.

- **Front claws.** The health tab must show a *front left claw* on the left and a *front right
  claw* on the right. The original had the pair swapped, and this is the whole of that fix.
- **It never eats.** No hunger bar, ever. `baseHungerRate` is 0.
- **Tame at a glance**, and trainable to advanced. Its taming chance should read as certain.
- **Faster than anything on the map**, and comfortable at any temperature the map can reach.
- **It is a pack animal**: a caravan must accept it and load it.
- **Hitting it always turns it manhunter.** `manhunterOnDamageChance` is 1, straight from the
  original. If that reads as too harsh in play, say so: it is a one-line change now, and a
  change of behaviour after publication.
- **The horn is a cannon.** Provoke it and watch it fire: the shot must leave, land and explode.
  Nothing about this worked in the original, on either creature.
- **Butchering gives dark matter and no meat at all.**
- **Leave a corpse to rot past desiccation.** It must go on drawing the body, rotten. A pink box
  means the dropped graphic came back.

## God's Power, the seraph

- **Eight wings, eight different labels.** The health tab must let you tell them apart. In the
  original all eight read the same, which made a wounded wing impossible to find.
- **The right leg on the right.** It was filed under the left leg's group.
- **The ranged attack.** Eight shots a burst, a five-tile explosion each, out to a long range.
  This is the attack that never fired in the original: its projectile asked for a class from a
  mod that was never shipped, so the def failed and the verb dangled.
- **No one tames it**, and butchering gives heavenly cloth and a single angel core.
- **It must never arrive as a manhunter pack.** Run manhunter-pack incidents in dev mode and it
  should never be the animal chosen. At `combatPower` 10000 the original left it in the draw,
  where vanilla takes Thrumbo out at 500.

## The propagator, and the chain through it

- **The research.** *Dark matter propagation*, on the main tab, immediately right of advanced
  fabrication, 18000 points, needing microelectronics, advanced fabrication and a multi-analyzer,
  and a hi-tech research bench to work at.
- **The bootstrap.** Building the propagator costs one brain fragment, and only a propagator can
  grow another, so the first one has to be bought. Check that an exotic goods trader, outlander
  caravan or orbital, or the Empire, actually carries one. If none ever does, the mod is
  unbuildable and that is a blocker, not a detail.
- **A pawn must walk to it on their own.** This is what a new workbench needs and what vanilla
  work givers never provide: with a bill queued and a crafter free, someone must come and work.
- **The five bills run**: copy dark matter, grow a brain fragment, produce dark matter from a
  brain fragment, make a volleyball, grow a beetle egg.
- **The egg hatches a beetle in one day**, and the beetle that comes out is tame.

## The forty-one hairstyles

- All of them appear **at the styling station**, and pawns are generated with them.
- Names read in English. Switch the game to 简体中文 and the original Chinese comes back: 200
  translation keys were checked offline, but only the game proves the injection.

## Dark matter as a material

- Armour and blades made of it are far better than their weight suggests, it barely wears, and
  it does not burn.

---

## After the run

Paste `Player.log` whole, and say which of the checks above were done and what they showed. A
clean log with none of the checks run tells us nothing: not one of the six repairs is visible
from a log.
