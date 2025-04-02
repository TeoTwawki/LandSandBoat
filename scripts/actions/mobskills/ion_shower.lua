-----------------------------------
--  Ion Shower
--  Description: Calls forth an ion storm, dealing Lightning damage to all nearby targets. Additional effect: Stun
--  Type: Magical
--  Utsusemi/Blink absorb: Wipes shadows
--  Range: Unknown radial
-----------------------------------
---@type TMobSkill
local mobskillObject = {}

mobskillObject.onMobSkillCheck = function(target, mob, skill)
    return 0
end

mobskillObject.onMobWeaponSkill = function(target, mob, skill)
    local damage = math.floor(mob:getWeaponDmg() * 3.5)

    damage = invaderXim.mobskills.mobMagicalMove(mob, target, skill, damage, invaderXim.element.THUNDER, 1, invaderXim.mobskills.magicalTpBonus.NO_EFFECT)
    damage = invaderXim.mobskills.mobFinalAdjustments(damage, mob, skill, target, invaderXim.attackType.MAGICAL, invaderXim.damageType.THUNDER, invaderXim.mobskills.shadowBehavior.WIPE_SHADOWS)

    target:takeDamage(damage, mob, invaderXim.attackType.MAGICAL, invaderXim.damageType.THUNDER)
    invaderXim.mobskills.mobStatusEffectMove(mob, target, invaderXim.effect.STUN, 1, 0, 5)

    return damage
end

return mobskillObject
