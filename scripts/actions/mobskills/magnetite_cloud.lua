-----------------------------------
-- Magnetite Cloud
-- Deals earth damage to enemies within a fan-shaped area originating from the caster. Additional effect: Weight.
-----------------------------------
---@type TMobSkill
local mobskillObject = {}

mobskillObject.onMobSkillCheck = function(target, mob, skill)
    return 0
end

mobskillObject.onMobWeaponSkill = function(target, mob, skill)
    invaderXim.mobskills.mobStatusEffectMove(mob, target, invaderXim.effect.WEIGHT, 50, 0, 120)

    local dmgmod = invaderXim.mobskills.mobBreathMove(mob, target, skill, 0.167, 1.875, invaderXim.element.EARTH, 509)

    local dmg = invaderXim.mobskills.mobFinalAdjustments(dmgmod, mob, skill, target, invaderXim.attackType.BREATH, invaderXim.damageType.EARTH, invaderXim.mobskills.shadowBehavior.WIPE_SHADOWS)
    target:takeDamage(dmg, mob, invaderXim.attackType.BREATH, invaderXim.damageType.EARTH)
    return dmg
end

return mobskillObject
