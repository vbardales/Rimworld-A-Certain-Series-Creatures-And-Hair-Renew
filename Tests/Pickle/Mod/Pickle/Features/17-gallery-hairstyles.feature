# Pictures for the Workshop gallery, not a test: the three hairstyle portraits of the series "A day at Nelim's Sanctuary"
# (images 1 to 3 of 7; the creatures, the machine and the evening are images 4 to 7, feature 18), in Nelim's Sanctuary (the
# owner's save "Nelim's tribe", loaded as "Nelims-tribe", SanctuaryBacklot docs/GALERIE.md, SANCTUAIRE-LIEUX.md and
# SANCTUAIRE-CASES.md), without the interface. What a scenario asserts is only that the hairstyle is worn; the pictures are the
# point and are read by eye (@review). The camera of the game stops at about fifty pixels for a colonist: a local step lowers
# the bound of its zoom. Three families of steps, told apart by their prefix: `Nelim's Sanctuary:` = the Sanctuary Backlot
# (the named places); `Nelim's Pickle Tools:` = PickleTools, the generic tools (decor, animals, floor, framing, waiting);
# `A Certain Series:` = this mod's own steps.
#
# THE STORY (owner's rules of 2026-10-02/06/14/18, GALLERY.md): one Saturday at Nelim's Sanctuary. Nelim (the owner, the one
# colonist of the save) is the host and the protagonist. Rina, Toma and Sena are her guests, each wearing a hairstyle of the
# mod, and each gets a treat from her hands. The day moves on one picture at a time: 12:00, 14:00, 16:00 (portraits), then
# 17:00, 18:00, 18:30 and 20:00 (feature 18: the beetle, the seraph, the machine, the evening at the fire). Weather: Clear on
# every picture, stated in every scenario. Time passes inside each scenario by waits (60 ticks to settle, 120 ticks for the
# drafting of picture 2, 1250 ticks = 30 game minutes in picture 6, 600 ticks for the fire of picture 7). Nelim wears a
# DIFFERENT outfit on every picture (colours below), keeps her own hairstyle (the fixture's high ponytail, Roo_HD_Hair_Highpony) and her own face (brows,
# smirk smile, `blink`, the Sanctuary step, last before the capture). Every picture leaves the bottom of the frame empty:
# the English subtitle is burnt there afterwards (PUBLICATION.md). Animals face the camera (South). Decor belongs to one
# picture and is removed after it (`the decor is removed`).
#
# Shooting plan, one line per picture. Each line: place, hour, weather, time that passes | subject and what it says |
# composition | living things (pawn, outfit with colours, expression, action) | decor (defNames) | risk AND plan.
#   1. sofa-corner (the rose rug between three sofas), 12:00, Clear, 60 ticks | Misaka on Rina: she drops by at noon and
#      Nelim kept the good sofa for her | camera at 2 cells' height on (187, 124), tight on the two pawns, Rina facing South, Nelim facing West toward her (a plate held facing South covered her face in run redo-6),
#      a cat in front at z 125 | Rina: cream blouse (241, 231, 208), deep brown trousers (90, 59, 40), smile kit, stands just
#      in, Misaka drawn in its own colours (white hair); Nelim: teal collar shirt (47, 111, 115), charcoal trousers (52, 52,
#      60), her high ponytail, her smirk, carries a plate (MealSimple) held out to Rina; house cat Cat facing the camera | TorchLamp lit
#      at (184, 124), Plant_Daylily at (189, 124), the fixture's sofas and rug | RISK: the hairstyle stays a few pixels wide
#      and Nelim sweats (the fixture is hot). PLAN: 2 cells' height; pawns placed after the waits; Nelim's face is the last
#      step before the capture; if the hair still reads small, frame to 1.5 cells.
#   2. terrace (brick, black piano), 14:00, Clear, 60 + 120 ticks | Accelerator on Toma: a loner who keeps to the edge of
#      the room and refuses the bottle | frame (194, 118) to (200, 123), Toma off-centre by the piano, Nelim facing him a few
#      cells away, a peacock in front | Toma: all black under a long duster (28, 28, 36 / 43, 43, 53 / 23, 23, 29), drafted
#      for the angry face, stands; Nelim: cream basic shirt (237, 230, 214), olive trousers (91, 107, 58), burgundy jacket (122,
#      46, 58), her high ponytail, her smirk, carries a bottle (Beer) held out; Peacock facing the camera | Plant_Daylily at (195, 121) and
#      (200, 121), the fixture's piano | RISK: the black coat vanishes against the dark brick. PLAN: only the white hair has to
#      be bright, Nelim's burgundy gives the colour; if the coat is lost, lighten the duster to (45, 45, 58).
#   3. emerald-clearing (the podium: a small wooden floor ringed by flowers, its painted green zone bared), 16:00, Clear, 60
#      ticks | Index on Sena: she found a quiet corner and Nelim keeps her company | frame (194, 149) to (200, 155), warm wood
#      floor, torches in the back corners | Sena: white robe (247, 243, 232) and gold sash (201, 162, 39), calm kit, stands,
#      Index in its own colours; Nelim: sage collar shirt (143, 169, 138), denim trousers (63, 95, 138), her high ponytail, her smirk,
#      carries a bar of chocolate (Chocolate); Husky in front of Sena at z 150, facing the camera | WoodPlankFloor, TorchLamp
#      lit x2 at (194, 150) and (200, 150), Plant_Daylily x3 | RISK: the husky turns away from the camera again (it showed its
#      back in run c094). PLAN: it is spawned and placed last, in front of the pawns; if it still turns, ask NPT for a step that
#      holds an animal's facing. (Run redo-6: the husky showed its back after "facing South", so it is now asked to face North, to see which way the step turns it.)
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
    And I set the weather to "Clear"
    And Nelim's Pickle Tools: "Nelim" hairstyle is "Roo_HD_Hair_Highpony"
    And Nelim's Pickle Tools: "Nelim" wears "Apparel_CollarShirt" dyed rgb (47, 111, 115)
    And Nelim's Pickle Tools: "Nelim" wears "Apparel_Pants" dyed rgb (52, 52, 60)
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
    And Nelim's Pickle Tools: I place the decor "TorchLamp" at (184, 124)
    And Nelim's Pickle Tools: the decor "TorchLamp" at (184, 124) is lit
    And Nelim's Pickle Tools: I place the decor "Plant_Daylily" at (189, 124) fully grown
    And Nelim's Sanctuary: I am at the sanctuary "sofa-corner"
    And I wait 60 ticks
    And Nelim's Pickle Tools: "Rina" stands at (186, 124) facing South
    And Nelim's Pickle Tools: "Nelim" stands at (188, 124) facing West
    And Nelim's Pickle Tools: "Nelim" carries the item "MealSimple"
    And Nelim's Pickle Tools: an adult animal of kind "Cat" named "Miso" is spawned at (187, 125)
    And Nelim's Pickle Tools: the animal "Miso" stands at (187, 125) facing South
    And A Certain Series: I bring the camera to 2 cells' height on the cell (187, 124)
    And Nelim's Pickle Tools: "Rina" facial expression is "normal"
    And Nelim's Sanctuary: Nelim has her own face
    And I take a screenshot "gallery 1 misaka"
    And Nelim's Pickle Tools: the decor is removed
    Then no errors were logged

  Scenario: 2 - Toma keeps to the piano (Accelerator, the terrace, 14:00)
    Given the save "Nelims-tribe" is loaded
    And game speed is paused
    And I set the hour to 14
    And I set the weather to "Clear"
    And Nelim's Pickle Tools: "Nelim" hairstyle is "Roo_HD_Hair_Highpony"
    And Nelim's Pickle Tools: "Nelim" wears "Apparel_BasicShirt" dyed rgb (237, 230, 214)
    And Nelim's Pickle Tools: "Nelim" wears "Apparel_Pants" dyed rgb (91, 107, 58)
    And Nelim's Pickle Tools: "Nelim" wears "Apparel_Jacket" dyed rgb (122, 46, 58)
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
    And Nelim's Pickle Tools: I place the decor "Plant_Daylily" at (195, 121) fully grown
    And Nelim's Pickle Tools: I place the decor "Plant_Daylily" at (200, 121) fully grown
    And Nelim's Sanctuary: I am at the sanctuary "terrace"
    And I wait 60 ticks
    And I draft "Toma"
    And Nelim's Pickle Tools: I let 120 ticks pass
    And Nelim's Pickle Tools: "Toma" stands at (198, 121) facing South
    And Nelim's Pickle Tools: "Nelim" stands at (196, 122) facing East
    And Nelim's Pickle Tools: "Nelim" carries the item "Beer"
    And Nelim's Pickle Tools: an adult animal of kind "Peacock" named "Paon" is spawned at (196, 119)
    And Nelim's Pickle Tools: the animal "Paon" stands at (196, 119) facing South
    And Nelim's Pickle Tools: I frame the rectangle from (194, 118) to (200, 123)
    And Nelim's Sanctuary: Nelim has her own face
    And I take a screenshot "gallery 2 accelerator"
    And Nelim's Pickle Tools: the decor is removed
    Then no errors were logged

  Scenario: 3 - Sena finds the one shelf worth reading (Index, the podium, 16:00)
    Given the save "Nelims-tribe" is loaded
    And game speed is paused
    And I set the hour to 16
    And I set the weather to "Clear"
    And Nelim's Pickle Tools: "Nelim" hairstyle is "Roo_HD_Hair_Highpony"
    And Nelim's Pickle Tools: "Nelim" wears "Apparel_CollarShirt" dyed rgb (143, 169, 138)
    And Nelim's Pickle Tools: "Nelim" wears "Apparel_Pants" dyed rgb (63, 95, 138)
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
    And Nelim's Pickle Tools: "Nelim" carries the item "Chocolate"
    And Nelim's Pickle Tools: the animal "Yuki" stands at (197, 150) facing North
    And Nelim's Pickle Tools: I frame the rectangle from (194, 149) to (200, 155)
    And Nelim's Sanctuary: Nelim has her own face
    And I take a screenshot "gallery 3 index"
    And Nelim's Pickle Tools: the decor is removed
    Then no errors were logged
