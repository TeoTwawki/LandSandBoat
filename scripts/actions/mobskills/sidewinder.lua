-----------------------------------
-- Sidewinder
-- Trust: Semih Lafihna
-- Delivers an inaccurate attack that deals quintuple damage. Accuracy varies with TP.
-- Reverberation/Transfixtion/Detonation skillchain properties
-- Modifiers: STR:20%; AGI:50%
-----------------------------------
---@type TMobSkill
local mobskillObject = {}

mobskillObject.onMobSkillCheck = function(target, mob, skill)
    return 0
end

mobskillObject.onMobWeaponSkill = function(target, mob, skill)
    local numhits = 1
    local accmod = 1
    local ftp    = 5.0
    local info = invaderXim.mobskills.mobPhysicalMove(mob, target, skill, numhits, accmod, ftp, invaderXim.mobskills.physicalTpBonus.NO_EFFECT)
    local dmg = invaderXim.mobskills.mobFinalAdjustments(info.dmg, mob, skill, target, invaderXim.attackType.RANGED, invaderXim.damageType.PIERCING, invaderXim.mobskills.shadowBehavior.NUMSHADOWS_1)
    target:takeDamage(dmg, mob, invaderXim.attackType.RANGED, invaderXim.damageType.PIERCING)
    return dmg
end

return mobskillObject
