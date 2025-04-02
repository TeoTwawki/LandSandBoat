-----------------------------------
--  Toxic Spit
--
--  Description: Spews a toxic glob at a single target. Additional effect: Poison
--  Type: Magical Water
--  Utsusemi/Blink absorb: Ignores shadows
--  Notes: Additional effect can be removed with Poisona.
-----------------------------------
---@type TMobSkill
local mobskillObject = {}

mobskillObject.onMobSkillCheck = function(target, mob, skill)
    return 0
end

mobskillObject.onMobWeaponSkill = function(target, mob, skill)
    local damage = math.floor(mob:getWeaponDmg() * 2.5)
    local power  = math.floor(mob:getMainLvl() / 5 + 3)

    damage = invaderXim.mobskills.mobMagicalMove(mob, target, skill, damage, invaderXim.element.WATER, 1, invaderXim.mobskills.magicalTpBonus.NO_EFFECT)
    damage = invaderXim.mobskills.mobFinalAdjustments(damage, mob, skill, target, invaderXim.attackType.MAGICAL, invaderXim.damageType.WATER, invaderXim.mobskills.shadowBehavior.IGNORE_SHADOWS)

    target:takeDamage(damage, mob, invaderXim.attackType.MAGICAL, invaderXim.damageType.WATER)
    invaderXim.mobskills.mobStatusEffectMove(mob, target, invaderXim.effect.POISON, power, 3, 120)

    return damage
end

return mobskillObject
