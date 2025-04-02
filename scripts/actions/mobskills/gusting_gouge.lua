-----------------------------------
--  Gusting Gouge
--  Description: Deals Wind damage in a threefold attack to targets in a fan-shaped area of effect.
--  Type: Physical?
--  Utsusemi/Blink absorb: 3 shadows
--  Notes: Used only by Lamia equipped with a one-handed weapon. If they lost their weapon, they'll use Hysteric Barrage instead.
-----------------------------------
---@type TMobSkill
local mobskillObject = {}

mobskillObject.onMobSkillCheck = function(target, mob, skill)
    if
        mob:getAnimationSub() ~= 1 and
        (
            mob:getMainJob() == invaderXim.job.COR or
            mob:getMainJob() == invaderXim.job.BRD or
            mob:getMainJob() == invaderXim.job.RDM
        )
    then
        return 0
    else
        return 1
    end
end

mobskillObject.onMobWeaponSkill = function(target, mob, skill)
    local numhits = 3
    local accmod = 1
    local ftp    = 1
    local info = invaderXim.mobskills.mobPhysicalMove(mob, target, skill, numhits, accmod, ftp, invaderXim.mobskills.physicalTpBonus.NO_EFFECT)
    local dmg = invaderXim.mobskills.mobFinalAdjustments(info.dmg, mob, skill, target, invaderXim.attackType.PHYSICAL, invaderXim.damageType.PIERCING, info.hitslanded)
    target:takeDamage(dmg, mob, invaderXim.attackType.PHYSICAL, invaderXim.damageType.BLUNT)
    return dmg
end

return mobskillObject
