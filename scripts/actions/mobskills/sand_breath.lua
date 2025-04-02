-----------------------------------
-- Sand Breath
-- Deals Earth damage to enemies within a fan-shaped area. Additional effect: Blind
-----------------------------------
---@type TMobSkill
local mobskillObject = {}

mobskillObject.onMobSkillCheck = function(target, mob, skill)
    return 0
end

mobskillObject.onMobWeaponSkill = function(target, mob, skill)
    invaderXim.mobskills.mobStatusEffectMove(mob, target, invaderXim.effect.BLINDNESS, 20, 0, 180)

    local dmgmod = invaderXim.mobskills.mobBreathMove(mob, target, skill, 0.2, 0.75, invaderXim.element.EARTH, 800)

    local dmg = invaderXim.mobskills.mobFinalAdjustments(dmgmod, mob, skill, target, invaderXim.attackType.BREATH, invaderXim.damageType.EARTH, invaderXim.mobskills.shadowBehavior.IGNORE_SHADOWS)
    target:takeDamage(dmg, mob, invaderXim.attackType.BREATH, invaderXim.damageType.EARTH)
    return dmg
end

return mobskillObject
