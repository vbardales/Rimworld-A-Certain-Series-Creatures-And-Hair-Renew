# Pictures for the Workshop gallery, not a test: the two creatures and the propagator drawn close, in Nelim's Sanctuary (the
# owner's save "Nelim's tribe", loaded as "Nelims-tribe", PickleTools docs/SANCTUAIRE-LIEUX.md), without the interface. What
# the scenario asserts is only that they exist; the pictures are the point and are read by eye (@review).
#
# The photographer's second roll, staged like the portraits (owner, 2026-10-02/04: promotional, nothing at generated
# defaults; PUBLISHING.md): square A of the Sanctuary (191-204, 146-159), the same patch as the portraits (square B became the animal pen of the
# Sanctuary's final save), bare earth, cleared and floored with a small wooden podium; the specimens one after the other, the set cleared between them. Torch lamps rather than standing lamps (a
# powered lamp with no power shows the lightning icon on the picture), and no empty plant pot (it reads as a bucket).
# The beetle by torchlight with a stool; the seraph between two torch lamps; the propagator in a workshop corner with a
# torch and a bookcase.
@review @en-only @requires:nelim.pickletools.screenshotstudio @requires:nelim.pickletools.stagedecor
Feature: Gallery pictures of the creatures and the propagator

  Scenario: the beetle, the seraph and the propagator, each staged close up in the Sanctuary
    Given the save "Nelims-tribe" is loaded
    And game speed is paused
    And I set the hour to 15
    And Nelim's Pickle Tools: the floor of the sanctuary "emerald-clearing" is bared
    And Nelim's Pickle Tools: I am at the sanctuary "emerald-clearing"
    And Nelim's Pickle Tools: the area from (193, 148) to (204, 156) is cleared
    And Nelim's Pickle Tools: I lay the floor "WoodPlankFloor" from (195, 150) to (199, 154)
    When Nelim's Pickle Tools: studio presentation mode is enabled
    And A Certain Series: a "ACS_DarkMatterBeetle" pawn stands at (197, 152)
    And Nelim's Pickle Tools: I place the decor "TorchLamp" at (195, 152)
    And Nelim's Pickle Tools: I place the decor "Stool" at (199, 152)
    And Nelim's Pickle Tools: the decor "TorchLamp" at (195, 152) is lit
    Then 1 "ACS_DarkMatterBeetle" exist
    When A Certain Series: I bring the camera to 3 cells' height on the cell (197, 152)
    And I take a screenshot "gallery white rhinoceros beetle"
    And A Certain Series: I clear the staged creatures
    And Nelim's Pickle Tools: the decor is removed
    And Nelim's Pickle Tools: I lay the floor "WoodPlankFloor" from (195, 150) to (199, 154)
    And A Certain Series: a "ACS_Gabriel" pawn stands at (197, 152)
    And Nelim's Pickle Tools: I place the decor "TorchLamp" at (193, 152)
    And Nelim's Pickle Tools: I place the decor "TorchLamp" at (201, 152)
    And Nelim's Pickle Tools: the decor "TorchLamp" at (193, 152) is lit
    And I wait 60 ticks
    And Nelim's Pickle Tools: the decor "TorchLamp" at (201, 152) is lit
    Then 1 "ACS_Gabriel" exist
    When A Certain Series: I bring the camera to 4 cells' height on the cell (197, 152)
    And I take a screenshot "gallery seraph"
    And A Certain Series: I clear the staged creatures
    And Nelim's Pickle Tools: the decor is removed
    And Nelim's Pickle Tools: I lay the floor "WoodPlankFloor" from (199, 150) to (204, 154)
    And Nelim's Pickle Tools: I place the decor "ACS_DarkMatterProduction" at (204, 152)
    And Nelim's Pickle Tools: I place the decor "TorchLamp" at (200, 151)
    And Nelim's Pickle Tools: I place the decor "Bookcase" at (201, 154)
    And Nelim's Pickle Tools: the decor "TorchLamp" at (200, 151) is lit
    And Nelim's Pickle Tools: I place the decor "VanometricPowerCell" at (206, 152)
    And Nelim's Pickle Tools: I place the decor "VanometricPowerCell" at (206, 154)
    And Nelim's Pickle Tools: I place the decor "VanometricPowerCell" at (205, 154)
    And Nelim's Pickle Tools: I place the decor "VanometricPowerCell" at (206, 156)
    And Nelim's Pickle Tools: I place the decor "VanometricPowerCell" at (205, 156)
    And Nelim's Pickle Tools: the power network is refreshed
    And I wait 60 ticks
    And A Certain Series: I bring the camera to 4 cells' height on the cell (204, 153)
    And I take a screenshot "gallery propagator"
    Then no errors were logged
