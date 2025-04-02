-----------------------------------
-- High-Tension_Discharger
-- Description: Discharges a powerful current that deals Lightning damage to players in a fan-shaped area.
-- Additional effect: Stun
-- Type: Magical
-----------------------------------
---@type TMobSkill
local mobskillObject = {}

mobskillObject.onMobSkillCheck = function(target, mob, skill)
    return 0
end

mobskillObject.onMobWeaponSkill = function(target, mob, skill)
    local damage = mob:getWeaponDmg() * 3

    damage = invaderXim.mobskills.mobMagicalMove(mob, target, skill, damage, invaderXim.element.THUNDER, 2, invaderXim.mobskills.magicalTpBonus.MAB_BONUS, 1)
    damage = invaderXim.mobskills.mobFinalAdjustments(damage, mob, skill, target, invaderXim.attackType.MAGICAL, invaderXim.damageType.THUNDER, invaderXim.mobskills.shadowBehavior.IGNORE_SHADOWS)

    target:takeDamage(damage, mob, invaderXim.attackType.MAGICAL, invaderXim.damageType.THUNDER)
    invaderXim.mobskills.mobPhysicalStatusEffectMove(mob, target, skill, invaderXim.effect.STUN, 1, 3, 2)

    if target:hasStatusEffect(invaderXim.effect.ELEMENTALRES_DOWN) then
        target:delStatusEffectSilent(invaderXim.effect.ELEMENTALRES_DOWN)
    end

    mob:setLocalVar('nuclearWaste', 0)

    return damage
end

return mobskillObject
