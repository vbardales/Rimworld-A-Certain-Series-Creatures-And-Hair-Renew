# Publication sheet

**Drafted 2026-09-26. The mod is at `done`.** The Workshop item `3806708754` exists, private, created by the `0.1.0`
prepublication of 2026-09-23; `Mod/About/PublishedFileId.txt` is committed. Ahead: `tested`, the `1.0.0` publication
through the CI, the switch to public (by the owner), the thanks to post. Nothing below has been posted or pasted anywhere.
This sheet holds what the Workshop page asks for and the repository holds nowhere else, so that it serves at the next update
and for whoever takes the mod over.

Rules that apply, and where they are written: `PUBLISHING.md` and `AUDIT.md` (protocols repository, read versions in
`docs/PROTOCOLS-READ.md`), `Rimworld-Release-Admin/docs/OPERATIONS.md` for the CI.

## Before publishing

- **Stage.** `tested` first: a complete Pickle pass, entirely green, on the final `Mod/` in English, French and Chinese, plus
  the passes that mount the optional mods (four: Animal Prosthetics 2, five: Nocturnal Animals), every `@review` capture
  opened by a person, the logs read (`STATUS.md`, `TESTING.md`). Fail-fast policy of the owner (2026-09-25): the publication
  may go once no red is open and the regression pass runs afterwards, but never skips a red scenario replayed green on a
  build with its fix, the gallery, the dry-run of the exact commit, the approval of `steam-production` by the owner, and a
  rollback target chosen beforehand.
- **Publication goes through the CI, not the in-game button.** `.github/workflows/` holds only `tests.yml` today, so the
  publish workflow is still to generate (it is an update of an existing item: the manual workflow of
  `Rimworld-Release-Admin/scripts/generate-publish-workflow.sh`). Never edit `.github/` by hand. Then a dry-run of the exact
  commit (run id and SHA noted in `STATUS.md`), then `dispatch-publish.sh <owner/repo> <workflow.yml> <full SHA> 1.0.0`. Only
  the owner approves `steam-production`. The CI creates the tag and the GitHub release after a successful upload: not by hand.
- **The page still carries the `0.1.0` description.** `SetItemDescription` ran once, at creation. It is replaced only with
  `update_description` on for a publish; the item is private, so the dry-run cannot diff against the page and its printed
  text is read by hand.
- **Payload.** `Mod/` as committed. It carries no assembly: XML, textures and languages only. `Mod/ATTRIBUTION.md` is
  the copy of the root `ATTRIBUTION.md` (to update, see "Still to do" below).

## Steam description

**One source, decided by the owner on 2026-09-25** (`PUBLISHING.md`): the description is written once, in Markdown, in the
block below. The CI converts it to Steam BBCode and generates the plain-text `<description>` of `Mod/About/About.xml` from it,
and every dry-run and publish stops if they differ. The block cannot contain a code fence and its last line is the source
link. The first `sync-about-description.mjs --write` rewrites the `About.xml` text (read the diff).

Written from the current `About.xml`, with these changes to read: headings and links instead of capital lines, the two
optional mods linked, the AI tool named, Pickle named as a development tool. Steam's limit is 8000 bytes; this is about
5 KB.

