-----------------------------------
-- Water Meeble Warble
-- AOE Water Elemental damage, inflicts Poison and Drown (50 HP/tick).
-----------------------------------
---@type TMobSkill
local mobskillObject = {}

mobskillObject.onMobSkillCheck = function(target, mob, skill)
    return 0
end

mobskillObject.onMobWeaponSkill = function(target, mob, skill)
    local damage = mob:getWeaponDmg() * 9

    damage = invaderXim.mobskills.mobMagicalMove(mob, target, skill, damage, invaderXim.element.WATER, 2, invaderXim.mobskills.magicalTpBonus.NO_EFFECT, 1)
    damage = invaderXim.mobskills.mobFinalAdjustments(damage, mob, skill, target, invaderXim.attackType.MAGICAL, invaderXim.damageType.WATER, invaderXim.mobskills.shadowBehavior.WIPE_SHADOWS)

    target:takeDamage(damage, mob, invaderXim.attackType.MAGICAL, invaderXim.damageType.WATER)
    invaderXim.mobskills.mobStatusEffectMove(mob, target, invaderXim.effect.DROWN, 50, 3, 60)
    invaderXim.mobskills.mobStatusEffectMove(mob, target, invaderXim.effect.POISON, 50, 3, 60)

    return damage
end

return mobskillObject
