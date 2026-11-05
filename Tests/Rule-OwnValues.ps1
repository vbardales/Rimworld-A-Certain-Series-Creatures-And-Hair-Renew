param([Parameter(Mandatory)][string]$ModRoot, [string]$SharedDir)

# Own values and facts of this mod's content (creatures, bills, anatomy, hairstyles, ADS2 and Nocturnal patches): one consumer, so
# nothing here is shareable; Tests/Test-Mod.ps1 (generated) runs it after the shared checks. Prints findings, exit 1 on any.
# A rule of generic shape (def prefix, bills reachable, patch only when the other mod is there, hairstyles keep their tags) moves
# to a shared parametrised check when a second mod needs the same shape (Audit tracks them as SHARE rows).
$ErrorActionPreference = 'Stop'
$ModPath = Join-Path (Resolve-Path -LiteralPath $ModRoot).Path 'Mod'
$script:findings = @()

# One rule: the block returns its problems; each is printed under the rule name.
function It([string]$name, [scriptblock]$body) {
    try { $problems = @(& $body | Where-Object { $_ }) } catch { $problems = @("threw: $($_.Exception.GetBaseException().Message)") }
    foreach ($p in $problems) { $script:findings += "[$name] $p" }
}
function Read-Text([string]$p) { Get-Content $p -Raw -Encoding UTF8 }
function Def([string]$type, [string]$name) {
    $node = $script:index["${type}:$name"]
    if ($null -eq $node) { throw "Missing ${type}:$name" }
    return $node
}

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

if ($script:findings.Count) { $script:findings; exit 1 }
Write-Host 'Rule-OwnValues: all own values hold'
exit 0
