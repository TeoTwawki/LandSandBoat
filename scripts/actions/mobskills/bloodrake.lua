-----------------------------------
-- Bloodrake
--
-- Description: Slashes up a single target. Additional effect: Drain
-- Type: Physical
-- Utsusemi/Blink absorb: 1 shadow?
-- Range: Melee
-- Notes: A spell equivalent to Sanguine Blade in terms of functionality where damage dealt is absorbed as health recovered.
-----------------------------------
---@type TMobSkill
local mobskillObject = {}

mobskillObject.onMobSkillCheck = function(target, mob, skill)
    return 0
end

mobskillObject.onMobWeaponSkill = function(target, mob, skill)
    local numhits = 1
    local accmod = 1
    local ftp    = 3.0
    local info = invaderXim.mobskills.mobPhysicalMove(mob, target, skill, numhits, accmod, ftp, invaderXim.mobskills.physicalTpBonus.NO_EFFECT)
    local dmg = invaderXim.mobskills.mobFinalAdjustments(info.dmg, mob, skill, target, invaderXim.attackType.PHYSICAL, invaderXim.damageType.SLASHING, info.hitslanded)

        skill:setMsg(invaderXim.mobskills.mobPhysicalDrainMove(mob, target, skill, invaderXim.mobskills.drainType.HP, dmg))

    return dmg
end

return mobskillObject
