-----------------------------------
--  Water Bomb
--  Description: Deals water damage to enemies within area of effect. Additional effect: Silence.
--  Type: Magical (Water)
-----------------------------------
---@type TMobSkill
local mobskillObject = {}

mobskillObject.onMobSkillCheck = function(target, mob, skill)
    return 0
end

mobskillObject.onMobWeaponSkill = function(target, mob, skill)
    local damage = math.floor(mob:getWeaponDmg() * 2.5)

    damage = invaderXim.mobskills.mobMagicalMove(mob, target, skill, damage, invaderXim.element.WATER, 1, invaderXim.mobskills.magicalTpBonus.NO_EFFECT)
    damage = invaderXim.mobskills.mobFinalAdjustments(damage, mob, skill, target, invaderXim.attackType.MAGICAL, invaderXim.damageType.WATER, invaderXim.mobskills.shadowBehavior.WIPE_SHADOWS)

    target:takeDamage(damage, mob, invaderXim.attackType.MAGICAL, invaderXim.damageType.WATER)
    invaderXim.mobskills.mobStatusEffectMove(mob, target, invaderXim.effect.SILENCE, 1, 0, 60)

    return damage
end

return mobskillObject
