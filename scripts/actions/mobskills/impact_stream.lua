-----------------------------------
--  Impact Stream
--  Description: 50% Defense Down, Stun
--  Type: Magical
--  Wipe Shadows
--  Range: 10.0' AoE
-----------------------------------
---@type TMobSkill
local mobskillObject = {}

mobskillObject.onMobSkillCheck = function(target, mob, skill)
    return 0
end

mobskillObject.onMobWeaponSkill = function(target, mob, skill)
    local damage = math.floor(mob:getWeaponDmg() * 2.5)

    damage = invaderXim.mobskills.mobMagicalMove(mob, target, skill, damage, invaderXim.element.LIGHT, 1, 0, 1)
    damage = invaderXim.mobskills.mobFinalAdjustments(damage, mob, skill, target, invaderXim.attackType.MAGICAL, invaderXim.damageType.EARTH, invaderXim.mobskills.shadowBehavior.WIPE_SHADOWS)

    target:takeDamage(damage, mob, invaderXim.attackType.MAGICAL, invaderXim.damageType.EARTH)
    invaderXim.mobskills.mobStatusEffectMove(mob, target, invaderXim.effect.STUN, 1, 0, 4)
    invaderXim.mobskills.mobStatusEffectMove(mob, target, invaderXim.effect.DEFENSE_DOWN, 50, 0, 60)

    return damage
end

return mobskillObject
