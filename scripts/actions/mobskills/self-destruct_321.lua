-----------------------------------
-- self_destruct_321
-- Weapon skill for Time Bomb (BCNM 50 3, 2, 1...)
-----------------------------------
---@type TMobSkill
local mobskillObject = {}

mobskillObject.onMobSkillCheck = function(target, mob, skill)
    return 0
end

mobskillObject.onMobWeaponSkill = function(target, mob, skill)
    local amount = 9999 * skill:getTotalTargets()
    local dmg = invaderXim.mobskills.mobFinalAdjustments(amount, mob, skill, target, invaderXim.attackType.PHYSICAL, invaderXim.damageType.FIRE, invaderXim.mobskills.shadowBehavior.WIPE_SHADOWS)
    target:takeDamage(dmg, mob, invaderXim.attackType.PHYSICAL, invaderXim.damageType.FIRE)
    return dmg
end

return mobskillObject
