# Changelog

All notable changes to this mod are recorded here. The format follows
[Keep a Changelog](https://keepachangelog.com/en/1.1.0/).

## [Unreleased]

### Added

- First extraction from 某系列MOD (混沌の味方, Workshop 1667943729, RimWorld 1.0). 123 defs:
  - the white rhinoceros beetle and God's Power, with their two bodies, 25 body part defs and
    34 body part groups;
  - the three materials the creatures leave behind — dark matter, heavenly cloth, the angel core;
  - both creatures' innate projectiles and the seraph's impact effecter;
  - the dark matter propagator with its five recipes, its work giver, the brain fragment, the
    volleyball and the beetle egg, so the beetle can be bred;
  - all 41 hairstyles.
- English labels and descriptions on everything kept; the original Chinese preserved in
  `Languages/ChineseSimplified (简体中文)/DefInjected/`, 115 defs' worth.
- `packageId` `nelim.acertainseries`. The original had none — RimWorld 1.0 did not require one —
  and a 1.6 mod without one never loads.

### Changed

- Every def name prefixed `ACS_`, every texture moved under `Textures/ACS/`. The original's bare
  names (`Core`, `Sword`, `2`, `index`, `Doctor`, `Knight`, a texture folder called `Resource`)
  collide silently with any mod that picks the same one.
- 1.0 fields migrated to their 1.6 form: `wildness` to the `Wildness` stat, `ToxicSensitivity` to
  `ToxicResistance` (inverted), `hairGender`/`hairTags` to `styleGender`/`styleTags`,
  `soundImpactStuff` to `soundImpactBullet`.
- The `FlameThrower` sound, gone from 1.6, replaced by `Shot_IncendiaryLauncher` when firing and
  `Explosion_Flame` on impact; the `UnskilledLaborSpeed` stat, likewise gone, by
  `GeneralLaborSpeed` on all five recipes.
- The two research projects that led to the propagator folded into one, `ACS_DarkMatterTech`, at
  their combined cost of 18000, on the vanilla main tab. The original hung eight projects on a
  `ResearchTabDef` of its own; six of them gate the armoury, which is not here, and a tab holding
  one project is clutter.

### Fixed

- The seraph's ranged attack, which never worked: its projectile asked for a C# class from a mod
  the original neither shipped nor declared, so the def failed to resolve and the verb dangled.
  It uses vanilla `Projectile_Explosive` now.
- The beetle's dried-out corpse graphic, which pointed at a three-frame texture set that only
  ever shipped one frame. Dropped, so the game falls back to the live body drawn rotten.
- The beetle's front claws, whose left and right labels were swapped.
- The seraph's right leg, which was filed under the left leg's body part group.
- The seraph's eight wings, which shared one label and could not be told apart in the health tab.
- The seraph's arrival as a manhunter pack. At `combatPower` 10000 it was still in the draw, while
  vanilla takes Thrumbo out of it at 500 and AlphaThrumbo at 800 — the highest any base-game animal
  reaches. `canArriveManhunter` is false now, as the original already had it on the beetle.

### Removed

- Everything outside the scope of this extraction: Academy City's armour and weapons, all worn
  equipment, the dark matter prosthetics and their surgery, the six research projects that gated
  the armoury with the research tab they hung on, the five human traits, and two effecters that
  belonged to weapons.
- The ten power-building defs that redefined vanilla's own `Battery`, conduits, switch and five
  generators. This mod now redefines nothing that belongs to the base game.
- Dead 1.0 leftovers: the beetle's all-zero `wildBiomes` block, the `RewardSpecial` thing set
  maker tag, and a `ToxicSensitivity` stat factor of −1 on heavenly cloth.
