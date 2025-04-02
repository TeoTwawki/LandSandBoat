-----------------------------------
--  Plague Breath
--  Description: Deals water damage to enemies within a fan-shaped area originating from the caster. Additional effect: Poison.
--  Type: Magical Water (Element)
-----------------------------------
---@type TMobSkill
local mobskillObject = {}

mobskillObject.onMobSkillCheck = function(target, mob, skill)
    return 0
end

mobskillObject.onMobWeaponSkill = function(target, mob, skill)
    local power = mob:getMainLvl() / 4 + 1

    invaderXim.mobskills.mobStatusEffectMove(mob, target, invaderXim.effect.POISON, power, 3, 60)

    local dmgmod = invaderXim.mobskills.mobBreathMove(mob, target, skill, 0.1, 2, invaderXim.element.WATER, 250)

    local dmg = invaderXim.mobskills.mobFinalAdjustments(dmgmod, mob, skill, target, invaderXim.attackType.BREATH, invaderXim.damageType.WATER, invaderXim.mobskills.shadowBehavior.IGNORE_SHADOWS)
    target:takeDamage(dmg, mob, invaderXim.attackType.BREATH, invaderXim.damageType.WATER)
    return dmg
end

return mobskillObject
