# Pictures for the Workshop gallery, not a test: the two creatures and the propagator drawn close, in the zen
# meadow studio of PickleTools, without the interface. What the scenario asserts is only that they exist; the
# pictures are the point and are read by eye (@review). Nothing is placed by coordinates, because the studio's
# free ground is not known here: each one is put some cells east of a colonist, on the nearest standable cell.
@review @en-only @requires:nelim.pickletools.screenshotstudio
Feature: Gallery pictures of the creatures and the propagator

  Scenario: the beetle, the seraph and the propagator, each close up in the studio
    Given the save "nelim-zen-meadow-studio" is loaded
    And game speed is paused
    And a colonist "Rina" exists
    When A Certain Series: I spawn a "ACS_DarkMatterBeetle" pawn 5 cells east of "Rina"
    And A Certain Series: I spawn a "ACS_Gabriel" pawn 12 cells east of "Rina"
    And A Certain Series: I place a "ACS_DarkMatterProduction" 19 cells east of "Rina"
    Then 1 "ACS_DarkMatterBeetle" exist
    And 1 "ACS_Gabriel" exist
    When Nelim's Pickle Tools: studio presentation mode is enabled
    And A Certain Series: I bring the camera to 3 cells' height 5 cells east of "Rina"
    And I take a screenshot "gallery white rhinoceros beetle"
    And A Certain Series: I bring the camera to 4 cells' height 12 cells east of "Rina"
    And I take a screenshot "gallery seraph"
    And A Certain Series: I bring the camera to 3 cells' height 19 cells east of "Rina"
    And I take a screenshot "gallery propagator"
    Then no errors were logged
