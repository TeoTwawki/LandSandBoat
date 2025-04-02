-----------------------------------
--  Abyss Blast
--
--  Description: Blasts a single target with dark energy. Additional effect: Blind
--  Type: Magical
--  Utsusemi/Blink absorb: Ignores shadows
--  Range: Unknown
--  Notes: Blinds target
-----------------------------------
---@type TMobSkill
local mobskillObject = {}

mobskillObject.onMobSkillCheck = function(target, mob, skill)
    return 0
end

mobskillObject.onMobWeaponSkill = function(target, mob, skill)
    local damage   = mob:getWeaponDmg() * 5
    local power    = 15
    local duration = 120

    damage = invaderXim.mobskills.mobMagicalMove(mob, target, skill, damage, invaderXim.element.DARK, 1, invaderXim.mobskills.magicalTpBonus.NO_EFFECT)
    damage = invaderXim.mobskills.mobFinalAdjustments(damage, mob, skill, target, invaderXim.attackType.MAGICAL, invaderXim.damageType.DARK, invaderXim.mobskills.shadowBehavior.IGNORE_SHADOWS)

    target:takeDamage(damage, mob, invaderXim.attackType.MAGICAL, invaderXim.damageType.DARK)
    invaderXim.mobskills.mobStatusEffectMove(mob, target, invaderXim.effect.BLINDNESS, power, 0, duration)

    return damage
end

return mobskillObject
