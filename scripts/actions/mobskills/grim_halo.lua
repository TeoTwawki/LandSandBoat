-----------------------------------
-- Grim Halo
-- Deals damage to a all targets. Additional effect: Knockback
-- Only used by Fomors that wield a two-handed weapon (principally WAR, BLM, DRK, SAM, DRG, and SMN fomors).
-----------------------------------
---@type TMobSkill
local mobskillObject = {}

mobskillObject.onMobSkillCheck = function(target, mob, skill)
    local job = mob:getMainJob()
    if
        job == invaderXim.job.WAR or
        job == invaderXim.job.BLM or
        job == invaderXim.job.DRK or
        job == invaderXim.job.SAM or
        job == invaderXim.job.DRG or
        job == invaderXim.job.SMN
    then
        return 0
    end

    return 1
end

mobskillObject.onMobWeaponSkill = function(target, mob, skill)
    local numhits = 1
    local accmod = 1
    local ftp    = 2.5
    local info = invaderXim.mobskills.mobPhysicalMove(mob, target, skill, numhits, accmod, ftp, invaderXim.mobskills.physicalTpBonus.NO_EFFECT)
    local dmg = invaderXim.mobskills.mobFinalAdjustments(info.dmg, mob, skill, target, invaderXim.attackType.PHYSICAL, invaderXim.damageType.BLUNT, info.hitslanded)
    target:takeDamage(dmg, mob, invaderXim.attackType.PHYSICAL, invaderXim.damageType.BLUNT)
    return dmg
end

return mobskillObject
