-----------------------------------
-- Fire Meeble Warble
-- AOE Fire Elemental damage, inflicts Plague (50 MP/tick, 300 TP/tick) and Burn (50 HP/tick).
-----------------------------------
---@type TMobSkill
local mobskillObject = {}

mobskillObject.onMobSkillCheck = function(target, mob, skill)
    return 0
end

mobskillObject.onMobWeaponSkill = function(target, mob, skill)
    local damage = mob:getWeaponDmg() * 9

    damage = invaderXim.mobskills.mobMagicalMove(mob, target, skill, damage, invaderXim.element.WIND, 2, invaderXim.mobskills.magicalTpBonus.NO_EFFECT, 1)
    damage = invaderXim.mobskills.mobFinalAdjustments(damage, mob, skill, target, invaderXim.attackType.MAGICAL, invaderXim.damageType.WIND, invaderXim.mobskills.shadowBehavior.WIPE_SHADOWS)

    target:takeDamage(damage, mob, invaderXim.attackType.MAGICAL, invaderXim.damageType.WIND)
    invaderXim.mobskills.mobStatusEffectMove(mob, target, invaderXim.effect.PLAGUE, 30, 3, 60)
    invaderXim.mobskills.mobStatusEffectMove(mob, target, invaderXim.effect.BURN, 50, 3, 60)

    return damage
end

return mobskillObject
