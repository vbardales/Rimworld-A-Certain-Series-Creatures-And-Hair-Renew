# The fixture colony was saved WITHOUT this mod, so every scenario that loads it is the mod being added to an
# existing colony, and this one goes on to save that colony with the mod's content in it and load it again.
# What must survive is what the mod owns: both creatures, the machine and its queued bill, the finished
# research, a hairstyle, and an egg's incubation, which must not start over.
#
# Not covered, and why: an upgrade from a previous revision. The only earlier upload, 0.1.0, held the same
# Mod/ as the tree now under test, so there is no previous revision to upgrade from.
Feature: State survives a save and reload

  Scenario: creatures, the machine with its bill, a hairstyle and an egg mid-incubation survive a round trip
    Given the save "test-colony" is loaded
    And research "ACS_DarkMatterTech" is finished
    And I spawn a "ACS_DarkMatterBeetle" pawn at (140, 155)
    And I spawn a "ACS_Gabriel" pawn at (144, 155)
    And a "ACS_DarkMatterProduction" is built at (150, 155)
    And I spawn a "ACS_EggBeetle" at (146, 153)
    And a colonist "Styled" exists
    And A Certain Series: I give "Styled" the hairstyle "ACS_Accelerator"
    When I add bill "ACS_Make_EggBeetle" to the "ACS_DarkMatterProduction"
    And I wait 600 ticks
    And A Certain Series: I note the incubation of the egg at (146, 153)
    And I save and reload
    Then 1 "ACS_DarkMatterBeetle" exist
    And 1 "ACS_Gabriel" exist
    And a "ACS_DarkMatterProduction" exists
    And the "ACS_DarkMatterProduction" has 1 bills
    And A Certain Series: the research "ACS_DarkMatterTech" is finished
    And A Certain Series: "Styled" wears the hairstyle "ACS_Accelerator"
    And A Certain Series: the egg at (146, 153) has incubated as far as noted
    And the save round trips
    And no errors were logged
