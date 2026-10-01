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
