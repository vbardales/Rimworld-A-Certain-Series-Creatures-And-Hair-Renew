# Whether a hairstyle is generated for a pawn, and offered at the styling station, follows its gender and
# tags, which Tests/Test-Mod.ps1 asserts. What only a game shows is that a hairstyle's textures resolve and
# draw on a pawn's head: a missing texture is a pink square, and at most a logged error. Three of the forty-one
# are enough to prove the path (the textures share one folder and one naming rule); the offline suite checks
# that all forty-one files exist.
@review @en-only
Feature: Hairstyles from the series draw on colonists

  Background:
    Given the save "test-colony" is loaded

  Scenario: three of the forty-one hairstyles render, each on its own colonist
    Given a colonist "Rina" exists
    And a colonist "Toma" exists
    And a colonist "Sena" exists
    When A Certain Series: I give "Rina" the hairstyle "ACS_misaka"
    And A Certain Series: I give "Toma" the hairstyle "ACS_Accelerator"
    And A Certain Series: I give "Sena" the hairstyle "ACS_index"
    Then A Certain Series: "Rina" wears the hairstyle "ACS_misaka"
    And A Certain Series: "Toma" wears the hairstyle "ACS_Accelerator"
    And A Certain Series: "Sena" wears the hairstyle "ACS_index"
    When I zoom all the way in
    And I follow "Rina"
    And I wait 10 ticks
    And I take a screenshot "hairstyle misaka"
    And I follow "Toma"
    And I wait 10 ticks
    And I take a screenshot "hairstyle accelerator"
    And I follow "Sena"
    And I wait 10 ticks
    And I take a screenshot "hairstyle index"
    And I stop following
    Then no errors were logged
