-----------------------------------
-- Stellar Arrow (AOE)
-- Trust: Semih Lafihna
-- Darkness/Gravitation skillchain properties, AoE damage
-----------------------------------
---@type TMobSkill
local mobskillObject = {}

mobskillObject.onMobSkillCheck = function(target, mob, skill)
    return 0
end

mobskillObject.onMobWeaponSkill = function(target, mob, skill)
    local numhits = 1
    local accmod = 1
    local ftp    = 2
    local info = invaderXim.mobskills.mobPhysicalMove(mob, target, skill, numhits, accmod, ftp, invaderXim.mobskills.physicalTpBonus.NO_EFFECT)
    local dmg = invaderXim.mobskills.mobFinalAdjustments(info.dmg, mob, skill, target, invaderXim.attackType.RANGED, invaderXim.damageType.PIERCING, invaderXim.mobskills.shadowBehavior.WIPE_SHADOWS)
    target:takeDamage(dmg, mob, invaderXim.attackType.RANGED, invaderXim.damageType.PIERCING)
    return dmg
end

return mobskillObject
