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
workflow_stage: dormant[1.1.0]
code_review_sha: b104320eec3f940a2635974207bb47c5326a094a
echo_review_sha: 1c3da6940c5b8d25c868288e5cd6ba2784ba900f
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
updated:      2026-10-15, 1.1.0 published (v1.1.0, b104320); non-regression green; cleanup before dormancy
protocols_read_sha: 7db1e37ab197dac63501eb0554896a23a4ac9fed
---

# A Certain Series - Creatures and Hair Renew — status

Fields above are read by the sweep over every mod; this body is the short record of the current state. Dated detail
lives in `docs/runs/history.md` (one line per run and per event), `CHANGELOG.md`, `PUBLICATION.md` and `git log`.

## Where it stands

- **1.1.0 published (2026-10-13):** run `38413725207` (dry-run `38413192907`, `update_preview`, `update_description`, `update_tags`), tag `v1.1.0` and release by the CI, SHA `b104320eec3f940a2635974207bb47c5326a094a`, Workshop item 3806708754. Content: `<li>1.7</li>` next to `1.6` (`tested_1_7: yes`, English only, `01-loads` on 1.7.4976), descriptions say "the latest RimWorld version", Preview with the `1.7` badge, French dark matter work label `fabrication avec le`. **Tags `Mod, 1.6, 1.7` are on the public page** (checked through `GetPublishedFileDetails` on 2026-10-15). A first read on 2026-10-13, right after the upload, still showed `Mod, 1.6`: the API served a stale answer, the tag was not dropped (the earlier hypothesis that `1.7` was missing from the game's tag list was wrong). Non-regression (14.a) on `b104320`, `Mod/` unchanged since: English feature 02 (3 passed) and French feature 03 (2 passed) green, feature 13 French green before the commit (ticket `5f29`); `Test-Mod.ps1` 14 of 14 and `Check-Translations -Strict -RejectIdentical` green. Rollback target `v1.0.4`. The audit chain of 1.1.0 and its recorded deviations (`publish[1.1.0]` never written, first dry-run on an undated CHANGELOG) are in `docs/runs/history.md`.
- **Earlier versions:** `1.0.0` (2026-09-28), `1.0.1`, `1.0.2`, `1.0.3`, `1.0.4` (2026-10-11), tags `v1.0.0` to `v1.0.4`, runs, SHAs and change notes in `docs/runs/history.md`; the owner checked the public page on 2026-10-01.
- **packageId** `nelim.acertainseriescreaturesandhair` (shortened on 2026-09-28, owner: "retire renew"). Folder, repository, assembly and display names keep "Renew".
- **Tests:** 14 Pickle features (`Tests/Pickle/`), five complete passes plus two gallery features (`tested_on`); `Tests/Test-Mod.ps1` (14 groups) and `.github/scripts/Check-Translations.ps1 -Strict -RejectIdentical` (shared; 148 texts + 54 nested, English and French) green on `HEAD`. No `@wip`, every `@requires` played, no manual check left (`TESTING.md`). Evidence: `Tests/Pickle/Evidence/`, ignored, one minified report per pass (see `TESTING.md`, "Evidence to keep").
- **Thanks:** the description's THANKS section is complete and the comments are posted (`../WORKSHOP_COMMENTS.md`).
- **Licence `silent`:** no permission found for the original mod (recheck 2026-09-12: no licence file, empty About URL, no permission in the Steam description or its 14 comments, empty author profile, no source repository). The mod is `(unofficial)`, the MIT notice covers only the additions: see `LICENSE` and `ATTRIBUTION.md`. No git repository exists for the original (searched again 2026-09-30): no pull request possible.
- **Settings:** none, no page and no shortcut. Inventory: no `Source/`, no assembly, no `Keyed` folder, no `ModSettings` class, no MainButtons def in `Mod/` or `Tests/`.
- **Compatibility** (optional, offline test group and Pickle passes 4 and 5): Animal Prosthetics 2 (beetle in its category 3, `loadBefore`), Nocturnal Animals Continued (beetle nocturnal). The seraph is left out of both on purpose. Crossbreeding: decided, nothing (`BACKLOG.md`). **Dogs mate (Continued) and Better Crossbreeding** (`PUBLISHING.md`, four integrations for animal mods; the owner's rule of 2026-10-01 asks for a recorded decision): neither patch applies, by the owner's decision of 2026-09-25 (no crossbreeding). The beetle has no genders and a gestation of 0 and is made from an egg in the propagator, so it cannot mate; the seraph is unique by design. Nothing to add to `pawnKinds` of a Dogs mate group, no `canCrossBreedWith`, no Better Crossbreeding extension. Reopen only if the owner designs a pair (`BACKLOG.md`, item 1).

- **Content boxes:** adult content and violence both unticked, decided by the owner on 2026-10-01 (`PUBLICATION.md`, Content boxes).

## Translation audit

French lives entirely in `Mod/Languages/French/DefInjected/` (no Keyed folder: nine files, one per def type). All nine were read by hand (`TRANSLATIONS.md` section 3): none contains a `{PAWN_gender ? ...}` switch and none needs one, every text names a creature, a body part, an object or a hairstyle's namesake, never the colonist. `FRENCH_REVIEW.md` (`scripts/Make-FrenchReview.ps1`, stamps the revision) was validated by the owner on 2026-09-30. 2026-10-11: `ACS_AngelCore.description` changed in English and French for 1.0.4 (`19f331e`); the owner (Virginie) reread the two texts and validated them on 2026-10-11 at revision `df9fba5c68833549464a7eadc2d85cdb1eb24ae4`, no correction; `translation_en` and `translation_fr` are `complete` again. HairDef names follow fr.wikipedia: titles and Level 5 names stay in their original form. Any later French edit resets the field to `unchecked`. The French text shipped since `1.0.1` is the validated one.

## Vocabulary

`remaining`: `feature` missing from the first cut, `defect` known and unfixed, `unverified` not checked.
`licence`: `open` explicit licence, `silent` none and a dead source, `alive` none but a living source, `forbidden` a
written refusal, `original` owing nothing to anyone. `dependencies`: `declared` every needed mod is in
`modDependencies`, `to check` a non-vanilla `loadAfter` suggests an undeclared one, `none` the mod needs nothing (an
undeclared dependency is not cosmetic: it took 47 vanilla animals down with another mod on 2026-09-11).
