# Pictures for the Workshop gallery, not a test: the hairstyles of the mod drawn on a colonist who fills most of
# the screen, in the zen meadow studio of PickleTools, without the interface. What the scenario asserts is only
# that the hairstyle is worn; the pictures are the point, and they are read by eye (@review). The game's camera
# stops at about fifty pixels for a colonist, so a local step lowers the bound of the zoom range for the
# scenario. If the game refuses a size that small, the pictures show it and this file is the place to change.
#
# Hair colour white, 2026-10-02 (owner's rule, PUBLISHING.md, gallery captures: show off what the mod adds, never the default
# settings that drown it): the game tints a hairstyle by the colonist's own hair colour, a brown that hid Accelerator's
# white spikes and Misaka's barrettes in the 2026-09-27 pictures. A white tint draws the colours the artist drew. A beard on
# Misaka was tried the day before and dropped (owner: it did not suit the hairstyle).
#
# Moved onto clear meadow 2026-09-27: the colonists' own spawn spots (a doorway, a room, a field between two
# buildings) put a wall, a floor or a lit-window edge behind the first captures (owner, 2026-09-26: "ce n'est pas
# le fond zenNelim" - accepted for 1.0.0, fixed for after). 10/25/40 cells east of Rina's own start is the same
# clear ground feature 18 already found for the creatures; the offsets are read live, so each move lands relative
# to where the previous one put its subject, which only spaces them further apart.
@review @en-only @requires:nelim.pickletools.screenshotstudio
Feature: Gallery pictures of the hairstyles

  Scenario: three hairstyles, one colonist each, close up in the studio
    Given the save "nelim-zen-meadow-studio" is loaded
    And game speed is paused
    And a colonist "Rina" exists
    And a colonist "Toma" exists
    And a colonist "Sena" exists
    When A Certain Series: I move "Rina" to 10 cells east of "Rina"
    And A Certain Series: I move "Toma" to 25 cells east of "Rina"
    And A Certain Series: I move "Sena" to 40 cells east of "Rina"
    And A Certain Series: I give "Rina" the hairstyle "ACS_misaka"
    And A Certain Series: I give "Toma" the hairstyle "ACS_Accelerator"
    And A Certain Series: I give "Sena" the hairstyle "ACS_index"
    And A Certain Series: I let the hairstyle of "Rina" show its own colours
    And A Certain Series: I let the hairstyle of "Toma" show its own colours
    And A Certain Series: I let the hairstyle of "Sena" show its own colours
    Then A Certain Series: "Rina" wears the hairstyle "ACS_misaka"
    And A Certain Series: "Toma" wears the hairstyle "ACS_Accelerator"
    And A Certain Series: "Sena" wears the hairstyle "ACS_index"
    And A Certain Series: the hairstyle of "Rina" is drawn in its own colours
    When Nelim's Pickle Tools: studio presentation mode is enabled
    And A Certain Series: "Rina" faces the camera
    And A Certain Series: I bring the camera to 1 cells' height on "Rina"
    And I take a screenshot "gallery hairstyle misaka"
    And A Certain Series: "Toma" faces the camera
    And A Certain Series: I bring the camera to 1 cells' height on "Toma"
    And I take a screenshot "gallery hairstyle accelerator"
    And A Certain Series: "Sena" faces the camera
    And A Certain Series: I bring the camera to 1 cells' height on "Sena"
    And I take a screenshot "gallery hairstyle index"
    Then no errors were logged
