# Pictures for the Workshop gallery, not a test: the creatures, the machine and the evening, images 4 to 7 of the series
# "A day at Nelim's Sanctuary" (the story, the outfits and the rules are in the header of feature 17; images 1 to 3 are the
# hairstyle portraits), on the podium of Nelim's Sanctuary (the owner's save "Nelim's tribe", loaded as "Nelims-tribe",
# PickleTools docs/GALERIE.md, SANCTUAIRE-LIEUX.md and SANCTUAIRE-CASES.md), without the interface. What a scenario asserts is
# only that the thing exists; the pictures are read by eye (@review).
#
# The story continues the portraits: Nelim, the host, shows her guests what the mod brings while the day goes down, 17:00 to
# 20:00, Clear on every picture. The podium is the square A of the Sanctuary (x 191-204, z 146-159), its painted green zone
# bared, ringed by flowers, with the permanent vanometric power cell of the fixture on its east edge (205, 152-153). Nelim
# keeps one outfit all day (feature 17) and has her own face (the Sanctuary step, last before the capture). Each picture
# leaves the bottom of the frame empty for the English subtitle. Animals face the camera (South). The decor is removed after
# each picture.
#
# Shooting plan v2 (shotlist validated by the owner 2026-10-23; director's pass by an Opus sub-agent), continuing feature 17: the
# same outfits, every picture a game paused mid-play. Pictures 4 to 7 are all on the podium (emerald-clearing).
#   4. 17:00, Clear, 60 ticks | the white rhinoceros beetle, a pack animal that never eats | INSTANT: Nelim holds out the hay, the beetle
#      stands unmoved before it and the chicken pecks at the hay at her feet. METHOD: beetle (198, 153) (the step gives no facing), Nelim
#      (195, 153) facing East carrying Hay, Chicken (196, 152) facing South (seen from the front) | MEDIUM: camera 4 cells' height on (197, 152) | WoodPlankFloor,
#      TorchLamp lit (195, 150) and (199, 150), Stool (199, 151), Plant_Daylily (199, 154) and (195, 154) | THUMBNAIL: the beetle's horn silhouette on the wood.
#      RISK: the beetle crowds Nelim. PLAN: three cells between them.
#   5. 18:00, Clear, 60 ticks | the seraph (God's Power), eight wings of water | INSTANT: the seraph has just opened its wings and the
#      guests turn toward it while Nelim arrives with the cloth. METHOD (z grows to the north): ACS_Gabriel (197, 152); everybody 5 cells or more from it (its
#      wings draw over anything within about 4.5) and turned toward it: Rina (191, 155) East, Toma (197, 158) South, Sena (203, 155) West,
#      Nelim (194, 147) East carrying ACS_HeavenCloth, Peacock (200, 147) facing South | WIDE: camera 13 cells' height on (197, 152) | WoodPlankFloor,
#      Brazier lit x2 (192, 152) and (202, 152), Plant_YellowTallGrass (193, 149) and (201, 149) | THUMBNAIL: dark wings on the wood.
#      RISK: wings cut, pawns small at 13 cells. PLAN: widen or recompose after the replay.
#   6. 18:00 + 1250 ticks (18:30), Clear | the propagator, one running and one waiting for power | INSTANT: Nelim brings dark matter
#      toward the idle machine while Kuru watches the glow. METHOD: Nelim (198, 153) facing West carrying ACS_DarkMatter, Kuru (200, 152)
#      facing East toward the running machine | MEDIUM: rectangle (195, 149) to (206, 156) | WoodPlankFloor, ACS_DarkMatterProduction
#      (196, 152) and (204, 152), VanometricPowerCell x5, TorchLamp lit x5, Plant_Daylily x2 | THUMBNAIL: green glow against the
#      lightning icon. RISK: too dark. PLAN: five torches; a second row or 17:30 if still dark.
#   7. 20:00 + 600 ticks of fire, Clear | the evening at the fire: everybody stayed | INSTANT: Nelim brings the last log and the three
#      guests stand round the fire holding what she gave them in pictures 1 to 3 (plate, Beer, chocolate), Toma now with his beer.
#      METHOD: Campfire lit (197, 152); Rina (194, 153) East carrying MealSimple, Toma (200, 153) West carrying Beer, Sena (199, 151)
#      West carrying Chocolate, Nelim (195, 150) East carrying WoodLog, beetle (197, 155), Chicken (197, 149) facing South | CLOSING
#      IMAGE, wide: camera 8 cells' height on (197, 152) | WoodPlankFloor, TorchLamp lit x2 (193, 150) and (201, 150), Plant_YellowTallGrass
#      x3 | THUMBNAIL: the warm pool of light. RISK: the fire hides a guest. PLAN: it moves to (197, 153).
#   8. (planned, interface, set aside from the rating) the research window on "ACS_DarkMatterTech". Not written.
# Forced jobs (a real mid-gesture, NPT step "X is forced into the job ..."): compiled, never played, kept as a later upgrade of 3, 4 and 6.
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
    And Nelim's Pickle Tools: I place the decor "TorchLamp" at (199, 150)
    And Nelim's Pickle Tools: the decor "TorchLamp" at (199, 150) is lit
    And Nelim's Pickle Tools: I place the decor "Plant_Daylily" at (195, 154) fully grown
    And I wait 60 ticks
    And Nelim's Pickle Tools: "Nelim" hairstyle is "Roo_HD_Hair_Highpony"
    And A Certain Series: "Nelim" wears the hairstyle "Roo_HD_Hair_Highpony"
    And Nelim's Pickle Tools: "Nelim" wears "Apparel_BasicShirt" dyed rgb (237, 230, 214)
    And Nelim's Pickle Tools: "Nelim" wears "Apparel_Pants" dyed rgb (91, 107, 58)
    And Nelim's Pickle Tools: "Nelim" wears "Apparel_Jacket" dyed rgb (122, 46, 58)
    And A Certain Series: a "ACS_DarkMatterBeetle" pawn stands at (198, 153)
    And Nelim's Pickle Tools: "Nelim" stands at (195, 153) facing East
    And Nelim's Pickle Tools: "Nelim" carries the item "Hay"
    And Nelim's Sanctuary: Nelim has her own face
    And Nelim's Pickle Tools: an adult animal of kind "Chicken" named "Poule" is spawned at (196, 152)
    And Nelim's Pickle Tools: the animal "Poule" stands at (196, 152) facing South
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
    And Nelim's Pickle Tools: "Toma" face kit is "smile"
    And a colonist "Sena" exists
    And A Certain Series: "Sena" is a woman
    And Nelim's Pickle Tools: "Sena" body type is Thin
    And A Certain Series: "Sena" has the skin colour "#F5DCC6"
    And A Certain Series: I give "Sena" the hairstyle "ACS_index"
    And A Certain Series: I let the hairstyle of "Sena" show its own colours
    And A Certain Series: I dress "Sena" in "Apparel_Robe,Apparel_Sash" coloured "#F7F3E8,#C9A227"
    And Nelim's Pickle Tools: "Sena" face kit is "smile"
    And Nelim's Sanctuary: the floor of the sanctuary "emerald-clearing" is bared
    And Nelim's Sanctuary: I am at the sanctuary "emerald-clearing"
    And Nelim's Pickle Tools: the area from (193, 148) to (204, 156) is cleared
    And Nelim's Pickle Tools: I lay the floor "WoodPlankFloor" from (195, 150) to (199, 154)
    When Nelim's Pickle Tools: studio presentation mode is enabled
    And Nelim's Pickle Tools: I place the decor "Brazier" at (192, 152)
    And Nelim's Pickle Tools: I place the decor "Brazier" at (202, 152)
    And Nelim's Pickle Tools: the decor "Brazier" at (192, 152) is lit
    And Nelim's Pickle Tools: the decor "Brazier" at (202, 152) is lit
    And Nelim's Pickle Tools: I place the decor "Plant_YellowTallGrass" at (193, 149) fully grown
    And Nelim's Pickle Tools: I place the decor "Plant_YellowTallGrass" at (201, 149) fully grown
    And I wait 60 ticks
    And Nelim's Pickle Tools: "Nelim" hairstyle is "Roo_HD_Hair_Highpony"
    And A Certain Series: "Nelim" wears the hairstyle "Roo_HD_Hair_Highpony"
    And Nelim's Pickle Tools: "Nelim" wears "Apparel_BasicShirt" dyed rgb (237, 230, 214)
    And Nelim's Pickle Tools: "Nelim" wears "Apparel_Pants" dyed rgb (91, 107, 58)
    And Nelim's Pickle Tools: "Nelim" wears "Apparel_Jacket" dyed rgb (122, 46, 58)
    And A Certain Series: a "ACS_Gabriel" pawn stands at (197, 152)
    And Nelim's Pickle Tools: "Nelim" stands at (194, 147) facing East
    And Nelim's Pickle Tools: "Nelim" carries the item "ACS_HeavenCloth"
    And Nelim's Sanctuary: Nelim has her own face
    And Nelim's Pickle Tools: "Rina" stands at (191, 155) facing East
    And Nelim's Pickle Tools: "Toma" stands at (197, 158) facing South
    And Nelim's Pickle Tools: "Sena" stands at (203, 155) facing West
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
    And Nelim's Pickle Tools: "Nelim" wears "Apparel_BasicShirt" dyed rgb (237, 230, 214)
    And Nelim's Pickle Tools: "Nelim" wears "Apparel_Pants" dyed rgb (91, 107, 58)
    And Nelim's Pickle Tools: "Nelim" wears "Apparel_Jacket" dyed rgb (122, 46, 58)
    And Nelim's Sanctuary: the animals are removed from the sanctuary "emerald-clearing"
    And Nelim's Pickle Tools: "Nelim" stands at (198, 153) facing West
    And Nelim's Pickle Tools: "Nelim" carries the item "ACS_DarkMatter"
    And Nelim's Pickle Tools: an adult animal of kind "akaNEKO_kuroneko" named "Kuru" is spawned at (200, 152)
    And Nelim's Pickle Tools: the animal "Kuru" stands at (200, 152) facing East
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
    And Nelim's Pickle Tools: "Toma" face kit is "smile"
    And a colonist "Sena" exists
    And A Certain Series: "Sena" is a woman
    And Nelim's Pickle Tools: "Sena" body type is Thin
    And A Certain Series: "Sena" has the skin colour "#F5DCC6"
    And A Certain Series: I give "Sena" the hairstyle "ACS_index"
    And A Certain Series: I let the hairstyle of "Sena" show its own colours
    And A Certain Series: I dress "Sena" in "Apparel_Robe,Apparel_Sash" coloured "#F7F3E8,#C9A227"
    And Nelim's Pickle Tools: "Sena" face kit is "smile"
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
    And Nelim's Pickle Tools: "Nelim" wears "Apparel_BasicShirt" dyed rgb (237, 230, 214)
    And Nelim's Pickle Tools: "Nelim" wears "Apparel_Pants" dyed rgb (91, 107, 58)
    And Nelim's Pickle Tools: "Nelim" wears "Apparel_Jacket" dyed rgb (122, 46, 58)
    And A Certain Series: a "ACS_DarkMatterBeetle" pawn stands at (197, 155)
    And Nelim's Pickle Tools: "Rina" stands at (194, 153) facing East
    And Nelim's Pickle Tools: "Nelim" stands at (195, 150) facing East
    And Nelim's Pickle Tools: "Nelim" carries the item "WoodLog"
    And Nelim's Pickle Tools: "Rina" carries the item "MealSimple"
    And Nelim's Pickle Tools: "Toma" carries the item "Beer"
    And Nelim's Pickle Tools: "Sena" carries the item "Chocolate"
    And Nelim's Sanctuary: Nelim has her own face
    And Nelim's Pickle Tools: "Sena" stands at (199, 151) facing West
    And Nelim's Pickle Tools: "Toma" stands at (200, 153) facing West
    And Nelim's Pickle Tools: an adult animal of kind "Chicken" named "Poule" is spawned at (197, 149)
    And Nelim's Pickle Tools: the animal "Poule" stands at (197, 149) facing South
    Then 1 "ACS_DarkMatterBeetle" exist
    When A Certain Series: I bring the camera to 8 cells' height on the cell (197, 152)
    And I take a screenshot "gallery 7 evening"
    And Nelim's Pickle Tools: the decor is removed
    Then no errors were logged
