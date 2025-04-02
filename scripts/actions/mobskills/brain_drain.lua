-----------------------------------
-- Brain Drain
-- Deals damage to a single target. Additional effect: INT Down
-----------------------------------
---@type TMobSkill
local mobskillObject = {}

mobskillObject.onMobSkillCheck = function(target, mob, skill)
    return 0
end

mobskillObject.onMobWeaponSkill = function(target, mob, skill)
    local numhits = 1
    local accmod = 1
    local ftp    = 2
    local info = invaderXim.mobskills.mobPhysicalMove(mob, target, skill, numhits, accmod, ftp, invaderXim.mobskills.physicalTpBonus.NO_EFFECT)
    local dmg = invaderXim.mobskills.mobFinalAdjustments(info.dmg, mob, skill, target, invaderXim.attackType.MAGICAL, invaderXim.damageType.DARK, info.hitslanded)

    invaderXim.mobskills.mobPhysicalStatusEffectMove(mob, target, skill, invaderXim.effect.INT_DOWN, 10, 3, 120)

    target:takeDamage(dmg, mob, invaderXim.attackType.MAGICAL, invaderXim.damageType.DARK)

    return dmg
end

return mobskillObject
