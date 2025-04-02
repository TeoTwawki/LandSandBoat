-----------------------------------
--  Auroral Uppercut
-----------------------------------
local ID = zones[invaderXim.zone.EMPYREAL_PARADOX]
-----------------------------------
---@type TMobSkill
local mobskillObject = {}

mobskillObject.onMobSkillCheck = function(target, mob, skill)
    if
        target:hasStatusEffect(invaderXim.effect.PHYSICAL_SHIELD) or
        target:hasStatusEffect(invaderXim.effect.MAGIC_SHIELD)
    then
        return 1
    end

    mob:showText(mob, ID.text.PRISHE_TEXT + 4)

    return 0
end

mobskillObject.onMobWeaponSkill = function(target, mob, skill)
    local damage = mob:getWeaponDmg()

    damage = invaderXim.mobskills.mobMagicalMove(mob, target, skill, damage, invaderXim.element.LIGHT, 1, invaderXim.mobskills.magicalTpBonus.NO_EFFECT)
    damage = invaderXim.mobskills.mobFinalAdjustments(damage, mob, skill, target, invaderXim.attackType.MAGICAL, invaderXim.damageType.LIGHT, invaderXim.mobskills.shadowBehavior.IGNORE_SHADOWS)

    target:takeDamage(damage, mob, invaderXim.attackType.MAGICAL, invaderXim.damageType.LIGHT)

    return damage
end

return mobskillObject
