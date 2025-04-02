-----------------------------------
--  Erosion Dust
--  Description: Spreads eroding dust particles on targets in an area of effect, dealing Light damage and inflicting Dia.
--  Type: Magical
--  Utsusemi/Blink absorb: Wipes shadows
-----------------------------------
---@type TMobSkill
local mobskillObject = {}

mobskillObject.onMobSkillCheck = function(target, mob, skill)
    return 0
end

mobskillObject.onMobWeaponSkill = function(target, mob, skill)
    local damage = mob:getWeaponDmg() * 3.3

    damage = invaderXim.mobskills.mobMagicalMove(mob, target, skill, damage, invaderXim.element.LIGHT, 1, invaderXim.mobskills.magicalTpBonus.NO_EFFECT)
    damage = invaderXim.mobskills.mobFinalAdjustments(damage, mob, skill, target, invaderXim.attackType.MAGICAL, invaderXim.damageType.LIGHT, invaderXim.mobskills.shadowBehavior.WIPE_SHADOWS)
    target:takeDamage(damage, mob, invaderXim.attackType.MAGICAL, invaderXim.damageType.LIGHT)

    local duration = invaderXim.mobskills.calculateDuration(skill:getTP(), 10, 30)
    invaderXim.mobskills.mobStatusEffectMove(mob, target, invaderXim.effect.DIA, 3, 3, duration)

    return damage
end

return mobskillObject
