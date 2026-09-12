param([string]$ModPath = (Join-Path $PSScriptRoot '../Mod'))
$ErrorActionPreference = 'Stop'
$inventory = @(& (Join-Path $PSScriptRoot 'Get-TranslationInventory.ps1') -ModPath $ModPath)
$expected = @{}
foreach ($item in $inventory) {
    $id = "$($item.Type)/$($item.Key)"
    if ($expected.ContainsKey($id)) { throw "Duplicate source: $id" }
    if ([string]::IsNullOrWhiteSpace($item.English) -or $item.English -match '[\p{IsCJKUnifiedIdeographs}]') {
        throw "Missing English source: $id"
    }
    $expected[$id] = $item
}
$actual = @{}
foreach ($file in Get-ChildItem (Join-Path $ModPath 'Languages/French/DefInjected') -Recurse -Filter *.xml) {
    [xml]$doc = Get-Content $file.FullName -Raw -Encoding UTF8
    foreach ($node in $doc.SelectNodes('/LanguageData/*')) {
        $id = "$($file.Directory.Name)/$($node.Name)"
        if ($actual.ContainsKey($id)) { throw "Duplicate French: $id" }
        if (-not $expected.ContainsKey($id)) { throw "Unexpected French path: $id" }
        $value = $node.InnerText
        if ([string]::IsNullOrWhiteSpace($value) -or $value -match '\b(TODO|TBD)\b|[\p{IsCJKUnifiedIdeographs}]') {
            throw "Missing French text: $id"
        }
        if ($value -ceq $expected[$id].English -and $expected[$id].Type -ne 'HairDef') {
            throw "Untranslated French text: $id"
        }
        # Preserve any future format parameters and rich-text tags exactly.
        $pattern = '\{[^{}]+\}|</?[^>]+>'
        $enTokens = @([regex]::Matches($expected[$id].English, $pattern) | ForEach-Object Value | Sort-Object)
        $frTokens = @([regex]::Matches($value, $pattern) | ForEach-Object Value | Sort-Object)
        if (($enTokens -join '|') -cne ($frTokens -join '|')) { throw "Formatting tokens differ: $id" }
        $actual[$id] = $value
    }
}
foreach ($id in $expected.Keys) {
    if (-not $actual.ContainsKey($id)) { throw "Missing French entry: $id" }
}
Write-Output "PASS translation inventory: $($expected.Count) English source texts and $($actual.Count) French entries; no missing, duplicate or unexpected keys."
# Actual engine field/handle resolution is checked separately by Check-DefInjected.ps1.
