-----------------------------------
-- Chaos Blade
-- Description: Deals Dark damage to enemies within a fan-shaped area. Additional effect: Curse
-- Type: Magical
-- Utsusemi/Blink absorb: Ignores Shadows
-- Range: Melee
-----------------------------------
---@type TMobSkill
local mobskillObject = {}

mobskillObject.onMobSkillCheck = function(target, mob, skill)
    local mobSkin = mob:getModelId()

    if mobSkin == 421 then
        return 0
    else
        return 1
    end
end

mobskillObject.onMobWeaponSkill = function(target, mob, skill)
    local damage = mob:getWeaponDmg() * 3

    damage = invaderXim.mobskills.mobMagicalMove(mob, target, skill, damage, invaderXim.element.DARK, 2, invaderXim.mobskills.magicalTpBonus.MAB_BONUS, 1)
    damage = invaderXim.mobskills.mobFinalAdjustments(damage, mob, skill, target, invaderXim.attackType.MAGICAL, invaderXim.damageType.DARK, invaderXim.mobskills.shadowBehavior.IGNORE_SHADOWS)

    target:takeDamage(damage, mob, invaderXim.attackType.MAGICAL, invaderXim.damageType.DARK)
    invaderXim.mobskills.mobStatusEffectMove(mob, target, invaderXim.effect.CURSE_I, 25, 0, 60)

    return damage
end

return mobskillObject
