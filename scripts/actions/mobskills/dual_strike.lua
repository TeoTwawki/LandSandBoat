-----------------------------------
-- Dual Strike
--
-- Family: Xzomit
-- Type: Physical
-- Can be dispelled: N/A
-- Utsusemi/Blink absorb: 2 shadows
-- Range: Melee
-- Notes: Double attacks a single target. Additional effect: Stun
-----------------------------------
---@type TMobSkill
local mobskillObject = {}

mobskillObject.onMobSkillCheck = function(target, mob, skill)
    return 0
end

mobskillObject.onMobWeaponSkill = function(target, mob, skill)
    local numhits = 2
    local accmod = 1
    local ftp    = 1.5
    local info = invaderXim.mobskills.mobPhysicalMove(mob, target, skill, numhits, accmod, ftp, invaderXim.mobskills.physicalTpBonus.NO_EFFECT)
    local dmg = invaderXim.mobskills.mobFinalAdjustments(info.dmg, mob, skill, target, invaderXim.attackType.PHYSICAL, invaderXim.damageType.NONE, info.hitslanded)
    target:takeDamage(dmg, mob, invaderXim.attackType.PHYSICAL, invaderXim.damageType.NONE)

    invaderXim.mobskills.mobPhysicalStatusEffectMove(mob, target, skill, invaderXim.effect.STUN, 1, 0, 4)

    return dmg
end

return mobskillObject
