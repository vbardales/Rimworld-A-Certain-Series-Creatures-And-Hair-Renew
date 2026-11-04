param([string]$ModPath = (Join-Path $PSScriptRoot '../Mod'))

# Offline suite: the generic checks are the shared scripts of the protocols repository (the parent folder of this
# mod), run first; what follows asserts this mod's own values. No game installation or Pester required for the
# own tests. Needs the protocols checkout next to the mod (scripts/lib/TestRunner.ps1, scripts/Check-*.ps1).
$ErrorActionPreference = 'Stop'
$ModPath = (Resolve-Path -LiteralPath $ModPath).Path
$ModRoot = Split-Path -Parent $ModPath
$Protocols = (Resolve-Path -LiteralPath (Join-Path $ModRoot '..')).Path
. (Join-Path $Protocols 'scripts/lib/TestRunner.ps1')

# One shared check as one test: the exit code decides, its output is the detail of a failure.
function Invoke-Shared([string]$Script, [string[]]$Arguments) {
    $out = @(& powershell -NoProfile -ExecutionPolicy Bypass -File (Join-Path $Protocols "scripts/$Script") @Arguments 2>&1 | ForEach-Object { "$_" })
    if ($LASTEXITCODE -ne 0) { $out | Where-Object { $_ -match '\S' } | Select-Object -Last 15 }
}
function Def([string]$type, [string]$name) {
    $node = $script:index["${type}:$name"]
    if ($null -eq $node) { throw "Missing ${type}:$name" }
    return $node
}

It 'Shared: XML well formed, unique defNames, About.xml, Preview and icon (Check-ModBasics)' { Invoke-Shared 'Check-ModBasics.ps1' '-ModRoot', $ModRoot, '-Unofficial' }
It 'Shared: every def reference and inheritance parent resolves (Check-DefRefs)' { Invoke-Shared 'Check-DefRefs.ps1' '-ModPath', $ModPath, '-Brief' }
It 'Shared: every texture path resolves to a shipped file (Check-Textures)' { Invoke-Shared 'Check-Textures.ps1' '-ModRoot', $ModRoot }
It 'Shared: every patch target still exists in the installed mod (Check-PatchTargets)' { Invoke-Shared 'Check-PatchTargets.ps1' '-ModRoot', $ModRoot }

