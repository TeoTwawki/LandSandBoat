-----------------------------------
--  Thunderbolt
--  Description: Deals Lightning damage in an area of effect. Additional effect: Stun
--  Type: Magical
--  Utsusemi/Blink absorb: Ignores shadows
-----------------------------------
---@type TMobSkill
local mobskillObject = {}

mobskillObject.onMobSkillCheck = function(target, mob, skill)
    return 0
end

mobskillObject.onMobWeaponSkill = function(target, mob, skill)
    local duration = math.random(8, 14)
    local damage = invaderXim.mobskills.mobMagicalMove(mob, target, skill, mob:getMainLvl() + 2, invaderXim.element.THUNDER, 0.6, invaderXim.mobskills.magicalTpBonus.NO_EFFECT)
    damage = invaderXim.mobskills.mobFinalAdjustments(damage, mob, skill, target, invaderXim.attackType.MAGICAL, invaderXim.damageType.THUNDER, invaderXim.mobskills.shadowBehavior.IGNORE_SHADOWS)

    target:takeDamage(damage, mob, invaderXim.attackType.MAGICAL, invaderXim.damageType.THUNDER)
    invaderXim.mobskills.mobStatusEffectMove(mob, target, invaderXim.effect.STUN, 1, 0, duration)

    return damage
end

return mobskillObject
