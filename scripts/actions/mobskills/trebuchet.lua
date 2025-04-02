-----------------------------------
-- Trebuchet
-----------------------------------
---@type TMobSkill
local mobskillObject = {}

mobskillObject.onMobSkillCheck = function(target, mob, skill)
    return 0
end

mobskillObject.onMobWeaponSkill = function(target, mob, skill)
    local numhits = 1
    local accmod = 1
    local dmgmod = 1.6

    local info = invaderXim.mobskills.mobRangedMove(mob, target, skill, numhits, accmod, dmgmod, invaderXim.mobskills.magicalTpBonus.NO_EFFECT)
    local dmg = invaderXim.mobskills.mobFinalAdjustments(info.dmg, mob, skill, target, invaderXim.attackType.RANGED, invaderXim.damageType.BLUNT, info.hitslanded)
    target:takeDamage(dmg, mob, invaderXim.attackType.RANGED, invaderXim.damageType.BLUNT)
    return dmg
end

return mobskillObject
