-----------------------------------
-- Incensed Pummel
-----------------------------------
---@type TMobSkill
local mobskillObject = {}

mobskillObject.onMobSkillCheck = function(target, mob, skill)
    return 0
end

mobskillObject.onMobWeaponSkill = function(target, mob, skill)
    local numhits = 1
    local accmod = 1
    local ftp    = 2.0
    -- Random stat down
    local typeEffect = 136 + math.random(0, 6) -- 136 is invaderXim.effect.STR_DOWN add 0 to 6 for all 7 of the possible attribute reductions

    local info = invaderXim.mobskills.mobPhysicalMove(mob, target, skill, numhits, accmod, ftp, invaderXim.mobskills.physicalTpBonus.NO_EFFECT)
    local dmg = invaderXim.mobskills.mobFinalAdjustments(info.dmg, mob, skill, target, invaderXim.attackType.PHYSICAL, invaderXim.damageType.SLASHING, invaderXim.mobskills.shadowBehavior.IGNORE_SHADOWS)

    invaderXim.mobskills.mobPhysicalStatusEffectMove(mob, target, skill, typeEffect, 20, 3, 120)

    return dmg
end

return mobskillObject
