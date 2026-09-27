# Pictures for the Workshop gallery, not a test: the two creatures and the propagator drawn close, in the zen
# meadow studio of PickleTools, without the interface. What the scenario asserts is only that they exist; the
# pictures are the point and are read by eye (@review). Nothing is placed by coordinates, because the studio's
# free ground is not known here: each one is put some cells east of a colonist, on the nearest standable cell.
#
# Spacing fixed 2026-09-27: the first three captures (5/12/19 cells apart) let each neighbour's edge bleed into
# the next shot (a portrait, a horn, a wingtip, a power icon at a frame's corner) - a camera at N cells' height
# frames roughly N*16/9 cells either side of its centre, so two things closer than the sum of their half-widths
# share a frame. 10/25/40 clears the widest pair here (the seraph's 4-cell height, ~7.1 cells either side) with
# room to spare. Accepted as they were for 1.0.0 (owner, 2026-09-27: "pour une 1.0.0 c'est ok"); this fixes it
# for whatever version comes after, and the tickets are filed now in case they land before that publication.
@review @en-only @requires:nelim.pickletools.screenshotstudio
Feature: Gallery pictures of the creatures and the propagator

  Scenario: the beetle, the seraph and the propagator, each close up in the studio
    Given the save "nelim-zen-meadow-studio" is loaded
    And game speed is paused
    And a colonist "Rina" exists
    When A Certain Series: I spawn a "ACS_DarkMatterBeetle" pawn 10 cells east of "Rina"
    And A Certain Series: I spawn a "ACS_Gabriel" pawn 25 cells east of "Rina"
    And A Certain Series: I place a "ACS_DarkMatterProduction" 40 cells east of "Rina"
    Then 1 "ACS_DarkMatterBeetle" exist
    And 1 "ACS_Gabriel" exist
    When Nelim's Pickle Tools: studio presentation mode is enabled
    And A Certain Series: I bring the camera to 3 cells' height 10 cells east of "Rina"
    And I take a screenshot "gallery white rhinoceros beetle"
    And A Certain Series: I bring the camera to 4 cells' height 25 cells east of "Rina"
    And I take a screenshot "gallery seraph"
    And A Certain Series: I bring the camera to 3 cells' height 40 cells east of "Rina"
    And I take a screenshot "gallery propagator"
    Then no errors were logged
