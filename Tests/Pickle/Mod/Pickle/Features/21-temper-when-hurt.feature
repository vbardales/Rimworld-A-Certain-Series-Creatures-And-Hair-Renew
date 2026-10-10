# "The beetle's aggression" has no pass or fail threshold as a feeling, but two things in it are objective and
# both come from the defs: a wild creature nobody touches does nothing to a colonist beside it, and one that is
# hurt turns on whoever hurt it (manhunterOnDamageChance is 1 on both). What the creature then does with its
# cannon is feature 08; how dangerous that is to a colony is balance, and not asserted.
@slow @timeout:240
Feature: The creatures leave a colonist alone until they are hurt

  Background:
    Given the save "test-colony" is loaded
    And a colonist "Hunter" exists
    And game speed is ultrafast

  @timeout:240
  Scenario: the wild beetle is calm, then turns on the colonist who hurts it
    When A Certain Series: I spawn a "ACS_DarkMatterBeetle" pawn 6 cells east of "Hunter"
    And Nelim's Pickle Tools: I let 600 ticks pass
    Then A Certain Series: the "ACS_DarkMatterBeetle" is in no mental state
    And A Certain Series: the colonist "Hunter" is unhurt
    When A Certain Series: the "ACS_DarkMatterBeetle" is hurt by the colonist "Hunter"
    Then A Certain Series: the "ACS_DarkMatterBeetle" is in a manhunter state
    And no errors were logged

  @timeout:240
  Scenario: the wild seraph is calm, then turns on the colonist who hurts it
    When A Certain Series: I spawn a "ACS_Gabriel" pawn 6 cells east of "Hunter"
    And Nelim's Pickle Tools: I let 600 ticks pass
    Then A Certain Series: the "ACS_Gabriel" is in no mental state
    And A Certain Series: the colonist "Hunter" is unhurt
    When A Certain Series: the "ACS_Gabriel" is hurt by the colonist "Hunter"
    Then A Certain Series: the "ACS_Gabriel" is in a manhunter state
    And no errors were logged
