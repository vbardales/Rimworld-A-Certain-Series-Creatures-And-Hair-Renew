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
Test 'Creature, material and machine values match what the mod promises' {
    # The leaf defs state these values themselves, so they are read from the XML text: nothing here needs
    # the game's stat worker or an inherited value. What the game does with them (taming, caravans,
    # hunger) is vanilla code reading the same numbers.
    function StatBase($def, [string]$stat) {
        $node = $def.SelectSingleNode("statBases/$stat")
        Assert ($null -ne $node) "$($def.defName) states no $stat"
        return [double]$node.InnerText
    }
    $beetle = Def 'ThingDef' 'ACS_DarkMatterBeetle'
    Assert ((StatBase $beetle 'MoveSpeed') -eq 20) 'The beetle is no longer the fastest animal'
    Assert ((StatBase $beetle 'Wildness') -eq 0) 'The beetle is no longer tame at a glance'
    Assert ((StatBase $beetle 'MeatAmount') -eq 0) 'The beetle leaves meat'
    Assert ((StatBase $beetle 'ComfyTemperatureMin') -eq -500 -and (StatBase $beetle 'ComfyTemperatureMax') -eq 500) 'The beetle is no longer comfortable at any temperature'
    Assert ($beetle.race.baseHungerRate -eq '0') 'The beetle eats'
    Assert ($beetle.race.packAnimal -eq 'true') 'The beetle is not a pack animal'
    Assert ($beetle.race.trainability -eq 'Advanced') 'The beetle is not trainable to advanced'
    $seraph = Def 'ThingDef' 'ACS_Gabriel'
    Assert ((StatBase $seraph 'Wildness') -eq 1) 'The seraph can be tamed'
    Assert ((StatBase $seraph 'MoveSpeed') -eq 80) 'The seraph lost its speed'
    Assert ((StatBase $seraph 'MeatAmount') -eq 0) 'The seraph leaves meat'
    Assert ($seraph.race.baseHungerRate -eq '0') 'The seraph eats'
    $matter = Def 'ThingDef' 'ACS_DarkMatter'
    Assert ((StatBase $matter 'DeteriorationRate') -eq 0) 'Dark matter wears'
    Assert ((StatBase $matter 'SharpDamageMultiplier') -eq 5) 'Dark matter blades lost their edge'
    Assert ((StatBase $matter 'StuffPower_Armor_Sharp') -eq 5) 'Dark matter armour lost its protection'
    foreach ($factor in @{ Flammability = '0'; DeteriorationRate = '0.1'; MaxHitPoints = '10' }.GetEnumerator()) {
        $node = $matter.SelectSingleNode("stuffProps/statFactors/$($factor.Key)")
        Assert ($null -ne $node -and [double]$node.InnerText -eq [double]$factor.Value) "Dark matter no longer multiplies $($factor.Key) by $($factor.Value)"
    }
    $bench = Def 'ThingDef' 'ACS_DarkMatterProduction'
    Assert ([int]$bench.costList.Plasteel -eq 100 -and [int]$bench.costList.ComponentSpacer -eq 50 -and [int]$bench.costList.ACS_KakineTeitokuBrain -eq 1) 'The propagator no longer costs 100 plasteel, 50 spacer components and one brain fragment'
    Assert ([double](Def 'ResearchProjectDef' 'ACS_DarkMatterTech').baseCost -eq 18000) 'The research no longer costs 18000'
}
Test 'No creature kind caps its generation age at zero, which the age generator cannot satisfy' {
    # Seen in the first game run (2026-09-24): with maxGenerationAge 0 every generated beetle and seraph logged
    # "Tried 300 times to generate age". Vanilla animal kinds set neither field, so the defaults apply.
    $kinds = @($index.Values | Where-Object Name -eq 'PawnKindDef')
    Assert ($kinds.Count -eq 2) "Expected the two creature kinds, found $($kinds.Count)"
    foreach ($kind in $kinds) {
        Assert ($null -eq $kind.SelectSingleNode('minGenerationAge') -and $null -eq $kind.SelectSingleNode('maxGenerationAge')) "$($kind.defName) sets a generation age: leave it to the defaults, as vanilla animals do"
    }
}
Test 'No innate verb of a creature asks for a forced miss radius, which throws on every shot in 1.6' {
    # Seen in the first game run of the shots (2026-09-25): with forcedMissRadius above 0.5, Verb_LaunchProjectile
    # calls VerbProperties.GetForceMissFactorFor(EquipmentSource, caster), which reads equipment.def unguarded;
    # an innate verb has no equipment, so every tick of the burst threw a NullReferenceException.
    $verbs = @($index.Values | Where-Object { $_.Name -eq 'ThingDef' -and $_.SelectSingleNode('race') } | ForEach-Object { $_.SelectNodes('verbs/li') })
    Assert ($verbs.Count -eq 2) "Expected the two innate verbs, found $($verbs.Count)"
    foreach ($verb in $verbs) {
        foreach ($field in 'forcedMissRadius', 'forcedMissRadiusClassicMortars') {
            $node = $verb.SelectSingleNode($field)
            Assert (($null -eq $node) -or ([double]$node.InnerText -le 0.5)) "A creature's innate verb sets $field to $($node.InnerText): above 0.5 it throws on every shot"
        }
    }
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
Test 'The Animal Prosthetics 2 patch lists the beetle, only when that mod is there, and the mod loads before it' {
    $adsName = 'A Dog Said... Animal Prosthetics 2'
    $adsId = 'SamBucher.ADogSaidAnimalProsthetics2'
    [xml]$about = Get-Content -LiteralPath (Join-Path $ModPath 'About/About.xml') -Raw -Encoding UTF8
    Assert ($about.ModMetaData.loadBefore.li -contains $adsId) "About.xml does not load before $adsId, whose own patch copies the category lists before a later mod could add to them"
    Assert (-not ($about.ModMetaData.PSObject.Properties.Name -contains 'modDependencies')) 'The compatibility is optional: no mod dependency may be declared'
    [xml]$patch = Get-Content -LiteralPath (Join-Path $ModPath 'Patches/AnimalProsthetics2.xml') -Raw -Encoding UTF8
    $op = $patch.SelectSingleNode('/Patch/Operation')
    Assert ($op.GetAttribute('Class') -eq 'PatchOperationFindMod') 'The patch is not guarded by PatchOperationFindMod'
    Assert (@($op.mods.li) -ceq $adsName) "The guard does not name the mod exactly as '$adsName'"
    $add = $op.match
    Assert ($add.GetAttribute('Class') -eq 'PatchOperationAdd') 'The guarded operation is not a PatchOperationAdd'
    foreach ($cat in 'ADS_Cat1', 'ADS_Cat2', 'ADS_Cat3') {
        Assert ($add.xpath.Contains("@Name=""$cat""")) "The beetle is not added to $cat, and a category includes the ones below it"
    }
    $listed = @($add.value.li)
    Assert ($listed.Count -eq 1 -and $listed[0] -ceq 'ACS_DarkMatterBeetle') "Listed animals are not exactly the beetle: $($listed -join ', ')"
    $null = Def 'ThingDef' $listed[0]
    # The seraph is left out on purpose: none of its parts is a vanilla def, so no surgery names it.
    $seraphBody = Def 'BodyDef' 'ACS_Seraphim'
    $parts = @($seraphBody.SelectNodes('.//def') | ForEach-Object { $_.InnerText } | Sort-Object -Unique)
    Assert (@($parts | Where-Object { -not $_.StartsWith('ACS_') }).Count -eq 0) 'The seraph gained a vanilla body part: reconsider listing it in the other mod'
}
Write-Output "$script:passed passed; $script:failures failed."
if ($script:failures) { exit 1 }
