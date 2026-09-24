# A reviewer judges only the captures. Each scenario prepares the same clean scene, so nobody has to set up
# a colony or open a developer tool. The assertions state what a capture is about BEFORE it is taken: a
# screenshot step that passes says a file was written, not that the pane shows the right thing.
#
# Body parts are found by the label the player reads, in the language of the pass, and a label shared by
# two parts fails the step. That is the check the original mod would have failed: its eight wings shared
# one label, and its two front claws had swapped sides.
@review @en-only
Feature: The two creatures, read in English

  Background:
    Given the save "test-colony" is loaded

  Scenario: both creatures draw on a clean map
    When I move the camera to (146, 155)
    And I spawn a "ACS_DarkMatterBeetle" pawn at (143, 155)
    And I spawn a "ACS_Gabriel" pawn at (150, 155)
    And I wait 30 ticks
    Then 1 "ACS_DarkMatterBeetle" exist
    And 1 "ACS_Gabriel" exist
    When I take a screenshot "beetle and seraph"
    Then no errors were logged

  Scenario: the beetle's health tab names its front claws, each on its own side
    Given I spawn a "ACS_DarkMatterBeetle" pawn at (146, 155)
    When A Certain Series: the "ACS_DarkMatterBeetle" is given a "Cut" on its "front left claw"
    And A Certain Series: the "ACS_DarkMatterBeetle" is given a "Bruise" on its "front right claw"
    Then A Certain Series: the "ACS_DarkMatterBeetle" has a "Cut" on its "front left claw"
    And A Certain Series: the "ACS_DarkMatterBeetle" has no "Cut" on its "front right claw"
    And A Certain Series: the "ACS_DarkMatterBeetle" has a "Bruise" on its "front right claw"
    And A Certain Series: the "ACS_DarkMatterBeetle" has no "Bruise" on its "front left claw"
    When A Certain Series: I select the "ACS_DarkMatterBeetle"
    And Nelim's Pickle Tools: I open the "Health" inspect tab
    Then Nelim's Pickle Tools: the "Health" inspect tab is open
    When I take a screenshot "beetle front claws en"
    Then no errors were logged

  Scenario: the seraph's health tab tells its eight wings apart, and puts the right leg on the right
    Given I spawn a "ACS_Gabriel" pawn at (146, 155)
    When A Certain Series: the "ACS_Gabriel" is given a "Bruise" on its "first wing"
    And A Certain Series: the "ACS_Gabriel" is given a "Bruise" on its "third wing"
    And A Certain Series: the "ACS_Gabriel" is given a "Bruise" on its "fifth wing"
    And A Certain Series: the "ACS_Gabriel" is given a "Bruise" on its "seventh wing"
    And A Certain Series: the "ACS_Gabriel" is given a "Cut" on its "right leg"
    Then A Certain Series: the "ACS_Gabriel" has a "Bruise" on its "first wing"
    And A Certain Series: the "ACS_Gabriel" has a "Bruise" on its "third wing"
    And A Certain Series: the "ACS_Gabriel" has a "Bruise" on its "fifth wing"
    And A Certain Series: the "ACS_Gabriel" has a "Bruise" on its "seventh wing"
    And A Certain Series: the "ACS_Gabriel" has no "Bruise" on its "second wing"
    And A Certain Series: the "ACS_Gabriel" has no "Bruise" on its "fourth wing"
    And A Certain Series: the "ACS_Gabriel" has no "Bruise" on its "sixth wing"
    And A Certain Series: the "ACS_Gabriel" has no "Bruise" on its "eighth wing"
    And A Certain Series: the "ACS_Gabriel" has a "Cut" on its "right leg"
    And A Certain Series: the "ACS_Gabriel" has no "Cut" on its "left leg"
    When A Certain Series: I select the "ACS_Gabriel"
    And Nelim's Pickle Tools: I open the "Health" inspect tab
    Then Nelim's Pickle Tools: the "Health" inspect tab is open
    When I take a screenshot "seraph wings and right leg en"
    Then no errors were logged
