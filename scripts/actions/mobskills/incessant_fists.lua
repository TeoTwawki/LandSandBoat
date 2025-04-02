-----------------------------------
--  Incessant Fists
--  Description: Delivers a fivefold punching attack to a single target.
--  Type: Physical
--  Utsusemi/Blink absorb: 5 shadows
--  Range: Unknown
-----------------------------------
---@type TMobSkill
local mobskillObject = {}

mobskillObject.onMobSkillCheck = function(target, mob, skill)
    return 0
end

mobskillObject.onMobWeaponSkill = function(target, mob, skill)
    local numhits = 5
    local accmod = 1
    local ftp    = 1.3
    local info = invaderXim.mobskills.mobPhysicalMove(mob, target, skill, numhits, accmod, ftp, invaderXim.mobskills.physicalTpBonus.NO_EFFECT)
    local dmg = invaderXim.mobskills.mobFinalAdjustments(info.dmg, mob, skill, target, invaderXim.attackType.PHYSICAL, invaderXim.damageType.BLUNT, info.hitslanded)

    target:takeDamage(dmg, mob, invaderXim.attackType.PHYSICAL, invaderXim.damageType.BLUNT)
    return dmg
end

return mobskillObject
