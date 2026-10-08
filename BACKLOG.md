# Backlog

Ideas and reserves that are not done, with what is known about each. Nothing here is a commitment. Every item that
touches `Mod/` changes the revision under test: it needs its own offline check and, before the stage moves, new complete
passes (`Tests/Pickle/README.md`, "Which ticket, in which order"). Done items are in `docs/runs/history.md` and `git log`.

## 1. Crossbreeding: decided, nothing

Owner's decision (2026-09-25): none. The beetle keeps coming from the propagator's egg, without genders, with a gestation
of 0; the seraph is unique by design. Neither has a natural partner, so a crossing would be an invention, not a port.
If it is ever reopened: 1.6 has `RaceProperties.canCrossBreedWith` (both species must name each other), and "Better
Crossbreeding" (Workshop 3520675842) picks the offspring's species through a mod extension on the mother's race; a patch
that uses it depends on it. A designed pair needs a partner species chosen by the owner and a game test of whether a
beetle with genders still hatches from the egg the same way.

## 2. Animal Prosthetics 2, the mod's own body parts

Only the beetle's vanilla parts (eyes, antennae) can take that mod's surgeries; the legs, claws, horn, elytra and every part
of the seraph are this mod's own defs. Covering them means patching that mod's recipes one by one (see
`Mod/Patches/AnimalProsthetics2.xml`). Not attempted.

## 3. Comments left on the original mod's page (2019-2023)

Read for what they ask, kept here as reserves. The first comment under this port (28 September 2026, from the port's author)
announces the move to 1.6 and is not repeated. Texts in Chinese are summarised in English; nothing here is a commitment.

- **A railgun, and "magic rim"** (Virsia, 1 March 2019): more of the series as separate items. Not part of this port, which
  keeps the original's content. If a railgun were ever added it would be a new weapon, not a port.
- **Dark matter organs cannot be stored or fitted** (a commenter, 5 May 2019, asking whether it is a mod conflict or a bug):
  in this port the brain fragment is a trade good and the propagator chain is the only use of dark matter; no surgery fits
  a dark matter organ. Unverified in 1.6: whether any of the original's organ-like items still appear. Related to item 2.
- **How to get the brain fragment** (a commenter, 21 May 2019): answered by the port, which keeps the bootstrap as built:
  the first fragment is bought from an exotic trader or the Empire; only a propagator can grow another (`About.xml`).
- **"Dark matter cannot be installed"** (a commenter, 5 December 2019): same family as the organs above; the beetle and the
  seraph carry no installable dark matter part in this port.
- **The Index artwork felt out of place** (a commenter, 18 March 2019, about the original's art): the port draws its own
  header image and gallery, and Index is shown with `ACS_index` in gallery image 3; nothing to do.
- **Updates for 1.1, 1.4** (2020, 2023): answered by the port, which is for 1.6 only.
