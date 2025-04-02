-----------------------------------
-- Mephitic Spore
-- Deals Dark damage to targets in a fan-shaped area of effect. Additional effect: Poison
-- Type: Breath (But not a breath skill)
-- Utsusemi/Blink absorb: Ignores Shadows
-- Notes: Only used by Fairy Ring
-----------------------------------
---@type TMobSkill
local mobskillObject = {}

mobskillObject.onMobSkillCheck = function(target, mob, skill)
    return 0
end

mobskillObject.onMobWeaponSkill = function(target, mob, skill)
    local damage = mob:getWeaponDmg() * 4

    damage = invaderXim.mobskills.mobMagicalMove(mob, target, skill, damage, invaderXim.element.DARK, 1, invaderXim.mobskills.magicalTpBonus.NO_EFFECT, 1)
    damage = invaderXim.mobskills.mobFinalAdjustments(damage, mob, skill, target, invaderXim.attackType.BREATH, invaderXim.damageType.DARK, invaderXim.mobskills.shadowBehavior.IGNORE_SHADOWS)

    target:takeDamage(damage, mob, invaderXim.attackType.BREATH, invaderXim.damageType.DARK)
    invaderXim.mobskills.mobStatusEffectMove(mob, target, invaderXim.effect.POISON, 50, 3, 180)

    return damage
end

return mobskillObject
