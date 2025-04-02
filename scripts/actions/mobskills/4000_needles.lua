-----------------------------------
-- 4000 Needles
-- Description: Shoots multiple needles at enemies within range.
-----------------------------------
---@type TMobSkill
local mobskillObject = {}

mobskillObject.onMobSkillCheck = function(target, mob, skill)
    return 0
end

mobskillObject.onMobWeaponSkill = function(target, mob, skill)
    local needles = 4000 / skill:getTotalTargets()
    local dmg     = invaderXim.mobskills.mobFinalAdjustments(needles, mob, skill, target, invaderXim.attackType.PHYSICAL, invaderXim.damageType.LIGHT, invaderXim.mobskills.shadowBehavior.WIPE_SHADOWS)

    target:takeDamage(dmg, mob, invaderXim.attackType.PHYSICAL, invaderXim.damageType.LIGHT)

    return dmg
end

return mobskillObject
