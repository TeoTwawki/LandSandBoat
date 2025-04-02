-----------------------------------
-- Vortex
-- Creates a vortex that damages targets in an area of effect. Additional effect: Terror
-----------------------------------
---@type TMobSkill
local mobskillObject = {}

mobskillObject.onMobSkillCheck = function(target, mob, skill)
    return 0
end

mobskillObject.onMobWeaponSkill = function(target, mob, skill)
    local numhits = 1
    local accmod = 1
    local ftp    = 1.5 -- fTP and fTP scaling unknown. TODO: capture ftp
    local info = invaderXim.mobskills.mobPhysicalMove(mob, target, skill, numhits, accmod, ftp, invaderXim.mobskills.physicalTpBonus.NO_EFFECT, 0, 0, 0)
    local dmg = invaderXim.mobskills.mobFinalAdjustments(info.dmg, mob, skill, target, invaderXim.attackType.PHYSICAL, invaderXim.damageType.SLASHING, invaderXim.mobskills.shadowBehavior.NUMSHADOWS_3)
    invaderXim.mobskills.mobPhysicalStatusEffectMove(mob, target, skill, invaderXim.effect.TERROR, 1, 0, 9)
    invaderXim.mobskills.mobPhysicalStatusEffectMove(mob, target, skill, invaderXim.effect.BIND, 1, 0, 30)
    target:takeDamage(dmg, mob, invaderXim.attackType.PHYSICAL, invaderXim.damageType.SLASHING)

    if not target:isTrust() then
        mob:resetEnmity(target)
    end

    return dmg
end

return mobskillObject
