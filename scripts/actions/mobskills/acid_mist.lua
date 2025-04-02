-----------------------------------
-- Acid Mist
-- Deals Water damage to enemies within an area of effect. Additional effect: Attack Down
-----------------------------------
---@type TMobSkill
local mobskillObject = {}

mobskillObject.onMobSkillCheck = function(target, mob, skill)
    return 0
end

mobskillObject.onMobWeaponSkill = function(target, mob, skill)
    local damage   = mob:getWeaponDmg() * 3.2
    local power    = 50
    local duration = 120

    damage = invaderXim.mobskills.mobMagicalMove(mob, target, skill, damage, invaderXim.element.WATER, 1, invaderXim.mobskills.magicalTpBonus.MAB_BONUS, 1)
    damage = invaderXim.mobskills.mobFinalAdjustments(damage, mob, skill, target, invaderXim.attackType.MAGICAL, invaderXim.damageType.WATER, invaderXim.mobskills.shadowBehavior.WIPE_SHADOWS)

    target:takeDamage(damage, mob, invaderXim.attackType.MAGICAL, invaderXim.damageType.WATER)
    invaderXim.mobskills.mobStatusEffectMove(mob, target, invaderXim.effect.ATTACK_DOWN, power, 0, duration)

    return damage
end

return mobskillObject
