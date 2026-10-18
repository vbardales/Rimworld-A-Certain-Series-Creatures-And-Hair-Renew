---
localization: complete
translation_en: complete
translation_fr: complete
settings_audit: not_applicable
mod:          A Certain Series - Creatures and Hair Renew (unofficial)
packageId:    nelim.acertainseriescreaturesandhair
repo:         Rimworld-A-Certain-Series-Creatures-And-Hair-Renew
visibility:   public
detached:     yes
workflow_stage: shootGallery[1.1.1]
code_review_sha: b104320eec3f940a2635974207bb47c5326a094a
echo_review_sha: 477b9e4bd80011340e0fb57bc8b0a8d2ee7a72df
social_preview_sha256: 383dbb11480a6d890ae846cea5ec203e9730ad26c78b4e86c760a6458c145f94
publication_changelog_review_sha: 71cc9df2e721d01d44c03984861472cdf29fb52c
licence:      silent
licence_at:   original files and About.xml, Steam description and all 14 comments, author profile, source repository search (2026-09-12)
upstream_mod_remotes: N/A  # rechecked 2026-09-30: none found (GitHub search, Workshop page of 1667943729 links no repository)
dependencies: none
showcase:     complete
tested_on:    six complete passes green on the tree of `f678f05` (2026-09-28): English `a013`, French `45e1`, Chinese `6ad3`, Animal Prosthetics 2 `5558`, Nocturnal Animals `d901`; gallery `9b6e` and `ba7b` (2026-10-07, features 17 and 18 rewritten, with Venus Touch Waistlines). `1.0.1` (`2234e57`) changed only seven French hairstyle labels, the About description and the Preview: not replayed, no scenario reads them. 2026-10-11 on `267a4d8` (Mod/ differs from the tested tree only by the description): features 19 (who sells the creatures, `2026-10-11-sellers-temper-2`), 20 (surgery with Animal Prosthetics 2, pass `avec-ads2`, rerun on the promoted DefFieldSteps `2026-10-12-surgery-promoted`) and 21 (temper when hurt, `2026-10-11-temper-3`) green; 2026-10-14 and 15 on `b104320` (1.1.0, `Mod/` unchanged since): English feature 02 `2026-10-14-regression-en-3` and French feature 03 `2026-10-14-regression-fr-2` green
tested_1_7:   yes  # 2026-10-13, ticket 72c6, feature 01-loads only (1 passed, 0 failed), RimWorld 1.7.4976 rev1043, English, map sans-facultatifs, on e12a2f3; no supportedVersions change before Virginie confirms
workshop:     3806708754
remaining:
  - unverified: the sampled stocks show the beetle at four trader kinds and the seraph at two, not every seller of the possible list (the defs name four kinds with Royalty); how dangerous the beetle feels in a colony (balance, not automatable)
  - fragile: `Mod/Patches/NocturnalAnimals.xml` guards on the other mod's display name (`[XND] Nocturnal Animals (Continued)`); `Tests/Test-Mod.ps1` group 14 compares it with the installed copy when present
  - asked of PickleTools, no reply: Chinese fonts missing in the research-window capture (every project affected); a `forcedMiss` rule for `Check-ConfigErrors.ps1`. A 4 GB core dump from a crashed run of 2026-09-28 has no known path
  - ideas not started: `BACKLOG.md`
session:      local_c33e3e19-adcf-41c2-9400-2c2ea35e1a9e
updated:      2026-10-18, redo-5 of scenes 1, 3, 4, 6 filed as one ticket 349b (d464 and 6cab cancelled, superseded); owner review pending
protocols_read_sha: b7ed0bd92ef9c1a1a5c74fa52332110b024377dd
---
# A Certain Series - Creatures and Hair Renew — status

Fields above read by sweep over every mod; this body = short record of current state. Dated detail
in `docs/runs/history.md` (one line per run and per event), `CHANGELOG.md`, `PUBLICATION.md`, `git log`.

## Where it stands

