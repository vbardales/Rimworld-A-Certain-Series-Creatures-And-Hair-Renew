<#
.SYNOPSIS
  Builds FRENCH_REVIEW.md from the shipped English, Chinese and French DefInjected XML, for
  TRANSLATIONS.md's "Systematic French review by Virginie" (2026-09-30).
.DESCRIPTION
  This mod has no Keyed folder and no Languages/English folder either: every def name is now
  labelled in English directly on the Def (ATTRIBUTION.md, "Everything kept is now labelled in
  English on the def side"), so English is RimWorld's own native fallback, not a DefInjected
  override. Reads every Mod/Languages/French/DefInjected/**/*.xml key. For each key: English is
  resolved by dotted path against the matching Def in Mod/Defs, the same resolution RimWorld
  itself performs when no DefInjected override exists. Original is the matching entry in
  Mod/Languages/ChineseSimplified (简体中文)/DefInjected (the mod's true source language, kept
  apart per ATTRIBUTION.md, "the original Chinese is kept in Languages/ChineseSimplified"); when a
  key has no Chinese entry (the beetle's eyes and antennae, labelled in English in the original —
  ATTRIBUTION.md, "one gap, deliberate" — and the hairstyle character names, which the original
  never localized at all), Original falls back to English.

  Built by script, not by hand, because both fallbacks (a Def field by dotted path, Chinese or
  English by key) differ key by key and a hand copy cannot be trusted not to drift.
#>
param(
    [string]$Root = (Split-Path $PSScriptRoot -Parent),
    [string]$OutFile = (Join-Path (Split-Path $PSScriptRoot -Parent) 'FRENCH_REVIEW.md')
)

function Get-Entries($path) {
    $entries = [ordered]@{}
    if (-not (Test-Path $path)) { return $entries }
    $xml = [xml](Get-Content $path -Raw -Encoding UTF8)
    foreach ($node in $xml.LanguageData.ChildNodes) {
        if ($node.NodeType -ne 'Element') { continue }
        $entries[$node.Name] = $node.InnerText
    }
    return $entries
}

$frenchRoot = Join-Path $Root 'Mod/Languages/French/DefInjected'
$chineseRoot = Join-Path $Root 'Mod/Languages/ChineseSimplified (简体中文)/DefInjected'
$defsRoot = Join-Path $Root 'Mod/Defs'
$script:defFiles = Get-ChildItem $defsRoot -Recurse -Filter *.xml | ForEach-Object { $_.FullName }
$script:defCache = @{}

function Get-DefNode([string]$defType, [string]$defName) {
    # Several defNames collide across types (ACS_AngelCore is both a BodyPartGroupDef and a
    # ThingDef, ACS_DarkMatterBeetle both a PawnKindDef and a ThingDef — ATTRIBUTION.md, "the
    # thirteen names that collide"), so the search must match the XML element tag, not just the
    # defName, or it silently returns the wrong def's fields.
    $cacheKey = "$defType/$defName"
    if (-not $script:defCache.ContainsKey($cacheKey)) {
        $found = $null
        foreach ($f in $script:defFiles) {
            $x = [xml](Get-Content $f -Raw -Encoding UTF8)
            $node = $x.SelectSingleNode("//$defType[defName='$defName']")
            if ($node) { $found = $node; break }
        }
        $script:defCache[$cacheKey] = $found
    }
    return $script:defCache[$cacheKey]
}

function Get-NormalizedLabel([string]$text) {
    # Mirrors RimWorld's DefInjection path segment: spaces to underscores, then everything
    # outside [A-Za-z0-9_-] dropped (ATTRIBUTION.md, "The eight identical wing labels").
    ($text -replace ' ', '_') -replace '[^A-Za-z0-9_-]', ''
}

function Find-InList($listNode, [string]$segment) {
    # $segment is either a BodyPartDef defName (ACS_AngelNeck) or a normalized customLabel/label
    # (left_eye), optionally suffixed -N for the Nth duplicate (water_wing_blade-3).
    if (-not $listNode) { return $null }
    $items = @($listNode.li)
    $rank = $null
    $baseSegment = $segment
    if ($segment -match '^(.*)-(\d+)$') { $baseSegment = $Matches[1]; $rank = [int]$Matches[2] }

    $matches = @()
    foreach ($it in $items) {
        $def = $it.def
        $label = if ($it.customLabel) { $it.customLabel } elseif ($it.label) { $it.label } else { $null }
        $normLabel = if ($label) { Get-NormalizedLabel $label } else { $null }
        if ($def -eq $segment -or $normLabel -eq $segment) { return $it }
        if ($def -eq $baseSegment -or $normLabel -eq $baseSegment) { $matches += $it }
    }
    if ($null -ne $rank -and $rank -lt $matches.Count) { return $matches[$rank] }
    if ($matches.Count -eq 1) { return $matches[0] }
    return $null
}

function Resolve-DefField([string]$defType, [string]$key) {
    # key looks like "DefName.field", "DefName.corePart.parts.SegmentOrLabel.customLabel", or
    # "DefName.tools.label-or-defName-N.label".
    $parts = $key -split '\.'
    $defName = $parts[0]
    $rest = $parts[1..($parts.Length - 1)]
    $cur = Get-DefNode $defType $defName
    if (-not $cur) { return $null }
    $i = 0
    while ($i -lt $rest.Count) {
        $p = $rest[$i]
        if ($null -eq $cur) { return $null }
        if ($p -eq 'parts' -or $p -eq 'tools') {
            $i++
            if ($i -ge $rest.Count) { return $null }
            $cur = Find-InList $cur.$p $rest[$i]
        } else {
            $cur = $cur.$p
        }
        $i++
    }
    if ($cur -is [System.Xml.XmlElement]) { return $cur.InnerText }
    if ($cur) { return [string]$cur }
    return $null
}

# The three languages don't share filenames within a def-type folder (French/English split one
# file per def type; Chinese groups several def types per file), so index every language by
# def-type folder name + key, not by file path.
function Get-AllEntriesByType($root) {
    $byType = @{}
    if (-not (Test-Path $root)) { return $byType }
    Get-ChildItem $root -Directory | ForEach-Object {
        $type = $_.Name
        $merged = [ordered]@{}
        Get-ChildItem $_.FullName -Filter *.xml | Sort-Object Name | ForEach-Object {
            (Get-Entries $_.FullName).GetEnumerator() | ForEach-Object { $merged[$_.Key] = $_.Value }
        }
        $byType[$type] = $merged
    }
    return $byType
}

$chineseByType = Get-AllEntriesByType $chineseRoot

$out = New-Object System.Text.StringBuilder
[void]$out.AppendLine("# French review")
[void]$out.AppendLine()
[void]$out.AppendLine("Generated by `` _tools/Generate-FrenchReview.ps1 `` for TRANSLATIONS.md's systematic French review.")
[void]$out.AppendLine("Original: the shipped Chinese DefInjected text (`` Languages/ChineseSimplified (简体中文) ``,")
[void]$out.AppendLine("ATTRIBUTION.md, Translation). Two groups have no Chinese entry and fall back to English:")
[void]$out.AppendLine("the beetle's eyes and antennae (labelled in English in the original) and the hairstyle")
[void]$out.AppendLine("character names (the original never localized them: its text is the English label). Those rows say *(same as English)*.")
[void]$out.AppendLine("Decided 2026-09-30 (fr.wikipedia, fandom franchise reference): the hairstyle names and franchise epithets stay in the original form in French, so those rows carry no `?`; `Blue Hair Piercing` is the character `Aogami Pierce`.")
[void]$out.AppendLine()
$rev = (git -C $PSScriptRoot rev-parse HEAD).Trim()
$dirty = @(git -C $PSScriptRoot status --porcelain).Count
$rev = if ($dirty -eq 0) { "$rev, tree clean" } else { "$rev, plus $dirty uncommitted path(s) at generation" }
[void]$out.AppendLine("Generated $(Get-Date -Format 'yyyy-MM-dd'), revision: $rev, no gender-agreement rewrites")
[void]$out.AppendLine("needed (no player-facing text in this mod agrees with a pawn's gender: every label,")
[void]$out.AppendLine("description and tool name refers to a creature, an object or a hairstyle's namesake, never")
[void]$out.AppendLine("to the colonist wearing or receiving it).")
[void]$out.AppendLine()
[void]$out.AppendLine("English *(not found — check by hand)* is expected, not a gap, on `` .labelMale ``/`` .labelFemale ``")
[void]$out.AppendLine("(no such field on the Def; the game derives them from `` .label `` at runtime) and on a")
[void]$out.AppendLine("`` RecipeDef ``'s `` .jobString `` (also generated, never a literal field).")
[void]$out.AppendLine()

Get-ChildItem $frenchRoot -Directory | Sort-Object Name | ForEach-Object {
    $type = $_.Name
    Get-ChildItem $_.FullName -Filter *.xml | Sort-Object Name | ForEach-Object {
        $ff = $_
        $rel = "DefInjected/$type/$($ff.Name)"
        $frEntries = Get-Entries $ff.FullName
        if ($frEntries.Count -eq 0) { return }

        [void]$out.AppendLine("## $rel")
        [void]$out.AppendLine()
        [void]$out.AppendLine("| Key or path | Original | English | French |")
        [void]$out.AppendLine("|---|---|---|---|")
        foreach ($key in $frEntries.Keys) {
            $fr = $frEntries[$key]
            $en = Resolve-DefField $type $key
            $zh = $null
            if ($chineseByType.ContainsKey($type) -and $chineseByType[$type].Contains($key)) { $zh = $chineseByType[$type][$key] }
            $orig = if ($null -ne $zh) { $zh } elseif ($null -ne $en) { "$en *(same as English)*" } else { '*(not found — check by hand)*' }
            if ($null -eq $en) { $en = '*(not found — check by hand)*' }
            $flag = if (($fr -match '\{PAWN_gender') ) { ' | ?' } else { '' }
            $origCell = ($orig -replace '\|', '\|') -replace "`n", ' '
            $enCell = ($en -replace '\|', '\|') -replace "`n", ' '
            $frCell = ($fr -replace '\|', '\|') -replace "`n", ' '
            $keyCell = $key -replace '\|', '\|'
            [void]$out.AppendLine("| $keyCell | $origCell | $enCell | $frCell$flag |")
        }
        [void]$out.AppendLine()
    }
}

[System.IO.File]::WriteAllText($OutFile, $out.ToString(), (New-Object System.Text.UTF8Encoding($false)))
Write-Output "wrote $OutFile"
