-----------------------------------
-- Aqua Breath
--
-- Description: Deals Water damage to enemies within a fan-shaped area.
-- Type: Breath
-- Utsusemi/Blink absorb: Ignores shadows
-- Range: Unknown cone
-----------------------------------
---@type TMobSkill
local mobskillObject = {}

mobskillObject.onMobSkillCheck = function(target, mob, skill)
    return 0
end

mobskillObject.onMobWeaponSkill = function(target, mob, skill)
    local dmgCap = 500
    local dmgmod = invaderXim.mobskills.mobBreathMove(mob, target, skill, 0.10, 1.5, invaderXim.element.WATER, dmgCap) + 100

    if dmgmod > dmgCap then
        dmgmod = dmgCap
    end

    local dmg    = invaderXim.mobskills.mobFinalAdjustments(dmgmod, mob, skill, target, invaderXim.attackType.BREATH, invaderXim.damageType.WATER, invaderXim.mobskills.shadowBehavior.IGNORE_SHADOWS)

    target:takeDamage(dmg, mob, invaderXim.attackType.BREATH, invaderXim.damageType.WATER)

    return dmg
end

return mobskillObject
