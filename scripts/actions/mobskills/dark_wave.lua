-----------------------------------
--  Dark Wave
--
--  Description: A wave of dark energy washes over targets in an area of effect. Additional effect: Bio
--  Type: Magical
--  Utsusemi/Blink absorb: Ignores shadows
--  Range: 10' radial
--  Notes: Severity of Bio effect varies by time of day, from 8/tic at midday to 20/tic at midnight.
-----------------------------------
---@type TMobSkill
local mobskillObject = {}

mobskillObject.onMobSkillCheck = function(target, mob, skill)
    return 0
end

mobskillObject.onMobWeaponSkill = function(target, mob, skill)
    local damage = mob:getWeaponDmg() * 5
    local hour   = VanadielHour()
    local power  = 8

    if hour > 12 then
        power = 8 + hour - 11
    end

    damage = invaderXim.mobskills.mobMagicalMove(mob, target, skill, damage, invaderXim.element.DARK, 1, invaderXim.mobskills.magicalTpBonus.NO_EFFECT)
    damage = invaderXim.mobskills.mobFinalAdjustments(damage, mob, skill, target, invaderXim.attackType.MAGICAL, invaderXim.damageType.DARK, invaderXim.mobskills.shadowBehavior.IGNORE_SHADOWS)

    target:takeDamage(damage, mob, invaderXim.attackType.MAGICAL, invaderXim.damageType.DARK)
    invaderXim.mobskills.mobStatusEffectMove(mob, target, invaderXim.effect.BIO, power, 3, 60)

    return damage
end

return mobskillObject
