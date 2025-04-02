-----------------------------------
--  Storm Wing
--    Mob Ability: 2432
--  Description: Deals damage within a fan-shaped area. Additional effect: Silence.
--  Type: Magical
-----------------------------------
---@type TMobSkill
local mobskillObject = {}

mobskillObject.onMobSkillCheck = function(target, mob, skill)
    return 0
end

mobskillObject.onMobWeaponSkill = function(target, mob, skill)
    local damage = math.floor(mob:getWeaponDmg() * 1.5)

    damage = invaderXim.mobskills.mobMagicalMove(mob, target, skill, damage, invaderXim.element.WIND, 3, invaderXim.mobskills.magicalTpBonus.NO_EFFECT)
    damage = invaderXim.mobskills.mobFinalAdjustments(damage, mob, skill, target, invaderXim.attackType.MAGICAL, invaderXim.damageType.WIND, invaderXim.mobskills.shadowBehavior.NUMSHADOWS_3)

    target:takeDamage(damage, mob, invaderXim.attackType.MAGICAL, invaderXim.damageType.WIND)
    invaderXim.mobskills.mobStatusEffectMove(mob, target, invaderXim.effect.SILENCE, 1, 0, 60)

    return damage
end

return mobskillObject
