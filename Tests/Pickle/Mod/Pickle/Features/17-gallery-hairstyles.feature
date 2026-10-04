# Pictures for the Workshop gallery, not a test: the hairstyles of the mod drawn on a colonist who fills most of the screen,
# in Nelim's Sanctuary (the owner's save "Nelim's tribe", loaded as "Nelims-tribe", PickleTools docs/SANCTUAIRE-LIEUX.md),
# without the interface. What the scenario asserts is only that the hairstyle is worn; the pictures are the point and are
# read by eye (@review). The game's camera stops at about fifty pixels for a colonist, so a local step lowers the bound of
# the zoom range for the scenario.
#
# A photographer's afternoon, staged (owner, 2026-10-02/04: the gallery is promotional, nothing is left at the generated
# defaults; PUBLISHING.md). One patch of bare earth, square A of the Sanctuary (191-204, 146-159), is cleared, floored with
# a small wooden podium and lit by torches; three guests are photographed one after the other, the set cleared between them.
#   Rina, the student (Misaka): cream blouse and deep brown, the warm orange of the hair; a stool and a torch.
#   Toma, the loner (Accelerator): all black under a long coat, white spikes, a thin line tattoo; a torch either side.
#   Sena, the librarian (Index): a white robe, a gold sash, a bookcase at her side and a torch.
# The game tints a hairstyle by the colonist's hair colour: white lets each hairstyle show the colours its artist drew.
# A beard on Misaka was tried and dropped (owner: it did not suit her).
@review @en-only @requires:nelim.pickletools.screenshotstudio @requires:nelim.pickletools.stagedecor
Feature: Gallery pictures of the hairstyles

  Scenario: three hairstyles, one styled colonist each, close up in the Sanctuary
    Given the save "Nelims-tribe" is loaded
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
    And Nelim's Pickle Tools: the other colonists are out of frame
    And Nelim's Pickle Tools: the area from (193, 148) to (201, 156) is cleared
    And Nelim's Pickle Tools: I lay the floor "WoodPlankFloor" from (195, 150) to (199, 154)
    When A Certain Series: I give "Rina" the hairstyle "ACS_misaka"
    And A Certain Series: I give "Toma" the hairstyle "ACS_Accelerator"
    And A Certain Series: I give "Sena" the hairstyle "ACS_index"
    And A Certain Series: I let the hairstyle of "Rina" show its own colours
    And A Certain Series: I let the hairstyle of "Toma" show its own colours
    And A Certain Series: I let the hairstyle of "Sena" show its own colours
    And A Certain Series: I dress "Rina" in "Apparel_CollarShirt,Apparel_Pants" coloured "#F1E7D0,#5A3B28"
    And A Certain Series: I dress "Toma" in "Apparel_CollarShirt,Apparel_Pants,Apparel_Duster" coloured "#1C1C24,#2B2B35,#17171D"
    And A Certain Series: I dress "Sena" in "Apparel_Robe,Apparel_Sash" coloured "#F7F3E8,#C9A227"
    And Nelim's Pickle Tools: "Toma" face tattoo is "Face_Line"
    Then A Certain Series: "Rina" wears the hairstyle "ACS_misaka"
    And A Certain Series: "Toma" wears the hairstyle "ACS_Accelerator"
    And A Certain Series: "Sena" wears the hairstyle "ACS_index"
    And A Certain Series: the hairstyle of "Rina" is drawn in its own colours
    And A Certain Series: "Rina" wears the apparel "Apparel_CollarShirt"
    And A Certain Series: "Toma" wears the apparel "Apparel_Duster"
    And A Certain Series: "Sena" wears the apparel "Apparel_Robe"
    When Nelim's Pickle Tools: studio presentation mode is enabled
    And Nelim's Pickle Tools: I place the decor "TorchLamp" at (195, 152)
    And Nelim's Pickle Tools: I place the decor "Stool" at (199, 152)
    And Nelim's Pickle Tools: the decor "TorchLamp" at (195, 152) is lit
    And Nelim's Pickle Tools: "Rina" stands at (197, 152) facing South
    And A Certain Series: I bring the camera to 1 cells' height on "Rina"
    And I take a screenshot "gallery hairstyle misaka"
    And Nelim's Pickle Tools: the decor is removed
    And Nelim's Pickle Tools: I lay the floor "WoodPlankFloor" from (195, 150) to (199, 154)
    And Nelim's Pickle Tools: I place the decor "TorchLamp" at (195, 152)
    And Nelim's Pickle Tools: I place the decor "TorchLamp" at (199, 152)
    And Nelim's Pickle Tools: the decor "TorchLamp" at (195, 152) is lit
    And Nelim's Pickle Tools: the decor "TorchLamp" at (199, 152) is lit
    And Nelim's Pickle Tools: "Toma" stands at (197, 152) facing South
    And A Certain Series: I bring the camera to 1 cells' height on "Toma"
    And I take a screenshot "gallery hairstyle accelerator"
    And Nelim's Pickle Tools: the decor is removed
    And Nelim's Pickle Tools: I lay the floor "WoodPlankFloor" from (195, 150) to (199, 154)
    And Nelim's Pickle Tools: I place the decor "Bookcase" at (199, 152)
    And Nelim's Pickle Tools: I place the decor "TorchLamp" at (195, 152)
    And Nelim's Pickle Tools: the decor "TorchLamp" at (195, 152) is lit
    And Nelim's Pickle Tools: "Sena" stands at (197, 152) facing South
    And A Certain Series: I bring the camera to 1 cells' height on "Sena"
    And I take a screenshot "gallery hairstyle index"
    Then no errors were logged
