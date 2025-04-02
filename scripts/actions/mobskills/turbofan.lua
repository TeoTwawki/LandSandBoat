-----------------------------------
-- Turbofan
--  Description:
--  Type: Magical
--  additional effect : Silence.
-----------------------------------
---@type TMobSkill
local mobskillObject = {}

mobskillObject.onMobSkillCheck = function(target, mob, skill)
    return 0
end

mobskillObject.onMobWeaponSkill = function(target, mob, skill)
    local damage = mob:getWeaponDmg() * 3

    damage = invaderXim.mobskills.mobMagicalMove(mob, target, skill, damage, invaderXim.element.WIND, 2, invaderXim.mobskills.magicalTpBonus.MAB_BONUS, 1)
    damage = invaderXim.mobskills.mobFinalAdjustments(damage, mob, skill, target, invaderXim.attackType.MAGICAL, invaderXim.damageType.WIND, invaderXim.mobskills.shadowBehavior.IGNORE_SHADOWS)

    target:takeDamage(damage, mob, invaderXim.attackType.MAGICAL, invaderXim.damageType.WIND)
    invaderXim.mobskills.mobPhysicalStatusEffectMove(mob, target, skill, invaderXim.effect.SILENCE, 1, 3, 30)

    if target:hasStatusEffect(invaderXim.effect.ELEMENTALRES_DOWN) then
        target:delStatusEffectSilent(invaderXim.effect.ELEMENTALRES_DOWN)
    end

    mob:setLocalVar('nuclearWaste', 0)

    return damage
end

return mobskillObject
