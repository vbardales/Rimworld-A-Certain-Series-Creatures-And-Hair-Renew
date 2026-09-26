# A Certain Series — what was taken, what was left, and what was changed

## Source

| | |
|---|---|
| Mod | 某系列MOD ("a certain series MOD") |
| Author | 混沌の味方 |
| Workshop | [1667943729](https://steamcommunity.com/sharedfiles/filedetails/?id=1667943729) |
| `targetVersion` | 1.0 |
| `packageId` | **none** — RimWorld 1.0 did not require one |
| Licence | **none declared** — see `LICENSE` for what that means here |

The mod is a fan mod for the *A Certain Magical Index* series (とある魔術の禁書目録): Academy
City, its espers, and the magicians ranged against them. 585 files, 248 defs, 4.1 MB.

### On the licence

Checked in the three places that decide it: **no `LICENSE` or `COPYING` file** anywhere in the
mod, **no mention in `About.xml`** — whose whole text is a name, an author, an empty URL field,
`targetVersion` 1.0 and a one-line description — and **no repository** linked from it.

Silence is not a refusal, and it is not permission either. This is redistributed under the usual
practice for abandoned RimWorld mods: explicit credit, a link to the original, and removal on
request.

### Why this is a rebuild and not a Cherry Picker patch

The original declares no `packageId`. Every 1.6 mod needs one, and a mod that has none never
loads — so there is no loaded mod for a patch to trim. Removing what is out of scope had to be
done by building a new mod out of what is kept.

That new mod's `packageId` is `nelim.acertainseriescreaturesandhairrenew`. It is fixed for good: changing it after
publication disables the mod for every subscriber.

## What was taken

| New file | Origin |
|---|---|
| `Defs/ThingDefs_Races/DarkMatterBeetle.xml` | `Defs/AnimalDefs/DarkMatterBeetle.xml` |
| `Defs/ThingDefs_Races/Gabriel.xml` | `Defs/AnimalDefs/Gabriel.xml` |
| `Defs/Bodies/Body_DarkMatterBeetle.xml` | `Defs/Bodies/Bodies_DarkMatterBeetle.xml` |
| `Defs/Bodies/Body_Seraphim.xml` | `Defs/Bodies/Bodies_Angel.xml` |
| `Defs/Bodies/BodyParts_Beetle.xml` | `Defs/Bodies/BodyParts_DarkMatterBeetle.xml`, 9 defs |
| `Defs/Bodies/BodyParts_Angel.xml` | `Defs/Bodies/BodyParts_Angel.xml`, 16 defs |
| `Defs/Bodies/BodyPartGroups.xml` | `Defs/Bodies/BodyPartGroups.xml`, all 34 |
| `Defs/ThingDefs_Items/Resources.xml` | all 3 defs of `Defs/ThingDefs/ResourceDefs.xml` |
| `Defs/ThingDefs_Misc/Projectiles.xml` | `Defs/Projectiles/`, both files |
| `Defs/EffecterDefs/Effecters.xml` | 1 of the 3 defs of `Defs/Effects/Effecter.xml` |
| `Defs/HairDefs/Hairs_Female.xml` | `Defs/HairDefs/Femalehair.xml`, all 23 |
| `Defs/HairDefs/Hairs_Male.xml` | `Defs/HairDefs/Malehair.xml`, all 18 |
| `Defs/ThingDefs_Buildings/DarkMatterProduction.xml` | `Defs/ThingDefs/Buildings.xml` |
| `Defs/ThingDefs_Items/ProductionChain.xml` | all 3 defs and both abstracts of `Defs/ThingDefs/Items.xml` |
| `Defs/RecipeDefs/Recipes_DarkMatter.xml` | `Defs/RecipeDefs/Recipes_DarkMatter.xml`, all 5 |
| `Defs/WorkGiverDefs/WorkGivers.xml` | `Defs/WorkGiverDefs/WorkGivers.xml`, the one def |
| `Defs/ResearchProjectDefs/Research.xml` | 2 of the 9 defs of `Defs/ResearchProjectsDefs/`, folded into 1 |
| `Textures/ACS/**` | 141 of the mod's PNGs, unchanged, moved under an `ACS/` root |

123 defs in all. The three resources are here because the creatures need them: dark matter is the
beetle's `leatherDef`, heavenly cloth the seraph's, and the angel core is the seraph's
`butcherBodyPart` product. Without them the two animals do not resolve.

### The production chain, added after the first pass

The first extraction left the propagator behind, and with it the beetle's only means of
reproduction. It was brought back whole on request: the worktable, its five recipes, its work
giver, the brain fragment and the volleyball the recipes pass through, the egg, and the research
that gates the lot.

The machine costs one brain fragment to build and only a machine can grow another, so the first
fragment must be bought. That is the original author's design and it survives the extraction
intact - `tradeability` `All` and the `ExoticMisc` trade tag put it within reach of outlander and
orbital exotic traders and of the Empire, four trader kinds in all.

What did **not** come back is the tab. The original hung eight research projects on a
`ResearchTabDef` of its own, `AcademyCityTechnology`; six of them gate the armoury, which is not
here. `AcademyCityTechnologyBasic` (3000) and `DarkMatter` (15000) are folded into one project,
`ACS_DarkMatterTech`, at 18000 - the same total the player used to pay - keeping the three
vanilla prerequisites the first of the pair had (`MicroelectronicsBasics`, `AdvancedFabrication`,
`MultiAnalyzer`) and sitting on the vanilla `Main` tab at (19, 3), a slot free in Core and in
every expansion. A research tab holding one project is clutter.

### The projectiles, which the brief listed as out of scope

The brief set aside "the projectiles" along with the weapons. There turned out to be exactly two
in the whole mod, and both are a creature's own shot, named as the `defaultProjectile` of an
animal's `<verbs>` — no weapon in the mod carries a projectile of its own. Dropping them would
have left both creatures with a ranged verb pointing at nothing: an unresolved cross-reference at
load, and a shooter that fires nothing. They are kept as part of the animals, which is what they
are.

## What was left behind

Out of scope by the standing rule — no weapons, no races — or simply not asked for:

- **`AcademyCityWeapons.xml` (12 defs) and `Weapons.xml` (18)** — the whole armoury.
- **`AcademyCityPoweredArmor.xml` (11), `apparel.xml` (16), `headgear.xml` (6)** — the powered
  suits and everything worn.
- **`Buildings_Power.xml` (10)** — and this is the one that mattered. All ten **redefine a
  vanilla def**: `Battery`, `PowerConduit`, `WaterproofConduit`, `PowerSwitch`, `WindTurbine`,
  `SolarGenerator`, `GeothermalGenerator`, `WatermillGenerator`, `WoodFiredGenerator`,
  `ChemfuelPoweredGenerator`. A mod that redefines a base-game def fights every other mod that
  touches it, and the last one loaded wins. None of them is here, so this mod contests nothing.
- **`Items_BodyParts.xml` (11)**, **`Hediffs_AddedParts.xml` (11)** and
  **`Recipes_Surgery_Installations.xml` (10)** — the dark matter prosthetics and their surgery.
- **Seven of the nine defs of `ResearchProjects.xml`** — the six projects that gate the armoury,
  and the `ResearchTabDef` they hung on. The two that led to the propagator are kept, folded
  into one; see above.
- **`Traits.xml` (5)** — `PrecursoryPerception`, `HyperMemory`, `Saints`, `Madonna`, `God`. All
  five are human traits; none belongs to either creature.
- **Two of the three effecters** — `Gungnir` and `HolyRight`, which belonged to weapons.
- **`Textures/Animal/Dessicated_DarkMatterBeetle_east.png`** — see below.
- **`Textures/AnimalProjectile/Gabriel.png`** — no def ever referenced it.

### On the thirteen names that collide with the base game

Thirteen def names in the original are also base-game def names. Ten are the power buildings
above, and those are genuine overrides. The other three are not overrides at all, because
RimWorld keys defs per type and these three are of a different type from their namesakes:

| Name | In the mod | In the base game |
|---|---|---|
| `Core` | a `BodyPartDef`, the beetle's dark matter core | an `ExpansionDef` |
| `Doctor` | a `HairDef` | a `WorkTypeDef` |
| `Knight` | a `HairDef` | a `RoyalTitleDef` |

They never fought the base game. They would fight any *mod* that used the same name for the same
kind of def, which is one reason they are renamed here.

## What was changed

### Every def name is prefixed, and every texture moved

The original used bare names throughout, and some of them are names anyone might pick:
hairstyles called `2`, `4`, `5`, `7`, `index`, `aqua`, `blue`, `Thor`, `Terra`, `Doctor` and
`Knight`; body parts called `Core` and `Sword`; body part groups called `Sword`, `AngelCore` and
`FirstWing` through `EighthWing`. Two mods that pick the same def name produce a duplicate, and
RimWorld keeps whichever loaded last without saying so.

Texture paths are worse, because they are a single flat namespace shared by every mod at once.
The original put its hair at `Hair/2`, `Hair/index`, `Hair/blue`, and its dark matter texture in
a folder called simply `Resource` — and `Graphic_StackCount` reads a *folder*, so a second mod
dropping any PNG into `Textures/Resource/` would have turned it into one of dark matter's stack
variants.

So: every def name now begins with `ACS_`, and every texture lives under `Textures/ACS/`. This
was free to do because the mod had never been published under these names; it will not be free
again.

### 1.0 fields that 1.6 no longer has

| Was | Is now | Where |
|---|---|---|
| `<race><wildness>` | `<statBases><Wildness>` | both creatures |
| `<statBases><ToxicSensitivity>0` | `<statBases><ToxicResistance>1` | both creatures |
| `<hairGender>` | `<styleGender>` | all 41 hairstyles |
| `<hairTags>` | `<styleTags>` | all 41 hairstyles |
| `<stuffProps><soundImpactStuff>` | `<stuffProps><soundImpactBullet>` | dark matter |
| `<stuffProps><smeltable>` | gone from stuff; it is a `ThingDef` flag now | dark matter |
| `workSpeedStat` `UnskilledLaborSpeed` | `GeneralLaborSpeed` | all 5 recipes |
| SoundDef `FlameThrower` | `Shot_IncendiaryLauncher` / `Explosion_Flame` | 4 references |

`Wildness` is the one that bites: it is now a stat whose `defaultBaseValue` is −1, deliberately
invalid, so that an animal which fails to declare it is caught rather than quietly defaulted. The
seraph asked for `100` on what is now a 0–1 stat; it is `1` here, the same intent inside the
range.

`ToxicSensitivity` inverted when it became `ToxicResistance`, so `0` became `1`. A third use of
it, a `statFactor` of `-1` on heavenly cloth, is simply gone: a negative multiplier meant nothing
even in 1.0.

`<race><wildBiomes>` still exists in 1.6, so that one was not a migration — but all five of the
beetle's entries were `0`, which is what "never spawns wild" already means by omission. Dropped
as dead text rather than carried.

The `thingSetMakerTag` `RewardSpecial` on dark matter is dead in 1.6: no thing set maker asks for
it. Dropped rather than remapped onto a live tag, which would have put dark matter into quest
reward pools it was never in.

### Defects in the original, corrected

- **The seraph's ranged attack did not work.** `Projectile_isso` asked for
  `AnimalRangeAttack.Projectile_Explode`, a class from a mod that this one neither shipped nor
  declared as a dependency. The def failed to resolve and took the seraph's only ranged verb with
  it. Vanilla `Projectile_Explosive` does the same job — it reads `explosionEffect` from the
  projectile properties — and is used here.
- **The beetle's dried-out corpse graphic could never load.** `dessicatedBodyGraphicData` pointed
  at `Animal/Dessicated_DarkMatterBeetle`, and only an `_east` frame was ever shipped;
  `Graphic_Multi` needs north, east and south. The entry is dropped, so the game falls back to
  the live body drawn rotten — which is what players saw anyway.
- **The beetle's claws were labelled the wrong way round.** The tool named 右爪 (right claw) was
  linked to `BeetleFrontLeftClaw`, and 左爪 (left claw) to `BeetleFrontRightClaw`. The labels
  follow the body part now.
- **The seraph had two left legs.** Its right leg was put in the `AngelLeftLeg` group, leaving
  `AngelRightLeg` defined and used by nothing. Corrected.
- **The eight wings were indistinguishable.** All eight carried the label 天使之翼 with nothing
  to tell them apart, in a health tab that lists them one under the other. They are "first wing"
  through "eighth wing" here, matching the group names the original had already numbered.
- **The seraph could arrive as a manhunter pack.** It carries `combatPower` 10000 and left
  `canArriveManhunter` at its default of true. Vanilla takes its two most dangerous animals out of
  that draw — Thrumbo at 500 and AlphaThrumbo at 800 both set the flag false, and 800 is the
  highest `combatPower` any base-game animal has. The original set the flag on the *beetle*, at
  100, and left it off the seraph. Set false here.

### Two optional patches, added by this mod

Neither exists in the original, and neither needs the other mod: each is guarded by that mod's name and does nothing
without it.

- **A Dog Said... Animal Prosthetics 2** (SamBucher, Workshop 3238353862), `Patches/AnimalProsthetics2.xml`: the white
  rhinoceros beetle is added to that mod's category 3 of surgeries. Its surgeries name vanilla body parts, so they can
  only concern the beetle's vanilla parts; the seraph is left out. This mod loads before it (`loadBefore`), because it
  copies its category lists into its surgeries when it loads.
- **[XND] Nocturnal Animals (Continued)** (XeoNovaDan, continued by Mlie, Workshop 2269731409),
  `Patches/NocturnalAnimals.xml`: the beetle gets that mod's `ExtendedRaceProperties` with body clock `Nocturnal`. The
  seraph keeps the default, diurnal. Nothing is asked of the load order.

## Translation

224 of the original's 248 defs were labelled in Chinese. Everything kept is now labelled in
English on the def side — English is RimWorld's fallback language, so that is where it belongs —
and the original Chinese is kept in `Languages/ChineseSimplified (简体中文)/DefInjected/`, 115
defs' worth - everything but the one effecter, which has no label.

Where the original named a power rather than a person, the English follows it: 超电磁炮 is
"Railgun", 未元物质 is "Dark Matter", 心理掌控 is "Mental Out", 原子崩坏 is "Meltdowner",
前方之风 is "Vento of the Front". Where it named a person, the English is that person's name.

One gap, deliberate: the beetle's eyes and antennae were labelled in English in the original, so
there was no Chinese to preserve. The terms used in the Chinese file are the ones vanilla RimWorld
uses for the same insect parts.

### The eight identical wing labels

RimWorld builds a def-injection path for a list element from its **label**, normalised — spaces to
underscores, then everything outside `[A-Za-z0-9_-]` dropped — and falls back to the element's
defName when it has no label. The seraph's eight wing tools all read 水翼之刃 in the original and
"water wing blade" here: one handle, `water_wing_blade`, for eight entries of the same list.

That does **not** make them untranslatable. RimWorld suffixes a duplicated handle with its rank
**among the duplicates**, counted from zero and independent of its position in the list — Core's
own French and Chinese files write `Rhinoceros.tools.horn-0` and `horn-1` for a rhino's two horns,
and `Animal_Plague.stages.extreme-0` for a stage sitting third in its list. So the wings are
`ACS_Gabriel.tools.water_wing_blade-0` through `-7`, and all eight are translated.

The fallback to a bare index is real, but only when the normalised handle comes out **empty** — an
element with no label at all, or one labelled entirely in CJK, which the normalisation strips to
nothing. Had these tools kept 水翼之刃 on the def side, the index would have been the right answer.
They are in English, so it is not.

## Thanks

- **混沌の味方**, for the two creatures and the forty-one hairstyles.
- The RimWorld modding community, whose habit of crediting abandoned work by name is the only
  reason a mod like this can be brought forward at all.

Made with the help of an AI assistant.
