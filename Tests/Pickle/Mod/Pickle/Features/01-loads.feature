# Runtime checks only. Tests/Test-Mod.ps1 owns the XML contracts and Tests/Test-Translations.ps1 the
# translation inventory. What only a running game shows is that the game's own loader kept every
# principal def: in 1.6 a def whose Class= does not resolve is lost whole, and nothing offline replays that.
Feature: A Certain Series loads in the minimal set

  Scenario: the mod and its principal content load without an error
    Then mod "nelim.acertainseriescreaturesandhairrenew" is loaded
    And def "ACS_DarkMatterBeetle" of type "PawnKindDef" exists
    And def "ACS_Gabriel" of type "PawnKindDef" exists
    And def "ACS_DarkMatterProduction" of type "ThingDef" exists
    And def "ACS_EggBeetle" of type "ThingDef" exists
    And def "ACS_KakineTeitokuBrain" of type "ThingDef" exists
    And def "ACS_DarkMatterTech" of type "ResearchProjectDef" exists
    And def "ACS_Make_EggBeetle" of type "RecipeDef" exists
    And def "ACS_DoBillsUseDarkMatterProduction" of type "WorkGiverDef" exists
    And def "ACS_Accelerator" of type "HairDef" exists
    And no warnings from mod "A Certain Series - Creatures and Hair Renew (unofficial)"
    And no errors were logged
