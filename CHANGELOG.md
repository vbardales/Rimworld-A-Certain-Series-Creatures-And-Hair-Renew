# Changelog

All notable changes to this mod are recorded here. The format follows
[Keep a Changelog](https://keepachangelog.com/en/1.1.0/).

## [1.0.0] — unreleased

The tag and the GitHub release come with the publication, from the publishing CI, not by hand.

First version. RimWorld 1.6.

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
- French translations for all 202 owned text fields, including body parts, attacks,
  hairstyles, research, production recipes and work activity text.
- A source-based English/French coverage check in CI. English remains in the Defs;
  the original Chinese translation is preserved. In-game language checks are pending.
- Compatibility with A Dog Said... Animal Prosthetics 2 (Workshop 3238353862), optional: when that mod is
  active the beetle joins its category 3, so its surgeries can be offered on the beetle's vanilla body parts
  (the eyes among them). The seraph is left out, since every one of its parts is this mod's own and none of
  that mod's surgeries names them; the beetle's legs, claws, horn and elytra are in the same case. The mod
  loads before it (`loadBefore`), as its author asks of mods that add animals, and nothing changes without it.
  Not yet seen in a game.
- An in-game test suite for Pickle, under `Tests/Pickle/`: 15 features and 18 steps of its own, written
  but not yet run. Development only; none of it is in `Mod/`, so none of it reaches a player.
- `packageId` `nelim.acertainseriescreaturesandhairrenew`. The original had none — RimWorld 1.0 did not require one —
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
- Every generated beetle and seraph logged `Tried 300 times to generate age`: both creature kinds set
  `minGenerationAge` and `maxGenerationAge` to 0, as the 1.0 original did, and in 1.6 a maximum of 0 leaves the
  age generator nothing to draw for an animal. Found by the first game run; the two fields are dropped, as
  vanilla animal kinds set neither.
- The dark matter propagator now declares `Spacer` as its tech level. It had none, while
  building it needs the spacer research ACS_DarkMatterTech and 50 spacer components, so a
  world filtered by tech level kept it where it did not belong.

### Removed

- Everything outside the scope of this extraction: Academy City's armour and weapons, all worn
  equipment, the dark matter prosthetics and their surgery, the six research projects that gated
  the armoury with the research tab they hung on, the five human traits, and two effecters that
  belonged to weapons.
- The ten power-building defs that redefined vanilla's own `Battery`, conduits, switch and five
  generators. This mod now redefines nothing that belongs to the base game.
- Dead 1.0 leftovers: the beetle's all-zero `wildBiomes` block, the `RewardSpecial` thing set
  maker tag, and a `ToxicSensitivity` stat factor of −1 on heavenly cloth.

## [0.1.0] — 2026-09-23

Creation of a publishIdFile. Prepublication: a first upload whose only purpose was to create the
Workshop item, private as Steam creates every new item, and to obtain `Mod/About/PublishedFileId.txt`,
which holds item `3806708754`. This entry does not say the mod is public or tested.

### Added

- `Mod/About/PublishedFileId.txt`, committed in `8437ae0`. Without it the next upload would create a
  second item instead of updating this one.

### Notes

- The upload contained `Mod/` as it stood at `3db914f`. Since then `Mod/` has changed by that file and
  by `About/Preview.png`, recomposed on 2026-09-24 so that the title no longer covers the beetle. The
  item's page was created with the earlier image and still carries it.
- It was made from the working tree, which also held 141 `.dds` texture caches that the game had
  written beside the PNGs a quarter of an hour earlier. They are not in git, so the private item
  probably carries them. This repository has no publish workflow yet: an upload from a git checkout
  drops them, one from the working tree sends them again.
- The features listed under 1.0.0 are still to come as a release. The `tested` and `prepublished`
  states have not been reached: see `STATUS.md`.
