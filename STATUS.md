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
stage:        published
workflow_stage: published
licence:      silent
licence_at:   original files and About.xml, Steam description and all 14 comments, author profile, source repository search (2026-09-12)
upstream_mod_remotes: N/A  # rechecked 2026-09-30: none found (GitHub search, Workshop page of 1667943729 links no repository)
dependencies: none
showcase:     complete
tested_on:    six complete passes green on the tree of `f678f05` (2026-09-28): English `a013`, French `45e1`, Chinese `6ad3`, Animal Prosthetics 2 `5558`, Nocturnal Animals `d901`; gallery `9b6e` and `ba7b` (2026-10-07, features 17 and 18 rewritten, with Venus Touch Waistlines). `1.0.1` (`2234e57`) changed only seven French hairstyle labels, the About description and the Preview: not replayed, no scenario reads them
workshop:     3806708754
remaining:
  - unverified: whether a trader other than the two exotic ones sells the creatures (the description says exotic goods traders only); whether the beetle's vanilla parts (eyes, antennae) have a surgery in Animal Prosthetics 2; the beetle's aggression (subjective, not automated)
  - fragile: `Mod/Patches/NocturnalAnimals.xml` guards on the other mod's display name (`[XND] Nocturnal Animals (Continued)`); `Tests/Test-Mod.ps1` group 14 compares it with the installed copy when present
  - asked of PickleTools, no reply: Chinese fonts missing in the research-window capture (every project affected); a `forcedMiss` rule for `Check-ConfigErrors.ps1`. A 4 GB core dump from a crashed run of 2026-09-28 has no known path
  - cleanup after the last Pickle ticket (`20261008-164649-854-7899`): remove from the WSL install the mods this mod's sessions downloaded (Workshop cache of Animal Prosthetics 2 `3238353862`, Nocturnal Animals Continued `2269731409` and Harmony, if this mod's sessions put them there and no other mod's map needs them), under the machine lock, after listing what goes and what stays; then say here what was removed
  - ideas not started: `BACKLOG.md`
