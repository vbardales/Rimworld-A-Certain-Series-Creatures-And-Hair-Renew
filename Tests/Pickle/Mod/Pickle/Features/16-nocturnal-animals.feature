# Runtime check only, and only with the other mod present: @requires skips the scenario in every pass that
# does not mount it, and skipping is not a pass. It runs in the pass built with wsl-deps.avec-nocturnal.map.
# Tests/Test-Mod.ps1 owns what a file can prove (the patch text, its guard, that nothing is asked of the load
# order). What only the game shows is that the patch was applied to the beetle's race and to nothing else,
# and that the other mod's own class accepted the value. What the beetle then does at night is that mod's
# work and is not asserted here.
@requires:Mlie.XNDNocturnalAnimals
Feature: The beetle is nocturnal with Nocturnal Animals

  Scenario: the beetle has the nocturnal body clock and the seraph, left diurnal on purpose, has none
    Given mod "mlie.xndnocturnalanimals" is loaded
    And mod "nelim.acertainseriescreaturesandhairrenew" is loaded
    Then A Certain Series: the "ACS_DarkMatterBeetle" has the body clock "Nocturnal"
    And A Certain Series: the "ACS_Gabriel" has no body clock of its own
    And no warnings from mod "A Certain Series - Creatures and Hair Renew (unofficial)"
    And no errors were logged
