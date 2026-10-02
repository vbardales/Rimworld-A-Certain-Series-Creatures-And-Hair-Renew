# Pictures for the Workshop gallery, not a test: the two creatures and the propagator drawn close, in the zen
# meadow studio of PickleTools, without the interface. What the scenario asserts is only that they exist; the
# pictures are the point and are read by eye (@review @en-only @requires:nelim.pickletools.screenshotstudio
Feature: Gallery pictures of the creatures and the propagator

  # Staged 2026-10-02 (owner: the gallery is promotional, nothing at generated defaults; PUBLISHING.md). The photographer's
  # second roll, on the same patch of grass as the portraits: the specimens, one after the other, the set cleared between
  # them. The beetle by lamplight with a pot of flowers and a stool, as a naturalist would find it; the seraph between two
  # standing lamps with a small sculpture at its feet; the propagator in a workshop corner with a lamp and a bookcase.
  Scenario: the beetle, the seraph and the propagator, each staged close up in the studio
    Given the save "nelim-zen-meadow-studio" is loaded
    And game speed is paused
    And a colonist "Rina" exists
    When A Certain Series: I move "Rina" to 25 cells east of "Rina"
    And A Certain Series: I note the ground of "Rina"
    And A Certain Series: I park "Rina" 40 cells east of the noted ground
    And Nelim's Pickle Tools: studio presentation mode is enabled
    And A Certain Series: I stage a "ACS_DarkMatterBeetle" pawn on the noted ground
    And A Certain Series: I stage a "TorchLamp" -3 cells east and 0 cells north of the noted ground
    And A Certain Series: I stage a "PlantPot" 3 cells east and 1 cells north of the noted ground
    And A Certain Series: I stage a "Stool" 4 cells east and -1 cells north of the noted ground
    Then 1 "ACS_DarkMatterBeetle" exist
    When A Certain Series: I bring the camera to 3 cells' height on the noted ground
    And I take a screenshot "gallery white rhinoceros beetle"
    And A Certain Series: I clear the staged set
    And A Certain Series: I stage a "ACS_Gabriel" pawn on the noted ground
    And A Certain Series: I stage a "StandingLamp" -3 cells east and 0 cells north of the noted ground
    And A Certain Series: I stage a "StandingLamp" 3 cells east and 0 cells north of the noted ground
    And A Certain Series: I stage a "SculptureSmall" 0 cells east and -3 cells north of the noted ground
    Then 1 "ACS_Gabriel" exist
    When A Certain Series: I bring the camera to 4 cells' height on the noted ground
    And I take a screenshot "gallery seraph"
    And A Certain Series: I clear the staged set
    And A Certain Series: I stage a "ACS_DarkMatterProduction" 0 cells east and 0 cells north of the noted ground
    And A Certain Series: I stage a "StandingLamp" -4 cells east and 0 cells north of the noted ground
    And A Certain Series: I stage a "Bookcase" 4 cells east and 2 cells north of the noted ground
    And A Certain Series: I bring the camera to 3 cells' height on the noted ground
    And I take a screenshot "gallery propagator"
    Then no errors were logged
