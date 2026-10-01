# Pictures for the Workshop gallery, not a test: the hairstyles of the mod drawn on a colonist who fills most of
# the screen, in the zen meadow studio of PickleTools, without the interface. What the scenario asserts is only
# that the hairstyle is worn; the pictures are the point, and they are read by eye (@review). The game's camera
# stops at about fifty pixels for a colonist, so a local step lowers the bound of the zoom range for the
# scenario. If the game refuses a size that small, the pictures show it and this file is the place to change.
#
# Dressed to show the hairstyle off, 2026-10-01 (owner's rule, PUBLISHING.md, gallery captures): the barrette hairstyle
# of Misaka is worn by a bearded man, so it stands out against the face and the beard instead of drowning in a
# default pawn. The other two stay as they were: Accelerator's white spikes and Index's long hair already read.
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
    And A Certain Series: I make "Toma" a bearded man with the beard "Full"
    And A Certain Series: I give "Toma" the hairstyle "ACS_misaka"
    And A Certain Series: I give "Rina" the hairstyle "ACS_Accelerator"
    And A Certain Series: I give "Sena" the hairstyle "ACS_index"
    Then A Certain Series: "Toma" has the beard "Full"
    And A Certain Series: "Toma" wears the hairstyle "ACS_misaka"
    And A Certain Series: "Rina" wears the hairstyle "ACS_Accelerator"
    And A Certain Series: "Sena" wears the hairstyle "ACS_index"
    When Nelim's Pickle Tools: studio presentation mode is enabled
    And A Certain Series: "Toma" faces the camera
    And A Certain Series: I bring the camera to 1 cells' height on "Toma"
    And I take a screenshot "gallery hairstyle misaka"
    And A Certain Series: "Rina" faces the camera
    And A Certain Series: I bring the camera to 1 cells' height on "Rina"
    And I take a screenshot "gallery hairstyle accelerator"
    And A Certain Series: "Sena" faces the camera
    And A Certain Series: I bring the camera to 1 cells' height on "Sena"
    And I take a screenshot "gallery hairstyle index"
    Then no errors were logged
