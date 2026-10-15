# Pictures for the Workshop gallery, not a test: the creatures, the propagator and the evening, images 4 to 7 of the series
# "Nelim hosts the series" (images 1 to 3 are the hairstyle portraits, feature 17), on the podium of Nelim's Sanctuary (the
# owner's save "Nelim's tribe", loaded as "Nelims-tribe", PickleTools docs/GALERIE.md, SANCTUAIRE-LIEUX.md and
# SANCTUAIRE-CASES.md), without the interface. What a scenario asserts is only that the thing exists; the pictures are read by
# eye (@review).
#
# The story continues the portraits (owner's rules of 2026-10-02/06/14, GALLERY.md): Nelim, the protagonist, shows her guests
# what the mod brings, from 17:00 to 20:00. The podium is the square A of the Sanctuary (x 191-204, z 146-159), its painted
# green zone bared, ringed by flowers, with the permanent vanometric power cell of the fixture on its east edge (205, 152-153).
# Nelim keeps the look of the fixture and has her own face (the Sanctuary step). Each picture leaves the bottom of the frame
# empty for the English subtitle burnt there afterwards (PUBLICATION.md, "Gallery redo"). Animals face the camera (South).
#
# Shooting plan, one line per picture (place, moment, subject, composition, what lives there, what it says):
#   4. emerald-clearing, 17:00, the white rhinoceros beetle, Nelim close beside it for the scale, a torch on its left and a
#      stool on its right on a small wooden floor, a hen at its feet facing the camera: the pack animal Nelim leads in.
#   5. emerald-clearing, 18:00, the seraph (God's Power), framed high enough for the eight wings, Nelim facing it, Rina, Toma
#      and Sena a few cells behind, a torch lamp on each side, a peacock that walks into the frame facing the camera.
#   6. emerald-clearing, 19:00, Nelim at work beside the dark matter propagator against the power cells, a second one eight
#      cells away without power (the lightning icon names the need), a bookcase, a torch, a cat between them facing the camera.
#   7. emerald-clearing, 20:00 (optional), Rina, Nelim, Sena and Toma in a row at dusk under four torches, the beetle behind
#      them, the hen in front: everybody stayed.
# Torch lamps rather than standing lamps (a powered lamp with no power shows the lightning icon on the picture) and no
# empty plant pot (it reads as a bucket). The guests of picture 7 are dressed as in feature 17.
@review @en-only @requires:nelim.pickletools.screenshotstudio @requires:nelim.pickletools.stagedecor @requires:nelim.pickletools.colonistrace
Feature: Gallery pictures of the creatures, the propagator and the evening

  Scenario: 4 - Nelim leads in the white rhinoceros beetle (the podium, 17:00)
    Given the save "Nelims-tribe" is loaded
    And game speed is paused
    And I set the hour to 17
    And Nelim's Sanctuary: the floor of the sanctuary "emerald-clearing" is bared
    And Nelim's Sanctuary: I am at the sanctuary "emerald-clearing"
    And Nelim's Pickle Tools: the area from (193, 148) to (204, 156) is cleared
    And Nelim's Pickle Tools: I lay the floor "WoodPlankFloor" from (195, 150) to (199, 154)
    When Nelim's Pickle Tools: studio presentation mode is enabled
    And Nelim's Pickle Tools: I place the decor "TorchLamp" at (195, 150)
    And Nelim's Pickle Tools: I place the decor "Stool" at (199, 150)
    And Nelim's Pickle Tools: the decor "TorchLamp" at (195, 150) is lit
    And I wait 60 ticks
    And A Certain Series: a "ACS_DarkMatterBeetle" pawn stands at (197, 152)
    And Nelim's Pickle Tools: "Nelim" stands at (195, 153) facing East
    And Nelim's Sanctuary: Nelim has her own face
    And Nelim's Pickle Tools: an adult animal of kind "Chicken" named "Poule" is spawned at (197, 150)
    And Nelim's Pickle Tools: the animal "Poule" stands at (197, 150) facing South
    Then 1 "ACS_DarkMatterBeetle" exist
    When Nelim's Pickle Tools: I frame the rectangle from (194, 148) to (200, 155)
    And I take a screenshot "gallery 4 beetle"
    Then no errors were logged

  Scenario: 5 - the seraph at six in the evening (the podium, 18:00)
    Given the save "Nelims-tribe" is loaded
    And game speed is paused
    And I set the hour to 18
    And a colonist "Rina" exists
    And A Certain Series: "Rina" is a woman
    And Nelim's Pickle Tools: "Rina" body type is Thin
    And A Certain Series: "Rina" has the skin colour "#F2D2B8"
    And A Certain Series: I give "Rina" the hairstyle "ACS_misaka"
    And A Certain Series: I let the hairstyle of "Rina" show its own colours
    And A Certain Series: I dress "Rina" in "Apparel_CollarShirt,Apparel_Pants" coloured "#F1E7D0,#5A3B28"
    And Nelim's Pickle Tools: "Rina" face kit is "smile"
    And a colonist "Toma" exists
    And A Certain Series: "Toma" is a man
    And Nelim's Pickle Tools: "Toma" body type is Male
    And A Certain Series: "Toma" has the skin colour "#EBCBB0"
    And A Certain Series: I give "Toma" the hairstyle "ACS_Accelerator"
    And A Certain Series: I let the hairstyle of "Toma" show its own colours
    And A Certain Series: I dress "Toma" in "Apparel_CollarShirt,Apparel_Pants,Apparel_Duster" coloured "#1C1C24,#2B2B35,#17171D"
    And Nelim's Pickle Tools: "Toma" face kit is "smug"
    And a colonist "Sena" exists
    And A Certain Series: "Sena" is a woman
    And Nelim's Pickle Tools: "Sena" body type is Thin
    And A Certain Series: "Sena" has the skin colour "#F5DCC6"
    And A Certain Series: I give "Sena" the hairstyle "ACS_index"
    And A Certain Series: I let the hairstyle of "Sena" show its own colours
    And A Certain Series: I dress "Sena" in "Apparel_Robe,Apparel_Sash" coloured "#F7F3E8,#C9A227"
    And Nelim's Pickle Tools: "Sena" face kit is "calm"
    And Nelim's Sanctuary: the floor of the sanctuary "emerald-clearing" is bared
    And Nelim's Sanctuary: I am at the sanctuary "emerald-clearing"
    And Nelim's Pickle Tools: the area from (193, 148) to (204, 156) is cleared
    And Nelim's Pickle Tools: I lay the floor "WoodPlankFloor" from (195, 150) to (199, 154)
    When Nelim's Pickle Tools: studio presentation mode is enabled
    And Nelim's Pickle Tools: I place the decor "TorchLamp" at (193, 152)
    And Nelim's Pickle Tools: I place the decor "TorchLamp" at (201, 152)
    And Nelim's Pickle Tools: the decor "TorchLamp" at (193, 152) is lit
    And Nelim's Pickle Tools: the decor "TorchLamp" at (201, 152) is lit
    And I wait 60 ticks
    And A Certain Series: a "ACS_Gabriel" pawn stands at (197, 152)
    And Nelim's Pickle Tools: "Nelim" stands at (195, 151) facing East
    And Nelim's Sanctuary: Nelim has her own face
    And Nelim's Pickle Tools: "Rina" stands at (194, 155) facing South
    And Nelim's Pickle Tools: "Toma" stands at (197, 156) facing South
    And Nelim's Pickle Tools: "Sena" stands at (200, 155) facing South
    And Nelim's Pickle Tools: an adult animal of kind "Peacock" named "Paon" is spawned at (197, 149)
    And Nelim's Pickle Tools: the animal "Paon" stands at (197, 149) facing South
    Then 1 "ACS_Gabriel" exist
    When Nelim's Pickle Tools: I frame the rectangle from (193, 148) to (201, 157)
    And I take a screenshot "gallery 5 seraph"
    Then no errors were logged

  Scenario: 6 - Nelim at the propagator, one running and one waiting for power (the podium, 19:00)
    Given the save "Nelims-tribe" is loaded
    And game speed is paused
    And I set the hour to 19
    And Nelim's Sanctuary: the floor of the sanctuary "emerald-clearing" is bared
    And Nelim's Sanctuary: I am at the sanctuary "emerald-clearing"
    And Nelim's Pickle Tools: the area from (193, 148) to (204, 156) is cleared
    And Nelim's Pickle Tools: I lay the floor "WoodPlankFloor" from (195, 150) to (199, 154)
    When Nelim's Pickle Tools: studio presentation mode is enabled
    And Nelim's Pickle Tools: I lay the floor "WoodPlankFloor" from (199, 150) to (204, 154)
    And Nelim's Pickle Tools: the building status icons are kept
    And Nelim's Sanctuary: the animals are removed from the sanctuary "emerald-clearing"
    And Nelim's Pickle Tools: I place the decor "ACS_DarkMatterProduction" at (204, 152)
    And Nelim's Pickle Tools: I place the decor "ACS_DarkMatterProduction" at (196, 152)
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
    And Nelim's Pickle Tools: "Nelim" stands at (198, 153) facing West
    And Nelim's Sanctuary: Nelim has her own face
    And Nelim's Sanctuary: the animals are removed from the sanctuary "emerald-clearing"
    And Nelim's Pickle Tools: an adult animal of kind "Cat" named "Miso" is spawned at (202, 153)
    And Nelim's Pickle Tools: the animal "Miso" stands at (202, 153) facing South
    When Nelim's Pickle Tools: I frame the rectangle from (193, 148) to (209, 157)
    And I take a screenshot "gallery 6 propagator"
    Then no errors were logged

  Scenario: 7 - everybody stayed (the podium, 20:00)
    Given the save "Nelims-tribe" is loaded
    And game speed is paused
    And I set the hour to 20
    And a colonist "Rina" exists
    And A Certain Series: "Rina" is a woman
    And Nelim's Pickle Tools: "Rina" body type is Thin
    And A Certain Series: "Rina" has the skin colour "#F2D2B8"
    And A Certain Series: I give "Rina" the hairstyle "ACS_misaka"
    And A Certain Series: I let the hairstyle of "Rina" show its own colours
    And A Certain Series: I dress "Rina" in "Apparel_CollarShirt,Apparel_Pants" coloured "#F1E7D0,#5A3B28"
    And Nelim's Pickle Tools: "Rina" face kit is "smile"
    And a colonist "Toma" exists
    And A Certain Series: "Toma" is a man
    And Nelim's Pickle Tools: "Toma" body type is Male
    And A Certain Series: "Toma" has the skin colour "#EBCBB0"
    And A Certain Series: I give "Toma" the hairstyle "ACS_Accelerator"
    And A Certain Series: I let the hairstyle of "Toma" show its own colours
    And A Certain Series: I dress "Toma" in "Apparel_CollarShirt,Apparel_Pants,Apparel_Duster" coloured "#1C1C24,#2B2B35,#17171D"
    And Nelim's Pickle Tools: "Toma" face kit is "smug"
    And a colonist "Sena" exists
    And A Certain Series: "Sena" is a woman
    And Nelim's Pickle Tools: "Sena" body type is Thin
    And A Certain Series: "Sena" has the skin colour "#F5DCC6"
    And A Certain Series: I give "Sena" the hairstyle "ACS_index"
    And A Certain Series: I let the hairstyle of "Sena" show its own colours
    And A Certain Series: I dress "Sena" in "Apparel_Robe,Apparel_Sash" coloured "#F7F3E8,#C9A227"
    And Nelim's Pickle Tools: "Sena" face kit is "calm"
    And Nelim's Sanctuary: the floor of the sanctuary "emerald-clearing" is bared
    And Nelim's Sanctuary: I am at the sanctuary "emerald-clearing"
    And Nelim's Pickle Tools: the area from (193, 148) to (204, 156) is cleared
    And Nelim's Pickle Tools: I lay the floor "WoodPlankFloor" from (193, 149) to (201, 156)
    When Nelim's Pickle Tools: studio presentation mode is enabled
    And Nelim's Pickle Tools: I place the decor "TorchLamp" at (193, 150)
    And Nelim's Pickle Tools: I place the decor "TorchLamp" at (201, 150)
    And Nelim's Pickle Tools: I place the decor "TorchLamp" at (193, 155)
    And Nelim's Pickle Tools: I place the decor "TorchLamp" at (201, 155)
    And Nelim's Pickle Tools: the decor "TorchLamp" at (193, 150) is lit
    And Nelim's Pickle Tools: the decor "TorchLamp" at (201, 150) is lit
    And Nelim's Pickle Tools: the decor "TorchLamp" at (193, 155) is lit
    And Nelim's Pickle Tools: the decor "TorchLamp" at (201, 155) is lit
    And I wait 60 ticks
    And A Certain Series: a "ACS_DarkMatterBeetle" pawn stands at (197, 155)
    And Nelim's Pickle Tools: "Rina" stands at (194, 152) facing South
    And Nelim's Pickle Tools: "Nelim" stands at (196, 152) facing South
    And Nelim's Sanctuary: Nelim has her own face
    And Nelim's Pickle Tools: "Sena" stands at (198, 152) facing South
    And Nelim's Pickle Tools: "Toma" stands at (200, 152) facing South
    And Nelim's Pickle Tools: an adult animal of kind "Chicken" named "Poule" is spawned at (197, 150)
    And Nelim's Pickle Tools: the animal "Poule" stands at (197, 150) facing South
    Then 1 "ACS_DarkMatterBeetle" exist
    When Nelim's Pickle Tools: I frame the rectangle from (192, 148) to (202, 157)
    And I take a screenshot "gallery 7 evening"
    Then no errors were logged
