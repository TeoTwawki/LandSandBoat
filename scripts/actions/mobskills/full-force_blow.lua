-----------------------------------
-- Full-Force Blow
-- Deals damage to a single target. Additional effect: Knockback.
-- 0% TP: ??? / 150% TP: ??? / 300% TP: ???
-----------------------------------
---@type TMobSkill
local mobskillObject = {}

mobskillObject.onMobSkillCheck = function(target, mob, skill)
    return 0
end

mobskillObject.onMobWeaponSkill = function(target, mob, skill)
    -- Add Knockback Animation
    local numhits = 1
    local accmod = 1
    local ftp    = 2
    local info = invaderXim.mobskills.mobPhysicalMove(mob, target, skill, numhits, accmod, ftp, invaderXim.mobskills.physicalTpBonus.ATK_VARIES, 1.5, 1.5, 1.5)
    local dmg = invaderXim.mobskills.mobFinalAdjustments(info.dmg, mob, skill, target, invaderXim.attackType.PHYSICAL, invaderXim.damageType.SLASHING, info.hitslanded)
    target:takeDamage(dmg, mob, invaderXim.attackType.PHYSICAL, invaderXim.damageType.SLASHING)
    return dmg
end

return mobskillObject
