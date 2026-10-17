# Pictures for the Workshop gallery, not a test: the three hairstyle portraits of the series "Nelim hosts the series"
# (images 1 to 3 of 7; the creatures and the evening are images 4 to 7, feature 18), in Nelim's Sanctuary (the owner's save
# "Nelim's tribe", loaded as "Nelims-tribe", SanctuaryBacklot docs/GALERIE.md, SANCTUAIRE-LIEUX.md and SANCTUAIRE-CASES.md),
# without the interface. What a scenario asserts is only that the hairstyle is worn; the pictures are the point and are read by
# eye (@review). The camera of the game stops at about fifty pixels for a colonist: a local step lowers the bound of its zoom.
# Three families of steps, told apart by their prefix: `Nelim's Sanctuary:` = the Sanctuary Backlot (the named places);
# `Nelim's Pickle Tools:` = PickleTools, the generic tools (decor, animals, floor, framing, waiting);
# `A Certain Series:` = this mod's own steps.
#
# The story (owner's rules of 2026-10-02/06/14, GALLERY.md): Nelim (the owner, the one colonist of the save) is the
# protagonist and hosts the series. Rina, Toma and Sena are her guests, each wearing a hairstyle of the mod. The day moves on
# one picture at a time: 12:00, 14:00, 16:00 (then 17:00 to 20:00 in feature 18). Nelim keeps the look of the fixture (her own
# face, brown eyes, trousers and corset): no step dresses her. Each picture leaves the bottom of the frame empty: the English
# subtitle of the scene is burnt there afterwards (PUBLICATION.md, "Gallery redo"), it is not part of the scenario.
# Animals face the camera (South) on every picture of this feature.
#
# Shooting plan, one line per picture (place, moment, subject, composition, what lives there, what it says):
#   1. sofa-corner (the rose rug between three sofas), 12:00, Rina with Misaka and Nelim side by side on the rug, both
#      facing the camera (South: from above an East or West profile hides the hairstyle behind the face), the house cat in
#      front of them looking at the camera: Nelim kept the good sofa for a student who has just come in; cream blouse and
#      deep brown to bring out the orange of the hair. Pawns are placed after the waits (they drift) and Nelim's face is
#      the last step before the capture (sweat otherwise, run 2026-10-15-gallery-redo-1).
#   2. terrace (brick, black piano), 14:00, Toma with Accelerator by the piano, drafted for the angry face, Nelim some cells
#      away facing him, a peacock facing the camera: a loner who stays at the edge of the room; all black under a long coat so
#      only the white hair is bright.
#   3. emerald-clearing (the podium: a small wooden floor ringed by flowers, its painted green zone bared), 16:00, Sena with
#      Index facing the camera, Nelim beside her, two torches and three daylilies in the corners (added in redo-3 so the bare floor tells something), a husky at her feet looking at the camera: a quiet
#      corner and a visitor Nelim keeps company; white robe and gold sash on warm wood (the bookcase was dropped: on the
#      podium it reads as a crate, run 2026-10-15-gallery-redo-1).
# Skin tones are chosen: a generated tone made one face read as a smiley under pale hair. The game tints a hairstyle by the
# hair colour: white lets each hairstyle show the colours its artist drew. Faces: Rina smiles (face kit), Toma is drafted
# (angry), Sena is `normal`, Nelim has her own face (the Sanctuary step). Places: the empty photographs of every named place
# were read, not the names; the tea room was tried and dropped (its blue lamps tinted the white robe cyan); the cells come from
# SANCTUAIRE-CASES.md (sofa-corner row 124 is free from x 183 to 189; terrace row 121 from x 195 to 200).
@review @en-only @requires:nelim.pickletools.screenshotstudio @requires:nelim.pickletools.stagedecor @requires:nelim.pickletools.colonistrace
Feature: Gallery pictures of the hairstyles

  Scenario: 1 - Nelim welcomes Rina (Misaka, the sofa corner, 12:00)
    Given the save "Nelims-tribe" is loaded
    And game speed is paused
    And I set the hour to 12
    And a colonist "Rina" exists
    And A Certain Series: "Rina" is a woman
    And Nelim's Pickle Tools: "Rina" body type is Thin
    And A Certain Series: "Rina" has the skin colour "#F2D2B8"
    And Nelim's Pickle Tools: "Rina" has the gene "Eyes_Brown"
    And A Certain Series: I give "Rina" the hairstyle "ACS_misaka"
    And A Certain Series: I let the hairstyle of "Rina" show its own colours
    And A Certain Series: I dress "Rina" in "Apparel_CollarShirt,Apparel_Pants" coloured "#F1E7D0,#5A3B28"
    And Nelim's Pickle Tools: "Rina" face kit is "smile"
    Then A Certain Series: "Rina" wears the hairstyle "ACS_misaka"
    And A Certain Series: the hairstyle of "Rina" is drawn in its own colours
    And A Certain Series: "Rina" wears the apparel "Apparel_CollarShirt"
    When Nelim's Pickle Tools: studio presentation mode is enabled
    And Nelim's Sanctuary: I am at the sanctuary "sofa-corner"
    And I wait 60 ticks
    And Nelim's Pickle Tools: "Rina" stands at (186, 124) facing South
    And Nelim's Pickle Tools: "Nelim" stands at (188, 124) facing South
    And Nelim's Pickle Tools: an adult animal of kind "Cat" named "Miso" is spawned at (187, 126)
    And Nelim's Pickle Tools: the animal "Miso" stands at (187, 126) facing South
    And A Certain Series: I bring the camera to 3 cells' height on the cell (187, 125)
    And Nelim's Sanctuary: Nelim has her own face
    And I take a screenshot "gallery 1 misaka"
    Then no errors were logged

  Scenario: 2 - Toma keeps to the piano (Accelerator, the terrace, 14:00)
    Given the save "Nelims-tribe" is loaded
    And game speed is paused
    And I set the hour to 14
    And a colonist "Toma" exists
    And A Certain Series: "Toma" is a man
    And Nelim's Pickle Tools: "Toma" body type is Male
    And A Certain Series: "Toma" has the skin colour "#EBCBB0"
    And Nelim's Pickle Tools: "Toma" has the gene "Eyes_Crimson"
    And A Certain Series: I give "Toma" the hairstyle "ACS_Accelerator"
    And A Certain Series: I let the hairstyle of "Toma" show its own colours
    And A Certain Series: I dress "Toma" in "Apparel_CollarShirt,Apparel_Pants,Apparel_Duster" coloured "#1C1C24,#2B2B35,#17171D"
    Then A Certain Series: "Toma" wears the hairstyle "ACS_Accelerator"
    And A Certain Series: "Toma" wears the apparel "Apparel_Duster"
    When Nelim's Pickle Tools: studio presentation mode is enabled
    And Nelim's Sanctuary: I am at the sanctuary "terrace"
    And I wait 60 ticks
    And I draft "Toma"
    And Nelim's Pickle Tools: I let 120 ticks pass
    And Nelim's Pickle Tools: "Toma" stands at (198, 121) facing South
    And Nelim's Pickle Tools: "Nelim" stands at (196, 122) facing East
    And Nelim's Pickle Tools: an adult animal of kind "Peacock" named "Paon" is spawned at (196, 119)
    And Nelim's Pickle Tools: the animal "Paon" stands at (196, 119) facing South
    And Nelim's Pickle Tools: I frame the rectangle from (194, 118) to (200, 123)
    And Nelim's Sanctuary: Nelim has her own face
    And I take a screenshot "gallery 2 accelerator"
    Then no errors were logged

  Scenario: 3 - Sena finds the one shelf worth reading (Index, the podium, 16:00)
    Given the save "Nelims-tribe" is loaded
    And game speed is paused
    And I set the hour to 16
    And a colonist "Sena" exists
    And A Certain Series: "Sena" is a woman
    And Nelim's Pickle Tools: "Sena" body type is Thin
    And A Certain Series: "Sena" has the skin colour "#F5DCC6"
    And Nelim's Pickle Tools: "Sena" has the gene "Eyes_Green"
    And A Certain Series: I give "Sena" the hairstyle "ACS_index"
    And A Certain Series: I let the hairstyle of "Sena" show its own colours
    And A Certain Series: I dress "Sena" in "Apparel_Robe,Apparel_Sash" coloured "#F7F3E8,#C9A227"
    Then A Certain Series: "Sena" wears the hairstyle "ACS_index"
    And A Certain Series: "Sena" wears the apparel "Apparel_Robe"
    When Nelim's Pickle Tools: studio presentation mode is enabled
    And Nelim's Sanctuary: the floor of the sanctuary "emerald-clearing" is bared
    And Nelim's Sanctuary: I am at the sanctuary "emerald-clearing"
    And Nelim's Pickle Tools: I lay the floor "WoodPlankFloor" from (194, 149) to (200, 155)
    And Nelim's Pickle Tools: I place the decor "TorchLamp" at (194, 150)
    And Nelim's Pickle Tools: the decor "TorchLamp" at (194, 150) is lit
    And Nelim's Pickle Tools: I place the decor "TorchLamp" at (200, 150)
    And Nelim's Pickle Tools: the decor "TorchLamp" at (200, 150) is lit
    And Nelim's Pickle Tools: I place the decor "Plant_Daylily" at (194, 154) fully grown
    And Nelim's Pickle Tools: I place the decor "Plant_Daylily" at (200, 154) fully grown
    And Nelim's Pickle Tools: I place the decor "Plant_Daylily" at (199, 155) fully grown
    And I wait 60 ticks
    And Nelim's Pickle Tools: "Sena" stands at (197, 152) facing South
    And Nelim's Pickle Tools: "Sena" facial expression is "normal"
    And Nelim's Pickle Tools: "Nelim" stands at (195, 152) facing East
    And Nelim's Pickle Tools: an adult animal of kind "Husky" named "Yuki" is spawned at (197, 154)
    And Nelim's Pickle Tools: the animal "Yuki" stands at (197, 154) facing South
    And Nelim's Pickle Tools: I frame the rectangle from (194, 149) to (200, 155)
    And Nelim's Sanctuary: Nelim has her own face
    And I take a screenshot "gallery 3 index"
    Then no errors were logged
