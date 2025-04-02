-----------------------------------
-- Thundris Shriek
--
-- Description: Deals heavy lightning damage to targets in area of effect. Additional effect: Terror
-- Type: Magical
-- Utsusemi/Blink absorb: Wipes shadows
-- Range: Unknown
-- Notes: Players will begin to be intimidated by the dvergr after this attack.
-----------------------------------
---@type TMobSkill
local mobskillObject = {}

mobskillObject.onMobSkillCheck = function(target, mob, skill)
    local mobFamily = mob:getFamily()
    local mobModel  = mob:getModelId()

    if
        (mobFamily == 91 and mobModel ~= 1839) or
        (mobFamily == 316 and mobModel ~= 1840)
    then
        return 1
    end

    return 0
end

mobskillObject.onMobWeaponSkill = function(target, mob, skill)
    local damage = mob:getWeaponDmg() * 5

    damage = invaderXim.mobskills.mobMagicalMove(mob, target, skill, damage, invaderXim.element.THUNDER, 1, invaderXim.mobskills.magicalTpBonus.NO_EFFECT)
    damage = invaderXim.mobskills.mobFinalAdjustments(damage, mob, skill, target, invaderXim.attackType.MAGICAL, invaderXim.damageType.THUNDER, invaderXim.mobskills.shadowBehavior.WIPE_SHADOWS)

    target:takeDamage(damage, mob, invaderXim.attackType.MAGICAL, invaderXim.damageType.THUNDER)
    invaderXim.mobskills.mobStatusEffectMove(mob, target, invaderXim.effect.TERROR, 1, 0, 15)

    return damage
end

return mobskillObject
