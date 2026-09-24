# The French twin of 02. The clean-map capture is not repeated: what a creature looks like does not depend
# on the language. What does is the label each body part carries, which is how the steps find it, and how
# the health tab lays the longer French labels out.
@review @fr-only
Feature: The two creatures, read in French

  Background:
    Given the save "test-colony" is loaded

  Scenario: the beetle's health tab names its front claws, each on its own side
    Given I spawn a "ACS_DarkMatterBeetle" pawn at (146, 155)
    When A Certain Series: the "ACS_DarkMatterBeetle" is given a "Cut" on its "griffe avant gauche"
    And A Certain Series: the "ACS_DarkMatterBeetle" is given a "Bruise" on its "griffe avant droite"
    Then A Certain Series: the "ACS_DarkMatterBeetle" has a "Cut" on its "griffe avant gauche"
    And A Certain Series: the "ACS_DarkMatterBeetle" has no "Cut" on its "griffe avant droite"
    And A Certain Series: the "ACS_DarkMatterBeetle" has a "Bruise" on its "griffe avant droite"
    And A Certain Series: the "ACS_DarkMatterBeetle" has no "Bruise" on its "griffe avant gauche"
    When A Certain Series: I select the "ACS_DarkMatterBeetle"
    And Nelim's Pickle Tools: I open the "Health" inspect tab
    Then Nelim's Pickle Tools: the "Health" inspect tab is open
    When I take a screenshot "beetle front claws fr"
    Then no errors were logged

  Scenario: the seraph's health tab tells its eight wings apart, and puts the right leg on the right
    Given I spawn a "ACS_Gabriel" pawn at (146, 155)
    When A Certain Series: the "ACS_Gabriel" is given a "Bruise" on its "première aile"
    And A Certain Series: the "ACS_Gabriel" is given a "Bruise" on its "troisième aile"
    And A Certain Series: the "ACS_Gabriel" is given a "Bruise" on its "cinquième aile"
    And A Certain Series: the "ACS_Gabriel" is given a "Bruise" on its "septième aile"
    And A Certain Series: the "ACS_Gabriel" is given a "Cut" on its "jambe droite"
    Then A Certain Series: the "ACS_Gabriel" has a "Bruise" on its "première aile"
    And A Certain Series: the "ACS_Gabriel" has a "Bruise" on its "troisième aile"
    And A Certain Series: the "ACS_Gabriel" has a "Bruise" on its "cinquième aile"
    And A Certain Series: the "ACS_Gabriel" has a "Bruise" on its "septième aile"
    And A Certain Series: the "ACS_Gabriel" has no "Bruise" on its "deuxième aile"
    And A Certain Series: the "ACS_Gabriel" has no "Bruise" on its "quatrième aile"
    And A Certain Series: the "ACS_Gabriel" has no "Bruise" on its "sixième aile"
    And A Certain Series: the "ACS_Gabriel" has no "Bruise" on its "huitième aile"
    And A Certain Series: the "ACS_Gabriel" has a "Cut" on its "jambe droite"
    And A Certain Series: the "ACS_Gabriel" has no "Cut" on its "jambe gauche"
    When A Certain Series: I select the "ACS_Gabriel"
    And Nelim's Pickle Tools: I open the "Health" inspect tab
    Then Nelim's Pickle Tools: the "Health" inspect tab is open
    When I take a screenshot "seraph wings and right leg fr"
    Then no errors were logged
