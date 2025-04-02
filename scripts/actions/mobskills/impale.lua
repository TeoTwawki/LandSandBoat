-----------------------------------
--  Impale
--  Description: Deals damage to a single target. Additional effect: Paralysis (NM version AE applies a strong poison effect and resets enmity on target)
--  Type: Physical
--  Utsusemi/Blink absorb: 1 shadow (NM version ignores shadows)
--  Range: Melee
-----------------------------------
---@type TMobSkill
local mobskillObject = {}

mobskillObject.onMobSkillCheck = function(target, mob, skill)
    return 0
end

mobskillObject.onMobWeaponSkill = function(target, mob, skill)
    local typeEffect = invaderXim.effect.PARALYSIS
    local numhits = 1
    local accmod = 1
    local ftp    = 2.3
    local info = invaderXim.mobskills.mobPhysicalMove(mob, target, skill, numhits, accmod, ftp, invaderXim.mobskills.physicalTpBonus.NO_EFFECT)
    local shadows = info.hitslanded

    if mob:isMobType(invaderXim.mobType.NOTORIOUS) then
        shadows = invaderXim.mobskills.shadowBehavior.IGNORE_SHADOWS
        typeEffect = invaderXim.effect.POISON
        mob:resetEnmity(target)
    end

    local dmg = invaderXim.mobskills.mobFinalAdjustments(info.dmg, mob, skill, target, invaderXim.attackType.PHYSICAL, invaderXim.damageType.PIERCING, shadows)
    invaderXim.mobskills.mobPhysicalStatusEffectMove(mob, target, skill, typeEffect, 20, 0, 120)
    target:takeDamage(dmg, mob, invaderXim.attackType.PHYSICAL, invaderXim.damageType.PIERCING)

    return dmg
end

return mobskillObject