```markdown
UNOFFICIAL. This mod is published without the original author's explicit consent. If the original author contacts me to request its removal, I undertake to take it down promptly.

Two creatures and forty-one hairstyles, taken out of 某系列MOD by 混沌の味方 and brought forward to RimWorld 1.6.

I am not the author of this mod. The creatures, the textures and the original Chinese text are 混沌の味方's: all I did was pick out the part worth keeping, work out what RimWorld 1.0 wrote that 1.6 no longer understands, and put English on the labels. Credit goes to them; mistakes in the update are mine.

Original mod: [某系列MOD](https://steamcommunity.com/sharedfiles/filedetails/?id=1667943729)

## What it adds

- **The white rhinoceros beetle.** A pack animal grown out of dark matter: it never eats, it feels no cold and no heat, it moves faster than anything else on the map, and the horn on its head is an explosive cannon with a fifty-tile reach. Trainable to advanced, tame at a glance, and it butchers into no meat at all, only dark matter, a metallic stuff that barely wears, does not burn, and makes armour and blades out of all proportion to their weight.
- **God's Power, a seraph.** Eight wings of water, a crystal sword grown out of its right arm, and a shot that opens a five-tile explosion eight times a burst. It lives ten thousand years, feels no pain worth the name, and no one has ever tamed one. Butchering it yields heavenly cloth and a single angel core.
- **The dark matter propagator,** a refrigerator-shaped worktable that makes dark matter multiply, and the chain that runs through it: a preserved fragment of the second-ranked esper's brain, dark matter, a condensed white sphere, and finally an egg that hatches a beetle in a day. One research project unlocks the whole of it.
- **Forty-one hairstyles from the series,** twenty-three female and eighteen male, tagged so that any pawn can be generated with any of them and all of them are available at the styling station.

Neither creature spawns in the wild. The seraph reaches a colony only through exotic goods traders, caravan or orbital. The beetle can be bought the same way, or bred at the propagator. The propagator costs one brain fragment to build, and only a propagator can grow another, so the first fragment has to be bought, from an outlander or orbital exotic trader or from the Empire. That bootstrap is the original author's design, kept as it was.

## What it leaves behind

The original mod also carried Academy City powered armour and weapons, a set of power buildings that redefined vanilla's own, five human traits, and a line of dark matter prosthetics with their surgery. None of that is here. In particular, this mod redefines nothing that belongs to the base game, so it does not compete with any other mod over vanilla defs.

The original gated all of it behind a research tab of its own carrying eight projects. Only two of them concerned the propagator, so they are folded into a single project on the main research tab, at their combined cost. No new research tab.

## Notes

- Every def name carries an ACS_ prefix and every texture sits under Textures/ACS/, so nothing collides with another mod.
- Six defects of the original are corrected (the seraph's ranged attack, the beetle's corpse graphic, swapped claw labels, two left legs, identical wing labels, manhunter packs); ATTRIBUTION.md lists them.
- The Chinese text of the original is kept, in Languages. English and Simplified Chinese.

## Compatible with

- [A Dog Said... Animal Prosthetics 2](https://steamcommunity.com/sharedfiles/filedetails/?id=3238353862): when it is active, the beetle is listed in its category 3. Those surgeries name vanilla body parts, so they can only concern the beetle's vanilla parts, its eyes among them. Its legs, claws, horn and elytra, and every part of the seraph, are this mod's own; the seraph is left out. This mod loads before it, as its author asks of mods that add animals.
- [[XND] Nocturnal Animals (Continued)](https://steamcommunity.com/sharedfiles/filedetails/?id=2269731409): when it is active, the beetle is nocturnal, like a real rhinoceros beetle. The seraph is left diurnal, the default. Nothing is asked of the load order.

Neither is required.

## IF I GO QUIET

If I do not answer within a reasonable time after being contacted, anyone may freely update this or any other of my mods, including publishing a continuation of it. All credit must be preserved.

## AI-GENERATED

This update was made with Claude Code (Anthropic), under human direction, review and testing.

## THANKS

- 混沌の味方, for [某系列MOD](https://steamcommunity.com/sharedfiles/filedetails/?id=1667943729): the beetle, the seraph, the propagator and the forty-one hairstyles are all theirs. This is their work, carried forward.
- SamBucher, for [A Dog Said... Animal Prosthetics 2](https://steamcommunity.com/sharedfiles/filedetails/?id=3238353862), whose surgeries the beetle can now receive.
- XeoNovaDan, for the idea of [Nocturnal Animals](https://steamcommunity.com/sharedfiles/filedetails/?id=2004368312), and Mlie, for keeping it alive as [Nocturnal Animals (Continued)](https://steamcommunity.com/sharedfiles/filedetails/?id=2269731409): it is what lets the beetle keep a night owl's hours.
- Pickle (RimWorks) and [PickleTools](https://steamcommunity.com/sharedfiles/filedetails/?id=3806142401), used to test this mod in the game: development tools only, never a dependency of the mod. RimLogging too, for the same reason.

What was taken, what was left and what was changed is listed in ATTRIBUTION.md, in the repository linked below.

[Source code on GitHub](https://github.com/vbardales/Rimworld-A-Certain-Series-Creatures-And-Hair-Renew)
```

Checked on the Workshop page of Nocturnal Animals (Continued) on 2026-09-26: it is Mlie's update of XeoNovaDan's mod, so the
two credits in THANKS are right. Its page says a mod-added animal that is not patched stays diurnal (which is why the beetle is
patched), that it has in-game settings for every animal, and comments report that on some setups every animal shows as
"diurnal" and Reset does not restore the default (load-order dependent, with Vanilla Expanded mods). So a player may see the
beetle diurnal through that mod's own settings: not a defect of this patch, worth a line in the FAQ if it is asked. The
original mod carries no licence: `ATTRIBUTION.md` says so, and the description says "unofficial" first.