session:      local_0370d2fc-d327-4091-bf8f-6481630fa3aa
updated:      2026-10-08, gallery migrated to the Backlot with eyes and faces (runs `209d`, `fc2b`; images 1 to 3 replaced), 2026-10-07 gallery played and installed as the series "Noon at the Sanctuary" (features 17 and 18, runs `9b6e` and `ba7b`, JPEG 1.8 MB), two French corrections from the owner's review (`fabrication au`, the beetle is born wild, `n'amasseront jamais`); `_tools/` moved to `scripts/`, `Art/Preview.png` renamed `Preview-source.png`, thanks drafts kept in PUBLICATION.md
---

# A Certain Series - Creatures and Hair Renew — status

Fields above are read by the sweep over every mod; this body is the short record of the current state. Dated detail
lives in `docs/runs/history.md` (one line per run and per event), `CHANGELOG.md`, `PUBLICATION.md` and `git log`.

## Where it stands

- **1.0.3 prepared (2026-10-08):** dry-run `37821935505` green on SHA `79a2d2e137d261b152f3247558c9464d0d5ce68c` with `update_preview` and `update_description` (the gallery of seven files is uploaded by hand); PUBLISHED 2026-10-08 (run `37827987746`, tag `v1.0.3`, Workshop item 3806708754), gallery uploaded by hand by the owner.
- **Dates given by the owner (2026-10-08, local time):** `1.0.0` on 28 September, `1.0.1` on 30 September, `1.0.2` on 1 October (the CI run of `1.0.2` started at 22:08 UTC on 30 September, so after midnight in Paris). Her three production gestures of `1.0.0` (public, subscription to the comments, Watch all activity of the mod and the parent mods) are taken as made at that release, 28 September: tell me if they were made on another day.
- **Published versions:** `1.0.2` (2026-09-30 UTC, run `36783796843`, SHA `890c8743a46b930632a4da7ebf0bfb21ddeb8067`, dry-run `36782547484`, `update_preview` on: sent the header image, `Mod/About/Preview.png`), `1.0.1` (2026-09-30, run `36777976468`, SHA `2234e57eabd079127d1e825f90dff5c3f5eb2fca`, dry-run `36777795874`) and `1.0.0` (2026-09-28, run `36393488106`, SHA `f678f051bcea3ed5fa13eaa6026ece9016f295f8`). Item `3806708754`, public; the CI created tags `v1.0.0`, `v1.0.1`, `v1.0.2` and the releases. `1.0.1` ran with every `update_*` option off (the owner uploaded the gallery by hand); `1.0.2` sent the header image. Tags, description and title were never sent by the CI; the owner checked the public page on 2026-10-01 (header image, change note, tags): up to date. The description is regenerated from `PUBLICATION.md` (`node .github/scripts/sync-about-description.mjs --write`). Rollback target: `v1.0.0` (the earlier commits carry the old packageId).
- **packageId** `nelim.acertainseriescreaturesandhair` (shortened on 2026-09-28, owner: "retire renew"). Folder, repository, assembly and display names keep "Renew".
- **Tests:** 14 Pickle features (`Tests/Pickle/`), five complete passes plus two gallery features (`tested_on`); `Tests/Test-Mod.ps1` (14 groups) and `Tests/Test-Translations.ps1` (202 English, 202 French) green on `HEAD`. No `@wip`, every `@requires` played, no manual check left (`TESTING.md`). Evidence: `Tests/Pickle/Evidence/`, ignored, one minified report per pass (see `TESTING.md`, "Evidence to keep").
- **Thanks:** the description's THANKS section is complete and the comments are posted (`../WORKSHOP_COMMENTS.md`).
- **Licence `silent`:** no permission found for the original mod (recheck 2026-09-12: no licence file, empty About URL, no permission in the Steam description or its 14 comments, empty author profile, no source repository). The mod is `(unofficial)`, the MIT notice covers only the additions: see `LICENSE` and `ATTRIBUTION.md`. No git repository exists for the original (searched again 2026-09-30): no pull request possible.
- **Settings:** none, no page and no shortcut. Inventory: no `Source/`, no assembly, no `Keyed` folder, no `ModSettings` class, no MainButtons def in `Mod/` or `Tests/`.
- **Compatibility** (optional, offline test group and Pickle passes 4 and 5): Animal Prosthetics 2 (beetle in its category 3, `loadBefore`), Nocturnal Animals Continued (beetle nocturnal). The seraph is left out of both on purpose. Crossbreeding: decided, nothing (`BACKLOG.md`). **Dogs mate (Continued) and Better Crossbreeding** (`PUBLISHING.md`, four integrations for animal mods; the owner's rule of 2026-10-01 asks for a recorded decision): neither patch applies, by the owner's decision of 2026-09-25 (no crossbreeding). The beetle has no genders and a gestation of 0 and is made from an egg in the propagator, so it cannot mate; the seraph is unique by design. Nothing to add to `pawnKinds` of a Dogs mate group, no `canCrossBreedWith`, no Better Crossbreeding extension. Reopen only if the owner designs a pair (`BACKLOG.md`, item 1).

- **Content boxes:** adult content and violence both unticked, decided by the owner on 2026-10-01 (`PUBLICATION.md`, Content boxes).

## Translation audit

French lives entirely in `Mod/Languages/French/DefInjected/` (no Keyed folder: nine files, one per def type). All nine were read by hand (`TRANSLATIONS.md` section 3): none contains a `{PAWN_gender ? ...}` switch and none needs one, every text names a creature, a body part, an object or a hairstyle's namesake, never the colonist. `FRENCH_REVIEW.md` (`scripts/Generate-FrenchReview.ps1`, stamps the revision) was validated by the owner on 2026-09-30; `translation_fr: complete`. HairDef names follow fr.wikipedia: titles and Level 5 names stay in their original form. Any later French edit resets the field to `unchecked`. The French text shipped since `1.0.1` is the validated one.

## Vocabulary

`remaining`: `feature` missing from the first cut, `defect` known and unfixed, `unverified` not checked.
`licence`: `open` explicit licence, `silent` none and a dead source, `alive` none but a living source, `forbidden` a
written refusal, `original` owing nothing to anyone. `dependencies`: `declared` every needed mod is in
`modDependencies`, `to check` a non-vanilla `loadAfter` suggests an undeclared one, `none` the mod needs nothing (an
undeclared dependency is not cosmetic: it took 47 vanilla animals down with another mod on 2026-09-11).
