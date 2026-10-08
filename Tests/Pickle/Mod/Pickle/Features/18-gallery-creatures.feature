# Pictures for the Workshop gallery, not a test: the creatures and the propagator, images 4 to 6 of the series "Noon at the
# Sanctuary" (images 1 to 3 are the hairstyle portraits, feature 17), on the podium of Nelim's Sanctuary (the owner's save
# "Nelim's tribe", loaded as "Nelims-tribe", PickleTools docs/GALERIE.md, SANCTUAIRE-LIEUX.md and SANCTUAIRE-CASES.md),
# without the interface. What a scenario asserts is only that the thing exists; the pictures are read by eye (@review).
#
# The story continues the portraits (owner's rules of 2026-10-02/06, PUBLISHING.md): the same noon, the clock started at
# 12:00 in each scenario and the picture taken 5 minutes of game time (about 208 ticks) later than the previous one, after
# 60 ticks of set-up. The podium is the square A of the Sanctuary (x 191-204, z 146-159), its painted green zone bared, ringed
# by flowers, with the permanent vanometric power cell of the fixture on its east edge (205, 152-153).
#
# Shooting plan, one line per picture (place, moment, subject, composition, what lives there, what it says):
#   4. emerald-clearing, 12:15+, the white rhinoceros beetle, wide enough for its six legs, a torch on its left and a stool
#      on its right on a small wooden floor, a hen at its feet: the pack animal arrives, calm, in daylight.
#   5. emerald-clearing, 12:20+, the seraph (God's Power), framed high enough for the eight wings, a torch lamp on each
#      side, a peacock that walks into the frame: the angel at noon, a bird that does not fear it.
#   6. emerald-clearing, 12:25+, the dark matter propagator against the power cells, a bookcase behind, a torch, a cat on
#      the wooden floor: the workshop of the series, switched on (the lightning icon is gone only when the network is
#      refreshed and the building has its 5 000 W: six cells, 6 000 W).
#   7. emerald-clearing, 12:30+, the same propagator seen from farther, WITHOUT its power cells and without the network
#      refresh: the lightning icon (no power) is the point of the picture, it names the building's need (owner, 2026-10-08).
# Torch lamps rather than standing lamps (a powered lamp with no power shows the lightning icon on the picture) and no
# empty plant pot (it reads as a bucket). Diurnal animals only, the clock being at noon.
@review @en-only @requires:nelim.pickletools.screenshotstudio @requires:nelim.pickletools.stagedecor
Feature: Gallery pictures of the creatures and the propagator

  Scenario: 4 - the white rhinoceros beetle arrives (the podium, 12:15)
    Given the save "Nelims-tribe" is loaded
    And game speed is paused
    And I set the hour to 12
    And Nelim's Sanctuary: the floor of the sanctuary "emerald-clearing" is bared
    And Nelim's Sanctuary: I am at the sanctuary "emerald-clearing"
    And Nelim's Pickle Tools: the area from (193, 148) to (204, 156) is cleared
    And Nelim's Pickle Tools: I lay the floor "WoodPlankFloor" from (195, 150) to (199, 154)
    When Nelim's Pickle Tools: studio presentation mode is enabled
    And Nelim's Pickle Tools: I place the decor "TorchLamp" at (195, 152)
    And Nelim's Pickle Tools: I place the decor "Stool" at (199, 152)
    And Nelim's Pickle Tools: the decor "TorchLamp" at (195, 152) is lit
    And I wait 60 ticks
    And Nelim's Pickle Tools: I let 625 ticks pass
    And A Certain Series: a "ACS_DarkMatterBeetle" pawn stands at (197, 152)
    And Nelim's Pickle Tools: an adult animal of kind "Chicken" named "Poule" is spawned at (197, 154)
    Then 1 "ACS_DarkMatterBeetle" exist
    When Nelim's Pickle Tools: I frame the rectangle from (195, 151) to (199, 154)
    And I take a screenshot "gallery 4 beetle"
    Then no errors were logged

  Scenario: 5 - the seraph at noon (the podium, 12:20)
    Given the save "Nelims-tribe" is loaded
    And game speed is paused
    And I set the hour to 12
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
    And Nelim's Pickle Tools: I let 833 ticks pass
    And A Certain Series: a "ACS_Gabriel" pawn stands at (197, 152)
    And Nelim's Pickle Tools: an adult animal of kind "Peacock" named "Paon" is spawned at (197, 149)
    Then 1 "ACS_Gabriel" exist
    When Nelim's Pickle Tools: I frame the rectangle from (193, 149) to (199, 155)
    And I take a screenshot "gallery 5 seraph"
    Then no errors were logged

  Scenario: 6 - the dark matter propagator, switched on (the podium, 12:25)
    Given the save "Nelims-tribe" is loaded
    And game speed is paused
    And I set the hour to 12
    And Nelim's Sanctuary: the floor of the sanctuary "emerald-clearing" is bared
    And Nelim's Sanctuary: I am at the sanctuary "emerald-clearing"
    And Nelim's Pickle Tools: the area from (193, 148) to (204, 156) is cleared
    And Nelim's Pickle Tools: I lay the floor "WoodPlankFloor" from (195, 150) to (199, 154)
    When Nelim's Pickle Tools: studio presentation mode is enabled
    And Nelim's Pickle Tools: I lay the floor "WoodPlankFloor" from (199, 150) to (204, 154)
    And Nelim's Pickle Tools: I place the decor "ACS_DarkMatterProduction" at (204, 152)
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
    And Nelim's Pickle Tools: I let 1042 ticks pass
    And Nelim's Pickle Tools: an adult animal of kind "Cat" named "Miso" is spawned at (202, 152)
    When Nelim's Pickle Tools: I frame the rectangle from (202, 150) to (207, 156)
    And I take a screenshot "gallery 6 propagator"
    Then no errors were logged

  Scenario: 7 - the dark matter propagator, without power (the podium, 12:30)
    Given the save "Nelims-tribe" is loaded
    And game speed is paused
    And I set the hour to 12
    And Nelim's Sanctuary: the floor of the sanctuary "emerald-clearing" is bared
    And Nelim's Sanctuary: I am at the sanctuary "emerald-clearing"
    And Nelim's Pickle Tools: the area from (193, 148) to (204, 156) is cleared
    And Nelim's Pickle Tools: I lay the floor "WoodPlankFloor" from (195, 150) to (199, 154)
    When Nelim's Pickle Tools: studio presentation mode is enabled
    And Nelim's Pickle Tools: I lay the floor "WoodPlankFloor" from (199, 150) to (204, 154)
    And Nelim's Pickle Tools: I place the decor "ACS_DarkMatterProduction" at (204, 152)
    And Nelim's Pickle Tools: I place the decor "TorchLamp" at (200, 151)
    And Nelim's Pickle Tools: I place the decor "Bookcase" at (201, 154)
    And Nelim's Pickle Tools: the decor "TorchLamp" at (200, 151) is lit
    And I wait 60 ticks
    And Nelim's Pickle Tools: I let 1250 ticks pass
    And Nelim's Pickle Tools: an adult animal of kind "Cat" named "Miso" is spawned at (202, 152)
    When Nelim's Pickle Tools: I frame the rectangle from (199, 149) to (209, 156)
    And I take a screenshot "gallery 7 propagator unpowered"
    Then no errors were logged
