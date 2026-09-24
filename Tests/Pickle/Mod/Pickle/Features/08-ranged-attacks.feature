# The original mod's seraph shot never worked: its projectile asked for a C# class from a mod it neither
# shipped nor declared, the def failed to resolve, and the verb dangled with no log line. Tests/Test-Mod.ps1
# proves the projectiles now point at vanilla's explosive class; only a game shows the creature's own verb
# starting, a projectile leaving and every one of them landing.
#
# The game speed is normal on purpose: a projectile at this speed lives a handful of ticks, and the step
# watches every tick, but a slow frame at a fast speed is a tick it cannot see.
@slow @timeout:180
Feature: The creatures' own shots leave and land

  Background:
    Given the save "test-colony" is loaded
    And game speed is normal

  Scenario: the beetle's horn fires its cannon
    Given I spawn a "ACS_DarkMatterBeetle" pawn at (140, 155)
    When A Certain Series: the "ACS_DarkMatterBeetle" fires at (152, 155) and its "ACS_Projectile_Beetle" projectiles are watched
    Then A Certain Series: at least 1 "ACS_Projectile_Beetle" projectiles were seen and none is left in flight
    And no errors were logged

  Scenario: God's Power fires its sweep
    Given I spawn a "ACS_Gabriel" pawn at (140, 155)
    When A Certain Series: the "ACS_Gabriel" fires at (152, 155) and its "ACS_Projectile_Sweep" projectiles are watched
    Then A Certain Series: at least 1 "ACS_Projectile_Sweep" projectiles were seen and none is left in flight
    And no errors were logged
