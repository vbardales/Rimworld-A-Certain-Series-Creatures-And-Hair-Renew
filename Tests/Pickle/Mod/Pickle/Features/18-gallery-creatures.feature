# Pictures for the Workshop gallery, not a test: the creatures, the machine and the evening, images 4 to 7 of the series
# "A day at Nelim's Sanctuary" (the story, the outfits and the rules are in the header of feature 17; images 1 to 3 are the
# hairstyle portraits), on the podium of Nelim's Sanctuary (the owner's save "Nelim's tribe", loaded as "Nelims-tribe",
# PickleTools docs/GALERIE.md, SANCTUAIRE-LIEUX.md and SANCTUAIRE-CASES.md), without the interface. What a scenario asserts is
# only that the thing exists; the pictures are read by eye (@review).
#
# The story continues the portraits: Nelim, the host, shows her guests what the mod brings while the day goes down, 17:00 to
# 20:00, Clear on every picture. The podium is the square A of the Sanctuary (x 191-204, z 146-159), its painted green zone
# bared, ringed by flowers, with the permanent vanometric power cell of the fixture on its east edge (205, 152-153). Nelim
# wears a different outfit on every picture and has her own face (the Sanctuary step, last before the capture). Each picture
# leaves the bottom of the frame empty for the English subtitle. Animals face the camera (South). The decor is removed after
# each picture.
#
# Shooting plan, one line per picture (place, hour, weather, time | subject | composition | living things, outfit, expression,
# action | decor | risk and plan):
#   4. emerald-clearing, 17:00, Clear, 60 ticks | the white rhinoceros beetle, a pack animal that never eats | camera 4 cells' height on (197, 152)
#      with the beetle at (198, 153) fills the frame | Nelim: cream basic shirt (240, 228, 205), brown trousers (92, 60,
#      40), rust jacket (168, 69, 42), her high ponytail, her smirk, holds out hay (Hay) that the beetle ignores, at (195, 153) facing
#      East; ACS_DarkMatterBeetle; Chicken at (197, 151) facing the camera | WoodPlankFloor, TorchLamp lit at (195, 150), Stool
#      at (199, 151), Plant_Daylily at (199, 154) | RISK: the beetle crowds Nelim in the tight frame. PLAN: three cells between
#      them; if they touch, the beetle goes to (199, 153) and the frame widens to (193, 150)-(201, 155).
#   5. emerald-clearing, 18:00, Clear, 60 ticks | the seraph (God's Power), eight wings of water | camera 13 cells' height on (197, 152), everything outside the wings (>= 5 cells from the seraph) (was frame (193, 148) to (201,
#      157), high enough for the wings, guests staggered behind her and turned toward the seraph (no row facing the camera) |
#      Nelim: navy collar shirt (31, 58, 95), sand trousers (200, 184, 150), her high ponytail, her smirk, holds a bolt of heaven cloth
#      (ACS_HeavenCloth), facing East; ACS_Gabriel; Rina (193, 157) facing North, Toma (197, 158) facing West, Sena (201, 156)
#      facing North; Peacock facing the camera | WoodPlankFloor, Brazier lit x2 at (193, 152) and (201, 152),
#      Plant_YellowTallGrass at (193, 149) and (201, 149) | RISK: the wings are cut by the frame, or the guests' backs hide
#      their hairstyles. PLAN: frame verified in run c094 (the wings were whole); the guests' hair is read from behind, the
#      hairstyles were already shown in 1 to 3.
#   6. emerald-clearing, 18:00 then 30 more game minutes (1250 ticks), Clear | the dark matter propagator, one running, one
#      waiting for power (the lightning icon) | frame (195, 149) to (206, 156), tight on the machines | Nelim: grey basic
#      shirt (212, 206, 196), near-black trousers (47, 47, 54), slate jacket (59, 63, 70), her high ponytail, her smirk, carries a
#      lump of dark matter (ACS_DarkMatter), facing West; Cat in front of her at (200, 152) facing the camera | WoodPlankFloor,
#      ACS_DarkMatterProduction x2 at (196, 152) and (204, 152), VanometricPowerCell x5, TorchLamp lit x5, Plant_Daylily at
#      (196, 149) and (202, 149) | RISK: too dark (the run c094 capture was), and the right machine touching the cells does
#      not read. PLAN: five torches and the hour 18 plus 30 minutes instead of 19:00; if it still reads dark, add a second
#      row of torches or move the hour to 17:30.
#   7. emerald-clearing, 20:00, Clear, 60 ticks plus 600 ticks of fire | the evening at the fire: everybody stayed | frame
#      camera 8 cells' height on (197, 152), a ring around the fire, not a row facing the camera | Nelim: cream basic shirt (234, 220,
#      210), brown trousers (70, 55, 50), rose parka (176, 122, 122), her high ponytail, her smirk, brings a log (WoodLog) at (195, 150)
#      facing South; Rina (194, 153) facing East, smile; Toma (200, 153) facing West, smug; Sena (199, 151) facing South,
#      calm; the beetle behind at (197, 155); Chicken at (197, 149) facing the camera | WoodPlankFloor, Campfire lit at (197,
#      152), TorchLamp lit x2 at (193, 150) and (201, 150), Plant_YellowTallGrass x3 | RISK: the campfire hides a guest, faces
#      in profile read small. PLAN: Nelim and Sena face the camera, the two others turn toward the fire; if the fire hides
#      someone, it moves to (197, 153).
#   8. (planned, interface, set aside from the rating by the owner's rule of 2026-10-18) the research window on
#      "ACS_DarkMatterTech", taken on `window-backdrop-for-height`, cropped, no subtitle. Not written.
# Torch lamps rather than standing lamps (a powered lamp with no power shows the lightning icon on the picture) and no
# empty plant pot (it reads as a bucket). The guests of picture 7 are dressed as in feature 17.
@review @en-only @requires:nelim.pickletools.screenshotstudio @requires:nelim.pickletools.stagedecor @requires:nelim.pickletools.colonistrace
Feature: Gallery pictures of the creatures, the propagator and the evening

  Scenario: 4 - Nelim leads in the white rhinoceros beetle (the podium, 17:00)
    Given the save "Nelims-tribe" is loaded
    And game speed is paused
    And I set the hour to 17
    And I set the weather to "Clear"
    And Nelim's Pickle Tools: the temperature of the map is 20 degrees
    And Nelim's Sanctuary: the floor of the sanctuary "emerald-clearing" is bared
    And Nelim's Sanctuary: I am at the sanctuary "emerald-clearing"
    And Nelim's Pickle Tools: the area from (193, 148) to (204, 156) is cleared
    And Nelim's Pickle Tools: I lay the floor "WoodPlankFloor" from (195, 150) to (199, 154)
    When Nelim's Pickle Tools: studio presentation mode is enabled
    And Nelim's Pickle Tools: I place the decor "TorchLamp" at (195, 150)
    And Nelim's Pickle Tools: I place the decor "Stool" at (199, 151)
    And Nelim's Pickle Tools: I place the decor "Plant_Daylily" at (199, 154) fully grown
    And Nelim's Pickle Tools: the decor "TorchLamp" at (195, 150) is lit
    And I wait 60 ticks
    And Nelim's Pickle Tools: "Nelim" hairstyle is "Roo_HD_Hair_Highpony"
    And A Certain Series: "Nelim" wears the hairstyle "Roo_HD_Hair_Highpony"
    And Nelim's Pickle Tools: "Nelim" wears "Apparel_BasicShirt" dyed rgb (240, 228, 205)
    And Nelim's Pickle Tools: "Nelim" wears "Apparel_Pants" dyed rgb (92, 60, 40)
    And Nelim's Pickle Tools: "Nelim" wears "Apparel_Jacket" dyed rgb (168, 69, 42)
    And A Certain Series: a "ACS_DarkMatterBeetle" pawn stands at (198, 153)
    And Nelim's Pickle Tools: "Nelim" stands at (195, 153) facing East
    And Nelim's Pickle Tools: "Nelim" carries the item "Hay"
    And Nelim's Sanctuary: Nelim has her own face
    And Nelim's Pickle Tools: an adult animal of kind "Chicken" named "Poule" is spawned at (197, 151)
    And Nelim's Pickle Tools: the animal "Poule" stands at (197, 151) facing South
    Then 1 "ACS_DarkMatterBeetle" exist
    When A Certain Series: I bring the camera to 4 cells' height on the cell (197, 152)
    And I take a screenshot "gallery 4 beetle"
    And Nelim's Pickle Tools: the decor is removed
    Then no errors were logged

  Scenario: 5 - the seraph at six in the evening (the podium, 18:00)
    Given the save "Nelims-tribe" is loaded
    And game speed is paused
    And I set the hour to 18
    And I set the weather to "Clear"
    And Nelim's Pickle Tools: the temperature of the map is 20 degrees
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
    And Nelim's Pickle Tools: I place the decor "Brazier" at (193, 152)
    And Nelim's Pickle Tools: I place the decor "Brazier" at (201, 152)
    And Nelim's Pickle Tools: the decor "Brazier" at (193, 152) is lit
    And Nelim's Pickle Tools: the decor "Brazier" at (201, 152) is lit
    And Nelim's Pickle Tools: I place the decor "Plant_YellowTallGrass" at (193, 149) fully grown
    And Nelim's Pickle Tools: I place the decor "Plant_YellowTallGrass" at (201, 149) fully grown
    And I wait 60 ticks
    And Nelim's Pickle Tools: "Nelim" hairstyle is "Roo_HD_Hair_Highpony"
    And A Certain Series: "Nelim" wears the hairstyle "Roo_HD_Hair_Highpony"
    And Nelim's Pickle Tools: "Nelim" wears "Apparel_CollarShirt" dyed rgb (31, 58, 95)
    And Nelim's Pickle Tools: "Nelim" wears "Apparel_Pants" dyed rgb (200, 184, 150)
    And A Certain Series: a "ACS_Gabriel" pawn stands at (197, 152)
    And Nelim's Pickle Tools: "Nelim" stands at (194, 147) facing East
    And Nelim's Pickle Tools: "Nelim" carries the item "ACS_HeavenCloth"
    And Nelim's Sanctuary: Nelim has her own face
    And Nelim's Pickle Tools: "Rina" stands at (193, 157) facing North
    And Nelim's Pickle Tools: "Toma" stands at (197, 158) facing West
    And Nelim's Pickle Tools: "Sena" stands at (201, 156) facing North
    And Nelim's Pickle Tools: an adult animal of kind "Peacock" named "Paon" is spawned at (200, 147)
    And Nelim's Pickle Tools: the animal "Paon" stands at (200, 147) facing South
    Then 1 "ACS_Gabriel" exist
    When A Certain Series: I bring the camera to 13 cells' height on the cell (197, 152)
    And I take a screenshot "gallery 5 seraph"
    And Nelim's Pickle Tools: the decor is removed
    Then no errors were logged

  Scenario: 6 - Nelim at the propagator, one running and one waiting for power (the podium, 18:30)
    Given the save "Nelims-tribe" is loaded
    And game speed is paused
    And I set the hour to 18
    And I set the weather to "Clear"
    And Nelim's Pickle Tools: the temperature of the map is 20 degrees
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
    And Nelim's Pickle Tools: I place the decor "TorchLamp" at (201, 154)
    And Nelim's Pickle Tools: I place the decor "TorchLamp" at (195, 154)
    And Nelim's Pickle Tools: the decor "TorchLamp" at (200, 151) is lit
    And Nelim's Pickle Tools: the decor "TorchLamp" at (201, 154) is lit
    And Nelim's Pickle Tools: the decor "TorchLamp" at (195, 154) is lit
    And Nelim's Pickle Tools: I place the decor "TorchLamp" at (198, 150)
    And Nelim's Pickle Tools: I place the decor "TorchLamp" at (203, 150)
    And Nelim's Pickle Tools: the decor "TorchLamp" at (198, 150) is lit
    And Nelim's Pickle Tools: the decor "TorchLamp" at (203, 150) is lit
    And Nelim's Pickle Tools: I place the decor "Plant_Daylily" at (196, 149) fully grown
    And Nelim's Pickle Tools: I place the decor "Plant_Daylily" at (202, 149) fully grown
    And Nelim's Pickle Tools: I place the decor "VanometricPowerCell" at (206, 152)
    And Nelim's Pickle Tools: I place the decor "VanometricPowerCell" at (206, 154)
    And Nelim's Pickle Tools: I place the decor "VanometricPowerCell" at (205, 154)
    And Nelim's Pickle Tools: I place the decor "VanometricPowerCell" at (206, 156)
    And Nelim's Pickle Tools: I place the decor "VanometricPowerCell" at (205, 156)
    And Nelim's Pickle Tools: the power network is refreshed
    And Nelim's Pickle Tools: I let 1250 ticks pass
    And Nelim's Pickle Tools: "Nelim" hairstyle is "Roo_HD_Hair_Highpony"
    And A Certain Series: "Nelim" wears the hairstyle "Roo_HD_Hair_Highpony"
    And Nelim's Pickle Tools: "Nelim" wears "Apparel_BasicShirt" dyed rgb (212, 206, 196)
    And Nelim's Pickle Tools: "Nelim" wears "Apparel_Pants" dyed rgb (47, 47, 54)
    And Nelim's Pickle Tools: "Nelim" wears "Apparel_Jacket" dyed rgb (59, 63, 70)
    And Nelim's Sanctuary: the animals are removed from the sanctuary "emerald-clearing"
    And Nelim's Pickle Tools: "Nelim" stands at (198, 153) facing West
    And Nelim's Pickle Tools: "Nelim" carries the item "ACS_DarkMatter"
    And Nelim's Pickle Tools: an adult animal of kind "Cat" named "Miso" is spawned at (200, 152)
    And Nelim's Pickle Tools: the animal "Miso" stands at (200, 152) facing South
    When Nelim's Pickle Tools: I frame the rectangle from (195, 149) to (206, 156)
    And Nelim's Sanctuary: Nelim has her own face
    And I take a screenshot "gallery 6 propagator"
    And Nelim's Pickle Tools: the decor is removed
    Then no errors were logged

  Scenario: 7 - everybody stayed (the podium, 20:00)
    Given the save "Nelims-tribe" is loaded
    And game speed is paused
    And I set the hour to 20
    And I set the weather to "Clear"
    And Nelim's Pickle Tools: the temperature of the map is 20 degrees
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
    And Nelim's Pickle Tools: the decor "TorchLamp" at (193, 150) is lit
    And Nelim's Pickle Tools: the decor "TorchLamp" at (201, 150) is lit
    And Nelim's Pickle Tools: I place the decor "Campfire" at (197, 152)
    And Nelim's Pickle Tools: the decor "Campfire" at (197, 152) is lit
    And Nelim's Pickle Tools: I place the decor "Plant_YellowTallGrass" at (193, 155) fully grown
    And Nelim's Pickle Tools: I place the decor "Plant_YellowTallGrass" at (201, 155) fully grown
    And Nelim's Pickle Tools: I place the decor "Plant_YellowTallGrass" at (193, 149) fully grown
    And Nelim's Pickle Tools: I let 600 ticks pass
    And I wait 60 ticks
    And Nelim's Pickle Tools: "Nelim" hairstyle is "Roo_HD_Hair_Highpony"
    And A Certain Series: "Nelim" wears the hairstyle "Roo_HD_Hair_Highpony"
    And Nelim's Pickle Tools: "Nelim" wears "Apparel_BasicShirt" dyed rgb (234, 220, 210)
    And Nelim's Pickle Tools: "Nelim" wears "Apparel_Pants" dyed rgb (70, 55, 50)
    And Nelim's Pickle Tools: "Nelim" wears "Apparel_Parka" dyed rgb (176, 122, 122)
    And A Certain Series: a "ACS_DarkMatterBeetle" pawn stands at (197, 155)
    And Nelim's Pickle Tools: "Rina" stands at (194, 153) facing East
    And Nelim's Pickle Tools: "Nelim" stands at (195, 150) facing South
    And Nelim's Pickle Tools: "Nelim" carries the item "WoodLog"
    And Nelim's Sanctuary: Nelim has her own face
    And Nelim's Pickle Tools: "Sena" stands at (199, 151) facing South
    And Nelim's Pickle Tools: "Toma" stands at (200, 153) facing West
    And Nelim's Pickle Tools: an adult animal of kind "Chicken" named "Poule" is spawned at (197, 149)
    And Nelim's Pickle Tools: the animal "Poule" stands at (197, 149) facing South
    Then 1 "ACS_DarkMatterBeetle" exist
    When A Certain Series: I bring the camera to 8 cells' height on the cell (197, 152)
    And I take a screenshot "gallery 7 evening"
    And Nelim's Pickle Tools: the decor is removed
    Then no errors were logged
