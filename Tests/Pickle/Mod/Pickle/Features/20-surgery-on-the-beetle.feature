# The beetle is in the category 3 of A Dog Said... Animal Prosthetics 2. Those surgeries name vanilla body
# parts, so only the beetle's vanilla parts (Eye, Antenna) can be concerned. Feature 15 shows the beetle is
# offered more recipes than the seraph; this one names the recipes and asks the game to find a part to operate
# on, which is what "the beetle's eyes and antennae can get the surgeries" promises.
@requires:SamBucher.ADogSaidAnimalProsthetics2
Feature: The beetle's eyes and antennae can get the surgeries

  Background:
    Given the save "test-colony" is loaded
    And mod "sambucher.adogsaidanimalprosthetics2" is loaded

  Scenario: the beetle is offered the eye and the ear recipes and the game finds the part
    Then A Certain Series: the recipe "InstallBionicEyeAnimal" can be applied on a "Eye" of a "ACS_DarkMatterBeetle"
    And A Certain Series: the recipe "InstallBionicEarAnimal" can be applied on a "Antenna" of a "ACS_DarkMatterBeetle"
    And A Certain Series: the recipe "InstallCochlearImplantAnimal" can be applied on a "Antenna" of a "ACS_DarkMatterBeetle"
    And no errors were logged

  Scenario: the seraph, left out on purpose, is offered none of them
    Then A Certain Series: the race "ACS_Gabriel" is not offered the recipe "InstallBionicEyeAnimal"
    And A Certain Series: the race "ACS_Gabriel" is not offered the recipe "InstallBionicEarAnimal"
    And A Certain Series: the race "ACS_Gabriel" is not offered the recipe "InstallCochlearImplantAnimal"
    And no errors were logged
