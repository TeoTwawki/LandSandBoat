-----------------------------------
-- Arching Arrow
-- Trust: Semih Lafihna
-- Delivers a single-hit attack. Chance of critical varies with TP.
-- Modifiers: STR:20%; AGI:50%
-- Darkness/Gravitation skillchain properties, AoE damage
-----------------------------------
---@type TMobSkill
local mobskillObject = {}

mobskillObject.onMobSkillCheck = function(target, mob, skill)
    return 0
end

mobskillObject.onMobWeaponSkill = function(target, mob, skill)
    local numhits = 1
    local accmod  = 1
    local ftp     = 3.5
    local info    = invaderXim.mobskills.mobPhysicalMove(mob, target, skill, numhits, accmod, ftp, invaderXim.mobskills.physicalTpBonus.NO_EFFECT)
    local dmg     = invaderXim.mobskills.mobFinalAdjustments(info.dmg, mob, skill, target, invaderXim.attackType.RANGED, invaderXim.damageType.PIERCING, invaderXim.mobskills.shadowBehavior.NUMSHADOWS_1)

    target:takeDamage(dmg, mob, invaderXim.attackType.RANGED, invaderXim.damageType.PIERCING)

    return dmg
end

return mobskillObject
