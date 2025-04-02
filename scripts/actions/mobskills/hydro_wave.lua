-----------------------------------
--  Hydro Wave
--  Description: Deals water damage to enemies around the caster.
--  Type: Magical (Water)
-----------------------------------
---@type TMobSkill
local mobskillObject = {}

mobskillObject.onMobSkillCheck = function(target, mob, skill)
    return 0
end

mobskillObject.onMobWeaponSkill = function(target, mob, skill)
    local damage   = mob:getWeaponDmg()
    local power    = math.random(1, 16)
    local duration = math.floor(30 * invaderXim.mobskills.applyPlayerResistance(mob, invaderXim.effect.ENCUMBRANCE_II, target, mob:getStat(invaderXim.mod.INT) - target:getStat(invaderXim.mod.INT), 0, 0))

    damage = invaderXim.mobskills.mobMagicalMove(mob, target, skill, damage, invaderXim.element.WATER, 2.5, invaderXim.mobskills.magicalTpBonus.NO_EFFECT)
    damage = invaderXim.mobskills.mobFinalAdjustments(damage, mob, skill, target, invaderXim.attackType.MAGICAL, invaderXim.damageType.WATER, invaderXim.mobskills.shadowBehavior.WIPE_SHADOWS)

    target:takeDamage(damage, mob, invaderXim.attackType.MAGICAL, invaderXim.damageType.WATER)
    mob:addStatusEffect(invaderXim.effect.STONESKIN, 0, 0, 180, 2, 1500)
    invaderXim.mobskills.mobStatusEffectMove(mob, target, invaderXim.effect.ENCUMBRANCE_II, power, 0, duration)

    return damage
end

return mobskillObject
