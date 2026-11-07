# Gallery picture 2 replayed in the validated modded Sanctuary (owner 2026-11-05, NSB redecoration validated place by place: the terrace, a.k.a. the
# veranda, is validated). Same scene as feature 17 scenario 2 (Accelerator on Toma, the terrace, 14:00), loaded from the DecorBase fixture
# "Nelims-tribe-decor-mods" (map wsl-deps.decor.map, container 7g, run ALONE). Not a test: the picture is read by eye (@review). Room x 193-200, z 118-124,
# portrait cell (196, 121) kept free. Feature 17 keeps its own copy on the old save until the redecoration ends.
# Replay 2026-11-06 (owner: "rejoue", then "c'est toi qui vois"). Ticket 9d2c: the Beer hid Nelim's mouth facing East; ticket 5c46: facing South
# it sat right over her mouth. Now she carries nothing: INSTANT: she has just set the Beer down on the stool (197, 122) and Toma, facing East at
# (198, 121), turns his back on it. Nelim faces East, mouth readable. Everything else unchanged.
@review @en-only @requires:nelim.pickletools.screenshotstudio @requires:nelim.pickletools.stagedecor @requires:nelim.pickletools.colonistrace
Feature: Gallery picture 2 in the modded terrace

  Scenario: 2 - Toma keeps to the piano (Accelerator, the terrace, 14:00)
    Given the save "Nelims-tribe-decor-mods" is loaded
    And game speed is paused
    And I set the hour to 14
    And I set the weather to "Clear"
    And Nelim's Pickle Tools: the temperature of the map is 20 degrees
    And Nelim's Pickle Tools: "Nelim" face is held neutral
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
    And Nelim's Pickle Tools: "Nelim" wears "UnderWhere_Bra" dyed rgb (31, 58, 95)
    And Nelim's Pickle Tools: "Nelim" wears "UnderWhere_Panties" dyed rgb (31, 58, 95)
    And Nelim's Pickle Tools: "Nelim" wears "LTS_Tunika" dyed rgb (31, 122, 92)
    And Nelim's Pickle Tools: "Nelim" wears "Apparel_PAESmallEarrings" made of "Gold"
    And Nelim's Pickle Tools: "Toma" stands at (198, 121) facing East
    And Nelim's Pickle Tools: "Nelim" stands at (196, 122) facing East
    And Nelim's Pickle Tools: 1 of the item "Beer" are spawned at (197, 122)
    And Nelim's Pickle Tools: the free standable cells of the area from (193, 118) to (200, 124) are listed
    And Nelim's Pickle Tools: the things within 8 cells of (196, 121) are listed
    And Nelim's Pickle Tools: the things "Campfire" within 1 cells of (194, 121) are hidden
    And Nelim's Pickle Tools: an adult animal of kind "Peacock" named "Paon" is spawned at (197, 120)
    And Nelim's Pickle Tools: the animal "Paon" stands at (197, 120) facing East
    And Nelim's Pickle Tools: I frame the rectangle from (195, 119) to (200, 123)
    And Nelim's Sanctuary: Nelim has her own face
    And Nelim's Pickle Tools: "Nelim" facial expression "normal" is held
    And Nelim's Pickle Tools: the thermal state and thoughts of "Nelim" are logged
    And Nelim's Pickle Tools: the thermal state and thoughts of "Toma" are logged
    And I take a screenshot "gallery 2 accelerator decor"
    And Nelim's Pickle Tools: the decor is removed
    Then no errors were logged

