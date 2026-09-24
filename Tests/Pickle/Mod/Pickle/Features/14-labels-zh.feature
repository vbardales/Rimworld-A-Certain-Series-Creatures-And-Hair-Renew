# The mod keeps the original author's Chinese text under Languages/ChineseSimplified (简体中文), and says so in
# its description. The folder name has to match the language the game looks for, character for character:
# a name that differs is silent, and a Chinese game shows English. That is why this is a pass of its own,
# named by its ASCII prefix as the launcher requires (-Language ChineseSimplified), not a line in the French one.
@zh-only
Feature: The original Chinese text reaches the loaded definitions

  Scenario: the labels the original author wrote
    Then def "ACS_DarkMatterProduction" field "label" is "未元物质生产机"
    And def "ACS_KakineTeitokuBrain" field "label" is "垣根帝督的大脑碎块"
    And def "ACS_EggBeetle" field "label" is "独角仙的卵"
    And def "ACS_DarkMatter" field "label" is "未元物质"
    And def "ACS_HeavenCloth" field "label" is "天界之布"
    And A Certain Series: the ThingDef "ACS_AngelCore" is labelled "天使之核"
    And A Certain Series: the ThingDef "ACS_DarkMatterBeetle" is labelled "白色独角仙"
    And A Certain Series: the PawnKindDef "ACS_DarkMatterBeetle" is labelled "白色独角仙"
    And A Certain Series: the ThingDef "ACS_Gabriel" is labelled "神之力"
    And A Certain Series: the PawnKindDef "ACS_Gabriel" is labelled "神之力"
    And def "ACS_DarkMatterTech" field "label" is "未元物质扩展技术"
    And def "ACS_Make_EggBeetle" field "label" is "培育独角仙的卵"
