param([string]$ModPath = (Join-Path $PSScriptRoot '../Mod'))

# Audited fields in this XML-only mod. Re-audit this list when adding new Def types,
# patches, code or generated language resources; this is not a general RimWorld scanner.
$ErrorActionPreference = 'Stop'
$fields = @('label', 'description', 'customLabel', 'labelMale', 'labelFemale', 'jobString', 'verb', 'gerund')
$defs = @(Get-ChildItem (Join-Path $ModPath 'Defs') -Recurse -Filter *.xml | ForEach-Object {
    [xml]$doc = Get-Content $_.FullName -Raw -Encoding UTF8
    $doc.SelectNodes('/Defs/*')
})
function Walk-Text($node, [string]$path, [string]$type) {
    $handles = @{}
    foreach ($child in $node.SelectNodes('*')) {
        $segment = $child.Name
        if ($segment -eq 'li') {
            # The only lists containing owned text here are body parts and tools.
            if ($node.Name -eq 'parts') {
                $segment = if ($child.customLabel) { [string]$child.customLabel } else { [string]$child.def }
            } elseif ($node.Name -eq 'tools') { $segment = [string]$child.label }
            else {
                if ($child.SelectNodes('.//*') | Where-Object { $_.Name -in $fields }) {
                    throw "Unaudited text list: $type/$path/$($node.Name)"
                }
                continue
            }
            $segment = $segment -replace '[^a-zA-Z0-9_]', '_'
            $base = $segment
            if ($handles.ContainsKey($base)) { $handles[$base]++; $segment += '-' + $handles[$base] }
            else { $handles[$base] = 0 }
            if ($node.Name -eq 'tools' -and $handles[$base] -eq 0 -and
                @($node.SelectNodes('li') | Where-Object { ([string]$_.label -replace '[^a-zA-Z0-9_]', '_') -eq $base }).Count -gt 1) {
                $segment += '-0'
            }
        }
        $key = "$path.$segment"
        if ($child.Name -in $fields) {
            [pscustomobject]@{ Type = $type; Key = $key; English = $child.InnerText }
        } else { Walk-Text $child $key $type }
    }
}
foreach ($def in $defs | Where-Object { $_.defName }) {
    Walk-Text $def ([string]$def.defName) $def.Name
    # The sole local abstract text is the recipe base's inherited jobString.
    if ($def.Name -eq 'RecipeDef' -and -not $def.jobString) {
        $parent = $defs | Where-Object { $_.GetAttribute('Name') -eq $def.GetAttribute('ParentName') }
        if ($parent.jobString) {
            [pscustomobject]@{ Type = 'RecipeDef'; Key = "$($def.defName).jobString"; English = [string]$parent.jobString }
        }
    }
}
