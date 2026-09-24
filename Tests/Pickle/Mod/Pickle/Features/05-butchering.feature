# What a butchered creature yields is computed by the game from the race, its size and the butcher's
# skill, so it cannot be read off the XML: meat amount, leather amount and the body part a pawn kind
# gives all meet in Pawn.ButcherProducts. Nothing is spawned; the creature is generated and discarded.
Feature: Butchering the creatures yields what the mod says

  Background:
    Given the save "test-colony" is loaded
    And a colonist "Butcher" exists

  Scenario: the beetle leaves dark matter and no meat at all
    Then A Certain Series: butchering a "ACS_DarkMatterBeetle" by "Butcher" yields "ACS_DarkMatter" and no meat

  Scenario: God's Power leaves heavenly cloth and an angel core, and no meat
    Then A Certain Series: butchering a "ACS_Gabriel" by "Butcher" yields "ACS_HeavenCloth" and "ACS_AngelCore" and no meat
