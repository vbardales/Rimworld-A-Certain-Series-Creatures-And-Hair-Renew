# A Certain Series — Creatures and Hair Renew (unofficial)

UNOFFICIAL. This mod is published without the original author's explicit consent. If the original author contacts me to request its removal, I undertake to take it down promptly.

Two creatures and forty-one hairstyles, taken out of [某系列MOD](https://steamcommunity.com/sharedfiles/filedetails/?id=1667943729)
by 混沌の味方 — a RimWorld 1.0 fan mod for *A Certain Magical Index* — and brought forward to 1.6.

I am not the author of the original. See [ATTRIBUTION.md](ATTRIBUTION.md) for what was taken,
what was left behind, and what had to change; and [LICENSE](LICENSE) for what the MIT notice does
and does not cover.

## What is in it

**The white rhinoceros beetle** (白色独角仙). A pack animal grown out of dark matter. It never
eats, feels neither cold nor heat, moves faster than anything else on the map, and the horn on
its head is an explosive cannon with a fifty-tile reach. Trainable to advanced, tame at a glance,
and it butchers into no meat at all — only dark matter, a metallic stuff that barely wears, does
not burn, and makes armour and blades out of all proportion to their weight.

**God's Power** (神之力), a seraph. Eight wings of water, a crystal sword grown out of its right
arm, and a shot that opens a five-tile explosion eight times a burst. Ten thousand years of life,
no pain worth the name, and no one has ever tamed one. Butchering it yields heavenly cloth and a
single angel core.

**The dark matter propagator** (未元物质生产机), a refrigerator-shaped worktable that makes dark
matter multiply, and the chain that runs through it: a preserved fragment of the second-ranked
esper's brain, dark matter, a condensed white sphere, and an egg that hatches a beetle in a day.
One research project on the main tab unlocks the whole of it.

**Forty-one hairstyles** from the series, twenty-three female and eighteen male, tagged Urban,
Rural and Punk exactly as the original had them — so any pawn can be generated with any of them,
and all of them are available at the styling station.

Neither creature spawns in the wild. The seraph reaches a colony only through exotic goods
traders, caravan or orbital. The beetle can be bought the same way, or bred at the propagator.

The propagator costs one brain fragment to build, and only a propagator can grow another, so the
first fragment has to be bought - from an outlander or orbital exotic trader, or from the Empire.
That bootstrap is the original author's design, kept as it was.

## What is not in it

The original also carried Academy City's powered armour and weapons, a set of power buildings
that redefined vanilla's own, five human traits, and a line of dark matter prosthetics with their
surgery. None of that is here.

Two things worth knowing before you install it:

- Because none of the power buildings came across, **this mod redefines nothing that belongs to
  the base game**. It does not compete with any other mod over a vanilla def.
- The original gated everything behind a research tab of its own carrying eight projects. Only
  one of them concerned the propagator, so the two that led to it are folded into **a single
  project on the main tab**, at their combined cost. **No new research tab.**

## Layout

```
ACertainSeriesCreaturesAndHairRenew/
  Mod/          published — this is what the NTFS junction into RimWorld/Mods points at
    About/
    Defs/       123 defs, no C#
    Languages/  the original Chinese
    Textures/   everything under an ACS/ root
    LICENSE, ATTRIBUTION.md — copies of the two at the root, so they travel with the download
  Art/          preview sources, never published
```

There is no assembly: the whole mod is XML and PNG.

## Naming

Every def name begins with `ACS_` and every texture path with `ACS/`. The original used bare
names — hairstyles called `2` and `index`, body parts called `Core` and `Sword`, a texture folder
called `Resource` — and RimWorld resolves a collision between two mods by keeping whichever
loaded last, without saying so. The prefix was free to add before the first publication and will
not be free after it. `ATTRIBUTION.md` says more.

## Credits

- **混沌の味方** — the creatures, the hairstyles, every texture, and the Chinese text.
- 1.6 extraction, English text and corrections: **nelim**. Made with the help of an AI assistant.

If I do not answer within a reasonable time after being contacted, anyone may freely update this
or any other of my mods, including publishing a continuation of it. All credit must be preserved.
