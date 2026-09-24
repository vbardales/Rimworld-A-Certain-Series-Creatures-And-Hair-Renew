using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using RimWorks.Pickle;
using RimWorld;
using Verse;

namespace ACertainSeries.PickleSteps
{
    /// <summary>
    /// What no stock Pickle step reaches, and what only a running game can show about this mod:
    /// that a creature's innate shot leaves and lands, that a trader's stock can hold the brain
    /// fragment the propagator cannot be built without, that an egg hatches, that a body part is
    /// found by the label the player reads, and what a butchered creature yields.
    ///
    /// Every phrase starts with "A Certain Series:". Pickle matches steps on their text alone, across
    /// every suite loaded in a run, so an unprefixed phrase can collide with another suite's.
    ///
    /// Body parts are found by label, in the language the pass runs in. A scenario that names the
    /// English label therefore belongs to the English pass, and its French twin names the French one.
    /// A label shared by two parts is a failure here, not a first-match: that is how eight wings under
    /// one label was hidden in the original mod.
    /// </summary>
    [PickleSteps]
    public sealed class AcsSteps
    {
        private sealed class ShotLog
        {
            public string ProjectileDef;
            public int Seen;
            public int LeftInFlight;
            public bool BurstFinished;
        }

        private static Map Map(PickleContext ctx)
        {
            ctx.Require(Find.CurrentMap != null, "load a map before invoking an A Certain Series step");
            return Find.CurrentMap;
        }

        /// <summary>The one spawned pawn of a kind. Two would make every later step ambiguous.</summary>
        private static Pawn PawnOfKind(PickleContext ctx, string kindDefName)
        {
            var found = Map(ctx).mapPawns.AllPawnsSpawned.Where(p => p.kindDef != null && p.kindDef.defName == kindDefName).ToList();
            ctx.Assert(found.Count == 1, $"expected exactly one spawned {kindDefName}, found {found.Count}");
            return found[0];
        }

        private static Pawn Colonist(PickleContext ctx, string name)
        {
            var found = Map(ctx).mapPawns.FreeColonists
                .Where(p => p.LabelShort == name || (p.Name != null && (p.Name.ToStringShort == name || p.Name.ToStringFull == name)))
                .ToList();
            ctx.Assert(found.Count == 1, $"expected exactly one colonist called {name}, found {found.Count}");
            return found[0];
        }

        private static ThingDef Def(PickleContext ctx, string defName)
        {
            var def = DefDatabase<ThingDef>.GetNamedSilentFail(defName);
            ctx.Assert(def != null, $"no ThingDef named {defName}");
            return def;
        }

        /// <summary>Exactly one part with this label, or the step fails and says how many there were.</summary>
        private static BodyPartRecord Part(PickleContext ctx, Pawn pawn, string label)
        {
            var parts = pawn.RaceProps.body.AllParts.Where(p => p.Label == label).ToList();
            ctx.Assert(parts.Count == 1, $"expected exactly one part of {pawn.kindDef.defName} labelled \"{label}\", found {parts.Count}");
            return parts[0];
        }

        private static HediffDef Hediff(PickleContext ctx, string defName)
        {
            var def = DefDatabase<HediffDef>.GetNamedSilentFail(defName);
            ctx.Assert(def != null, $"no HediffDef named {defName}");
            return def;
        }

        // ---- the machine ---------------------------------------------------------------------------

        /// <summary>
        /// The propagator draws 5000 W and a pawn never walks to an unpowered bench. Whether the fixture's
        /// own network reaches a given cell is not known, so this switches the component on directly. It
        /// tests the bench, its bills and its work giver, not the power grid.
        /// </summary>
        [Given("A Certain Series: the {string} at \\({int}, {int}\\) is powered")]
        public void Powered(PickleContext ctx, string defName, int x, int z)
        {
            var building = new IntVec3(x, 0, z).GetThingList(Map(ctx)).FirstOrDefault(t => t.def.defName == defName);
            ctx.Assert(building != null, $"no {defName} at ({x}, {z})");
            var power = building.TryGetComp<CompPowerTrader>();
            ctx.Assert(power != null, $"{defName} at ({x}, {z}) has no power component");
            power.PowerOn = true;
            ctx.Assert(power.PowerOn, $"{defName} at ({x}, {z}) would not switch on");
        }

