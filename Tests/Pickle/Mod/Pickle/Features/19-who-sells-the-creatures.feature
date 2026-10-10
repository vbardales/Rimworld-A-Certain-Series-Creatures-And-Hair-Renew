# The description says the creatures reach a colony only through exotic-goods traders, caravans, or orbital
# traders. Tags are read from the XML offline; which trader kinds of the real game ever hold them is the
# outcome of the generators, so this builds the stock of every loaded trader kind and asks who offered them.
# The kinds allowed are the ones the XML reading names (tradeTagsSell holding AnimalUncommon): the two Core
# exotic traders and, with Royalty, the two Empire ones. A stranger in the answer is a trader the description
# does not name; sampling can miss a seller, never invent one, so the check is one-sided on purpose.
@slow @timeout:300
Feature: Only the traders the description names sell the creatures

  Background:
    Given the save "test-colony" is loaded

  @timeout:300
  Scenario: the beetle is sold by no other trader
    Then A Certain Series: no trader outside "Caravan_Outlander_Exotic,Orbital_Exotic,Base_Empire_Standard,Empire_Caravan_TraderGeneral" offers "ACS_DarkMatterBeetle" in 100 stocks each
    And no errors were logged

  @timeout:300
  Scenario: the seraph is sold by no other trader
    Then A Certain Series: no trader outside "Caravan_Outlander_Exotic,Orbital_Exotic,Base_Empire_Standard,Empire_Caravan_TraderGeneral" offers "ACS_Gabriel" in 100 stocks each
    And no errors were logged
