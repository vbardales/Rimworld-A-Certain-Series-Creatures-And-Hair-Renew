---
mod:          A Certain Series - Creatures and Hair Renew (unofficial)
packageId:    nelim.acertainseriescreaturesandhairrenew
repo:         Rimworld-A-Certain-Series-Creatures-And-Hair-Renew
visibility:   public
detached:     yes
stage:        done
licence:      silent
licence_at:   original files and About.xml, Steam description and all 14 comments, author profile, source repository search (2026-09-12)
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

- **`stage: done`** — content complete, with offline validation; this does not mean tested
  in game. All 28 XML files parsed, covering 123 concrete defs and no C# assembly.
  Six shared validators passed during the 2026-09-12 audit:
  `../scripts/Check-XmlFields.ps1`, `Check-DefRefs.ps1`, `Check-XmlClasses.ps1`,
  `Check-TypeRefs.ps1`, `Check-ConfigErrors.ps1` and `Check-DefInjected.ps1`.
  Fields, def references, parents and referenced classes resolved; no unguarded third-party
  type or covered configuration error was reported, and all 200 translation keys passed.
  The standalone `Tests/Test-Mod.ps1` suite was rerun on 2026-09-12: **9 groups passed,
  0 failed**. It covers metadata, XML/local references, textures, combat and anatomy
  regressions, production access, egg hatching and hairstyles. Run instructions and
  limits are in [`TESTING.md`](TESTING.md).
  `.github/workflows/tests.yml` runs this suite on pushes, pull requests and manual
  dispatch. The workflow is committed and pushed; its remote run status has not been
  checked here. Static checks do not replace the pending in-game scenarios.
- **`showcase: complete`** — `Preview.png` at 896x504 with the title engraved, `ModIcon.png` at
  128x128, both full-size renders kept under `Art/`.
  Preview overlay recomposed on 2026-09-12 against `../STYLE_RIMWORLD.md`:
  `Art/Preview.png` is the text-free illustration copied from the preserved
  `Art/Preview-source.png`; no illustration replacement or regeneration was needed.
  `Art/Preview-text.html` holds the layout and reads its only colour palette from
  `Art/preview-palette.json`. `Art/render-preview.cjs` renders and measures it with
  Playwright and sharp (Node.js; set NODE_PATH if packages are not installed locally).
  The veil follows the broad brown stone floor. The ochre tag follows the dominant
  warm stone/earth hue family, lightened for contrast, not a pixel average.
  Under the revised palette rule, the accent now comes from the seraph's blue water
  wings, with increased saturation and lightness. This cool blue is clearly distinct
  from the warm ochre tag and dominant earth colours at both reviewed image sizes.
  Chrome reports actual Segoe UI Semibold for the title, Segoe UI for tag and summary,
  and SegoeUI-Bold for version digits; capture waits for document.fonts.ready.
  Strong title words, the connector and summary share the same primary ink.
  Direct title spans reduce `and` and `Renew` to 0.65em (29.9px), still weight 600;
  `Renew` uses secondary ink. `A Certain Series` retains full size as the series name.
  The ochre secondary ink was lightened further to pass contrast behind `Renew`.
  The separate unofficial
  tag is 24px/400; the 80px corner badge reads the highest stable supportedVersion, 1.6.
  `Art/preview-qa.json` records minimum contrasts over every background pixel in each
  text bounding box with text hidden: primary title 6.09:1, connector 10.87:1,
  Renew 4.68:1, summary 5.36:1, tag 9.01:1;
  badge digits against the opaque accent 8.51:1. No shadow credit is used.
  Visually checked `Mod/About/Preview.png` (896x504, 569528 bytes) and
  `Art/preview-268.png` (268px wide): no overlap or clipping, title and version
  identifiable, reduced title words readable and divider visible. Preview and composition
  sources pushed to GitHub in commit `47be439`; nothing uploaded to the Workshop.
- **`tested_on`, empty** — the mod has never been launched. That is the one real remainder, and
  not one a session can clear on its own: see [`TESTING.md`](TESTING.md), which lays out the run
  in order, the seven strings to search `Player.log` for, and the two questions that have no
  expected answer.
- **`workshop`, empty** — never uploaded, and no `PublishedFileId.txt` in `Mod/`. The Steam
  description is sent only when the item is created and never reprinted: read it once more
  before clicking.
- **`licence: silent`** — no explicit modification or redistribution permission found
  for the original mod in the 2026-09-12 recheck. The installed original contains no
  licence file or permission notice, and its About.xml URL is empty. The
  [Steam description and all 14 comments](https://steamcommunity.com/sharedfiles/filedetails/?id=1667943729#comments)
  contain no general permission to continue or redistribute it. The author's
  [public profile](https://steamcommunity.com/profiles/76561198253882434) has an empty
  summary; no original source repository was linked or identified by the search.
  This records what was found, not proof that no repository exists.
  The Steam description also asks users not to download this version and to remove it
  if installed; the author explains wanting to remake it. A February 2020 comment
  repeats that possibility. This warning is recorded separately from the absence of a
  licence; it is not an authorization to reuse the mod. The February 2019 thanks for
  help with the English description grants no general permission either.
  The classification remains `silent`, with the `(unofficial)` suffix. The local MIT
  licence covers only the extraction's additions, not the original artwork or content;
  see [`LICENSE`](LICENSE) and [`ATTRIBUTION.md`](ATTRIBUTION.md).

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
