# The defect that would make the whole chain dead and leave no log line: a new workbench needs its own
# work giver, or no pawn ever walks to it. So a colonist is left alone with the machine and a queued bill,
# and the bill must finish. Two recipes run, the two whose work is short enough to wait for; the others
# (copying dark matter, condensing a volleyball, growing a brain fragment) go through the same work giver.
#
# The machine draws 5000 W. The step that powers it switches the component on rather than wiring a grid,
# because the fixture's own network is not known to reach a given cell: this tests the bench, its bills
# and its work giver, not the power grid.
@slow @timeout:300
Feature: A colonist works the propagator without being told to

  Background:
    Given the save "test-colony" is loaded
    And research "ACS_DarkMatterTech" is finished
    And a "ACS_DarkMatterProduction" is built at (146, 155)
    And A Certain Series: the "ACS_DarkMatterProduction" at (146, 155) is powered
    And a colonist "Operator" exists
    And "Operator" has childhood "ShopKid36"
    And "Operator" has backstory "Blacksmith7"
    And "Operator" skill "Crafting" is set to level 10
    And "Operator" skill "Intellectual" is set to level 12
    Then "Operator" can do "Crafting"
    When I set "Operator" priority "Crafting" to 1

  @timeout:300
  Scenario: a brain fragment becomes dark matter
    Given I spawn a "ACS_KakineTeitokuBrain" at (144, 155)
    When I add bill "ACS_Make_DarkMatterByKakineTeitokuBrain" to the "ACS_DarkMatterProduction" at (146, 155)
    And game speed is ultrafast
    And I wait for bill "ACS_Make_DarkMatterByKakineTeitokuBrain" to finish
    Then a "ACS_DarkMatter" exists
    And no errors were logged

  @timeout:300
  Scenario: a volleyball becomes a beetle egg
    Given I spawn a "ACS_Volleyball" at (144, 155)
    When I add bill "ACS_Make_EggBeetle" to the "ACS_DarkMatterProduction" at (146, 155)
    And game speed is ultrafast
    And I wait for bill "ACS_Make_EggBeetle" to finish
    Then a "ACS_EggBeetle" exists
    And no errors were logged
