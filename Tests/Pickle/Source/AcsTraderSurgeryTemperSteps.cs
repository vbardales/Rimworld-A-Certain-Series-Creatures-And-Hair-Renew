using System;
using System.Collections.Generic;
using System.Linq;
using RimWorks.Pickle;
using RimWorld;
using Verse;

namespace ACertainSeries.PickleSteps
{
    /// <summary>
    /// Who sells the creatures, which surgeries the beetle is really offered, and what the creatures do when
    /// hurt. Same rule as AcsSteps: every phrase starts with "A Certain Series:".
    /// </summary>
    [PickleSteps]
    public sealed class AcsTraderSurgeryTemperSteps
    {
        private static Map Map(PickleContext ctx)
        {
            ctx.Require(Find.CurrentMap != null, "load a map before invoking an A Certain Series step");
            return Find.CurrentMap;
        }

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

        /// <summary>
        /// Every trader kind of the loaded game builds its stock several times. The kinds that ever hold the thing
        /// must all be in the list. Animal generators build pawns; they are destroyed at once, in this disposable
        /// fixture colony. A kind whose generator throws is skipped and counted in the log, not hidden.
        /// </summary>
        [Then("A Certain Series: no trader outside {string} offers {string} in {int} stocks each")]
        public void NoOtherTraderOffers(PickleContext ctx, string allowedList, string thingDefName, int samples)
        {
            var allowed = new HashSet<string>(allowedList.Split(',').Select(s => s.Trim()).Where(s => s.Length > 0));
            var faction = Find.FactionManager.AllFactionsVisible.FirstOrDefault(f => !f.IsPlayer);
            ctx.Require(faction != null, "the fixture has no non-player faction to generate a stock for");
            var offeredBy = new SortedSet<string>();
            int skipped = 0, tried = 0;
            foreach (var kind in DefDatabase<TraderKindDef>.AllDefsListForReading)
            {
                if (kind.stockGenerators == null) continue;
                tried++;
                try
                {
                    for (int i = 0; i < samples && !offeredBy.Contains(kind.defName); i++)
                        foreach (var generator in kind.stockGenerators)
                            foreach (var thing in generator.GenerateThings(Map(ctx).Tile, faction).ToList())
                            {
                                if (thing.def.defName == thingDefName) offeredBy.Add(kind.defName);
                                if (thing is Pawn pawn && !pawn.Destroyed) pawn.Destroy();
                            }
                }
                catch (Exception e)
                {
                    skipped++;
                    Log.Message("[ACS] trader kind " + kind.defName + " skipped: " + e.GetType().Name);
                }
            }
            Log.Message("[ACS] " + thingDefName + " offered by: " + string.Join(", ", offeredBy) + " (" + tried + " kinds tried, " + skipped + " skipped)");
            var strangers = offeredBy.Where(k => !allowed.Contains(k)).ToList();
            ctx.Assert(strangers.Count == 0, $"{thingDefName} is also offered by {string.Join(", ", strangers)}, which the description does not name");
            ctx.Assert(offeredBy.Count > 0, $"{thingDefName} was offered by no trader kind in {samples} stocks each");
        }

        [Then("A Certain Series: the race {string} is not offered the recipe {string}")]
        public void RaceNotOfferedRecipe(PickleContext ctx, string raceDefName, string recipeDefName)
        {
            var race = DefDatabase<ThingDef>.GetNamedSilentFail(raceDefName);
            ctx.Assert(race != null, $"no ThingDef named {raceDefName}");
            ctx.Assert(DefDatabase<RecipeDef>.GetNamedSilentFail(recipeDefName) != null, $"no RecipeDef named {recipeDefName}");
            ctx.Assert(!race.AllRecipes.Any(r => r.defName == recipeDefName), $"{raceDefName} is offered {recipeDefName}");
        }

        /// <summary>
        /// The recipe is offered AND the game finds a part of that def on a real pawn of the kind: being listed is
        /// not being usable.
        /// </summary>
        [Then("A Certain Series: the recipe {string} can be applied on a {string} of a {string}")]
        public void RecipeAppliesOnPart(PickleContext ctx, string recipeDefName, string partDefName, string kindDefName)
        {
            var recipe = DefDatabase<RecipeDef>.GetNamedSilentFail(recipeDefName);
            ctx.Assert(recipe != null, $"no RecipeDef named {recipeDefName}");
            var kind = DefDatabase<PawnKindDef>.GetNamedSilentFail(kindDefName);
            ctx.Assert(kind != null, $"no PawnKindDef named {kindDefName}");
            var pawn = PawnGenerator.GeneratePawn(kind);
            try
            {
                ctx.Assert(pawn.def.AllRecipes.Contains(recipe), $"{kindDefName} is not offered {recipeDefName}");
                var parts = recipe.Worker.GetPartsToApplyOn(pawn, recipe).ToList();
                ctx.Assert(parts.Any(p => p.def.defName == partDefName),
                    $"{recipeDefName} finds no {partDefName} on a {kindDefName}: parts found are [{string.Join(", ", parts.Select(p => p.def.defName))}]");
            }
            finally { if (!pawn.Destroyed) pawn.Destroy(); }
        }

        [When("A Certain Series: the {string} is hurt by the colonist {string}")]
        public void HurtBy(PickleContext ctx, string kindDefName, string colonistName)
        {
            var target = PawnOfKind(ctx, kindDefName);
            var instigator = Colonist(ctx, colonistName);
            target.TakeDamage(new DamageInfo(DamageDefOf.Cut, 1f, 0f, -1f, instigator));
        }

        [Then("A Certain Series: the {string} is in a manhunter state")]
        public void InManhunterState(PickleContext ctx, string kindDefName)
        {
            var pawn = PawnOfKind(ctx, kindDefName);
            var state = pawn.MentalStateDef;
            ctx.Assert(state != null && state.defName.StartsWith("Manhunter"),
                $"{kindDefName} is in {(state == null ? "no mental state" : state.defName)}, not a manhunter state");
        }

        [Then("A Certain Series: the {string} is in no mental state")]
        public void InNoMentalState(PickleContext ctx, string kindDefName)
        {
            var pawn = PawnOfKind(ctx, kindDefName);
            ctx.Assert(pawn.MentalStateDef == null, $"{kindDefName} is in {pawn.MentalStateDef?.defName}");
        }

        [Then("A Certain Series: the colonist {string} is unhurt")]
        public void ColonistUnhurt(PickleContext ctx, string colonistName)
        {
            var pawn = Colonist(ctx, colonistName);
            var injuries = pawn.health.hediffSet.hediffs.OfType<Hediff_Injury>().ToList();
            ctx.Assert(injuries.Count == 0, $"{colonistName} carries {injuries.Count} injuries: {string.Join(", ", injuries.Select(i => i.Label))}");
        }
    }
}
