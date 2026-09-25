# Backlog

Ideas and reserves that are not done, with what is known about each. Nothing here is a commitment, and nothing
here has been tried in a game. Every item that touches `Mod/` changes the revision under test: it needs its own
offline check and, before the stage moves, new complete passes (`Tests/Pickle/README.md`, "Which ticket, in
which order").

## 1. Nocturnal Animals ([XND] Nocturnal Animals)

**Possible, small.** The mod gives animals a circadian rhythm through a def extension. Read on its Workshop page and
its GitHub wiki, not from a local install:

- Continued version, the one that supports 1.6: Workshop 2269731409, packageId `Mlie.XNDNocturnalAnimals`, name
  "[XND] Nocturnal Animals (Continued)", depends on Harmony. The original (2004368312) is a different item.
- A modder adds `NocturnalAnimals.ExtendedRaceProperties` with a `bodyClock` of `Diurnal`, `Nocturnal` or
  `Crepuscular` to the animal's `ThingDef`, in a `PatchOperationFindMod` guarded by the mod's name, in a patch
  (`PatchOperationAddModExtension`). No dependency, no `loadBefore` asked.
- An animal that is not patched is diurnal. So both creatures already behave as diurnal today, and a patch is a
  choice, not a repair.

**To decide:** which rhythm each creature gets, if any. A patch would be `Mod/Patches/NocturnalAnimals.xml`, the same
shape as `AnimalProsthetics2.xml`, with an offline check in `Test-Mod.ps1` and a feature `@requires`-ing the
package. A fifth pass would need that mod and Harmony in the WSL cache.

## 2. Crossbreeding

**Possible in the game's own terms, but there is no natural partner in this mod, so it needs a decision first.**

- 1.6 has crossbreeding built in: `RaceProperties.canCrossBreedWith` (and `crossAggroWith`), a list of races, which
  has to name the other species on both sides (read from the game's assembly, and from the notes of "Dogs mate
  (Continued)" on its page).
- "Better Crossbreeding" (Workshop 3520675842) adds a mod extension on the *mother's* race to choose whose species
  the offspring takes (maternal, paternal, random, or another species from a weighted list). It "does nothing on its
  own": a mod that uses it depends on it.
- **What limits it here:** the beetle is made in the propagator from an egg, sets `hasGenders` to false and a gestation
  of 0, so it very probably cannot mate at all (to be seen in a game); the seraph has a gender, but nothing in the
  source mod says it crosses with any species. Crossbreeding one of them with a given animal is a design of its own, not a
  port.

**To decide:** which pairs, and what the offspring is. Then the vanilla route means patching the *other* species
as well, per partner mod.

## 3. Animal Prosthetics 2, the mod's own body parts

Only the beetle's vanilla parts (eyes, antennae) can take that mod's surgeries; the legs, claws, horn, elytra and every
part of the seraph are this mod's own defs. Covering them means patching that mod's recipes one by one (see
`Mod/Patches/AnimalProsthetics2.xml`). Not attempted.

## 4. Two review captures that do not show their subject

The research capture is scrolled to the left of the tree and misses the mod's project at (19, 3); the three hairstyle
captures are wide views where no hairstyle can be told (`docs/runs/history.md`, complete English pass). Both scenarios pass
on their assertions. Fixing the pictures changes a feature, so it costs new complete passes.

## Proposals for items 1 and 2 (2026-09-25, to be chosen by the owner; nothing is done)

**Nocturnal Animals.** Proposed: the white rhinoceros beetle **Nocturnal** (rhinoceros beetles are), the seraph
**left as it is** (diurnal by default; an angel that "does not eat and does not age" has no rhythm worth patching).
One patch, `Mod/Patches/NocturnalAnimals.xml`, a `PatchOperationFindMod` on the mod's name adding the
`NocturnalAnimals.ExtendedRaceProperties` extension with `bodyClock` `Nocturnal` to `ACS_DarkMatterBeetle`. To check
before writing it: that the beetle has a rest need at all (a creature without one has no clock to shift), and the exact
extension class and field names, read from the mod's own files once it is in the Windows Workshop folder (it is not now).
Cost: the patch, one offline group in `Test-Mod.ps1`, a `@requires` feature, and a fifth pass that mounts the mod and
Harmony.

**Crossbreeding.** Three options, in the order proposed:
1. **Nothing (proposed).** The beetle has no genders and a gestation of 0, it is made from an egg in the propagator; the
   seraph is unique by design. Neither has a natural partner, so a crossing would be an invention, not a port.
2. **Only refuse.** Say in the description that neither creature crosses, and add nothing.
3. **A designed pair.** Give the beetle genders and a gestation, and let it cross with a named partner from another
   mod, each side patched (`canCrossBreedWith` on both), the offspring chosen through "Better Crossbreeding" (a
   dependency of the patch, never of the mod). This needs a partner species chosen by the owner and a game test of
   whether a beetle with genders still hatches from the propagator's egg the same way.

## Item 4, status

Both captures were reworked on 2026-09-25 (`83232d1`): a local step scrolls the research window to the project, and
the hairstyle scenario ends on the character tab's portrait. Ticket `421e` plays them.
