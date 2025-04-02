-----------------------------------
-- Erratic Flutter
--
-- Description: Deals Fire damage around the caster. Grants the effect of Haste.
-- Family: Wamoura
-- Monipulators: Wamoura (MON), Coral Wamoura (MON)
-- Level (Monstrosity): 60
-- TP Cost (Monstrosity): 1500 TP
-- Type: Enhancing
-- Element: Fire
-- Can be dispelled: Yes
-- Notes:
-- Blue magic version is 307/1024 haste for 5 minutes. Wamaora haste is presumed identical.
-- Wamoura version also deals Fire damage to targets around the wamoura.
-- While it does not overwrite most forms of Slowga, Slow II, Slow II TP moves,
-- Erratic Flutter does overwrite Hojo: Ni, Hojo: Ichi, and Slow.
-- Player Blue magic version is wind element instead of fire.
-----------------------------------
---@type TMobSkill
local mobskillObject = {}

mobskillObject.onMobSkillCheck = function(target, mob, skill)
    return 0
end

mobskillObject.onMobWeaponSkill = function(target, mob, skill)
    local damage = mob:getWeaponDmg() * 2.75

    damage = invaderXim.mobskills.mobMagicalMove(mob, target, skill, damage, invaderXim.element.FIRE, 1, invaderXim.mobskills.magicalTpBonus.NO_EFFECT)
    damage = invaderXim.mobskills.mobFinalAdjustments(damage , mob, skill, target, invaderXim.attackType.MAGICAL, invaderXim.damageType.FIRE, invaderXim.mobskills.shadowBehavior.IGNORE_SHADOWS)

    target:takeDamage(damage, mob, invaderXim.attackType.MAGICAL, invaderXim.damageType.FIRE)
    invaderXim.mobskills.mobBuffMove(mob, invaderXim.effect.HASTE, 4500, 0, 180) -- There is no message for the self buff aspect, only dmg.

    return damage
end

return mobskillObject
