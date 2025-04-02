-----------------------------------
-- Tremors
-- Deals Earth damage with a seismic disturbance. Additional effect: DEX Down
-- Area of Effect is centered around caster.
-- Utsusemi/Blink absorb: Wipes shadows
-- Duration: Three minutes ?
-----------------------------------
---@type TMobSkill
local mobskillObject = {}

mobskillObject.onMobSkillCheck = function(target, mob, skill)
    return 0
end

mobskillObject.onMobWeaponSkill = function(target, mob, skill)
    local damage = math.floor(mob:getWeaponDmg() * 2.5)

    damage = invaderXim.mobskills.mobMagicalMove(mob, target, skill, damage, invaderXim.element.EARTH, 1, invaderXim.mobskills.magicalTpBonus.MAB_BONUS, 1)
    damage = invaderXim.mobskills.mobFinalAdjustments(damage, mob, skill, target, invaderXim.attackType.MAGICAL, invaderXim.damageType.EARTH, invaderXim.mobskills.shadowBehavior.WIPE_SHADOWS)

    target:takeDamage(damage, mob, invaderXim.attackType.MAGICAL, invaderXim.damageType.EARTH)
    invaderXim.mobskills.mobStatusEffectMove(mob, target, invaderXim.effect.DEX_DOWN, 10, 3, 120)

    return damage
end

return mobskillObject
