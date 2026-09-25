# The research window and the machine's bill list are the game acting on the defs: a tab position, a cost
# drawn from a project, a recipe offered by a bench. Tests/Test-Mod.ps1 proves the recipes point at the bench;
# this proves the bench offers them once the research is done.
@requires:nelim.pickletools.research
Feature: The research and the propagator it unlocks

  Background:
    Given the save "test-colony" is loaded

  @review
  Scenario: the research is on the main tab at its combined cost
    When Nelim's Pickle Tools: I open the research tab "Main"
    Then Nelim's Pickle Tools: the research window is on the tab "Main"
    And Nelim's Pickle Tools: the research window lists the project "ACS_DarkMatterTech" costing 18000
    When I take a screenshot "research dark matter propagation"
    And A Certain Series: I scroll the research window to the project "ACS_DarkMatterTech"
    And I wait 10 ticks
    And I take a screenshot "research dark matter propagation in view"
    Then no errors were logged

  Scenario: the propagator offers all five of its bills once the research is done
    Given research "ACS_DarkMatterTech" is finished
    And a "ACS_DarkMatterProduction" is built at (146, 155)
    When I add bill "ACS_Make_DarkMatter" to the "ACS_DarkMatterProduction"
    And I add bill "ACS_Make_KakineTeitokuBrain" to the "ACS_DarkMatterProduction"
    And I add bill "ACS_Make_DarkMatterByKakineTeitokuBrain" to the "ACS_DarkMatterProduction"
    And I add bill "ACS_Make_Volleyball" to the "ACS_DarkMatterProduction"
    And I add bill "ACS_Make_EggBeetle" to the "ACS_DarkMatterProduction"
    Then the "ACS_DarkMatterProduction" has 5 bills
    And no errors were logged
