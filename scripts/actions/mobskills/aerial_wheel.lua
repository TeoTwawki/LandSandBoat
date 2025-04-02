-----------------------------------
-- Aerial Wheel
-- Deals a ranged attack to a single target. Additional effect: stun
-----------------------------------
---@type TMobSkill
local mobskillObject = {}

mobskillObject.onMobSkillCheck = function(target, mob, skill)
    return 0
end

mobskillObject.onMobWeaponSkill = function(target, mob, skill)
    local numhits = 1
    local accmod  = 0.8
    local dmgmod  = 2.3
    local info    = invaderXim.mobskills.mobRangedMove(mob, target, skill, numhits, accmod, dmgmod, invaderXim.mobskills.magicalTpBonus.NO_EFFECT)
    local dmg     = invaderXim.mobskills.mobFinalAdjustments(info.dmg, mob, skill, target, invaderXim.attackType.RANGED, invaderXim.damageType.PIERCING, info.hitslanded)

    invaderXim.mobskills.mobPhysicalStatusEffectMove(mob, target, skill, invaderXim.effect.STUN, 1, 0, 4)
    target:takeDamage(dmg, mob, invaderXim.attackType.RANGED, invaderXim.damageType.PIERCING)

    return dmg
end

return mobskillObject