$script:index = @{}
$documents = @()
It 'Definitions are indexed and carry the ACS_ prefix' {
    $files = @(Get-ChildItem -LiteralPath $ModPath -Recurse -Filter *.xml -File)
    if ($files.Count -eq 0) { 'No XML found' }
    foreach ($file in $files) {
        [xml]$doc = Read-Text $file.FullName
        $script:documents += $doc
        foreach ($node in $doc.SelectNodes('/Defs/*[defName]')) {
            $key = "$($node.Name):$($node.defName)"
            if (-not $node.defName.StartsWith('ACS_')) { "Unprefixed $key" }
            $script:index[$key] = $node
        }
    }
    if ($script:index.Count -eq 0) { 'No definitions found' }
}
It 'Metadata includes the repository in the description' {
    [xml]$about = Read-Text (Join-Path $ModPath 'About/About.xml')
    $meta = $about.ModMetaData
    if ($meta.packageId -cne 'nelim.acertainseriescreaturesandhair') { 'Package identity changed' }
    if ($meta.supportedVersions.li -notcontains '1.6') { 'Missing 1.6 support' }
    if ($meta.url -notmatch '^https://github.com/[^/]+/[^/]+$') { 'Missing GitHub repository URL' }
    elseif (-not $meta.description.Contains($meta.url)) { 'Repository URL missing from description' }
}
It 'Both ranged attacks resolve to vanilla explosive projectiles' {
    foreach ($name in 'ACS_DarkMatterBeetle', 'ACS_Gabriel') {
        $animal = Def 'ThingDef' $name
        $shot = Def 'ThingDef' $animal.verbs.li.defaultProjectile
        if ($animal.verbs.li.verbClass -ne 'Verb_Shoot') { "$name cannot shoot" }
        if ($shot.thingClass -ne 'Projectile_Explosive') { "$name requires a non-vanilla projectile" }
        if ([double]$shot.projectile.explosionRadius -le 0) { "$name has no explosion" }
        if ((Def 'PawnKindDef' $name).canArriveManhunter -ne 'false') { "$name can arrive in manhunter packs" }
    }
}
It 'Anatomy repairs and corpse fallback stay intact' {
    $beetle = Def 'ThingDef' 'ACS_DarkMatterBeetle'
    foreach ($side in 'left', 'right') {
        $tool = $beetle.SelectSingleNode("tools/li[label='$side claw']")
        if ($tool.linkedBodyPartsGroup -ne "ACS_BeetleFront${side}Claw") { "Wrong $side claw group" }
    }
    $body = Def 'BodyDef' 'ACS_Seraphim'
    if ($body.SelectSingleNode(".//li[customLabel='right leg']/groups/li").InnerText -ne 'ACS_AngelRightLeg') { 'Right leg uses wrong group' }
    $wings = @($body.SelectNodes(".//li[def='ACS_AngelWing']/customLabel") | ForEach-Object InnerText)
    if ($wings.Count -ne 8 -or @($wings | Select-Object -Unique).Count -ne 8) { 'Eight distinct wing labels required' }
    if ($null -ne (Def 'PawnKindDef' 'ACS_DarkMatterBeetle').SelectSingleNode('.//dessicatedBodyGraphicData')) { 'Broken desiccated graphic restored' }
}
It 'All five production bills are reachable and have valid products' {
    $bench = Def 'ThingDef' 'ACS_DarkMatterProduction'
    $giver = Def 'WorkGiverDef' 'ACS_DoBillsUseDarkMatterProduction'
    if ($giver.giverClass -ne 'WorkGiver_DoBill' -or $giver.fixedBillGiverDefs.li -notcontains $bench.defName) { 'Workbench has no bill work giver' }
    $recipes = @($index.Values | Where-Object Name -eq 'RecipeDef')
    if ($recipes.Count -ne 5) { 'Expected five production recipes' }
    foreach ($recipe in $recipes) {
        $users = @($recipe.recipeUsers.li)
        if ($recipe.ParentName) {
            foreach ($doc in $documents) {
                $parent = $doc.SelectSingleNode("/Defs/RecipeDef[@Name='$($recipe.ParentName)']")
                if ($parent) { $users += @($parent.recipeUsers.li) }
            }
        }
        if (($bench.recipes.li -notcontains $recipe.defName) -and ($users -notcontains $bench.defName)) { "Unreachable bill $($recipe.defName)" }
        if ($recipe.products.ChildNodes.Count -eq 0) { "No products for $($recipe.defName)" }
        foreach ($product in $recipe.products.ChildNodes) {
            $null = Def 'ThingDef' $product.Name
            if ([double]$product.InnerText -le 0) { "Invalid product count in $($recipe.defName)" }
        }
    }
    $brain = Def 'ThingDef' 'ACS_KakineTeitokuBrain'
    if ($brain.tradeability -ne 'All' -or $brain.tradeTags.li -notcontains 'ExoticMisc') { 'First brain fragment cannot enter exotic trade stock' }
}
It 'Creature, material and machine values match what the mod promises' {
    # The leaf defs state these values themselves, so they are read from the XML text: nothing here needs
    # the game's stat worker or an inherited value. What the game does with them (taming, caravans,
    # hunger) is vanilla code reading the same numbers.
    function StatBase($def, [string]$stat) {
        $node = $def.SelectSingleNode("statBases/$stat")
        if ($null -eq $node) { throw "$($def.defName) states no $stat" }
        return [double]$node.InnerText
    }
    $beetle = Def 'ThingDef' 'ACS_DarkMatterBeetle'
    if ((StatBase $beetle 'MoveSpeed') -ne 20) { 'The beetle is no longer the fastest animal' }
    if ((StatBase $beetle 'Wildness') -ne 0) { 'The beetle is no longer tame at a glance' }
    if ((StatBase $beetle 'MeatAmount') -ne 0) { 'The beetle leaves meat' }
    if ((StatBase $beetle 'ComfyTemperatureMin') -ne -500 -or (StatBase $beetle 'ComfyTemperatureMax') -ne 500) { 'The beetle is no longer comfortable at any temperature' }
    if ($beetle.race.baseHungerRate -ne '0') { 'The beetle eats' }
    if ($beetle.race.packAnimal -ne 'true') { 'The beetle is not a pack animal' }
    if ($beetle.race.trainability -ne 'Advanced') { 'The beetle is not trainable to advanced' }
    $seraph = Def 'ThingDef' 'ACS_Gabriel'
    if ((StatBase $seraph 'Wildness') -ne 1) { 'The seraph can be tamed' }
    if ((StatBase $seraph 'MoveSpeed') -ne 80) { 'The seraph lost its speed' }
    if ((StatBase $seraph 'MeatAmount') -ne 0) { 'The seraph leaves meat' }
    if ($seraph.race.baseHungerRate -ne '0') { 'The seraph eats' }
    $matter = Def 'ThingDef' 'ACS_DarkMatter'
    if ((StatBase $matter 'DeteriorationRate') -ne 0) { 'Dark matter wears' }
    if ((StatBase $matter 'SharpDamageMultiplier') -ne 5) { 'Dark matter blades lost their edge' }
    if ((StatBase $matter 'StuffPower_Armor_Sharp') -ne 5) { 'Dark matter armour lost its protection' }
    foreach ($factor in @{ Flammability = '0'; DeteriorationRate = '0.1'; MaxHitPoints = '10' }.GetEnumerator()) {
        $node = $matter.SelectSingleNode("stuffProps/statFactors/$($factor.Key)")
        if ($null -eq $node -or [double]$node.InnerText -ne [double]$factor.Value) { "Dark matter no longer multiplies $($factor.Key) by $($factor.Value)" }
    }
    $bench = Def 'ThingDef' 'ACS_DarkMatterProduction'
    if ([int]$bench.costList.Plasteel -ne 100 -or [int]$bench.costList.ComponentSpacer -ne 50 -or [int]$bench.costList.ACS_KakineTeitokuBrain -ne 1) { 'The propagator no longer costs 100 plasteel, 50 spacer components and one brain fragment' }
    if ([double](Def 'ResearchProjectDef' 'ACS_DarkMatterTech').baseCost -ne 18000) { 'The research no longer costs 18000' }
}
# The two rules below are not in a shared script yet (review of 2026-11-04 asks Check-ConfigErrors or Check-AnimalDefs to take them): kept here until then.
It 'No creature kind caps its generation age at zero, which the age generator cannot satisfy' {
    # Seen in the first game run (2026-09-24): with maxGenerationAge 0 every generated beetle and seraph logged
    # "Tried 300 times to generate age". Vanilla animal kinds set neither field, so the defaults apply.
    $kinds = @($index.Values | Where-Object Name -eq 'PawnKindDef')
    if ($kinds.Count -ne 2) { "Expected the two creature kinds, found $($kinds.Count)" }
    foreach ($kind in $kinds) {
        if ($null -ne $kind.SelectSingleNode('minGenerationAge') -or $null -ne $kind.SelectSingleNode('maxGenerationAge')) { "$($kind.defName) sets a generation age: leave it to the defaults, as vanilla animals do" }
    }
}
It 'The forced miss radius of an innate verb satisfies the config check of the game and does not throw on every shot' {
    # Two rules of 1.6, both seen in the game runs of 2026-09-25.
    # 1. Verb_LaunchProjectile.TryCastShot, with forcedMissRadius above 0.5, calls
    #    VerbProperties.GetForceMissFactorFor(EquipmentSource, caster), which reads equipment.def unguarded; an innate
    #    verb has no equipment, so every tick of the burst threw a NullReferenceException and nothing was fired.
    # 2. VerbProperties.ConfigErrors logs "has incorrect forcedMiss settings" at load unless (forcedMissRadius > 0)
    #    equals whether the projectile causes an explosion (explosionRadius above 0).
    # So an explosive innate verb needs a radius in (0, 0.5], and a non-explosive one exactly 0.
    $verbs = @($index.Values | Where-Object { $_.Name -eq 'ThingDef' -and $_.SelectSingleNode('race') } | ForEach-Object { $_.SelectNodes('verbs/li') })
    if ($verbs.Count -ne 2) { "Expected the two innate verbs, found $($verbs.Count)" }
    foreach ($verb in $verbs) {
        $projectile = Def 'ThingDef' $verb.defaultProjectile
        $explosive = $null -ne $projectile.SelectSingleNode('projectile/explosionRadius') -and [double]$projectile.projectile.explosionRadius -gt 0
        $node = $verb.SelectSingleNode('forcedMissRadius')
        $radius = if ($node) { [double]$node.InnerText } else { 0 }
        if ($radius -gt 0.5) { "The innate verb of $($verb.defaultProjectile) sets forcedMissRadius to ${radius}: above 0.5 it throws on every shot" }
        if (($radius -gt 0) -ne $explosive) { "The innate verb of $($verb.defaultProjectile) is $(if ($explosive) {'explosive but has no'} else {'not explosive but has a'}) forcedMissRadius: the game logs a config error at load" }
        $classic = $verb.SelectSingleNode('forcedMissRadiusClassicMortars')
        if ($null -ne $classic -and [double]$classic.InnerText -gt 0.5) { 'forcedMissRadiusClassicMortars above 0.5 has the same effect as forcedMissRadius' }
    }
}
It 'Egg hatches the beetle after one day' {
    $egg = Def 'ThingDef' 'ACS_EggBeetle'
    $hatcher = $egg.SelectSingleNode("comps/li[@Class='CompProperties_Hatcher']")
    if ($hatcher.hatcherDaystoHatch -ne '1') { 'Wrong hatch duration' }
    if ($hatcher.hatcherPawn -ne 'ACS_DarkMatterBeetle') { 'Wrong hatchling' }
    $null = Def 'PawnKindDef' $hatcher.hatcherPawn
}
It 'All 41 hairstyles retain their generation tags and Chinese labels' {
    $chineseFolder = Get-ChildItem (Join-Path $ModPath 'Languages') -Directory | Where-Object Name -Like 'ChineseSimplified*'
    $chineseDocuments = @(Get-ChildItem -LiteralPath $chineseFolder.FullName -Recurse -Filter *.xml | ForEach-Object { [xml](Read-Text $_.FullName) })
    $hair = @($index.Values | Where-Object Name -eq 'HairDef')
    if ($hair.Count -ne 41) { 'Expected 41 hairstyles' }
    foreach ($h in $hair) {
        foreach ($tag in 'Urban', 'Rural', 'Punk') {
            if ($h.styleTags.li -notcontains $tag) { "$($h.defName) missing $tag" }
        }
        $labels = @($chineseDocuments | ForEach-Object { $_.SelectNodes("/LanguageData/$($h.defName).label") })
        if ($labels.Count -ne 1 -or [string]::IsNullOrWhiteSpace($labels[0].InnerText)) { "Missing or duplicate Chinese label for $($h.defName)" }
    }
}
It 'The Animal Prosthetics 2 patch lists the beetle, only when that mod is there, and the mod loads before it' {
    $adsName = 'A Dog Said... Animal Prosthetics 2'
    $adsId = 'SamBucher.ADogSaidAnimalProsthetics2'
    [xml]$about = Read-Text (Join-Path $ModPath 'About/About.xml')
    if ($about.ModMetaData.loadBefore.li -notcontains $adsId) { "About.xml does not load before $adsId, whose own patch copies the category lists before a later mod could add to them" }
    if ($about.ModMetaData.PSObject.Properties.Name -contains 'modDependencies') { 'The compatibility is optional: no mod dependency may be declared' }
    [xml]$patch = Read-Text (Join-Path $ModPath 'Patches/AnimalProsthetics2.xml')
    $op = $patch.SelectSingleNode('/Patch/Operation')
    if ($op.GetAttribute('Class') -ne 'PatchOperationFindMod') { 'The patch is not guarded by PatchOperationFindMod' }
    if (@($op.mods.li) -cne $adsName) { "The guard does not name the mod exactly as '$adsName'" }
    $add = $op.match
    if ($add.GetAttribute('Class') -ne 'PatchOperationAdd') { 'The guarded operation is not a PatchOperationAdd' }
    foreach ($cat in 'ADS_Cat1', 'ADS_Cat2', 'ADS_Cat3') {
        if (-not $add.xpath.Contains("@Name=""$cat""")) { "The beetle is not added to $cat, and a category includes the ones below it" }
    }
    $listed = @($add.value.li)
    if ($listed.Count -ne 1 -or $listed[0] -cne 'ACS_DarkMatterBeetle') { "Listed animals are not exactly the beetle: $($listed -join ', ')" }
    else { $null = Def 'ThingDef' $listed[0] }
    # The seraph is left out on purpose: none of its parts is a vanilla def, so no surgery names it.
    $seraphBody = Def 'BodyDef' 'ACS_Seraphim'
    $parts = @($seraphBody.SelectNodes('.//def') | ForEach-Object { $_.InnerText } | Sort-Object -Unique)
    if (@($parts | Where-Object { -not $_.StartsWith('ACS_') }).Count -ne 0) { 'The seraph gained a vanilla body part: reconsider listing it in the other mod' }
}
It 'The Nocturnal Animals patch makes the beetle nocturnal, only when that mod is there, and asks for nothing else' {
    $naName = '[XND] Nocturnal Animals (Continued)'
    [xml]$about = Read-Text (Join-Path $ModPath 'About/About.xml')
    if ($about.ModMetaData.PSObject.Properties.Name -contains 'modDependencies') { 'The compatibility is optional: no mod dependency may be declared' }
    if (@($about.ModMetaData.loadBefore.li) -contains 'Mlie.XNDNocturnalAnimals') { 'No load order is needed with Nocturnal Animals: it reads the extension at runtime' }
    [xml]$patch = Read-Text (Join-Path $ModPath 'Patches/NocturnalAnimals.xml')
    $op = $patch.SelectSingleNode('/Patch/Operation')
    if ($op.GetAttribute('Class') -ne 'PatchOperationFindMod') { 'The patch is not guarded by PatchOperationFindMod' }
    # The guard matches by display name; whether the installed copy still has that name is Check-PatchTargets.
    if (@($op.mods.li) -cne $naName) { "The guard does not name the mod exactly as '$naName'" }
    $add = $op.match
    if ($add.GetAttribute('Class') -ne 'PatchOperationAddModExtension') { 'The guarded operation is not a PatchOperationAddModExtension' }
    if ($add.xpath -cne '/Defs/ThingDef[defName="ACS_DarkMatterBeetle"]') { "The patch does not target the beetle's ThingDef alone: $($add.xpath)" }
    $ext = @($add.value.li)
    if ($ext.Count -ne 1 -or $ext[0].GetAttribute('Class') -cne 'NocturnalAnimals.ExtendedRaceProperties') { 'The value is not one NocturnalAnimals.ExtendedRaceProperties extension' }
    elseif ($ext[0].bodyClock -cne 'Nocturnal') { "The beetle's bodyClock is '$($ext[0].bodyClock)', not Nocturnal" }
    $null = Def 'ThingDef' 'ACS_DarkMatterBeetle'
    if ($script:index['ThingDef:ACS_Gabriel'].SelectSingleNode('modExtensions')) { 'The seraph carries a mod extension of its own: the patch leaves it diurnal on purpose' }
}
Complete-Tests
