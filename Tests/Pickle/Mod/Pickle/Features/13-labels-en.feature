# What the player reads, on the loaded defs, in the language of the pass. Tests/Test-Translations.ps1 proves
# every owned text has a French entry and Check-DefInjected that every key resolves against the 1.6 types.
# Neither proves the game APPLIED them: a language folder whose name differs in case from the one the game
# looks for is silent on Linux and on the Steam Deck, and shows the English text in a French game.
@en-only
Feature: English text reaches the loaded definitions

  Scenario: the labels a player reads
    Then def "ACS_DarkMatterProduction" field "label" is "dark matter propagator"
    And def "ACS_KakineTeitokuBrain" field "label" is "Kakine Teitoku's brain fragment"
    And def "ACS_EggBeetle" field "label" is "rhinoceros beetle egg"
    And def "ACS_DarkMatter" field "label" is "dark matter"
    And def "ACS_HeavenCloth" field "label" is "heavenly cloth"
    And def "ACS_AngelCore" field "label" is "angel core"
    And def "ACS_DarkMatterBeetle" field "label" is "white rhinoceros beetle"
    And def "ACS_Gabriel" field "label" is "God's Power"
    And def "ACS_DarkMatterTech" field "label" is "dark matter propagation"
    And def "ACS_Make_EggBeetle" field "label" is "grow a rhinoceros beetle egg"

  Scenario: what the game says while a colonist works at the propagator
    Then def "ACS_Make_DarkMatter" field "jobString" is "Copying dark matter."
    And def "ACS_Make_KakineTeitokuBrain" field "jobString" is "Growing a brain fragment."
    And def "ACS_Make_DarkMatterByKakineTeitokuBrain" field "jobString" is "Producing dark matter."
    And def "ACS_Make_Volleyball" field "jobString" is "Condensing dark matter."
    And def "ACS_Make_EggBeetle" field "jobString" is "Growing a beetle egg."
    And def "ACS_DoBillsUseDarkMatterProduction" field "verb" is "craft"
    And def "ACS_DoBillsUseDarkMatterProduction" field "gerund" is "crafting at"