## Thanks comments to post, after the item is public

State of the three recipients of this mod: `WORKSHOP_COMMENTS.md` (added 2026-09-26, all `drafted`). The registry decides
whether a send is still needed; method, cadence (three a day at most, not in a row) and the removal rule are in its
"Writing a comment". Animal Prosthetics 2 (SamBucher) has its row, drafted from `DalmatiansRenew/PUBLICATION.md`: one
comment per page, so this mod adds nothing there. Pickle and RimLogging are `posted`, and this mod is added to their
`Covers`. Harmony is not named here (the mod does not use it).

The drafts are mine, in English, to be read and rewritten in her own voice before any sending: they are drafts, not text
she wrote. Each holds one link to this mod behind BBCode and says nothing about compatibility the authors did not declare.

**1667943729, 某系列MOD (混沌の味方).** Read the page's last comments first (Chinese; is the author still there?).

```
Hi! I took the white rhinoceros beetle, the seraph and the 41 hairstyles out of your mod and brought them to 1.6, as [url=https://steamcommunity.com/sharedfiles/filedetails/?id=3806708754]A Certain Series - Creatures and Hair Renew (unofficial)[/url]. Everything is credited to you, and if you'd rather I take it down, tell me and I will :)
```

**2269731409, Nocturnal Animals (Continued), Mlie.**

```
Thanks for keeping Nocturnal Animals going! One thing on my side: the white rhinoceros beetle in [url=https://steamcommunity.com/sharedfiles/filedetails/?id=3806708754]A Certain Series - Creatures and Hair Renew[/url] now keeps night hours through your extension, and my patch does nothing when your mod isn't there xD
```

**2004368312, Nocturnal Animals, XeoNovaDan (the original).** Only if the page still takes comments.

```
Thanks for the idea behind Nocturnal Animals. Mlie carries it now, and it is what gives the beetle of [url=https://steamcommunity.com/sharedfiles/filedetails/?id=3806708754]A Certain Series - Creatures and Hair Renew[/url] its night hours. No answer needed :)
```

## Change notes (Steam), one block per version

The CI reads the block under `### <version>` and sends it as written (BBCode); its first line must carry the version.

### 1.0.0

> [b]1.0.0[/b]
> First public release. Adds the white rhinoceros beetle and the seraph, the dark matter propagator with its production
> chain and its research project, and forty-one hairstyles, brought forward from 某系列MOD to RimWorld 1.6. New since the
> private 0.1.0: the beetle is offered Animal Prosthetics 2's surgeries and is nocturnal with Nocturnal Animals (both
> optional), and the mod is tested in English, French and Chinese. English and Simplified Chinese.

Confirm the sentence against the passes that were actually green before sending: it says what a person was shown.

### 0.1.0 (prepublished by hand on 2026-09-23, kept for the record)

> [b]0.1.0[/b]
> First private upload.

## Dependencies and DLC

**No DLC and no mod is required.** `supportedVersions` declares 1.6 only. `loadBefore` names Animal Prosthetics 2 only,
because its patch copies the category lists into its surgeries when it loads. Nocturnal Animals asks for no order.

## Gallery (manual: no tool of the chain can send it)

Not settled. A folder holding only the images to upload, numbered `01-`, `02-` in page order, no old version, no raw capture
(`PUBLISHING.md`, Images). Candidates, in the order to try; every image is opened and looked at before it is listed:

| Order | What it should show | Source |
|---|---|---|
| 1 | The three hairstyles, one pawn each, filling the screen, in the zen studio | Feature 17 (`@review`), pending its replay at one cell |
| 2 | The propagator and its research project in view | Feature 06 capture "research dark matter propagation in view" |
| 3 | The beetle and the seraph | To take in the studio (`ScreenshotStudio`) |

Rule of the owner: what is not interface must be zoomed enough to be seen; a pawn (clothes, hair) nearly fills the screen.

## Still to do before `prepublished`

- Update `ATTRIBUTION.md` (done 2026-09-26, root and `Mod/`: a Markdown file, the game and the tests do not read it)
  and its copy in `Mod/`.
- The registry of Workshop comments (`WORKSHOP_COMMENTS.md`), the thanks to post once the item is public, the dry-run.
- The Steam page description is hand-edited by the owner or replaced by `update_description`.
