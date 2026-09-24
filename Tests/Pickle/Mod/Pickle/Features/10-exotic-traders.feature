# The propagator costs one brain fragment, and only a propagator can grow another, so the first one has to
# be bought: a mod whose only source is a trader that never stocks it cannot be played. Trade tags are read
# from the XML offline; whether a trader's stock, built the way the game builds it, ever holds the fragment
# is an outcome of the generator, its exclusions and its random draw. Two hundred stocks a trader make a
# miss all but impossible if the fragment is eligible, and cost nothing: no world, no trade window.
Feature: The first brain fragment can be bought

  Background:
    Given the save "test-colony" is loaded

  Scenario: both Core exotic traders offer it
    Then A Certain Series: 200 stocks of the trader "Caravan_Outlander_Exotic" offer "ACS_KakineTeitokuBrain" at least once
    And A Certain Series: 200 stocks of the trader "Orbital_Exotic" offer "ACS_KakineTeitokuBrain" at least once

  @requires:Royalty
  Scenario: the Empire's trader offers it too
    Then A Certain Series: 200 stocks of the trader "Base_Empire_Standard" offer "ACS_KakineTeitokuBrain" at least once
