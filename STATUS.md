---
mod:          A Certain Series - Creatures and Hair Renew (unofficial)
packageId:    nelim.acertainseriescreaturesandhairrenew
repo:         Rimworld-A-Certain-Series-Creatures-And-Hair-Renew
visibility:   public
detached:     yes
stage:        done
licence:      silent
licence_at:   three places, the mod itself, its About.xml, and the absence of a linked repository
dependencies: none
showcase:     complete
tested_on:
workshop:
remaining:
  - unverified: never seen running in game, and five of the six repairs can only be read in part
  - unverified: does an exotic goods trader carry the brain fragment, without which the machine cannot be built
  - unverified: the beetle's aggression, which turns it manhunter on every hit it takes, does it play out
session:      local_62b40a02-9527-4bdd-a977-f6bbd6de409d
updated:      2026-09-12, kept by the session that holds this mod
---

# A Certain Series - Creatures and Hair Renew — status

A status sheet, read by one sweep over every mod rather than by asking each session in turn. It
lives at the root, never in `Mod/`, so Steam never receives it.

The fields above are kept by the session that holds this mod. What they say today:

- **`stage: done`** — the content is finished and verified cold. 123 defs, no C#, and the
  monorepo's four checkers replayed on 2026-09-11 without a line between them: XML fields valid
  by reflection against the 1.6 assembly, every def reference resolved, no unguarded third-party
  type, 200 translation keys good.
- **`showcase: complete`** — `Preview.png` at 896x504 with the title engraved, `ModIcon.png` at
  128x128, both full-size renders kept under `Art/`.
- **`tested_on`, empty** — the mod has never been launched. That is the one real remainder, and
  not one a session can clear on its own: see [`TESTING.md`](TESTING.md), which lays out the run
  in order, the seven strings to search `Player.log` for, and the two questions that have no
  expected answer.
- **`workshop`, empty** — never uploaded, and no `PublishedFileId.txt` in `Mod/`. The Steam
  description is sent only when the item is created and never reprinted: read it once more
  before clicking.
- **`licence: silent`** — the original author, 混沌の味方, declared no licence anywhere, and the
  mod died in 1.0. Checked in the three places that decide it, set out in
  [`ATTRIBUTION.md`](ATTRIBUTION.md). Redistributed under the usual practice: explicit credit, a
  link to the original, and removal on request.

`remaining` vocabulary: `feature` for something missing from the first cut, `defect` for a known
defect left unfixed, `unverified` for what could not be checked.

`licence` vocabulary: `open` an explicit licence, `silent` no licence and a dead source,
`alive` no licence but a living source, `forbidden` a written refusal, `original` owing nothing
to anyone — not a name, not an idea traceable to one mod, not a value derived from its assets.

- **`dependencies`** — `declared` when every mod this one needs is named in the About's
  `modDependencies`, `to check` when a non-vanilla `loadAfter` suggests a dependency that is not
  declared, `none` when the mod needs nothing. An undeclared dependency is not cosmetic: on
  2026-09-11 Reequilibrage animaux took 47 vanilla animals down with it, Muffalo included, because
  the class it injects belongs to a mod that was not declared and not loaded.