        // ---- reading a creature -------------------------------------------------------------------

        [When("A Certain Series: I select the {string}")]
        public void Select(PickleContext ctx, string kindDefName)
        {
            var pawn = PawnOfKind(ctx, kindDefName);
            Find.Selector.ClearSelection();
            Find.Selector.Select(pawn, playSound: false, forceDesignatorDeselect: true);
            Find.CameraDriver.JumpToCurrentMapLoc(pawn.Position);
        }

        [When("A Certain Series: the {string} is given a {string} on its {string}")]
        public void GivenInjury(PickleContext ctx, string kindDefName, string hediffDefName, string partLabel)
        {
            var pawn = PawnOfKind(ctx, kindDefName);
            var part = Part(ctx, pawn, partLabel);
            var hediff = HediffMaker.MakeHediff(Hediff(ctx, hediffDefName), pawn, part);
            hediff.Severity = 3f;
            pawn.health.AddHediff(hediff, part);
        }

        [Then("A Certain Series: the {string} has a {string} on its {string}")]
        public void HasInjury(PickleContext ctx, string kindDefName, string hediffDefName, string partLabel)
        {
            var pawn = PawnOfKind(ctx, kindDefName);
            var part = Part(ctx, pawn, partLabel);
            ctx.Assert(pawn.health.hediffSet.hediffs.Any(h => h.def.defName == hediffDefName && h.Part == part),
                $"{kindDefName} has no {hediffDefName} on its {partLabel}");
        }

        [Then("A Certain Series: the {string} has no {string} on its {string}")]
        public void HasNoInjury(PickleContext ctx, string kindDefName, string hediffDefName, string partLabel)
        {
            var pawn = PawnOfKind(ctx, kindDefName);
            var part = Part(ctx, pawn, partLabel);
            ctx.Assert(!pawn.health.hediffSet.hediffs.Any(h => h.def.defName == hediffDefName && h.Part == part),
                $"{kindDefName} has a {hediffDefName} on its {partLabel}, and should not");
        }

        // ---- the innate shots ---------------------------------------------------------------------

        /// <summary>
        /// Starts the creature's own ranged verb at a cell, then watches every tick until its burst is
        /// over and the projectiles are gone. It polls per tick, not per frame: a projectile at this
        /// speed lives a handful of ticks, and at a fast game speed several ticks pass between frames.
        /// The result is kept for the Then step that reads it.
        /// </summary>
        [When("A Certain Series: the {string} fires at \\({int}, {int}\\) and its {string} projectiles are watched", TimeoutSeconds = 100f)]
        public async Task Fire(PickleContext ctx, string kindDefName, int x, int z, string projectileDefName)
        {
            var map = Map(ctx);
            var pawn = PawnOfKind(ctx, kindDefName);
            var projectile = Def(ctx, projectileDefName);
            var verb = pawn.VerbTracker.AllVerbs.FirstOrDefault(v => v.verbProps.defaultProjectile == projectile);
            ctx.Assert(verb != null, $"{kindDefName} has no verb that fires {projectileDefName}");

            var log = new ShotLog { ProjectileDef = projectileDefName };
            ctx.Assert(verb.TryStartCastOn(new LocalTargetInfo(new IntVec3(x, 0, z))),
                $"{kindDefName} refused to start casting at ({x}, {z}): out of range, out of sight, or too close");

            var seen = new HashSet<int>();
            for (int tick = 0; tick < 3000; tick++)
            {
                await ctx.WaitTicks(1);
                foreach (var thing in map.listerThings.ThingsOfDef(projectile)) seen.Add(thing.thingIDNumber);
                log.BurstFinished = verb.state == VerbState.Idle;
                log.LeftInFlight = map.listerThings.ThingsOfDef(projectile).Count;
                if (log.BurstFinished && seen.Count > 0 && log.LeftInFlight == 0) break;
            }
            log.Seen = seen.Count;
            ctx.Set(log);
        }

