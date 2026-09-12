param([string]$ModPath = (Join-Path $PSScriptRoot '../Mod'))

# Standalone, read-only regression checks. No game installation or Pester required.
$ErrorActionPreference = 'Stop'
$ModPath = (Resolve-Path -LiteralPath $ModPath).Path
$script:failures = 0
$script:passed = 0
function Assert($condition, [string]$message) {
    if (-not $condition) { throw $message }
}
function Test([string]$name, [scriptblock]$body) {
    try { & $body; $script:passed++; Write-Output "PASS $name" }
    catch { $script:failures++; Write-Output "FAIL ${name}: $_" }
}
function Def([string]$type, [string]$name) {
    $node = $script:index["${type}:$name"]
    Assert ($null -ne $node) "Missing ${type}:$name"
    return $node
}

$script:index = @{}
$documents = @()
Test 'XML parses; definitions have unique names within their type' {
    $files = @(Get-ChildItem -LiteralPath $ModPath -Recurse -Filter *.xml -File)
    Assert ($files.Count -gt 0) 'No XML found'
    foreach ($file in $files) {
        [xml]$doc = Get-Content -LiteralPath $file.FullName -Raw -Encoding UTF8
        $script:documents += $doc
        foreach ($node in $doc.SelectNodes('/Defs/*[defName]')) {
            $key = "$($node.Name):$($node.defName)"
            Assert (-not $script:index.ContainsKey($key)) "Duplicate $key"
            Assert ($node.defName.StartsWith('ACS_')) "Unprefixed $key"
            $script:index[$key] = $node
        }
    }
    Assert ($script:index.Count -gt 0) 'No definitions found'
}
Test 'Metadata includes the repository in the description' {
    [xml]$about = Get-Content -LiteralPath (Join-Path $ModPath 'About/About.xml') -Raw -Encoding UTF8
    $meta = $about.ModMetaData
    Assert ($meta.packageId -ceq 'nelim.acertainseriescreaturesandhairrenew') 'Package identity changed'
    Assert ($meta.supportedVersions.li -contains '1.6') 'Missing 1.6 support'
    Assert ($meta.url -match '^https://github.com/[^/]+/[^/]+$') 'Missing GitHub repository URL'
    Assert ($meta.description.Contains($meta.url)) 'Repository URL missing from description'
}
Test 'Local ACS references and inheritance parents resolve' {
    $names = @{}
    $parents = @{}
    foreach ($doc in $documents) {
        foreach ($n in $doc.SelectNodes('/Defs/*/defName')) { $names[$n.InnerText] = $true }
        foreach ($n in $doc.SelectNodes('/Defs/*[@Name]')) { $parents[$n.GetAttribute('Name')] = $true }
    }
    foreach ($doc in $documents) {
        foreach ($n in $doc.SelectNodes('/Defs//*')) {
            if ($n.GetAttribute('ParentName').StartsWith('ACS_')) {
                Assert ($parents.ContainsKey($n.GetAttribute('ParentName'))) "Unknown parent $($n.GetAttribute('ParentName'))"
            }
            if ($n.ChildNodes.Count -eq 1 -and $n.FirstChild.NodeType -eq 'Text' -and $n.InnerText -match '^ACS_\w+$') {
                Assert ($names.ContainsKey($n.InnerText)) "Unknown local reference $($n.InnerText)"
            }
            if ($n.LocalName.StartsWith('ACS_')) {
                Assert ($names.ContainsKey($n.LocalName)) "Unknown dictionary reference $($n.LocalName)"
            }
        }
    }
}
Test 'Custom graphics have the required files or stack directory' {
    foreach ($doc in $documents) {
        foreach ($n in $doc.SelectNodes('//texPath[starts-with(text(), "ACS/")]')) {
            $base = Join-Path $ModPath "Textures/$($n.InnerText)"
            $graphic = $n.ParentNode.graphicClass
            if ($graphic -eq 'Graphic_StackCount') {
                Assert ((Test-Path -LiteralPath $base -PathType Container) -and @(Get-ChildItem -LiteralPath $base -Filter *.png).Count -gt 0) "Empty stack graphic $base"
            } elseif ($graphic -eq 'Graphic_Single') {
                Assert (Test-Path -LiteralPath "$base.png") "Missing $base.png"
            } else {
                foreach ($direction in 'north','east','south') {
                    Assert (Test-Path -LiteralPath "${base}_$direction.png") "Missing ${base}_$direction.png"
                }
            }
        }
    }
}
Test 'Both ranged attacks resolve to vanilla explosive projectiles' {
    foreach ($name in 'ACS_DarkMatterBeetle','ACS_Gabriel') {
        $animal = Def 'ThingDef' $name
        $shot = Def 'ThingDef' $animal.verbs.li.defaultProjectile
        Assert ($animal.verbs.li.verbClass -eq 'Verb_Shoot') "$name cannot shoot"
        Assert ($shot.thingClass -eq 'Projectile_Explosive') "$name requires a non-vanilla projectile"
        Assert ([double]$shot.projectile.explosionRadius -gt 0) "$name has no explosion"
        Assert ((Def 'PawnKindDef' $name).canArriveManhunter -eq 'false') "$name can arrive in manhunter packs"
    }
}
Test 'Anatomy repairs and corpse fallback stay intact' {
    $beetle = Def 'ThingDef' 'ACS_DarkMatterBeetle'
    foreach ($side in 'left','right') {
        $tool = $beetle.SelectSingleNode("tools/li[label='$side claw']")
        Assert ($tool.linkedBodyPartsGroup -eq "ACS_BeetleFront${side}Claw") "Wrong $side claw group"
    }
    $body = Def 'BodyDef' 'ACS_Seraphim'
    Assert ($body.SelectSingleNode(".//li[customLabel='right leg']/groups/li").InnerText -eq 'ACS_AngelRightLeg') 'Right leg uses wrong group'
    $wings = @($body.SelectNodes(".//li[def='ACS_AngelWing']/customLabel") | ForEach-Object InnerText)
    Assert ($wings.Count -eq 8 -and @($wings | Select-Object -Unique).Count -eq 8) 'Eight distinct wing labels required'
    Assert ($null -eq (Def 'PawnKindDef' 'ACS_DarkMatterBeetle').SelectSingleNode('.//dessicatedBodyGraphicData')) 'Broken desiccated graphic restored'
}
Test 'All five production bills are reachable and have valid products' {
    $bench = Def 'ThingDef' 'ACS_DarkMatterProduction'
    $giver = Def 'WorkGiverDef' 'ACS_DoBillsUseDarkMatterProduction'
    Assert ($giver.giverClass -eq 'WorkGiver_DoBill' -and $giver.fixedBillGiverDefs.li -contains $bench.defName) 'Workbench has no bill work giver'
    $recipes = @($index.Values | Where-Object Name -eq 'RecipeDef')
    Assert ($recipes.Count -eq 5) 'Expected five production recipes'
    foreach ($recipe in $recipes) {
        $users = @($recipe.recipeUsers.li)
        if ($recipe.ParentName) {
            foreach ($doc in $documents) {
                $parent = $doc.SelectSingleNode("/Defs/RecipeDef[@Name='$($recipe.ParentName)']")
                if ($parent) { $users += @($parent.recipeUsers.li) }
            }
        }
        Assert (($bench.recipes.li -contains $recipe.defName) -or ($users -contains $bench.defName)) "Unreachable bill $($recipe.defName)"
        Assert ($recipe.products.ChildNodes.Count -gt 0) "No products for $($recipe.defName)"
        foreach ($product in $recipe.products.ChildNodes) {
            $null = Def 'ThingDef' $product.Name
            Assert ([double]$product.InnerText -gt 0) "Invalid product count in $($recipe.defName)"
        }
    }
    $brain = Def 'ThingDef' 'ACS_KakineTeitokuBrain'
    Assert ($brain.tradeability -eq 'All' -and $brain.tradeTags.li -contains 'ExoticMisc') 'First brain fragment cannot enter exotic trade stock'
}
Test 'Egg hatches the beetle after one day' {
    $egg = Def 'ThingDef' 'ACS_EggBeetle'
    $hatcher = $egg.SelectSingleNode("comps/li[@Class='CompProperties_Hatcher']")
    Assert ($hatcher.hatcherDaystoHatch -eq '1') 'Wrong hatch duration'
    Assert ($hatcher.hatcherPawn -eq 'ACS_DarkMatterBeetle') 'Wrong hatchling'
    $null = Def 'PawnKindDef' $hatcher.hatcherPawn
}
Test 'All 41 hairstyles retain their generation tags and Chinese labels' {
    $chineseFolder = Get-ChildItem (Join-Path $ModPath 'Languages') -Directory | Where-Object Name -Like 'ChineseSimplified*'
    $chineseDocuments = @(Get-ChildItem -LiteralPath $chineseFolder.FullName -Recurse -Filter *.xml | ForEach-Object {
        [xml](Get-Content $_.FullName -Raw -Encoding UTF8)
    })
    $hair = @($index.Values | Where-Object Name -eq 'HairDef')
    Assert ($hair.Count -eq 41) 'Expected 41 hairstyles'
    foreach ($h in $hair) {
        foreach ($tag in 'Urban','Rural','Punk') {
            Assert ($h.styleTags.li -contains $tag) "$($h.defName) missing $tag"
        }
        $labels = @($chineseDocuments | ForEach-Object { $_.SelectNodes("/LanguageData/$($h.defName).label") })
        Assert ($labels.Count -eq 1 -and -not [string]::IsNullOrWhiteSpace($labels[0].InnerText)) "Missing or duplicate Chinese label for $($h.defName)"
    }
}
Write-Output "$script:passed passed; $script:failures failed."
if ($script:failures) { exit 1 }
