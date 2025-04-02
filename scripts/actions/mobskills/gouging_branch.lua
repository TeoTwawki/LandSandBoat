-----------------------------------
--  Gouging Branch
--  Description: Drills a single target with a branch. Additional effect: Blind
--  Type: Physical
--  Utsusemi/Blink absorb: 2-3 shadows
--  Range: Melee
--  Notes: Only used by Stcemqestcint
-----------------------------------
---@type TMobSkill
local mobskillObject = {}

mobskillObject.onMobSkillCheck = function(target, mob, skill)
    return 0
end

mobskillObject.onMobWeaponSkill = function(target, mob, skill)
    local numhits = 3
    local accmod  = 1
    local info    = invaderXim.mobskills.mobPhysicalMove(mob, target, skill, numhits, accmod, 1, invaderXim.mobskills.physicalTpBonus.NO_EFFECT, 2.0, 2.0, 2.0)
    local dmg     = invaderXim.mobskills.mobFinalAdjustments(info.dmg, mob, skill, target, invaderXim.attackType.PHYSICAL, invaderXim.damageType.PIERCING, info.hitslanded)

    invaderXim.mobskills.mobPhysicalStatusEffectMove(mob, target, skill, invaderXim.effect.BLINDNESS, 50, 0, 45)

    target:takeDamage(dmg, mob, invaderXim.attackType.PHYSICAL, invaderXim.damageType.PIERCING)

    return dmg
end

return mobskillObject
