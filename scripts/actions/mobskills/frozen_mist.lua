-----------------------------------
--  Frozen Mist
--  Description: Deals ice damage to enemies around the caster. Additional effect: Terror
--  Type: Magical (Ice)
-----------------------------------
---@type TMobSkill
local mobskillObject = {}

mobskillObject.onMobSkillCheck = function(target, mob, skill)
    return 0
end

mobskillObject.onMobWeaponSkill = function(target, mob, skill)
    local damage   = mob:getWeaponDmg()
    local duration = math.floor(30 * invaderXim.mobskills.applyPlayerResistance(mob, invaderXim.effect.TERROR, target, mob:getStat(invaderXim.mod.INT) - target:getStat(invaderXim.mod.INT), 0, 0))

    damage = invaderXim.mobskills.mobMagicalMove(mob, target, skill, damage, invaderXim.element.ICE, 1.5, invaderXim.mobskills.magicalTpBonus.NO_EFFECT)
    damage = invaderXim.mobskills.mobFinalAdjustments(damage, mob, skill, target, invaderXim.attackType.MAGICAL, invaderXim.damageType.ICE, invaderXim.mobskills.shadowBehavior.WIPE_SHADOWS)

    target:takeDamage(damage, mob, invaderXim.attackType.MAGICAL, invaderXim.damageType.ICE)
    invaderXim.mobskills.mobStatusEffectMove(mob, target, invaderXim.effect.TERROR, 30, 0, duration)

    return damage
end

return mobskillObject
