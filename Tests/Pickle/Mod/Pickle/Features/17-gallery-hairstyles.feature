# Pictures for the Workshop gallery, not a test: the hairstyles of the mod drawn on a colonist who fills most of
# the screen, in the zen meadow studio of PickleTools, without the interface. What the scenario asserts is only
# that the hairstyle is worn; the pictures are the point, and they are read by eye (@review). The game's camera
# stops at about fifty pixels for a colonist, so a local step lowers the bound of the zoom range for the
# scenario. If the game refuses a size that small, the pictures show it and this file is the place to change.
@review @en-only @requires:nelim.pickletools.screenshotstudio
Feature: Gallery pictures of the hairstyles

  Scenario: three hairstyles, one colonist each, close up in the studio
    Given the save "nelim-zen-meadow-studio" is loaded
    And game speed is paused
    And a colonist "Rina" exists
    And a colonist "Toma" exists
    And a colonist "Sena" exists
    When A Certain Series: I give "Rina" the hairstyle "ACS_misaka"
    And A Certain Series: I give "Toma" the hairstyle "ACS_Accelerator"
    And A Certain Series: I give "Sena" the hairstyle "ACS_index"
    Then A Certain Series: "Rina" wears the hairstyle "ACS_misaka"
    And A Certain Series: "Toma" wears the hairstyle "ACS_Accelerator"
    And A Certain Series: "Sena" wears the hairstyle "ACS_index"
    When Nelim's Pickle Tools: studio presentation mode is enabled
    And A Certain Series: I bring the camera to 1 cells' height on "Rina"
    And I take a screenshot "gallery hairstyle misaka"
    And A Certain Series: I bring the camera to 1 cells' height on "Toma"
    And I take a screenshot "gallery hairstyle accelerator"
    And A Certain Series: I bring the camera to 1 cells' height on "Sena"
    And I take a screenshot "gallery hairstyle index"
    Then no errors were logged
