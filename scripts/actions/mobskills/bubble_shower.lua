-----------------------------------
-- Bubble Shower
-- Deals Water damage in an area of effect. Additional effect: STR Down
-----------------------------------
---@type TMobSkill
local mobskillObject = {}

mobskillObject.onMobSkillCheck = function(target, mob, skill)
    return 0
end

mobskillObject.onMobWeaponSkill = function(target, mob, skill)
    invaderXim.mobskills.mobStatusEffectMove(mob, target, invaderXim.effect.STR_DOWN, 10, 3, 120)

    local dmgmod = invaderXim.mobskills.mobBreathMove(mob, target, skill, 0.15, 5, invaderXim.element.WATER, 200)

    local dmg = invaderXim.mobskills.mobFinalAdjustments(dmgmod, mob, skill, target, invaderXim.attackType.BREATH, invaderXim.damageType.WATER, invaderXim.mobskills.shadowBehavior.IGNORE_SHADOWS)
    target:takeDamage(dmg, mob, invaderXim.attackType.BREATH, invaderXim.damageType.WATER)
    return dmg
end

return mobskillObject
