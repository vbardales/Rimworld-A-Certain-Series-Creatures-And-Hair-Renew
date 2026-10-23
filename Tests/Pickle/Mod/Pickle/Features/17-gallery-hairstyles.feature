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
# drafting of picture 2, 1250 ticks = 30 game minutes in picture 6, 600 ticks for the fire of picture 7). Nelim wears ONE outfit all day (picture 1 and
# the note below), keeps her own hairstyle (the fixture's high ponytail, Roo_HD_Hair_Highpony) and her own face (brows,
# smirk smile, `blink`, the Sanctuary step, last before the capture). Every picture leaves the bottom of the frame empty:
# the English subtitle is burnt there afterwards (PUBLICATION.md). Animals face the camera (South). Decor belongs to one
# picture and is removed after it (`the decor is removed`).
#
# Shooting plan v2 (shotlist validated by the owner 2026-10-23; director's pass by an Opus sub-agent). Each picture is a game
# PAUSED MID-PLAY: every living thing acts toward something, nobody poses for the camera. Per picture: place, hour, weather, time
# | subject | THE INSTANT and how it is obtained | composition | decor (defNames) | thumbnail (268 px) and risk with its plan.
#   1. sofa-corner, 12:00, Clear, 60 ticks, map at 20 degrees | Misaka on Rina: she drops by at noon | INSTANT: Rina has just stepped
#      onto the rug and Nelim turns to hand her the plate; Tama looks at it. METHOD: Rina (186, 124) facing East, Nelim (188, 124)
#      facing West carrying MealSimple, Tama (187, 123) facing East, all without a job, game paused; Nelim dressed after the waits |
#      OPENING IMAGE, medium: camera 3 cells' height on (187, 124), the sofas and rug in frame | TorchLamp lit (184, 124),
#      Plant_Daylily (189, 124), the fixture's sofas and rug | THUMBNAIL: Rina's white hair against the rug. RISK: the hair is small
#      at medium zoom. PLAN: a tighter camera (2 cells) if the replay shows it unreadable.
#   2. terrace, 14:00, Clear, 60 + 120 ticks | Accelerator on Toma: a loner who refuses | INSTANT: Nelim has just offered the Beer
#      and Toma turns his back, angry. METHOD: Toma drafted (angry face) at (198, 121) facing East, Nelim (196, 122) facing East
#      carrying Beer, peacock (196, 119) facing East toward the piano | CLOSE: rectangle (195, 119) to (200, 123) | Plant_Daylily
#      (195, 121) and (200, 121), the fixture's piano | THUMBNAIL: white hair against the black duster. RISK: the coat is lost on the
#      dark brick. PLAN: lighten the duster to (45, 45, 58).
#   3. podium (emerald-clearing), 16:00, Clear, 60 ticks | Index on Sena: a quiet corner | INSTANT: Yuki has just padded up beside Sena and Nelim steps up with the chocolate. METHOD (z grows to the north, so
#      South faces the camera): Sena (197, 152) facing South, Yuki (the save's husky) at (199, 152) facing West toward her, in profile,
#      Nelim (195, 152) facing East carrying Chocolate | CLOSE: rectangle (194, 149) to (200, 154) |
#      WoodPlankFloor, TorchLamp lit (194, 150), Brazier lit (200, 150), Plant_Daylily x3 | THUMBNAIL: the white robe on the wood.
#      RISK: Yuki turns away (she showed her back in runs c094 and redo-6). PLAN: placed last; read which way the step turns her.
# NELIM keeps ONE outfit all day (owner's continuity rule 2026-10-23): cream basic shirt (237, 230, 214), olive trousers (91, 107, 58),
# burgundy jacket (122, 46, 58), her high ponytail (Roo_HD_Hair_Highpony), her smirk; the guests keep theirs from picture to picture.
# NELIM'S OUTFIT AND HAIR are set AFTER the last wait of each scenario (2026-10-23): every capture of redo-6 showed her in the same yellow top while PickleTools' looks run (no waits) draws the dyed outfit and the Roo ponytail. Lead, not proven: during the waits her own AI re-dresses her. Guests dressed before the waits kept their clothes.
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
    And Nelim's Pickle Tools: the temperature of the map is 20 degrees
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
    And Nelim's Pickle Tools: "Nelim" hairstyle is "Roo_HD_Hair_Highpony"
    And A Certain Series: "Nelim" wears the hairstyle "Roo_HD_Hair_Highpony"
    And Nelim's Pickle Tools: "Nelim" wears "Apparel_BasicShirt" dyed rgb (237, 230, 214)
    And Nelim's Pickle Tools: "Nelim" wears "Apparel_Pants" dyed rgb (91, 107, 58)
    And Nelim's Pickle Tools: "Nelim" wears "Apparel_Jacket" dyed rgb (122, 46, 58)
    And Nelim's Pickle Tools: "Rina" stands at (186, 124) facing East
    And Nelim's Pickle Tools: "Nelim" stands at (188, 124) facing West
    And Nelim's Pickle Tools: "Nelim" carries the item "MealSimple"
    And Nelim's Pickle Tools: an adult animal of kind "Cat" named "Tama" is spawned at (187, 123)
    And Nelim's Pickle Tools: the animal "Tama" stands at (187, 123) facing East
    And A Certain Series: I bring the camera to 3 cells' height on the cell (187, 124)
    And Nelim's Sanctuary: Nelim has her own face
    And Nelim's Pickle Tools: "Rina" stands at (186, 124) facing East
    And I take a screenshot "gallery 1 misaka"
    And Nelim's Pickle Tools: the decor is removed
    Then no errors were logged

  Scenario: 2 - Toma keeps to the piano (Accelerator, the terrace, 14:00)
    Given the save "Nelims-tribe" is loaded
    And game speed is paused
    And I set the hour to 14
    And I set the weather to "Clear"
    And Nelim's Pickle Tools: the temperature of the map is 20 degrees
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
    And Nelim's Pickle Tools: "Nelim" hairstyle is "Roo_HD_Hair_Highpony"
    And A Certain Series: "Nelim" wears the hairstyle "Roo_HD_Hair_Highpony"
    And Nelim's Pickle Tools: "Nelim" wears "Apparel_BasicShirt" dyed rgb (237, 230, 214)
    And Nelim's Pickle Tools: "Nelim" wears "Apparel_Pants" dyed rgb (91, 107, 58)
    And Nelim's Pickle Tools: "Nelim" wears "Apparel_Jacket" dyed rgb (122, 46, 58)
    And Nelim's Pickle Tools: "Toma" stands at (198, 121) facing East
    And Nelim's Pickle Tools: "Nelim" stands at (196, 122) facing East
    And Nelim's Pickle Tools: "Nelim" carries the item "Beer"
    And Nelim's Pickle Tools: an adult animal of kind "Peacock" named "Paon" is spawned at (196, 119)
    And Nelim's Pickle Tools: the animal "Paon" stands at (196, 119) facing East
    And Nelim's Pickle Tools: I frame the rectangle from (195, 119) to (200, 123)
    And Nelim's Sanctuary: Nelim has her own face
    And I take a screenshot "gallery 2 accelerator"
    And Nelim's Pickle Tools: the decor is removed
    Then no errors were logged

  Scenario: 3 - Sena finds the one shelf worth reading (Index, the podium, 16:00)
    Given the save "Nelims-tribe" is loaded
    And game speed is paused
    And I set the hour to 16
    And I set the weather to "Clear"
    And Nelim's Pickle Tools: the temperature of the map is 20 degrees
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
    And Nelim's Pickle Tools: I place the decor "Brazier" at (200, 150)
    And Nelim's Pickle Tools: the decor "Brazier" at (200, 150) is lit
    And Nelim's Pickle Tools: I place the decor "Plant_Daylily" at (194, 154) fully grown
    And Nelim's Pickle Tools: I place the decor "Plant_Daylily" at (200, 154) fully grown
    And Nelim's Pickle Tools: I place the decor "Plant_Daylily" at (199, 155) fully grown
    And I wait 60 ticks
    And Nelim's Pickle Tools: "Nelim" hairstyle is "Roo_HD_Hair_Highpony"
    And A Certain Series: "Nelim" wears the hairstyle "Roo_HD_Hair_Highpony"
    And Nelim's Pickle Tools: "Nelim" wears "Apparel_BasicShirt" dyed rgb (237, 230, 214)
    And Nelim's Pickle Tools: "Nelim" wears "Apparel_Pants" dyed rgb (91, 107, 58)
    And Nelim's Pickle Tools: "Nelim" wears "Apparel_Jacket" dyed rgb (122, 46, 58)
    And Nelim's Pickle Tools: "Sena" stands at (197, 152) facing South
    And Nelim's Pickle Tools: "Sena" facial expression is "normal"
    And Nelim's Pickle Tools: "Nelim" stands at (195, 152) facing East
    And Nelim's Pickle Tools: "Nelim" carries the item "Chocolate"
    And Nelim's Pickle Tools: the animal "Yuki" stands at (199, 152) facing West
    And Nelim's Pickle Tools: I frame the rectangle from (194, 149) to (200, 154)
    And Nelim's Sanctuary: Nelim has her own face
    And I take a screenshot "gallery 3 index"
    And Nelim's Pickle Tools: the decor is removed
    Then no errors were logged
