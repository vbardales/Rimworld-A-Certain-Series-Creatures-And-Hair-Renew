# Review refusals

Suggestions from the ChatGPT review (`/review-translation`) that were refused. Do not propose them again. One line each: key or text, proposal, reason, date.

| Key or text | Proposal | Reason | Date |
|---|---|---|---|
| `ACS_Make_DarkMatter.description`, `ACS_Make_KakineTeitokuBrain.description`, `ACS_Make_DarkMatterByKakineTeitokuBrain.description`, `ACS_Make_EggBeetle.description`, `ACS_DarkMatterTech.description`, `ACS_DarkMatterProduction.description`, `ACS_KakineTeitokuBrain.description`, `ACS_Volleyball.description`, `ACS_EggBeetle.description`, `ACS_DarkMatterBeetle.description`, `ACS_Gabriel.description`, `ACS_DarkMatter.description`, `ACS_HeavenCloth.description`, `ACS_AngelCore.description` (ChineseSimplified) | Rewrite each Chinese description to carry the information of the English text | The Chinese text is the original author's own (mod notes, `ATTRIBUTION.md`); the English is a separate reconstruction. Rewriting the author's words to match ours is not ours to do | 2026-11-12 |
| `ACS_Make_DarkMatter.jobString` | Check that injecting a field the English XML does not carry works in game | RecipeDef.jobString has a default value, so the injection resolves; French feature 03 (dark matter work label) was green on `b104320` | 2026-11-12 |
| `ACS_Seraphim.corePart.parts.{first..eighth}_wing.customLabel`, `ACS_{First..Eighth}Wing.label` (Chinese) | Number the sixteen labels `第一只天使之翼` to `第八只天使之翼` | Chinese is the source language of the author (`Docs/translation-review-sources.json`); licence `silent`, no upstream repository, so no local edit of the source column; English and French already number the wings | 2026-11-12, APPLIED 2026-11-12 in 435b94d under the new source-column rule (item 21) |
