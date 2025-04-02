-----------------------------------
--  Vitrolic Barrage
--
--  Description: Bombards nearby targets with acid, dealing fixed Water damage. Additional effect: Poison
--  Type: ??? (Water)
--  Utsusemi/Blink absorb: Wipes shadows
--  Range: AoE 10'
--  Notes: Poison is 20/tic
-----------------------------------
---@type TMobSkill
local mobskillObject = {}

mobskillObject.onMobSkillCheck = function(target, mob, skill)
    return 0
end

mobskillObject.onMobWeaponSkill = function(target, mob, skill)
    local needles = 1000 / skill:getTotalTargets()

    invaderXim.mobskills.mobStatusEffectMove(mob, target, invaderXim.effect.POISON, 20, 3, 60)

    local dmg = invaderXim.mobskills.mobFinalAdjustments(needles, mob, skill, target, invaderXim.attackType.PHYSICAL, invaderXim.damageType.WATER, invaderXim.mobskills.shadowBehavior.WIPE_SHADOWS)

    target:takeDamage(dmg, mob, invaderXim.attackType.PHYSICAL, invaderXim.damageType.WATER)

    return dmg
end

return mobskillObject