- **1.1.0 published (2026-10-13):** run `38413725207` (dry-run `38413192907`, `update_preview`, `update_description`, `update_tags`), tag `v1.1.0` and release by CI, SHA `b104320eec3f940a2635974207bb47c5326a094a`, Workshop item 3806708754. Content: `<li>1.7</li>` next to `1.6` (`tested_1_7: yes`, English only, `01-loads` on 1.7.4976), descriptions say "the latest RimWorld version", Preview with `1.7` badge, French dark matter work label `fabrication avec le`. **Tags `Mod, 1.6, 1.7` on public page** (checked via `GetPublishedFileDetails` 2026-10-15). First read 2026-10-13, right after upload, still showed `Mod, 1.6`: API served stale answer, tag not dropped (earlier hypothesis that `1.7` missing from game's tag list wrong). Non-regression (14.a) on `b104320`, `Mod/` unchanged since: English feature 02 (3 passed) and French feature 03 (2 passed) green, feature 13 French green before commit (ticket `5f29`); `Test-Mod.ps1` 14 of 14 and `Check-Translations -Strict -RejectIdentical` green. Rollback target `v1.0.4`. Audit chain of 1.1.0 and recorded deviations (`publish[1.1.0]` never written, first dry-run on undated CHANGELOG) in `docs/runs/history.md`.
- **Earlier versions:** `1.0.0` (2026-09-28), `1.0.1`, `1.0.2`, `1.0.3`, `1.0.4` (2026-10-11), tags `v1.0.0` to `v1.0.4`, runs, SHAs, change notes in `docs/runs/history.md`; owner checked public page 2026-10-01.
- **packageId** `nelim.acertainseriescreaturesandhair` (shortened 2026-09-28, owner: "retire renew"). Folder, repository, assembly, display names keep "Renew".
- **Tests:** 14 Pickle features (`Tests/Pickle/`), five complete passes plus two gallery features (`tested_on`); `Tests/Test-Mod.ps1` (14 groups) and `.github/scripts/Check-Translations.ps1 -Strict -RejectIdentical` (shared; 148 texts + 54 nested, English and French) green on `HEAD`. No `@wip`, every `@requires` played, no manual check left (`TESTING.md`). Evidence: `Tests/Pickle/Evidence/`, ignored, one minified report per pass (see `TESTING.md`, "Evidence to keep").
- **Thanks:** description THANKS section complete, comments posted (`../WORKSHOP_COMMENTS.md`).
- **Licence `silent`:** no permission found for original mod (recheck 2026-09-12: no licence file, empty About URL, no permission in Steam description or its 14 comments, empty author profile, no source repository). Mod is `(unofficial)`, MIT notice covers only additions: see `LICENSE` and `ATTRIBUTION.md`. No git repository for original (searched again 2026-09-30): no pull request possible.
- **Settings:** none, no page, no shortcut. Inventory: no `Source/`, no assembly, no `Keyed` folder, no `ModSettings` class, no MainButtons def in `Mod/` or `Tests/`.
- **Compatibility** (optional, offline test group and Pickle passes 4 and 5): Animal Prosthetics 2 (beetle in its category 3, `loadBefore`), Nocturnal Animals Continued (beetle nocturnal). Seraph left out of both on purpose. Crossbreeding: decided, nothing (`BACKLOG.md`). **Dogs mate (Continued) and Better Crossbreeding** (`PUBLISHING.md`, four integrations for animal mods; owner's rule 2026-10-01 asks for recorded decision): neither patch applies, owner's decision 2026-09-25 (no crossbreeding). Beetle has no genders, gestation 0, made from egg in propagator, so cannot mate; seraph unique by design. Nothing to add to `pawnKinds` of Dogs mate group, no `canCrossBreedWith`, no Better Crossbreeding extension. Reopen only if owner designs a pair (`BACKLOG.md`, item 1).

- **Content boxes:** adult content and violence both unticked, owner decided 2026-10-01 (`PUBLICATION.md`, Content boxes).

- **Gallery redo-2 read (2026-10-17):** ticket `c094` (scenes 1, 2, 3, 6) read by the session, all four accepted: 1 faces front and the bookcase reads as books; 2 white hair against the black coat, piano and peacock; 3 hairstyle clear, the shelf of the scene name is not in frame but the subtitle (quiet corner) fits; 6 one propagator with the lightning icon, one running. 4, 5, 7 from `2026-10-15-gallery-redo-1`. Reindexed 1 to 7, clean originals in `Art/Gallery-clean/`, subtitled images in `Art/Gallery/` (`Add-Subtitle.ps1`, lines of `PUBLICATION.md`), 3.7 MB and 2.9 MB. Echo kept (same subjects as the gallery). Scene 3 judged the weakest (bare floor, husky from behind): recomposed in feature 17 (`7670ae1`, two torches, three daylilies), ticket `20261017-224756-367-d464` in queue (scene 3 alone, evidence `Tests/Pickle/Evidence/2026-10-17-gallery-redo-3`), wakes the session with `RUN_DONE`. Next: read `summary.json`, open the capture, rebuild `3-hairstyle-index.jpg` and its subtitle if it holds, owner reviews the seven images, Preview unchanged. Feature 13 (`@fr-only`) ran in an English game in `c094` and failed: harness artefact, cause not found, not a mod defect (no `Mod/` change).
- **Gallery redo-5 (2026-10-18, owner asked to rework 1, 3, 4, 6):** read the old clean originals: 3 husky seen from behind at the back of a bare floor; 4 beetle small, Nelim in profile far from it; 6 dark, cat from behind. Edits (`Gallery redo-5` commit): 3 husky moved in front of Sena (z 150); 4 frame (194, 150) to (200, 155), beetle (197, 153), hen (197, 151), daylily added; 6 two more torches, cat in front (200, 151), frame (195, 149) to (206, 156); 1 keeps redo-4. One ticket `20261018-060527-057-349b` (scenes 1, 3, 4, 6, evidence `Tests/Pickle/Evidence/2026-10-18-gallery-redo-5`); old tickets d464 and 6cab cancelled. Next: read captures, loop.
- **Gallery redo-4 (2026-10-18, session director verdict, owner asked to iterate until fully satisfied):** read the seven clean originals. Keep 2, 5, 7 (4 acceptable, beetle small but readable). Weak: 1 (top half bare wall, pawns and hairstyle tiny: now framed at 2 cells' height on (187, 124), cat at z 125), 3 (bare floor, husky from behind: d464 pending), 6 (too dark, bookcase reads as crate, wide frame: bookcase swapped for two more lit torches, frame (194, 149) to (207, 157)). Ticket `20261018-000742-272-6cab` (scenes 1 and 6, evidence `Tests/Pickle/Evidence/2026-10-18-gallery-redo-4`). Loop: read captures, recompose what is still weak, until no scene is weak, then rebuild index and subtitles.
- **Gallery redo (reopened 2026-10-17, owner go, `1.1.1` gallery only, no `Mod/` change):** states `code` to `playTests` of `1.1.1` touch nothing (no code, dependency, setting, text or test change). Run `2026-10-15-gallery-redo-1` read by the session: 4, 5, 7 strong; 1 (Rina in profile, Nelim sweating), 2 (Nelim out of frame), 3 (bookcase reads as a crate, squirrel as a worm), 6 (both propagators show the lightning icon) recomposed in features 17 and 18, replayed alone. Subtitle lines in `PUBLICATION.md`, "Gallery subtitles".

## Shotlist (write-shotlist, 2026-10-18; written after the first captures, kept as the director's record)

Source: headers of `Tests/Pickle/Mod/Pickle/Features/17-gallery-hairstyles.feature` and `18-gallery-creatures.feature` (one line per shot, story included). Story: "Nelim hosts the series", one afternoon and evening in her Sanctuary, 12:00 to 20:00, one image per hour or two. Nelim is the protagonist; Rina, Toma, Sena are guests wearing the three hairstyles; the evening brings the creatures, the machine and everybody together. Rhythm: `I set the hour to N` per scenario (12, 14, 16, 17, 18, 19, 20); weather not set by any scenario, the fixture's own (clear). DepMap for all seven: `Tests/Pickle/wsl-deps.galerie.map` (Sanctuary base, nothing challenged, no extra mod). Steps: PickleTools (decor, floor, framing, animals, face kit, presentation mode), Sanctuary steps, this mod's own (`I give ... the hairstyle`, `a "..." pawn stands at`, `I bring the camera to N cells' height`). No step missing.

| # | Place, hour | Subject, what it says | Composition | Living things | Decor (defNames) | Type, subtitle |
|---|---|---|---|---|---|---|
| 1 | sofa-corner, 12:00 | Misaka hairstyle: Rina drops by, Nelim kept the good sofa | camera 2 cells high on (187, 124), tight on the two pawns, both facing South | Rina (thin, smile, cream blouse and deep brown), Nelim (own face), house cat `Cat` facing camera | fixture sofas and rose rug | scene, line 1 |
| 2 | terrace, 14:00 | Accelerator hairstyle: Toma keeps to the piano | frame (194, 118) to (200, 123), Toma off-centre by the piano | Toma (male, drafted, all black with `Apparel_Duster`), Nelim facing him, `Peacock` facing camera | fixture brick, black piano | scene, line 2 |
| 3 | emerald-clearing (podium), 16:00 | Index hairstyle: Sena in a quiet corner | frame (194, 149) to (200, 155), warm wood floor | Sena (white robe, gold sash, calm), Nelim beside her, `Husky` facing camera | `WoodPlankFloor`, `TorchLamp` x2, `Plant_Daylily` x3 | scene, line 3 |
| 4 | podium, 17:00 | the white rhinoceros beetle, Nelim close for scale | frame (194, 148) to (200, 155), beetle centred | beetle `ACS_DarkMatterBeetle`, Nelim, `Chicken` facing camera | `WoodPlankFloor`, `TorchLamp`, `Stool` | scene, line 4 |
| 5 | podium, 18:00 | the seraph, eight wings | frame (193, 148) to (201, 157), high enough for the wings | `ACS_Gabriel`, Nelim facing it, Rina, Toma, Sena behind, `Peacock` facing camera | `WoodPlankFloor`, `TorchLamp` x2 | scene, line 5 |
| 6 | podium, 19:00 | dark matter propagator, one running, one waiting for power | frame (194, 149) to (207, 157), tight on the machines | Nelim working, `Cat` between the machines facing camera | `ACS_DarkMatterProduction` x2, `VanometricPowerCell` x5, `TorchLamp` x3, `WoodPlankFloor` | scene, line 6 |
| 8 | window-backdrop-for-height (interface) | research window on `ACS_DarkMatterTech`: what it takes to build the machine | window cropped 5 px either side of the window, full height | none | none | `nelim.pickletools.research` added to the DepMap; steps of feature 06 (open the research tab, scroll to the project) | interface window, no subtitle; PLANNED, not written |
| 7 | podium, 20:00 | everybody stayed | frame (192, 148) to (202, 157), row of four at dusk, beetle behind | Rina, Nelim, Sena, Toma facing camera, beetle, `Chicken` | `WoodPlankFloor`, `TorchLamp` x4 | scene, line 7 |

Self-score: **4 of 5** (re-run 2026-10-18 after redo-5). Met: one story moving forward by the hour; every shot has living things and a reason for its decor; no catalogue plate; places and hours vary on purpose (three places, seven hours, weather clear on purpose); every field filled, redo-5 changes included; each image says what its subtitle says; shot 8 planned so the offer includes the research and the interface. Weak points: (1) shot 8 not written yet, so the interface and the research are still not in the gallery; (2) three hairstyles shown out of about fifty, chosen for contrast (the Preview and description carry the variety); (3) ranged attack, butchering and traders live only in tests. Kept: seven images read by the director, redo loop continues until none is weak.

## Translation audit

French lives entirely in `Mod/Languages/French/DefInjected/` (no Keyed folder: nine files, one per def type). All nine read by hand (`TRANSLATIONS.md` section 3): none contains `{PAWN_gender ? ...}` switch, none needs one, every text names creature, body part, object or hairstyle's namesake, never colonist. `FRENCH_REVIEW.md` (`scripts/Make-FrenchReview.ps1`, stamps revision) validated by owner 2026-09-30. 2026-10-11: `ACS_AngelCore.description` changed in English and French for 1.0.4 (`19f331e`); owner (Virginie) reread both texts, validated 2026-10-11 at revision `df9fba5c68833549464a7eadc2d85cdb1eb24ae4`, no correction; `translation_en` and `translation_fr` `complete` again. HairDef names follow fr.wikipedia: titles and Level 5 names stay in original form. Any later French edit resets field to `unchecked`. French text shipped since `1.0.1` is the validated one.

## Vocabulary

`remaining`: `feature` missing from first cut, `defect` known and unfixed, `unverified` not checked.
`licence`: `open` explicit licence, `silent` none and dead source, `alive` none but living source, `forbidden` written refusal, `original` owing nothing to anyone. `dependencies`: `declared` every needed mod in
`modDependencies`, `to check` non-vanilla `loadAfter` suggests undeclared one, `none` mod needs nothing (undeclared
dependency not cosmetic: took 47 vanilla animals down with another mod 2026-09-11).