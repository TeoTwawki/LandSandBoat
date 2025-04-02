-----------------------------------
-- Seaspray
-- Description: Deals Water damage to targets in a fan-shaped area of effect. Additional effect: Slow
-- Type: Breath
-----------------------------------
---@type TMobSkill
local mobskillObject = {}

mobskillObject.onMobSkillCheck = function(target, mob, skill)
    return 0
end

mobskillObject.onMobWeaponSkill = function(target, mob, skill)
    local duration = invaderXim.mobskills.calculateDuration(skill:getTP(), 30, 60)
    invaderXim.mobskills.mobStatusEffectMove(mob, target, invaderXim.effect.SLOW, 3500, 0, duration)

    local dmgmod = invaderXim.mobskills.mobBreathMove(mob, target, skill, 0.125, 1, invaderXim.element.WATER, 500)
    local dmg = invaderXim.mobskills.mobFinalAdjustments(dmgmod, mob, skill, target, invaderXim.attackType.BREATH, invaderXim.damageType.WATER, invaderXim.mobskills.shadowBehavior.IGNORE_SHADOWS)
    target:takeDamage(dmg, mob, invaderXim.attackType.BREATH, invaderXim.damageType.WATER)

    return dmg
end

return mobskillObject
