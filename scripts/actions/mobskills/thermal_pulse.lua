-----------------------------------
--  Thermal Pulse
--  Family: Wamouracampa
--  Description: Deals Fire damage to enemies within area of effect. Additional effect: Blindness
--  Type: Magical
--  Utsusemi/Blink absorb: Ignores shadow
--  Range: 12.5
--  Notes: Open form only.
-----------------------------------
---@type TMobSkill
local mobskillObject = {}

mobskillObject.onMobSkillCheck = function(target, mob, skill)
    if mob:getAnimationSub() ~= 0 then
        return 1
    else
        return 0
    end
end

mobskillObject.onMobWeaponSkill = function(target, mob, skill)
    local damage = mob:getWeaponDmg() * 4.5

    damage = invaderXim.mobskills.mobMagicalMove(mob, target, skill, damage, invaderXim.element.FIRE, 1, invaderXim.mobskills.magicalTpBonus.NO_EFFECT)
    damage = invaderXim.mobskills.mobFinalAdjustments(damage, mob, skill, target, invaderXim.attackType.MAGICAL, invaderXim.damageType.FIRE, invaderXim.mobskills.shadowBehavior.IGNORE_SHADOWS)

    target:takeDamage(damage, mob, invaderXim.attackType.MAGICAL, invaderXim.damageType.FIRE)

    local duration = invaderXim.mobskills.calculateDuration(skill:getTP(), 30, 90)
    invaderXim.mobskills.mobStatusEffectMove(mob, target, invaderXim.effect.BLINDNESS, 100, 0, duration)

    return damage
end

return mobskillObject
