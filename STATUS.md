---
localization: complete
translation_en: complete
translation_fr: complete
settings_audit: not_applicable
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
workshop:     3806708754
remaining:
  - defect: About description uses a bare GitHub URL instead of the required final Source code on GitHub Steam link (a transition 10 requirement, so it does not affect `done`); the creation upload probably sent it (no session has read the page), in which case fixing About.xml alone no longer changes the page and it is edited by hand
  - resolved 2026-09-24 (preTest -> done): the Pickle suite is written in `Tests/Pickle/` (14 features, 17 local steps, a README that justifies the scope), and `Tests/Pickle/Check-Steps.ps1` resolves every step line to exactly one step. Written, not run: `done` does not ask for a run
  - unverified: none of the 14 Pickle features has run. The first run confirms or breaks the ten assumptions listed at the end of `Tests/Pickle/README.md`, and five of the six repairs can only be seen in a running game; the game did load the mod once, on 2026-09-23 (141 .dds caches written at 14:12), with no log read
  - unverified: the French and Chinese passes have not run, so no label or layout has been seen in either language; clipping is read on the `@review` captures of feature 03
  - unverified: does an exotic goods trader carry the brain fragment, without which the machine cannot be built. Feature 09 asks it of 200 generated stocks per trader; not run
  - unverified: the beetle's aggression, which turns it manhunter on every hit it takes, does it play out. Subjective and not automated
  - unverified: to reach tested, the three passes (English, French, Chinese; commands in `Tests/Pickle/README.md`) must run green, the Empire scenario must be played and not skipped, no scenario may be `@wip`, and every `@review` capture must be opened (AUDIT.md transition 9). Nothing has run
  - unverified: the private 0.1.0 item was uploaded from the working tree and probably carries 141 .dds caches that git never held; check its file list. An upload from a git checkout drops them, one from the working tree sends them again, and this repository has no publish workflow yet
  - unverified: the item's page still carries the earlier preview image; `Mod/About/Preview.png` was recomposed on 2026-09-24 and nothing has uploaded it
  - unverified: the description says the seraph reaches a colony only through exotic goods traders; both creatures carry the `AnimalUncommon` tag and the two exotic traders sell it, but whether another trader does too is not checked. To settle at the description review (transition 10)
  - first game run, 2026-09-24 21:04 (pass 1 English, request 20260924-164530-619-a69c, on 56ef72d; the dispatcher's worker died mid-run but the game finished alone, and I copied the four small text files to `Tests/Pickle/Evidence/2026-09-24-english` before deleting its 1.7 GB archive): `exitReason` `watchdog-timeout`, 15 of 20 scenarios played, **8 passed and 7 failed, 5 never played**. Passed: the load, the hairstyles, the research, the propagator's five bills, both production recipes, both exotic traders including the Empire variant (so assumptions 3, 5 and 7 of the README held, on that revision). All 7 failures carry one log error, `Tried 300 times to generate age`, from both creature kinds setting `maxGenerationAge` to 0, a defect inherited from 1.0: fixed in `a0fa40c` and not replayed. The 16th scenario, the egg (`10`), tripped the 120 s watchdog on `I wait for the egg ... to hatch`, which ended the game (exit 2): a whole day of incubation does not fit, so the scenario now starts the egg at 95 percent (new step, 19 in all) and the timeout tags are on the scenarios too; not replayed. The five never played include the egg itself and, after it, whatever else follows in feature order, the save round trip among them; the report does not list them. Fixed in the working tree (kinds no longer set either field, `Test-Mod.ps1` group added and mutation-tested); not replayed, so nothing here is confirmed until a pass runs on the fixed revision. The English pass must be redone whole
  - unverified: the optional compatibility with A Dog Said... Animal Prosthetics 2 (2026-09-24) is proved offline only (`Test-Mod.ps1`, mutation-tested). Feature 15 and the fourth pass (`wsl-deps.avec-ads2.map`) are written and have not run; the other mod is not yet in the WSL install's Workshop cache. Whether the beetle's vanilla parts (eyes, antennae) have a surgery in that mod is not verified
  - defect to settle by hand: the About description now carries a compatibility note, but the Steam page was created earlier and keeps the old text; add the note to the page at the description review (transition 10)
  - resolved 2026-09-24 (audit of the preTest -> done transition): feature 02 of the Pickle suite restated values the leaf defs state themselves, which AUDIT.md says to prove offline. It was deleted and its assertions moved into `Test-Mod.ps1` (`ce5677f`)
session:      local_62b40a02-9527-4bdd-a977-f6bbd6de409d
updated:      2026-09-24, cumulative workflow audit at ce5677f19cb734f697ae6a594819846c08ad0f57: stage done confirmed, tested not reached; then the optional Animal Prosthetics 2 compatibility (see the addendum)
---

# A Certain Series - Creatures and Hair Renew — status

## Addendum — Animal Prosthetics 2 compatibility, 2026-09-24 (after the audit below)

Asked for by the owner, who pointed at Workshop item 3238353862. Stage stays `done`: the addition carries its
own offline test and its own written scenario, and nothing in it asks for a run at `done`.

- **What the other mod asks** (read on its Steam page and its GitHub repository, not from a local install): a
  mod that adds animals lists them in the `recipeUsers` of its abstract recipes `ADS_Cat1`, `ADS_Cat2`,
  `ADS_Cat3`, a category including the ones below it, and loads **before** it.
- **What was done:** `Mod/Patches/AnimalProsthetics2.xml`, guarded by `PatchOperationFindMod` on the mod's
  name, lists `ACS_DarkMatterBeetle` in all three (trainable pack animal, category 3); `About.xml` gains
  `loadBefore` `SamBucher.ADogSaidAnimalProsthetics2` and a note in the description. No dependency is declared.
- **The seraph is left out on purpose.** Every part of its body is this mod's own def, and that mod's
  surgeries name vanilla parts, so listing it would add a name that is never offered anything. The beetle's
  legs, claws, horn and elytra are in the same case; only its `Eye` and `Antenna` are vanilla. Adding the mod's
  own parts to the other mod's recipes would mean patching them one by one and was not attempted.
- **Offline:** `Test-Mod.ps1` has an eleventh group (11 passed, 0 failed); four deliberate mutations of a copy,
  each caught by its own message: the `loadBefore` removed, the guard removed, the seraph added, the mod name
  misspelled. `Test-Translations.ps1` unchanged (202 and 202). `Check-Steps.ps1`: 18 local patterns, 243 step
  lines, all resolved.
- **Pickle:** feature 15 (`@requires` on the other mod: skipped, by design, in the three language passes) and a
  fourth pass map. Both written, never run. Two new assumptions, 11 and 12, in `Tests/Pickle/README.md`.
- **Supersedes** the sentence of transition 7 below that says the About declares no `loadBefore` and ships no
  patch: both now exist, and are optional.

## Cumulative workflow audit — 2026-09-24

**Previous stage: `done`. Stage retained: `done`.** `tested` is not reached: nothing has run in a game.
Audited against `../AUDIT.md` as it stood at 08:14 today, read in full for this audit, with
`../MOD_SETTINGS.md` and `../TRANSLATIONS.md`, read in full. `../PUBLISHING.md` was read in part: its
publishing-by-CI and evidence sections and its latest change (09:55 today), not every line. `../STYLE_RIMWORLD.md`
was consulted for the preview only.

Audited revision `ce5677f19cb734f697ae6a594819846c08ad0f57`, on `main`, identical to `origin/main` when the
checks ran. Working tree clean when the audit began; the only change made since is this file. **One
correction was made before the checks, in the audited revision itself** (`ce5677f`, see transition 8).
Nothing was generated, published or launched: no RimWorld process was started, in Windows or in the WSL,
and no Pickle ticket was taken.

| Transition | Finding and evidence |
| --- | --- |
| 1. dansMonoRepo -> horsMonoRepo | **Validated.** The repository root is this folder; `origin` is the GitHub repository, public, and holds the audited commit. The parent monorepo tracks 0 files of it (the absence of a parent remote is normal here). Licence `silent`, with the `(unofficial)` tag, packageId, displayed name, repository and folder all say the same thing. English README, ATTRIBUTION, LICENSE and CHANGELOG exist, and the two copies in `Mod/` are byte-identical to their root originals. **Not re-verified today:** the external pages behind the `silent` classification (last read 2026-09-12). |
| 2. -> ModIcon generated | **Validated as far as the rule allows.** No code or assembly ships, so there is nothing to build (`Mod/` holds no DLL). `Mod/About/ModIcon.png` exists, 128x128, 46,248 bytes. It is the owner's choice; its size and style deviations from the guide were accepted by her on 2026-09-13 and are unchanged. This audit did not generate, alter or request an icon, and did not measure its legibility at 32 px. |
| 3. -> Preview generated | **Validated.** `Mod/About/Preview.png`, 896x504, 579,218 bytes, below both limits, opened and read. It was recomposed on 2026-09-24 at the owner's request (`a518192`): the text stays top-left and the scene sits 20 px lower, so the title no longer covers the beetle. Bottom-right was tried and rejected (it hides the propagator). Minimum contrast behind each text box, measured with the text hidden: title 6.03, connector 11.01, suffix 4.63, tag 9.04, summary 4.63, all above 4.5:1. Chrome was driven directly because Playwright is not installed here; the font check of the official script was not repeated. |
| 4. -> preOptions | **Validated.** Accent `#45BCE8` (cool, from the seraph's wings) against secondary `#F0CC8D` (warm, from the stone and lamp): clearly separate. Description in English. `A Certain Series` at full size, `and` and `Renew` at 65%, `(unofficial)` as the tag, `1.6` in the badge, all agreeing with `About.xml`. |
| 5. -> options | **Validated by source analysis** (the rule asks for nothing more). 0 matches for `MainButtonDef`, `ModSettings`, `SettingsCategory`, `DoSettingsWindowContents` or `Dialog_ModSettings` in `Mod/` and `Tests/`; no assembly is shipped. `settings_audit: not_applicable` stands: there is no page and no shortcut to be empty or visible. No option effect, persistence or shortcut was tested in a game, and none is claimed. |
| 6. -> l10n | **Validated.** `Tests/Test-Translations.ps1`: 202 English source texts, 202 French entries, no missing, duplicate or unexpected key. `scripts/Check-DefInjected.ps1`: 402 keys, 0 errors. Since the translation audit of 2026-09-13 (`a066b66`) the only change to `Mod/Defs` is one line, `techLevel Spacer`, which is not player-facing text; `Mod/Languages` did not change. The three fields therefore stay `complete`. Runtime display in English, French and Chinese is **unverified**, as `../TRANSLATIONS.md` allows at this point. |
| 7. -> preTest | **Validated.** `About.xml` declares no `modDependencies`, `loadAfter`, `loadBefore` or `incompatibleWith`, and ships no `LoadFolders` and no patch. `Check-TypeRefs`: 0 references to a third-party type. `Check-DefRefs` run against a copy of Core's defs alone resolves every reference and every parent, so the mod needs neither a DLC nor another mod. `supportedVersions` is 1.6. |
| 8. -> done | **Validated, after one correction.** `Test-Mod.ps1`: 10 groups, 0 failed. `Test-Translations.ps1` as above. The six shared validators, run on `Mod/`: `Check-XmlFields` 18 files, no unknown field; `Check-DefRefs` 116 defs and 3 parents, nothing unresolved; `Check-XmlClasses` 19 types, all resolved; `Check-TypeRefs` clean; `Check-ConfigErrors` 126 of 126 defs, 26 rules, no error; `Check-DefInjected` as above. The functional scenarios (H1, T1, S1, S2) carry preconditions, actions and expected results in `TESTING.md`. The Pickle suite is written: 14 features, 17 local steps, and `Tests/Pickle/Check-Steps.ps1` resolves all 238 step lines to exactly one step. CI (`Mod regression tests`) is green on the audited commit. **Defect found and fixed:** feature 02 asserted values the leaf defs state themselves, which the protocol says to prove offline; it was deleted and its assertions moved into `Test-Mod.ps1`, where two deliberate mutations of a copy were detected. Its justification in the README had been wrong. |
| 9. -> tested | **Not reached, and nothing in it is verified.** No scenario has run in a game. Outstanding: the three passes (English, French, Chinese; commands in `Tests/Pickle/README.md`) played green; the Empire scenario played and not skipped; no `@wip` at the run (none is written); every `@review` capture opened; the logs read; the ten assumptions of `Tests/Pickle/README.md` confirmed or broken by the first run. |
| 10, 11 | Not reached. The prepublication of 2026-09-23 is an act, not a state (see below). |

### What this audit does not certify

- Not one Pickle step was executed. The checker proves that a step's text exists, not what the step does.
- The item's page has not been read by a session: its description, its preview and its file list are unknown.

### Strictly necessary to reach `tested`

Run the three passes through `scripts/Run-PickleWsl.ps1`, each behind its own ticket, watching the wait with
`Monitor`; read `exitReason` before the counts; open the nine `@review` captures; fix what the first run
breaks and replay the affected features; then record the runs in `docs/runs/`.

### Reserves and recommendations, none of them blocking

- The description says the seraph reaches a colony "only through exotic goods traders". Both creatures carry
  the `AnimalUncommon` tag and the two exotic traders sell it; whether another trader does too is not
  checked. Settle it at the description review of transition 10.
- Transition 10 will also need, and none of it is written: the description in the required order
  (`IF I GO QUIET`, `AI-GENERATED`, `THANKS`, the attribution line, then `Source code on GitHub`), a
  `PUBLICATION.md`, the thanks messages, the adult-content answers, a publish workflow with its dry-run, and
  the release notes. The description sent at creation cannot be changed from `About.xml`.
- `ModIcon.png` is 46 KB against a guide of 20 to 30. Accepted by the owner; noted only.

## Prepublication 0.1.0 — 2026-09-24

Newest entry; where it disagrees with the sections below, it wins.

- **Workshop item `3806708754`**, created on 2026-09-23 at 14:29 by a prepublication upload from this
  working tree. Steam creates every item private and RimWorld never changes that: nothing was made
  public. `Mod/About/PublishedFileId.txt` is committed in `8437ae0` and the remote copy holds the
  same number. The item's page has not been read by a session.
- **The stage is `done` again, after a day at `preTest`.** A prepublication is an act, not a stage
  (`../AUDIT.md`, transition 11), so it moves nothing. But `done` needs the Pickle scenarios to be
  written (transition 8), and none existed: the audit that recorded `done` on 2026-09-13 predates the
  present `AUDIT.md`. The stage was corrected to `preTest` on 2026-09-24, then restored the same day
  once the suite was written. Neither `tested` nor `prepublished` has been reached.
- **`CHANGELOG.md` is initialised** (`fe82516`): `0.1.0` records the upload, which held `Mod/` as it
  stood at `3db914f`. `1.0.0` is back to unreleased above it, and absorbed the old `Unreleased`.
- **141 `.dds` files** sat untracked in `Mod/Textures/`, each beside a tracked PNG twin. The game wrote
  them on 2026-09-23 at 14:12. None was ever in git; `*.dds` is now ignored (`7a0d6ae`) and the files
  stay on disk. They were on disk during the upload, hence the last line of `remaining`.
- **The Pickle suite is written, never run.** `Tests/Pickle/`: 14 features, a step assembly compiled
  against the 1.6 game assemblies (17 steps, all prefixed `A Certain Series:`), a pass map staging two
  shared tools, and a README that says what is in Gherkin, what deliberately is not, and why. The
  checker resolves all 238 step lines to exactly one step; it was tried against a deliberately wrong
  feature and a deliberately invalid pattern, and failed on both, before being trusted. It proves a
  step's text exists, not that the step does what its scenario hopes.
- **Evidence: there is none to sort.** No suite existed before today, so no report sits in
  `Tests/Pickle/Evidence/`, none in the shared report folders, and nothing under `docs/runs/`. The
  folders are ignored, `Minify-Evidence.ps1` is copied in, and the proofs worth keeping, nine captures
  and the text reports, are listed in `TESTING.md` ("Evidence to keep"). `Art/preview-qa.json`,
  `Art/preview-268.png` and `Art/preview-palette.json` are showcase QA that this file points to
  below: tracked, small, kept.
- **The gates, measured** (`TESTING.md`, "What `tested` requires"): no scenario is `@wip`; one is
  conditional, the Empire trader, and must be seen played; every manual check is covered by a scenario
  or listed not applicable, in a map. That third check is met once the three passes have run green.
- **The preview was recomposed** (`a518192`). The text stays top-left; the picture sits 20 pixels lower,
  so the title no longer covers the beetle's head and horn. Bottom-right was tried and is worse: it
  hides the propagator and the veil dims the seraph. Going further is blocked by the contrast floor:
  behind the summary the lit carapace gives 4.06:1 at offset 0 and first clears 4.5:1 at -26, and the
  offset kept is -30. `Mod/About/Preview.png` is now 579,218
  bytes, replacing the 569,528 quoted in the audit sections below; minimum contrasts 6.03, 11.01,
  4.63, 9.04 and 4.63.
- No Pickle ticket is held: no run has been asked for. When one is, the wait is watched with `Monitor`
  on `scripts/Pickle-Status.ps1`, not with a cron.

## Current cumulative workflow audit — 2026-09-13

**Original stage: `done`; audited intermediate stage: `preTest`; current stage: `done`.**
The user-requested test-plan corrections below resolve the remaining offline gate.
The first eight gates pass, including the recorded user exceptions and method corrections.
Game execution remains pending for done -> tested.
The user-supplied nine transitions take precedence over older protocol stage wording.
Read protocols: `../PUBLISHING.md`, `../STYLE_RIMWORLD.md`, `../MOD_SETTINGS.md`,
`../TRANSLATIONS.md`, and inherited `../AGENTS.md`.

Audited revision: `a066b66400dfc1bdcb41c0f83c1fbcd574c3fb56`; working tree clean before
the audit. The GitHub HEAD returned the same SHA. The initial audit changed only this status document; the subsequent authorized test-plan
repair also changes TESTING.md. No development, image generation, publication or game/configuration changes
were performed. Historical results below are preserved and do not override this section.

### Ordered gate findings

| Transition | Finding and evidence |
| --- | --- |
| dansMonoRepo -> horsMonoRepo | **User exception:** `git -c safe.directory=C:/Users/nelim/Documents/rimworld -C .. remote -v` contains no remote for this repository; the user explicitly accepts this for an extracted standalone mod. **Validated:** local independent `.git`; parent `ls-files ACertainSeriesCreaturesAndHairRenew` returns no tracked files; own `origin` points to the correct GitHub URL; `git ls-remote origin HEAD` matches the audited SHA; `gh repo view ... --json name,visibility,url` returns PUBLIC. Package ID, About name, folder and repository describe the same extraction; literal spelling identity is unnecessary. English README, attribution, changelog and scoped LICENSE exist. Root/distributed LICENSE hashes match, as do ATTRIBUTION hashes. **Historical evidence retained:** the dated permission audit is corroborated by current local source files and the accessible Steam description; its partial refresh limits are recorded below. |
| horsMonoRepo -> ModIcon generated | **Not applicable, justified:** compilation and compiled-artifact freshness; the payload has XML and PNG content, no source project or assembly. **Validated:** icon is a readable PNG, 128x128, 46,248 bytes, with its original in Art. **Visual deviation explicitly accepted by the user:** many surrounding illustrated character heads/figures violate the one-or-two-object limit and no-second-character rule; peripheral rendering is much more detailed than the required flat outlined objects. Weight also exceeds the guide's 20-30 KB target, though that is not its hard Preview limit. **Not verified:** readability at 32px; covered by the user icon override, not claimed as a performed visual check. Content runtime correctness belongs to the later functional checks. |
| ModIcon generated -> Preview generated | **Validated locally:** PNG, 896x504, 569,528 bytes, below both 900 KB and 1 MB; actual visual review of the delivered image and Art/preview-268.png. Source Art/Preview.png and archive Art/Preview-source.png exist. Scene subject and title are identifiable, no clipping or overlap observed. **Validated:** source palette measurement reports one vivid hue family. **Validated by direct inspection:** no concrete camera/style defect or unresolved visual doubt was found. A separate game-screenshot comparison was not performed; it is a review method, not an additional blocking criterion. The Preview gate passes. |
| Preview generated -> preOptions | **Validated locally:** blue badge/divider clearly separate from warm ochre secondary text at both inspected sizes; English description; Renew and and use direct 65% spans, secondary and primary ink respectively; series name stays full size; unofficial tag and 1.6 badge agree with About.xml. Palette JSON is read by the composition HTML. **Defect found:** About.xml has a bare GitHub URL in the middle of the description, not the final Steam-formatted Source code on GitHub link required by PUBLISHING.md. The source-link defect is publication preparation work, not one of the user-defined criteria for this transition. **Gate validated:** palette separation, English description and naming conventions pass. Existing font/contrast evidence concerns unchanged artifacts; no redundant historical report or new measurement is required without a concrete concern. |
| preOptions -> options | **Not applicable, justified:** the behavior inventory identifies no relevant settings need; source inspection finds no settings page, settings storage or MainButtonDef. Applicable automated checks passed on the unchanged revision. Under the user clarification, this validates the gate without game execution. |
| options -> l10n | **Validated offline:** 202 English source fields and 202 French entries; 402 French/Chinese injection paths resolve, zero reported errors. French text reviewed, including body sides, eight wing labels, tools, proper names, recipes and work activity. No owned UI code, Keyed strings, grammar files, patches or LoadFolders found. **Gate finalized:** the settings prerequisite now passes, and localization plus both resource fields are complete. No content changed since the successful checks; FR/EN runtime display remains unverified for done -> tested. |
| l10n -> preTest | **Validated within static scope:** About declares 1.6, no third-party requirements or load-order entries; no patches, LoadFolders, conditional integration or assembly shipped. Six shared checks below report no unresolved references, unknown fields or unguarded third-party types. The dependency gate passes on the source/reference audit. **Runtime limit:** no Core-only game launch was performed; shared validators index installed DLC as well as Core, so their success alone is not evidence of a DLC-free game run. Interactive confirmation belongs to done -> tested. |
| preTest -> done | **Validated:** meaningful automated/XML regression suites exist and were executed successfully on the shipped revision. Functional scenarios have many actions and expected outcomes. **Defects found in the scenario document:** tame hatchling expectation contradicts the shipped wild-hatchling descriptions; existing-save coverage is absent without a justification; bootstrap trader access is called a question without an expected result despite being necessary for progression. These initially blocked the gate and are now resolved by TESTING.md scenarios H1, T1, S1 and S2; see the dated repair below. The gate now passes. |
| done -> tested | **Not verified:** no game run, inspected Player.log, FR/EN UI execution, new-game or existing-save execution, or runtime settings/shortcut evidence in this audit. Existing unchecked scenarios do not demonstrate success. |

### Settings audit

RimWorld target: 1.6. No customization integration was run. Inventory covers the two
creatures, their combat/temper/taming and trading values, five recipes and production
costs, research, materials and 41 hair definitions. No existing settings storage, custom
UI, MainButtonDef, source code, assembly, integration or documented XML-editing workflow
is shipped. Production quantities and combat values implement the retained content;
recipe selection and research already use native game UI. No specific requirement for
global tuning or content toggles was found. This justifies the no-settings
decision without exposing every balance constant as an option. The planned beetle
aggression assessment does not establish a missing settings requirement; a concrete
future requirement would trigger re-audit.

Technical inventory observed no page or shortcut definition. The file inventory and
search for MainButtonDef, ModSettings, SettingsCategory and DoSettingsWindowContents
were checked again after the user's clarification: no matches in Mod/ or Tests/, no
shipped code/assembly, and no relevant content changes since audited revision a066b66.
The behavior inventory above supplies the rationale beyond mere absence of C#.
The nine automated regression groups and six shared validators already passed on this
revision; no redundant run or artificial settings test was added for this status-only edit.

Under the user's explicit rule, source analysis and applicable automated tests validate
preOptions -> options; interactive verification is not required here. Therefore
`settings_audit: not_applicable`. Option effects, persistence, reset and shortcut reveal
checks are not applicable because no settings or shortcut are provided. No game test
is claimed; any relevant interactive UI/log verification belongs to done -> tested.

### Executed checks and limits

Commands run from this repository, using `powershell -NoProfile -ExecutionPolicy Bypass -File`:

| Script and arguments | Observed result |
| --- | --- |
| Tests/Test-Mod.ps1 | 9 groups passed, 0 failed; actual payload has 37 XML files and 123 concrete typed defs. |
| Tests/Test-Translations.ps1 | 202 English source texts / 202 French entries; no missing, duplicate or unexpected keys. |
| ../scripts/Check-XmlFields.ps1 -ModPath ./Mod | 18 files checked; no unknown fields. |
| ../scripts/Check-DefRefs.ps1 -ModPath ./Mod -Brief | No malformed XML, missing refs, wrong reference types or unresolved parents. Script reports 116 distinct def names and 3 parents; this differs from the 123 typed concrete defs because names can recur across types. |
| ../scripts/Check-XmlClasses.ps1 -ModPath ./Mod -TypeLists ../rw16_types.txt | 19 referenced types resolved; uses the existing type-list snapshot. |
| ../scripts/Check-TypeRefs.ps1 -ModPath ./Mod | 18 XML files; 77 field names scanned, 9 List-Type fields; 0 third-party type references. Three ambiguous field names excluded by the validator. |
| ../scripts/Check-ConfigErrors.ps1 -ModPath ./Mod | 126/126 definitions including abstracts checked; 26 rules; no config error. Cross-def and computed-property rules remain outside its coverage. |
| ../scripts/Check-DefInjected.ps1 -TransMod ./Mod | 11,702 defs indexed; 402 keys checked, 0 errors. This resolves paths, not exhaustive coverage or runtime display. |

The shared scripts read installed RimWorld managed assemblies and Data. Their outputs
are successful static checks, not execution of Unity, combat, trader stock, hatching or
the UI. CI configuration invokes the two standalone suites; its remote run result was
not checked. No existing historical report or QA image was overwritten.

Freshness: the current mod/tests were rerun at the audited SHA. Art, composition and About
last changed in `47be43952f92231d75fd15c3a92bcc8e571bb388`, which contains the saved QA
report. Its minimum contrasts and font observations remain historical evidence, not
measurements repeated today. The source renderer writes over delivered art and QA files,
so it was not run during this preservation-only audit. Relevant future content changes
invalidate affected checks; settings/UI changes also invalidate the localization inventory.

Additional image check: source Art/Preview.png measured at native 1339x1174 using
System.Drawing HSV hue and explicit HSV saturation/value calculations, matching the
guide thresholds (S >= 0.55, V >= 0.25, 30-degree bins, >= 1% of pixels per family).
Result: one qualifying family, hue bin 30 degrees, 6.35% of the image; passes the
maximum-three-family criterion. Unlike Measure-Palette.sh, this check used native
resolution instead of a 960px resample. No image was modified. No game screenshot
was found in the standard Steam userdata/760/remote/294100/screenshots locations;
a direct camera comparison was not performed. This does not invalidate the direct
visual review, and no camera reservation is retained without a concrete concern.

### Permission and external-access evidence

The existing `silent` classification is retained as a documented absence of permission,
not as a grant of rights. Public visibility and unofficial notices agree with the local
publishing convention; LICENSE explicitly excludes original content from its MIT grant.
The installed original at Steam/steamapps/workshop/content/294100/1667943729 has no
LICENSE/COPYING/README found by recursive filename inspection; About.xml has no permission
notice or source URL. Root and distributed notices are byte-identical.

Firecrawl CLI was unavailable; the web reader fallback returned the
[original Steam page](https://steamcommunity.com/sharedfiles/filedetails/?id=1667943729).
Its description still asks users to remove the old version and mentions a possible remake.
It provides no explicit redistribution permission. Only ten of fourteen comments were
returned; the author profile request failed. The historical full-comment/profile/source
search below is not represented as freshly reproduced. No relevant change to the rights evidence was identified since the dated audit, so this
incomplete refresh does not itself invalidate that historical classification. The first
gate accepts the documented decision with these limits; an inaccessible source is not
proof of prohibition or authorization.
Initial GitHub access failed in the sandbox; a permitted read-only retry succeeded.
No remote, visibility, licence or publication setting was changed.

### User exceptions — 2026-09-13

- The user confirms that absence of a parent-monorepo remote is normal after extraction.
  The standalone repository, actual public visibility and pushed revision remain verified.
  No parent remote must be added for this audit to advance.
- The user explicitly validates/overrides the ModIcon. Its observed style deviations and
  unperformed 32px check are retained as evidence, but do not block advancement and do
  not require image changes. This is user acceptance, not a technical style-test pass.

### Audit-method correction — 2026-09-13

The user clarified that mandatory passage criteria must be distinguished from suggested
verification methods. A missing proof blocks only when it concerns a mandatory criterion
that cannot be verified during the audit. Direct artifact inspection is sufficient when
it verifies that criterion; a historical report is not required in addition. A suggested
comparison with a game screenshot does not independently block the Preview gate.

The earlier audit incorrectly retained `ModIcon générée` solely for that missing comparison.
This was an audit-method error, not a visual defect or a request for another image override.
That conclusion is superseded: the inspected Preview passes, showcase is complete (with
the separately recorded ModIcon user acceptance), and the intermediate corrected stage was `preOptions`.
No new test or image correction is claimed. The final source-link convention remains an
actual publication-documentation defect, tracked separately from the explicit preOptions
criteria. The later settings-method clarification below supersedes the initial runtime blocker.

### Settings-method clarification — 2026-09-13

The user explicitly defines preOptions -> options as source/Def analysis and applicable
automated tests, without mandatory game execution. If no relevant settings exist,
source verification of the absence of an empty page and shortcut justifies
`settings_audit: not_applicable`. Interactive checks belong to done -> tested.
This instruction supersedes the conflicting runtime requirement in the shared protocols
for this audit. It is a workflow clarification, not a claim that game tests were executed.

The unchanged source inventory and successful offline checks validate options and allow
the already checked localization gate to be finalized. The dependency audit also passes;
the resulting cumulative stage is preTest. Game execution is not used as a blocker for
any earlier transition. The distinct test-plan defects below still block preTest -> done.

### Test-plan repair — 2026-09-13

Authorized by the user's request to fix the tests. Reviewed against revision
`a066b66400dfc1bdcb41c0f83c1fbcd574c3fb56` plus this local TESTING.md/STATUS.md edit.
No shipped content or automated test implementation changed.

- H1 now expects a crafted egg to hatch wild after one day, then become a colony animal
  after taming. Preconditions, faction observations and a clear mismatch outcome are
  specified. This matches the shipped English/French contract; runtime behavior remains
  unverified rather than being inferred from the description.
- T1 tests normal purchase of the first brain fragment and construction/production without
  a pre-existing propagator. The actual Core trader definitions Caravan_Outlander_Exotic
  and Orbital_Exotic were inspected for ExoticMisc stock generation. Each route is recorded
  separately. A bounded random sample without an offer is INCONCLUSIVE, not proof of a
  defect or a pass. Empire trading is an explicitly conditional Royalty variant.
- S1 covers adding the mod to a backed-up existing colony and restarting/reloading it.
  S2 covers persistence of creatures, hairstyles, materials, bills/research and incubation,
  with a separately identified prior-revision upgrade variant. Both specify preconditions,
  actions, expected outcomes and evidence to retain in English and French.
- Removed the claim that one run needs no reloads, separated the subjective aggression
  review from functional tests, and required preservation of previous logs/save files.
- Re-executed Tests/Test-Mod.ps1: **9 groups passed, 0 failed**. Re-executed
  Tests/Test-Translations.ps1: **202 English / 202 French entries**, no missing, duplicate
  or unexpected keys. `git diff --check` passed. The six previously executed shared XML
  validators remain valid because no payload or validator input changed.

Every new interactive scenario explicitly remains NOT RUN. No artificial tests were
added to check documentation wording. With the plan repaired and applicable offline
checks passing, `stage: done` is justified; `tested_on` stays empty.

### Exact next transition: done -> tested

Execute the TESTING.md scenarios in RimWorld 1.6, including H1, T1, S1 and S2 and the
existing content checks, with English/French UI and log review. Record actual results,
revision, game/mod/DLC versions and save/log evidence; resolve failures and rerun affected
regressions before marking tested. Settings effects/persistence and shortcut integration
remain not applicable under the recorded source-based settings audit. The source-link
format defect is still separately tracked for publication preparation.

## Historical status and evidence (superseded where noted above)

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
- **`tested_on`, empty** — no scenario has been played (the game loaded the mod once on
  2026-09-23, see "Prepublication 0.1.0" above; that is not a test). In-game validation remains pending, and
  not one a session can clear on its own: see [`TESTING.md`](TESTING.md), which lays out the run
  in order, the seven strings to search `Player.log` for, and the two questions that have no
  expected answer.
- **`workshop`** — superseded on 2026-09-24: item `3806708754` was created on 2026-09-23 and its
  `PublishedFileId.txt` is committed (see "Prepublication 0.1.0" above). The Steam description is
  sent only when the item is created and never reprinted, so what the creation upload sent, if it sent
  a description, is what the page carries until someone edits it by hand.
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

## Translation audit

Audited on 2026-09-13 against base revision `63c41c3` plus the local French resources
and translation-check changes. The existing `stage: done` is historical; the three
translation fields certify the offline gate in `../TRANSLATIONS.md`, not a game run.

- Scope: all 17 XML files under `Mod/Defs`, 123 concrete defs and local abstract
  parents. No assembly, source UI, patches, LoadFolders, optional integrations,
  Keyed strings or custom grammar resources are shipped. All leaf field names were
  reviewed; owned text uses native translatable Def fields.
- The inventory contains 202 fields: BodyDef 43, BodyPartDef 25, BodyPartGroupDef 34,
  HairDef 41, PawnKindDef 6, RecipeDef 15, ResearchProjectDef 2, ThingDef 33 and
  WorkGiverDef 3. It includes nested body custom labels, all 13 attack tool labels,
  gendered pawn labels, the inherited recipe job string, and work giver verb/gerund.
- English is supplied by the Defs. French explicitly covers every inventoried field
  in `Mod/Languages/French/DefInjected/`; no redundant English folder is needed.
  Character names and power nicknames used as proper names may intentionally remain
  identical. Descriptive epithets are translated; all eight wings remain distinct.
  Chinese resources are preserved. No format parameters, grammar tokens or rich-text
  tags occur in the owned source strings; the coverage test checks token parity.
- Vanilla supplies inherited UI, recipe/work templates, hatching/rotting inspect
  strings and generated corpse/minified-item labels through its language resources
  and translated Def labels. No third-party keys or dependencies are reused.
  IDs, class names, texture/sound paths, numeric data, tags and About metadata are
  excluded from owned text; documentation follows the separate English-only rule.
- `powershell -NoProfile -ExecutionPolicy Bypass -File Tests/Test-Translations.ps1`:
  **202 English texts / 202 French entries**, no missing, duplicate or unexpected
  keys, empty values or mismatched formatting tokens. The inventory is derived from
  Defs rather than the Chinese folder, which lacks the work giver verb and gerund.
- `../scripts/Check-DefInjected.ps1 -TransMod ./Mod`: **402 keys checked, 0 errors**,
  no ambiguous handles or unresolved targets. This checks French and Chinese against
  installed RimWorld 1.6 types and Defs; it does not establish exhaustive coverage.
- `powershell -NoProfile -ExecutionPolicy Bypass -File Tests/Test-Mod.ps1`:
  **9 groups passed, 0 failed**. The hairstyle test now scopes Chinese labels to
  their language folder. The new translation coverage check is also wired into CI;
  remote execution has not been checked.
- Runtime validation is **not performed**. Follow the English/French checklist in
  `TESTING.md`; generated labels, grammar, raw keys, fallback and clipping remain
  tracked as `unverified` above. Reset affected translation fields to `unchecked`
  after changing texts, Defs, patches, interface code or language resources.

`licence` vocabulary: `open` an explicit licence, `silent` no licence and a dead source,
`alive` no licence but a living source, `forbidden` a written refusal, `original` owing nothing
to anyone — not a name, not an idea traceable to one mod, not a value derived from its assets.

- **`dependencies`** — `declared` when every mod this one needs is named in the About's
  `modDependencies`, `to check` when a non-vanilla `loadAfter` suggests a dependency that is not
  declared, `none` when the mod needs nothing. An undeclared dependency is not cosmetic: on
  2026-09-11 Reequilibrage animaux took 47 vanilla animals down with it, Muffalo included, because
  the class it injects belongs to a mod that was not declared and not loaded.
