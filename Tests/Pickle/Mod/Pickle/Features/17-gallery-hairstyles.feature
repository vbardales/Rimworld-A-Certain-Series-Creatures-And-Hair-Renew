# Pictures for the Workshop gallery, not a test: the three hairstyle portraits of the series "Noon at the Sanctuary"
# (images 1 to 3 of 6; the creatures are images 4 to 6, feature 18), in Nelim's Sanctuary (the owner's save "Nelim's tribe",
# loaded as "Nelims-tribe", SanctuaryBacklot docs/GALERIE.md, SANCTUAIRE-LIEUX.md and SANCTUAIRE-CASES.md), without the
# interface. What a scenario asserts is only that the hairstyle is worn; the pictures are the point and are read by eye
# (@review). The camera of the game stops at about fifty pixels for a colonist: a local step lowers the bound of its zoom.
# Three families of steps, told apart by their prefix: `Nelim's Sanctuary:` = the Sanctuary Backlot (the named places);
# `Nelim's Pickle Tools:` = PickleTools, the generic tools (decor, animals, floor, framing, waiting);
# `A Certain Series:` = this mod's own steps.
#
# The story (owner's rules of 2026-10-02/06, PUBLISHING.md: the author is the photographer, one story, time passes,
# something alive in every picture). A single noon in the Sanctuary, by Nelim's tribe: three visitors, each at home in a
# corner of the house, then three creatures on the podium. The clock starts at 12:00 in each scenario (the save is
# reloaded) and the picture is taken a little later each time, 5 minutes of game time (about 208 ticks) further than the
# previous one, after 60 ticks of set-up; a picture of the series is a scenario. Rhythm chosen: 5 minutes.
#
# Shooting plan, one line per picture (place, moment, subject, composition, what lives there, what it says):
#   1. sofa-corner (the rose rug between three sofas), 12:00+, Rina with Misaka, close and a little left of centre so the
#      rug and the sofas frame her, a house cat on the floor to her right: a student at home who has just come in;
#      cream blouse and deep brown to bring out the orange of the hair against the rose.
#   2. terrace (brick, black piano), 12:05+, Toma with Accelerator, centred, the piano at the edge of the frame, a peacock
#      walking past behind him: a loner who stays at the edge; all black under a long coat so only the white hair is bright.
#   3. emerald-clearing (the podium: a small wooden floor ringed by flowers, its painted green zone bared), 12:10+, Sena with
#      Index, a bookcase on her right and a torch on her left, a squirrel on the floor: the librarian with her shelf;
#      white robe and gold sash on warm wood.
# Skin tones are chosen: a generated tone made one face read as a smiley under pale hair. A beard on Misaka was tried and
# dropped (owner: it did not suit her). The game tints a hairstyle by the hair colour: white lets each hairstyle show
# the colours its artist drew. Places: the empty photographs of every named place were read, not the names; the tea room
# was tried and dropped (its blue lamps tinted the white robe cyan); the terrace cells come from SANCTUAIRE-CASES.md
# (the shelf of materials is at (197, 118), the free cells of row 121 are x 195-200).
@review @en-only @requires:nelim.pickletools.screenshotstudio @requires:nelim.pickletools.stagedecor
Feature: Gallery pictures of the hairstyles

  Scenario: 1 - Rina, the student, comes home (Misaka, the sofa corner, 12:00)
    Given the save "Nelims-tribe" is loaded
    And game speed is paused
    And I set the hour to 12
    And a colonist "Rina" exists
    And A Certain Series: "Rina" is a woman
    And Nelim's Pickle Tools: "Rina" body type is Thin
    And A Certain Series: "Rina" has the skin colour "#F2D2B8"
    And A Certain Series: I give "Rina" the hairstyle "ACS_misaka"
    And A Certain Series: I let the hairstyle of "Rina" show its own colours
    And A Certain Series: I dress "Rina" in "Apparel_CollarShirt,Apparel_Pants" coloured "#F1E7D0,#5A3B28"
    Then A Certain Series: "Rina" wears the hairstyle "ACS_misaka"
    And A Certain Series: the hairstyle of "Rina" is drawn in its own colours
    And A Certain Series: "Rina" wears the apparel "Apparel_CollarShirt"
    When Nelim's Pickle Tools: studio presentation mode is enabled
    And Nelim's Sanctuary: I am at the sanctuary "sofa-corner"
    And Nelim's Pickle Tools: "Rina" stands at (187, 123) facing South
    And I wait 60 ticks
    And I wait 0 ticks
    And Nelim's Pickle Tools: an adult animal of kind "Cat" named "Miso" is spawned at (189, 122)
    And A Certain Series: I bring the camera to 2 cells' height on the cell (188, 123)
    And I take a screenshot "gallery 1 misaka"
    Then no errors were logged

  Scenario: 2 - Toma, the loner, at the edge of the terrace (Accelerator, 12:05)
    Given the save "Nelims-tribe" is loaded
    And game speed is paused
    And I set the hour to 12
    And a colonist "Toma" exists
    And A Certain Series: "Toma" is a man
    And Nelim's Pickle Tools: "Toma" body type is Male
    And A Certain Series: "Toma" has the skin colour "#EBCBB0"
    And A Certain Series: I give "Toma" the hairstyle "ACS_Accelerator"
    And A Certain Series: I let the hairstyle of "Toma" show its own colours
    And A Certain Series: I dress "Toma" in "Apparel_CollarShirt,Apparel_Pants,Apparel_Duster" coloured "#1C1C24,#2B2B35,#17171D"
    Then A Certain Series: "Toma" wears the hairstyle "ACS_Accelerator"
    And A Certain Series: "Toma" wears the apparel "Apparel_Duster"
    When Nelim's Pickle Tools: studio presentation mode is enabled
    And Nelim's Sanctuary: I am at the sanctuary "terrace"
    And I wait 60 ticks
    And Nelim's Pickle Tools: I let 208 ticks pass
    And Nelim's Pickle Tools: "Toma" stands at (198, 121) facing South
    And Nelim's Pickle Tools: an adult animal of kind "Peacock" named "Paon" is spawned at (195, 120)
    And A Certain Series: I bring the camera to 2 cells' height on "Toma"
    And I take a screenshot "gallery 2 accelerator"
    Then no errors were logged

  Scenario: 3 - Sena, the librarian, by her shelf (Index, the podium, 12:10)
    Given the save "Nelims-tribe" is loaded
    And game speed is paused
    And I set the hour to 12
    And a colonist "Sena" exists
    And A Certain Series: "Sena" is a woman
    And Nelim's Pickle Tools: "Sena" body type is Thin
    And A Certain Series: "Sena" has the skin colour "#F5DCC6"
    And A Certain Series: I give "Sena" the hairstyle "ACS_index"
    And A Certain Series: I let the hairstyle of "Sena" show its own colours
    And A Certain Series: I dress "Sena" in "Apparel_Robe,Apparel_Sash" coloured "#F7F3E8,#C9A227"
    Then A Certain Series: "Sena" wears the hairstyle "ACS_index"
    And A Certain Series: "Sena" wears the apparel "Apparel_Robe"
    When Nelim's Pickle Tools: studio presentation mode is enabled
    And Nelim's Sanctuary: the floor of the sanctuary "emerald-clearing" is bared
    And Nelim's Sanctuary: I am at the sanctuary "emerald-clearing"
    And Nelim's Pickle Tools: I lay the floor "WoodPlankFloor" from (194, 149) to (200, 155)
    And Nelim's Pickle Tools: I place the decor "Bookcase" at (199, 152)
    And Nelim's Pickle Tools: I place the decor "TorchLamp" at (195, 152)
    And Nelim's Pickle Tools: the decor "TorchLamp" at (195, 152) is lit
    And I wait 60 ticks
    And Nelim's Pickle Tools: I let 417 ticks pass
    And Nelim's Pickle Tools: "Sena" stands at (197, 152) facing South
    And Nelim's Pickle Tools: an adult animal of kind "Squirrel" named "Noisette" is spawned at (196, 151)
    And Nelim's Pickle Tools: I frame the rectangle from (195, 151) to (198, 153)
    And I take a screenshot "gallery 3 index"
    Then no errors were logged
