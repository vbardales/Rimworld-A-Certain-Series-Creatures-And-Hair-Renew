# An egg hatches, and the description promises it hatches wild: like any egg not laid in the colony, it has no
# faction, and the beetle's wildness stat of zero is what makes taming it certain. Taming itself is vanilla
# arithmetic on that stat, asserted offline in Test-Mod.ps1, and is not replayed here.
#
# The egg starts at 95 percent of its incubation, not at zero. A whole game day is 60000 ticks, and the first
# run (2026-09-24) showed the headless install cannot play them inside the 120 seconds the watchdog allows a
# scenario: it tripped, exit 2, and the rest of the run was lost. That the hatcher takes one day is asserted
# offline (Test-Mod.ps1, hatcherDaystoHatch = 1); this scenario shows what only the game shows, that the hatcher
# finishes, produces the beetle, and leaves it with no faction.
@slow
Feature: The beetle egg hatches a wild beetle

  Scenario: an egg not laid in the colony hatches wild
    Given the save "test-colony" is loaded
    And I spawn a "ACS_EggBeetle" at (146, 155)
    And A Certain Series: the incubation of the egg at (146, 155) is set to 95 percent
    And game speed is ultrafast
    When A Certain Series: I wait for the egg at (146, 155) to hatch
    Then 1 "ACS_DarkMatterBeetle" exist
    And A Certain Series: the "ACS_DarkMatterBeetle" has no faction
    And no errors were logged
