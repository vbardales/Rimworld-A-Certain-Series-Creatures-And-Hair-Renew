# The definitions as the game loaded them: after inheritance, and with each stat computed by the game's
# own stat worker. Tests/Test-Mod.ps1 reads the XML text and does not replay inheritance, so a value
# an abstract parent overrides would pass there and be wrong here. No save is needed, so this is fast.
Feature: The loaded definitions agree with what the mod promises

  Scenario: the white rhinoceros beetle is a fast, tame-by-nature pack animal that never eats
    Then def "ACS_DarkMatterBeetle" stat "MoveSpeed" is 20
    And def "ACS_DarkMatterBeetle" stat "Wildness" is 0
    And def "ACS_DarkMatterBeetle" stat "MeatAmount" is 0
    And def "ACS_DarkMatterBeetle" stat "ComfyTemperatureMin" is -500
    And def "ACS_DarkMatterBeetle" stat "ComfyTemperatureMax" is 500
    And A Certain Series: the race "ACS_DarkMatterBeetle" never gets hungry
    And A Certain Series: the race "ACS_DarkMatterBeetle" is a pack animal
    And A Certain Series: the race "ACS_DarkMatterBeetle" can be trained up to "Advanced"

  Scenario: God's Power cannot be tamed and is faster than the beetle
    Then def "ACS_Gabriel" stat "Wildness" is 1
    And def "ACS_Gabriel" stat "MoveSpeed" is 80
    And def "ACS_Gabriel" stat "MeatAmount" is 0
    And A Certain Series: the race "ACS_Gabriel" never gets hungry

  Scenario: dark matter, as a material, does not burn, barely wears and holds ten times the hit points
    Then A Certain Series: the material "ACS_DarkMatter" multiplies "Flammability" by 0
    And A Certain Series: the material "ACS_DarkMatter" multiplies "DeteriorationRate" by 0.1
    And A Certain Series: the material "ACS_DarkMatter" multiplies "MaxHitPoints" by 10
    And def "ACS_DarkMatter" stat "SharpDamageMultiplier" is 5
    And def "ACS_DarkMatter" stat "StuffPower_Armor_Sharp" is 5

  Scenario: the propagator costs one brain fragment, and the research that opens it costs eighteen thousand
    Then def "ACS_DarkMatterProduction" costs 1 "ACS_KakineTeitokuBrain"
    And def "ACS_DarkMatterProduction" costs 100 "Plasteel"
    And def "ACS_DarkMatterProduction" costs 50 "ComponentSpacer"
    And def "ACS_DarkMatterTech" field "baseCost" is "18000"
