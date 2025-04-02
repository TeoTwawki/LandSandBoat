-----------------------------------
-- True Strike
--
-- Description: Deals critical damage. Accuracy varies with TP.
-- Type: Physical
-- Utsusemi/Blink absorb: 1 Shadow
-- Range: Melee
-----------------------------------
---@type TMobSkill
local mobskillObject = {}

mobskillObject.onMobSkillCheck = function(target, mob, skill)
    mob:messageBasic(invaderXim.msg.basic.READIES_WS, 0, 166)
    return 0
end

mobskillObject.onMobWeaponSkill = function(target, mob, skill)
    local numhits = 1
    local accmod = 0.6
    local ftp    = 3.0
    local info = invaderXim.mobskills.mobPhysicalMove(mob, target, skill, numhits, accmod, ftp, invaderXim.mobskills.physicalTpBonus.ACC_VARIES, 1.1, 1.2, 1.3)
    local dmg = invaderXim.mobskills.mobFinalAdjustments(info.dmg, mob, skill, target, invaderXim.attackType.PHYSICAL, invaderXim.damageType.BLUNT, info.hitslanded)

    target:takeDamage(dmg, mob, invaderXim.attackType.PHYSICAL, invaderXim.damageType.BLUNT)
    return dmg
end

return mobskillObject
