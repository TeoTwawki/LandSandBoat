-----------------------------------
--  Acid Breath
--
--  Description: Deals Water damage to enemies in a fan-shaped area of effect. Additional effect: STR Down
--  Type: Breath
--  Utsusemi/Blink absorb: Ignores shadows
--  Range: Unknown cone
-----------------------------------
---@type TMobSkill
local mobskillObject = {}

mobskillObject.onMobSkillCheck = function(target, mob, skill)
    return 0
end

mobskillObject.onMobWeaponSkill = function(target, mob, skill)
    local power    = 20
    local tick     = 3
    local duration = power * tick

    invaderXim.mobskills.mobStatusEffectMove(mob, target, invaderXim.effect.STR_DOWN, power, tick, duration)

    local dmgmod = invaderXim.mobskills.mobBreathMove(mob, target, skill, 0.1, 1, invaderXim.element.WATER, 200)
    local dmg    = invaderXim.mobskills.mobFinalAdjustments(dmgmod, mob, skill, target, invaderXim.attackType.BREATH, invaderXim.damageType.WATER, invaderXim.mobskills.shadowBehavior.IGNORE_SHADOWS)

    target:takeDamage(dmg, mob, invaderXim.attackType.BREATH, invaderXim.damageType.WATER)

    return dmg
end

return mobskillObject
