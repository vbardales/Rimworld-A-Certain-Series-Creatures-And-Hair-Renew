# Backlog

Ideas, reserves not done, with what known about each. Nothing here commitment. Every item touching `Mod/` changes revision under test: needs own offline check and, before stage moves, new complete passes (`Tests/Pickle/README.md`, "Which ticket, in which order"). Done items in `docs/runs/history.md` and `git log`.

## 1. Crossbreeding: decided, nothing

Owner decision (2026-09-25): none. Beetle keeps coming from propagator's egg, no genders, gestation 0; seraph unique by design. Neither has natural partner, so crossing would be invention, not port.
If ever reopened: 1.6 has `RaceProperties.canCrossBreedWith` (both species must name each other), and "Better Crossbreeding" (Workshop 3520675842) picks offspring species through mod extension on mother's race; patch using it depends on it. Designed pair needs partner species chosen by owner and game test whether beetle with genders still hatches from egg same way.

## 2. Animal Prosthetics 2, the mod's own body parts

Only beetle's vanilla parts (eyes, antennae) can take that mod's surgeries; legs, claws, horn, elytra and every seraph part are this mod's own defs. Covering them means patching that mod's recipes one by one (see `Mod/Patches/AnimalProsthetics2.xml`). Not attempted.

## 3. Comments left on the original mod's page (2019-2023)

Read for what they ask, kept here as reserves. First comment under this port (28 September 2026, from port's author) announces move to 1.6, not repeated. Chinese texts summarised in English; nothing here commitment.

- **A railgun, and "magic rim"** (Virsia, 1 March 2019): more of series as separate items. Not part of this port, which keeps original's content. If railgun ever added, it would be new weapon, not port.
- **Dark matter organs cannot be stored or fitted** (a commenter, 5 May 2019, asking mod conflict or bug): in this port brain fragment is trade good and propagator chain only use of dark matter; no surgery fits dark matter organ. Unverified in 1.6: whether any original organ-like items still appear. Related to item 2.
- **How to get the brain fragment** (a commenter, 21 May 2019): answered by port, which keeps bootstrap as built: first fragment bought from exotic trader or Empire; only propagator can grow another (`About.xml`).
- **"Dark matter cannot be installed"** (a commenter, 5 December 2019): same family as organs above; beetle and seraph carry no installable dark matter part in this port.
- **The Index artwork felt out of place** (a commenter, 18 March 2019, about original's art): port draws own header image and gallery, Index shown with `ACS_index` in gallery image 3; nothing to do.
- **Updates for 1.1, 1.4** (2020, 2023): answered by port, which is 1.6 only.