        [Then("A Certain Series: at least {int} {string} projectiles were seen and none is left in flight")]
        public void ShotsLanded(PickleContext ctx, int minimum, string projectileDefName)
        {
            var log = ctx.Get<ShotLog>();
            ctx.Require(log != null && log.ProjectileDef == projectileDefName, "watch the projectile first, with the same def");
            ctx.Assert(log.Seen >= minimum, $"{projectileDefName}: {log.Seen} projectile(s) seen, at least {minimum} expected");
            ctx.Assert(log.BurstFinished, $"{projectileDefName}: the burst had not finished when the watch ended");
            ctx.Assert(log.LeftInFlight == 0, $"{projectileDefName}: {log.LeftInFlight} projectile(s) still in flight when the watch ended");
        }

        // ---- the first brain fragment -------------------------------------------------------------

        /// <summary>
        /// Builds a trader's tag-driven stock again and again, the way the game builds it when a trader
        /// arrives, and counts how often a def is in it. Only the tag generators are used: the others can
        /// build pawns, which are not meant to be thrown away unspawned. A miss over many stocks is not a
        /// proof of impossibility, but it is a failure to investigate: the propagator cannot be built
        /// without this fragment and only a trader can bring the first one.
        /// </summary>
        [Then("A Certain Series: {int} stocks of the trader {string} offer {string} at least once")]
        public void StocksOffer(PickleContext ctx, int samples, string traderKindDefName, string thingDefName)
        {
            var kind = DefDatabase<TraderKindDef>.GetNamedSilentFail(traderKindDefName);
            ctx.Assert(kind != null, $"no TraderKindDef named {traderKindDefName}");
            var generators = kind.stockGenerators.OfType<StockGenerator_Tag>().ToList();
            ctx.Assert(generators.Count > 0, $"{traderKindDefName} has no tag-driven stock generator");
            var faction = Find.FactionManager.AllFactionsVisible.FirstOrDefault(f => !f.IsPlayer);
            ctx.Require(faction != null, "the fixture has no non-player faction to generate a stock for");

            int stocksWithIt = 0;
            for (int i = 0; i < samples; i++)
            {
                bool offered = false;
                foreach (var generator in generators)
                    foreach (var thing in generator.GenerateThings(Map(ctx).Tile, faction))
                        if (thing.def.defName == thingDefName) offered = true;
                if (offered) stocksWithIt++;
            }
            ctx.Assert(stocksWithIt > 0,
                $"{thingDefName} was in none of {samples} generated stocks of {traderKindDefName}: check the trade tag, the tradeability and the generator's exclusions");
        }

        // ---- the egg ------------------------------------------------------------------------------

        /// <summary>
        /// The end of the incubation (see SetIncubation for why not the whole day). Set the game speed first.
        /// The wait ends when the egg is gone and a beetle exists. It must stay under the 120 s the watchdog
        /// allows a scenario.
        /// </summary>
        [When("A Certain Series: I wait for the egg at \\({int}, {int}\\) to hatch", TimeoutSeconds = 100f)]
        public async Task WaitForHatch(PickleContext ctx, int x, int z)
        {
            var map = Map(ctx);
            var cell = new IntVec3(x, 0, z);
            var egg = cell.GetThingList(map).FirstOrDefault(t => t.def.defName == "ACS_EggBeetle");
            ctx.Assert(egg != null, $"no ACS_EggBeetle at ({x}, {z})");
            await ctx.WaitUntil(() => egg.Destroyed
                && map.mapPawns.AllPawnsSpawned.Any(p => p.kindDef != null && p.kindDef.defName == "ACS_DarkMatterBeetle"), 95f);
            ctx.Assert(egg.Destroyed, "the egg did not hatch: check the temperature at its cell");
        }

        [Then("A Certain Series: the {string} has no faction")]
        public void HasNoFaction(PickleContext ctx, string kindDefName)
        {
            var pawn = PawnOfKind(ctx, kindDefName);
            ctx.Assert(pawn.Faction == null, $"{kindDefName} belongs to {pawn.Faction?.Name}, and an egg not laid in the colony hatches wild");
        }

