# The French twin of 13: the same defs, read in a game started in French. A label that is still English here
# is a translation the game did not apply, whatever the offline inventory says.
@fr-only
Feature: French text reaches the loaded definitions

  Scenario: the labels a player reads
    Then def "ACS_DarkMatterProduction" field "label" is "multiplicateur de matière noire"
    And def "ACS_KakineTeitokuBrain" field "label" is "fragment du cerveau de Kakine Teitoku"
    And def "ACS_EggBeetle" field "label" is "œuf de scarabée rhinocéros"
    And def "ACS_DarkMatter" field "label" is "matière noire"
    And def "ACS_HeavenCloth" field "label" is "étoffe céleste"
    And def "ACS_AngelCore" field "label" is "noyau angélique"
    And def "ACS_DarkMatterBeetle" field "label" is "scarabée rhinocéros blanc"
    And def "ACS_Gabriel" field "label" is "Puissance de Dieu"
    And def "ACS_DarkMatterTech" field "label" is "multiplication de matière noire"
    And def "ACS_Make_EggBeetle" field "label" is "cultiver un œuf de scarabée rhinocéros"

  Scenario: what the game says while a colonist works at the propagator
    Then def "ACS_Make_DarkMatter" field "jobString" is "Duplique de la matière noire."
    And def "ACS_Make_KakineTeitokuBrain" field "jobString" is "Cultive un fragment de cerveau."
    And def "ACS_Make_DarkMatterByKakineTeitokuBrain" field "jobString" is "Produit de la matière noire."
    And def "ACS_Make_Volleyball" field "jobString" is "Condense de la matière noire."
    And def "ACS_Make_EggBeetle" field "jobString" is "Cultive un œuf de scarabée."
    And def "ACS_DoBillsUseDarkMatterProduction" field "verb" is "fabriquer"
    And def "ACS_DoBillsUseDarkMatterProduction" field "gerund" is "fabrication sur"
