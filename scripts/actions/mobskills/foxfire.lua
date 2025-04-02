-----------------------------------
--  Foxfire
--
--  Description: Damage varies with TP. Additional effect: "Stun."
--  Type: Physical (Blunt)
-- RDM, THF, PLD, BST, BRD, RNG, NIN, and COR fomors).
-----------------------------------
---@type TMobSkill
local mobskillObject = {}

local validJobs = set{
    invaderXim.job.RDM,
    invaderXim.job.THF,
    invaderXim.job.PLD,
    invaderXim.job.BST,
    invaderXim.job.RNG,
    invaderXim.job.BRD,
    invaderXim.job.NIN,
    invaderXim.job.COR,
}

mobskillObject.onMobSkillCheck = function(target, mob, skill)
    if validJobs[mob:getMainJob()] then
        return 0
    end

    return 1
end

mobskillObject.onMobWeaponSkill = function(target, mob, skill)
    local numhits = 1
    local accmod = 1
    local ftp    = 2
    local info = invaderXim.mobskills.mobPhysicalMove(mob, target, skill, numhits, accmod, ftp, invaderXim.mobskills.physicalTpBonus.NO_EFFECT, 0, 0, 0)
    local dmg = invaderXim.mobskills.mobFinalAdjustments(info.dmg, mob, skill, target, invaderXim.attackType.PHYSICAL, invaderXim.damageType.BLUNT, info.hitslanded)

    invaderXim.mobskills.mobPhysicalStatusEffectMove(mob, target, skill, invaderXim.effect.STUN, 1, 0, 16)

    target:takeDamage(dmg, mob, invaderXim.attackType.PHYSICAL, invaderXim.damageType.BLUNT)
    return dmg
end

return mobskillObject