        private sealed class NotedIncubation
        {
            public float Progress;
        }

        /// <summary>
        /// The hatcher keeps its progress in a private field, so this reads it by name. If the game renames
        /// it the step fails and says so, rather than reading nothing and passing.
        /// </summary>
        private static void IncubationField(PickleContext ctx, int x, int z, out CompHatcher hatcher, out System.Reflection.FieldInfo field)
        {
            var egg = new IntVec3(x, 0, z).GetThingList(Map(ctx)).FirstOrDefault(t => t.def.defName == "ACS_EggBeetle");
            ctx.Assert(egg != null, $"no ACS_EggBeetle at ({x}, {z})");
            hatcher = egg.TryGetComp<CompHatcher>();
            ctx.Assert(hatcher != null, "the egg has no hatcher component");
            field = typeof(CompHatcher).GetField("gestateProgress", System.Reflection.BindingFlags.NonPublic | System.Reflection.BindingFlags.Instance);
            ctx.Require(field != null, "CompHatcher.gestateProgress no longer exists: the game renamed it, update this step");
        }

        private static float Incubation(PickleContext ctx, int x, int z)
        {
            IncubationField(ctx, x, z, out var hatcher, out var field);
            return (float)field.GetValue(hatcher);
        }

        /// <summary>
        /// A whole game day of incubation is 60000 ticks, which the headless install plays at about 500 to 700
        /// a second: too long for the watchdog, which ends a scenario after 120 real seconds. So the scenario
        /// starts the egg near the end. That the hatcher takes one day is asserted offline (Test-Mod.ps1,
        /// hatcherDaystoHatch); what only the game shows is the hatching and the faction rule.
        /// </summary>
        [Given("A Certain Series: the incubation of the egg at \\({int}, {int}\\) is set to {int} percent")]
        public void SetIncubation(PickleContext ctx, int x, int z, int percent)
        {
            ctx.Assert(percent >= 0 && percent < 100, "the incubation must be set below 100 percent, or the egg hatches at once");
            IncubationField(ctx, x, z, out var hatcher, out var field);
            field.SetValue(hatcher, percent / 100f);
        }

        [When("A Certain Series: I note the incubation of the egg at \\({int}, {int}\\)")]
        public void NoteIncubation(PickleContext ctx, int x, int z)
        {
            var progress = Incubation(ctx, x, z);
            ctx.Assert(progress > 0f, $"the egg at ({x}, {z}) has not begun to incubate: progress is {progress}");
            ctx.Set(new NotedIncubation { Progress = progress });
        }

        [Then("A Certain Series: the egg at \\({int}, {int}\\) has incubated as far as noted")]
        public void IncubationKept(PickleContext ctx, int x, int z)
        {
            var noted = ctx.Get<NotedIncubation>();
            ctx.Require(noted != null, "note the incubation before comparing it");
            var progress = Incubation(ctx, x, z);
            ctx.Assert(progress >= noted.Progress, $"the egg's incubation went back from {noted.Progress} to {progress}");
        }

        // ---- butchering ---------------------------------------------------------------------------

        [Then("A Certain Series: butchering a {string} by {string} yields {string} and no meat")]
        public void ButcherYields(PickleContext ctx, string kindDefName, string butcherName, string productDefName)
        {
            Yields(ctx, kindDefName, butcherName, new[] { productDefName });
        }

        [Then("A Certain Series: butchering a {string} by {string} yields {string} and {string} and no meat")]
        public void ButcherYieldsTwo(PickleContext ctx, string kindDefName, string butcherName, string first, string second)
        {
            Yields(ctx, kindDefName, butcherName, new[] { first, second });
        }

