-----------------------------------
-- Terror Touch
-- Additional effect: Weakens attacks. Accuracy varies with TP.
-----------------------------------
---@type TMobSkill
local mobskillObject = {}

mobskillObject.onMobSkillCheck = function(target, mob, skill)
    return 0
end

mobskillObject.onMobWeaponSkill = function(target, mob, skill)
    local numhits = 1
    local accmod = 1
    local ftp    = 1
    local info = invaderXim.mobskills.mobPhysicalMove(mob, target, skill, numhits, accmod, ftp, invaderXim.mobskills.physicalTpBonus.ACC_VARIES, 1, 2, 3)
    local dmg = invaderXim.mobskills.mobFinalAdjustments(info.dmg, mob, skill, target, invaderXim.attackType.PHYSICAL, invaderXim.damageType.BLUNT, info.hitslanded)

    invaderXim.mobskills.mobPhysicalStatusEffectMove(mob, target, skill, invaderXim.effect.ATTACK_DOWN, 75, 0, 30)

    target:takeDamage(dmg, mob, invaderXim.attackType.PHYSICAL, invaderXim.damageType.BLUNT)
    return dmg
end

return mobskillObject
