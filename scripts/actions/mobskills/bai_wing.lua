-----------------------------------
-- Bai Wing
--
-- Description: A dust storm deals Earth damage to enemies within a very wide area of effect. Additional effect: Slow
-- Type: Magical
-- Utsusemi/Blink absorb: Wipes shadows
-- Range: 30' radial.
-- Notes: Used only by Ouryu and Cuelebre while flying.
-----------------------------------
---@type TMobSkill
local mobskillObject = {}

mobskillObject.onMobSkillCheck = function(target, mob, skill)
    if mob:getAnimationSub() ~= 1 then
        return 1
    end

    return 0
end

mobskillObject.onMobWeaponSkill = function(target, mob, skill)
    local damage = mob:getWeaponDmg() * 5

    damage = invaderXim.mobskills.mobMagicalMove(mob, target, skill, damage, invaderXim.element.EARTH, 1, invaderXim.mobskills.magicalTpBonus.NO_EFFECT)
    damage = invaderXim.mobskills.mobFinalAdjustments(damage, mob, skill, target, invaderXim.attackType.MAGICAL, invaderXim.damageType.EARTH, invaderXim.mobskills.shadowBehavior.WIPE_SHADOWS)

    target:takeDamage(damage, mob, invaderXim.attackType.MAGICAL, invaderXim.damageType.EARTH)
    invaderXim.mobskills.mobStatusEffectMove(mob, target, invaderXim.effect.SLOW, 3000, 0, 120)

    return damage
end

return mobskillObject
