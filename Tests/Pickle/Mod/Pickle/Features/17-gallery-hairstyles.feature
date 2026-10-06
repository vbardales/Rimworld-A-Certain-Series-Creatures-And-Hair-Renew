# Pictures for the Workshop gallery, not a test: the hairstyles of the mod drawn on a colonist who fills most of the screen,
# in Nelim's Sanctuary (the owner's save "Nelim's tribe", loaded as "Nelims-tribe", PickleTools docs/GALERIE.md and
# docs/SANCTUAIRE-LIEUX.md), without the interface. What the scenario asserts is only that the hairstyle is worn; the
# pictures are the point and are read by eye (@review). The game's camera stops at about fifty pixels for a colonist, so a
# local step lowers the bound of the zoom range for the scenario.
#
# A photographer's day in the Sanctuary, staged (owner, 2026-10-02/06: the gallery is promotional, nothing is left at the
# generated defaults, and each picture is taken where it makes sense: PUBLISHING.md). The places were chosen on the empty
# photographs of every named place, not by name. Three guests, each at home in a place of their own, in the lamplight the
# place already has (no decor of ours: the places are furnished):
#   Rina, the student (Misaka): cream blouse and deep brown, at the pink rug of the sofa corner, a sofa on three sides.
#   Toma, the loner (Accelerator): all black under a long coat, on the brick terrace beside the black piano, white spikes
#     on the dark floor.
#   Sena, the librarian (Index): a white robe and a gold sash, on a small wooden floor of the podium (square A, ringed by
#     flowers; its painted green zone bared) with a bookcase and a torch; the tea room was tried and dropped: its blue lamps tinted her white cyan.
#   Skin tones are chosen (a generated tone made one face read as a smiley under pale hair); the camera is two cells high.
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
    And Nelim's Pickle Tools: "Rina" body type is Thin
    And Nelim's Pickle Tools: "Toma" body type is Male
    And Nelim's Pickle Tools: "Sena" body type is Thin
    And A Certain Series: "Rina" has the skin colour "#F2D2B8"
    And A Certain Series: "Toma" has the skin colour "#EBCBB0"
    And A Certain Series: "Sena" has the skin colour "#F5DCC6"
    And Nelim's Pickle Tools: "Rina" stands at (108, 160)
    And Nelim's Pickle Tools: "Toma" stands at (110, 160)
    And Nelim's Pickle Tools: "Sena" stands at (112, 160)
    When A Certain Series: I give "Rina" the hairstyle "ACS_misaka"
    And A Certain Series: I give "Toma" the hairstyle "ACS_Accelerator"
    And A Certain Series: I give "Sena" the hairstyle "ACS_index"
    And A Certain Series: I let the hairstyle of "Rina" show its own colours
    And A Certain Series: I let the hairstyle of "Toma" show its own colours
    And A Certain Series: I let the hairstyle of "Sena" show its own colours
    And A Certain Series: I dress "Rina" in "Apparel_CollarShirt,Apparel_Pants" coloured "#F1E7D0,#5A3B28"
    And A Certain Series: I dress "Toma" in "Apparel_CollarShirt,Apparel_Pants,Apparel_Duster" coloured "#1C1C24,#2B2B35,#17171D"
    And A Certain Series: I dress "Sena" in "Apparel_Robe,Apparel_Sash" coloured "#F7F3E8,#C9A227"
    Then A Certain Series: "Rina" wears the hairstyle "ACS_misaka"
    And A Certain Series: "Toma" wears the hairstyle "ACS_Accelerator"
    And A Certain Series: "Sena" wears the hairstyle "ACS_index"
    And A Certain Series: the hairstyle of "Rina" is drawn in its own colours
    And A Certain Series: "Rina" wears the apparel "Apparel_CollarShirt"
    And A Certain Series: "Toma" wears the apparel "Apparel_Duster"
    And A Certain Series: "Sena" wears the apparel "Apparel_Robe"
    When Nelim's Pickle Tools: studio presentation mode is enabled
    And Nelim's Pickle Tools: I am at the sanctuary "sofa-corner"
    And Nelim's Pickle Tools: "Rina" stands at (187, 123) facing South
    And A Certain Series: I bring the camera to 2 cells' height on "Rina"
    And I take a screenshot "gallery hairstyle misaka"
    And Nelim's Pickle Tools: "Rina" stands at (108, 160)
    And Nelim's Pickle Tools: I am at the sanctuary "terrace"
    And Nelim's Pickle Tools: "Toma" stands at (198, 119) facing South
    And A Certain Series: I bring the camera to 2 cells' height on "Toma"
    And I take a screenshot "gallery hairstyle accelerator"
    And Nelim's Pickle Tools: "Toma" stands at (110, 160)
    And Nelim's Pickle Tools: the floor of the sanctuary "emerald-clearing" is bared
    And Nelim's Pickle Tools: I am at the sanctuary "emerald-clearing"
    And Nelim's Pickle Tools: I lay the floor "WoodPlankFloor" from (194, 149) to (200, 155)
    And Nelim's Pickle Tools: I place the decor "Bookcase" at (199, 152)
    And Nelim's Pickle Tools: I place the decor "TorchLamp" at (195, 152)
    And Nelim's Pickle Tools: the decor "TorchLamp" at (195, 152) is lit
    And Nelim's Pickle Tools: "Sena" stands at (197, 152) facing South
    And A Certain Series: I bring the camera to 2 cells' height on "Sena"
    And I take a screenshot "gallery hairstyle index"
    Then no errors were logged
