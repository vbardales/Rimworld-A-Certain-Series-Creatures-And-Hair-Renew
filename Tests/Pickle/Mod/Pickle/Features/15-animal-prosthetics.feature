# Runtime check only, and only with the other mod present: @requires skips the scenario in every pass that
# does not mount it, and skipping is not a pass. It runs in the pass built with wsl-deps.avec-ads2.map.
# Tests/Test-Mod.ps1 owns what a file can prove (the patch text, the guard, the loadBefore). What only the
# game shows is the outcome of the ORDER: the other mod copies its category lists into its surgery recipes
# in its own patch, so this mod's names count only if they were added before that copy.
@requires:SamBucher.ADogSaidAnimalProsthetics2
Feature: The beetle is offered the surgeries of A Dog Said... Animal Prosthetics 2

  Scenario: the beetle gets its category's surgeries and the seraph, left out on purpose, gets none
    Given mod "sambucher.adogsaidanimalprosthetics2" is loaded
    And mod "nelim.acertainseriescreaturesandhairrenew" is loaded
    Then A Certain Series: the "ACS_DarkMatterBeetle" is offered more recipes than the "ACS_Gabriel"
    And no warnings from mod "A Certain Series - Creatures and Hair Renew (unofficial)"
    And no errors were logged
