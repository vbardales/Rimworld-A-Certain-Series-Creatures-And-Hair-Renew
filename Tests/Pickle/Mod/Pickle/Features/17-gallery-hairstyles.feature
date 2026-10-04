# Pictures for the Workshop gallery, not a test: the hairstyles of the mod drawn on a colonist who fills most of
# the screen, in the zen meadow studio of PickleTools, without the interface. What the scenario asserts is only
# that the hairstyle is worn; the pictures are the point, and they are read by eye (@review). The game's camera
# stops at about fifty pixels for a colonist, so a local step lowers the bound of the zoom range for the
# scenario. If the game refuses a size that small, the pictures show it and this file is the place to change.
#
# A photographer's afternoon in the zen meadow, 2026-10-02 (owner: the gallery is promotional, so each picture is staged,
# nothing is left at the generated defaults; PUBLISHING.md). Three portraits, one story: a photographer sets up on one patch
# of grass and shoots three guests, one after the other, clearing the set between them.
#   Rina, the student (Misaka): cream blouse and deep brown, the warm orange of the hair; a standing lamp and a potted plant.
#   Toma, the loner (Accelerator): all black under a long coat, white spikes, a thin line tattoo; a torch lamp and a stool.
#   Sena, the librarian (Index): a white robe, a gold sash, a lectern and a small shelf of books around her.
# The game tints a hairstyle by the colonist's hair colour: white lets each hairstyle show the colours its artist drew. All
# three stand on the SAME ground (the one Toma was first moved to, the cleanest of the three), so the backgrounds match.
# A beard on Misaka was tried and dropped (owner: it did not suit her).
#
# Moved onto clear meadow 2026-09-27: the colonists' own spawn spots (a doorway, a room, a field between two
# buildings) put a wall, a floor or a lit-window edge behind the first captures (owner, 2026-09-26: "ce n'est pas
# le fond zenNelim" - accepted for 1.0.0, fixed for after). 10/25/40 cells east of Rina's own start is the same
# clear ground feature 18 already found for the creatures; the offsets are read live, so each move lands relative
# to where the previous one put its subject, which only spaces them further apart.
@review @en-only @requires:nelim.pickletools.screenshotstudio
Feature: Gallery pictures of the hairstyles

  Scenario: three hairstyles, one styled colonist each, close up in the studio
    Given the save "nelim-zen-meadow-studio" is loaded
    And game speed is paused
    And a colonist "Rina" exists
    And a colonist "Toma" exists
    And a colonist "Sena" exists
    And A Certain Series: "Rina" is a woman
    And A Certain Series: "Toma" is a man
    And A Certain Series: "Sena" is a woman
    And Nelim's Pickle Tools: "Rina" body type is Female
    And Nelim's Pickle Tools: "Toma" body type is Male
    And Nelim's Pickle Tools: "Sena" body type is Female
    When A Certain Series: I move "Toma" to 25 cells east of "Rina"
    And A Certain Series: I note the ground of "Toma"
    And A Certain Series: I park "Rina" 10 cells east of the noted ground
    And A Certain Series: I park "Sena" 40 cells east of the noted ground
    And A Certain Series: I give "Rina" the hairstyle "ACS_misaka"
    And A Certain Series: I give "Toma" the hairstyle "ACS_Accelerator"
    And A Certain Series: I give "Sena" the hairstyle "ACS_index"
    And A Certain Series: I let the hairstyle of "Rina" show its own colours
    And A Certain Series: I let the hairstyle of "Toma" show its own colours
    And A Certain Series: I let the hairstyle of "Sena" show its own colours
    And A Certain Series: I dress "Rina" in "Apparel_CollarShirt,Apparel_Pants" coloured "#F1E7D0,#5A3B28"
    And A Certain Series: I dress "Toma" in "Apparel_CollarShirt,Apparel_Pants,Apparel_Duster" coloured "#1C1C24,#2B2B35,#17171D"
    And A Certain Series: I dress "Sena" in "Apparel_Robe,Apparel_Sash" coloured "#F7F3E8,#C9A227"
    And A Certain Series: I tattoo "Toma" with the face tattoo "Face_Line"
    Then A Certain Series: "Rina" wears the hairstyle "ACS_misaka"
    And A Certain Series: "Toma" wears the hairstyle "ACS_Accelerator"
    And A Certain Series: "Sena" wears the hairstyle "ACS_index"
    And A Certain Series: the hairstyle of "Rina" is drawn in its own colours
    And A Certain Series: "Rina" wears the apparel "Apparel_CollarShirt"
    And A Certain Series: "Toma" wears the apparel "Apparel_Duster"
    And A Certain Series: "Sena" wears the apparel "Apparel_Robe"
    And A Certain Series: "Toma" has the face tattoo "Face_Line"
    When Nelim's Pickle Tools: studio presentation mode is enabled
    And A Certain Series: I stage a "StandingLamp" 1 cells east and 0 cells north of the noted ground
    And A Certain Series: I stage a "PlantPot" -1 cells east and 0 cells north of the noted ground
    Then A Certain Series: 2 staged things stand around the noted ground
    When A Certain Series: I put "Rina" on the noted ground
    And A Certain Series: "Rina" faces the camera
    And A Certain Series: I bring the camera to 1 cells' height on "Rina"
    And I take a screenshot "gallery hairstyle misaka"
    And A Certain Series: I clear the staged set
    And A Certain Series: I park "Rina" 10 cells east of the noted ground
    And A Certain Series: I stage a "TorchLamp" -1 cells east and 0 cells north of the noted ground
    And A Certain Series: I stage a "Stool" 1 cells east and 0 cells north of the noted ground
    And A Certain Series: I put "Toma" on the noted ground
    And A Certain Series: "Toma" faces the camera
    And A Certain Series: I bring the camera to 1 cells' height on "Toma"
    And I take a screenshot "gallery hairstyle accelerator"
    And A Certain Series: I clear the staged set
    And A Certain Series: I park "Toma" 25 cells east of the noted ground
    And A Certain Series: I stage a "Lectern" 1 cells east and 0 cells north of the noted ground
    And A Certain Series: I stage a "ShelfSmall" -1 cells east and 0 cells north of the noted ground
    And A Certain Series: I put "Sena" on the noted ground
    And A Certain Series: "Sena" faces the camera
    And A Certain Series: I bring the camera to 1 cells' height on "Sena"
    And I take a screenshot "gallery hairstyle index"
    Then no errors were logged
