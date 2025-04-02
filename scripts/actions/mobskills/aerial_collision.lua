-----------------------------------
-- Aerial Collision
-- Description: Cone Attack damage and Defense Down, strips Utsusemi (invaderXim.mobskills.shadowBehavior.WIPE_SHADOWS)
-----------------------------------
---@type TMobSkill
local mobskillObject = {}

mobskillObject.onMobSkillCheck = function(target, mob, skill)
    return 0
end

mobskillObject.onMobWeaponSkill = function(target, mob, skill)
    local numhits = 1
    local accmod  = 1
    local ftp     = 1
    local info    = invaderXim.mobskills.mobPhysicalMove(mob, target, skill, numhits, accmod, ftp, invaderXim.mobskills.physicalTpBonus.NO_EFFECT)
    local dmg     = invaderXim.mobskills.mobFinalAdjustments(info.dmg, mob, skill, target, invaderXim.attackType.PHYSICAL, invaderXim.damageType.NONE, invaderXim.mobskills.shadowBehavior.WIPE_SHADOWS)

    invaderXim.mobskills.mobPhysicalStatusEffectMove(mob, target, skill, invaderXim.effect.DEFENSE_DOWN, 10, 0, 30)
    target:takeDamage(dmg, mob, invaderXim.attackType.PHYSICAL, invaderXim.damageType.NONE)

    return dmg
end

return mobskillObject
