# An egg hatches after one game day, and the description promises it hatches wild: like any egg not laid in
# the colony, it has no faction, and the beetle's wildness stat of zero is what makes taming it certain.
# Taming itself is vanilla arithmetic on that stat, asserted in 02, and is not replayed here.
@slow @timeout:900
Feature: The beetle egg hatches a wild beetle in one game day

  Scenario: an egg not laid in the colony hatches wild
    Given the save "test-colony" is loaded
    And I spawn a "ACS_EggBeetle" at (146, 155)
    And game speed is ultrafast
    When A Certain Series: I wait for the egg at (146, 155) to hatch
    Then 1 "ACS_DarkMatterBeetle" exist
    And A Certain Series: the "ACS_DarkMatterBeetle" has no faction
    And no errors were logged