        private static void Yields(PickleContext ctx, string kindDefName, string butcherName, string[] expected)
        {
            var kind = DefDatabase<PawnKindDef>.GetNamedSilentFail(kindDefName);
            ctx.Assert(kind != null, $"no PawnKindDef named {kindDefName}");
            var butcher = Colonist(ctx, butcherName);
            var animal = PawnGenerator.GeneratePawn(kind);
            var products = animal.ButcherProducts(butcher, 1f).ToList();
            // Generated without a map and never spawned: discard it, or it stays a pawn nothing owns.
            animal.Discard(silentlyRemoveReferences: true);
            var names = string.Join(", ", products.Select(p => $"{p.stackCount} {p.def.defName}"));
            foreach (var wanted in expected)
                ctx.Assert(products.Any(p => p.def.defName == wanted && p.stackCount > 0), $"butchering {kindDefName} gave [{names}], expected {wanted}");
            ctx.Assert(!products.Any(p => p.def.IsMeat), $"butchering {kindDefName} gave meat: [{names}]");
        }

        // ---- research -----------------------------------------------------------------------------

        [Then("A Certain Series: the research {string} is finished")]
        public void ResearchFinished(PickleContext ctx, string defName)
        {
            var project = DefDatabase<ResearchProjectDef>.GetNamedSilentFail(defName);
            ctx.Assert(project != null, $"no ResearchProjectDef named {defName}");
            ctx.Assert(project.IsFinished, $"{defName} is not finished");
        }

        // ---- a label, read by def type --------------------------------------------------------------

        /// <summary>
        /// Pickle's <c>def "X" field "label" is "Y"</c> refuses a name that several def types share, and this
        /// mod shares three (the creatures' race and kind, the angel core's item, part and group). This one says
        /// which type, so each of the two translations of a creature is read on its own def.
        /// </summary>
        [Then("A Certain Series: the {word} {string} is labelled {string}")]
        public void IsLabelled(PickleContext ctx, string typeName, string defName, string expected)
        {
            var type = GenTypes.GetTypeInAnyAssembly(typeName);
            ctx.Assert(type != null && typeof(Def).IsAssignableFrom(type), $"{typeName} is not a def type");
            var def = GenDefDatabase.GetDef(type, defName, false);
            ctx.Assert(def != null, $"no {typeName} named {defName}");
            ctx.Assert(def.label == expected, $"{typeName} {defName} is labelled \"{def.label}\", not \"{expected}\"");
        }

        // ---- the recipes another mod gives a creature ---------------------------------------------

        /// <summary>
        /// What a race is offered, once every patch has run and the recipe users are resolved. Comparing
        /// two races that inherit the same base recipes needs no recipe name: the other mod's surgeries are
        /// created by its own patches, so their names are not written anywhere this suite can read.
        /// </summary>
        [Then("A Certain Series: the {string} is offered more recipes than the {string}")]
        public void OfferedMoreRecipes(PickleContext ctx, string moreDefName, string fewerDefName)
        {
            var more = Def(ctx, moreDefName);
            var fewer = Def(ctx, fewerDefName);
            var moreCount = more.AllRecipes.Count;
            var fewerCount = fewer.AllRecipes.Count;
            ctx.Assert(moreCount > fewerCount, $"{moreDefName} is offered {moreCount} recipes and {fewerDefName} {fewerCount}: expected more for the first");
        }

        // ---- the hairstyles -----------------------------------------------------------------------

        [When("A Certain Series: I give {string} the hairstyle {string}")]
        public void GiveHairstyle(PickleContext ctx, string colonistName, string hairDefName)
        {
            var pawn = Colonist(ctx, colonistName);
            var hair = DefDatabase<HairDef>.GetNamedSilentFail(hairDefName);
            ctx.Assert(hair != null, $"no HairDef named {hairDefName}");
            pawn.story.hairDef = hair;
            pawn.Drawer.renderer.SetAllGraphicsDirty();
        }

        [Then("A Certain Series: {string} wears the hairstyle {string}")]
        public void WearsHairstyle(PickleContext ctx, string colonistName, string hairDefName)
        {
            var pawn = Colonist(ctx, colonistName);
            ctx.Assert(pawn.story.hairDef != null && pawn.story.hairDef.defName == hairDefName,
                $"{colonistName} wears {pawn.story.hairDef?.defName}, not {hairDefName}");
        }
    }
}
