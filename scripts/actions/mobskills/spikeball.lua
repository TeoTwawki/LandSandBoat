-----------------------------------
-- Spikeball
-- Throws a spiky projectile at a single target. Additional effect: Poison
-----------------------------------
---@type TMobSkill
local mobskillObject = {}

mobskillObject.onMobSkillCheck = function(target, mob, skill)
    return 0
end

mobskillObject.onMobWeaponSkill = function(target, mob, skill)
    local numhits = 1
    local accmod = 1
    local ftp    = 2.8
    local info = invaderXim.mobskills.mobPhysicalMove(mob, target, skill, numhits, accmod, ftp, invaderXim.mobskills.physicalTpBonus.NO_EFFECT)
    local dmg = invaderXim.mobskills.mobFinalAdjustments(info.dmg, mob, skill, target, invaderXim.attackType.RANGED, invaderXim.damageType.PIERCING, info.hitslanded)
    target:takeDamage(dmg, mob, invaderXim.attackType.RANGED, invaderXim.damageType.PIERCING)

    if dmg > 0 then
        invaderXim.mobskills.mobStatusEffectMove(mob, target, invaderXim.effect.POISON, 3, 3, 160)
    end

    return dmg
end

return mobskillObject
