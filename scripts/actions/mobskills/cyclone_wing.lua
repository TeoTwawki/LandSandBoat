-----------------------------------
-- Cyclone Wing
--
-- Description: Deals darkness damage to enemies within a very wide area of effect. Additional effect: Sleep
-- Type: Magical
-- Utsusemi/Blink absorb: Wipes shadows
-- Range: 30' radial.
-- Notes: Used only by Vrtra and Azdaja
-----------------------------------
---@type TMobSkill
local mobskillObject = {}

mobskillObject.onMobSkillCheck = function(target, mob, skill)
    if
        mob:getAnimationSub() == 1 or
        target:isBehind(mob, 48)
    then
        return 1
    end

    return 0
end

mobskillObject.onMobWeaponSkill = function(target, mob, skill)
    local damage = invaderXim.mobskills.mobMagicalMove(mob, target, skill, mob:getMainLvl() + 2, invaderXim.element.DARK, 4, invaderXim.mobskills.magicalTpBonus.NO_EFFECT)
    damage = invaderXim.mobskills.mobFinalAdjustments(damage, mob, skill, target, invaderXim.attackType.MAGICAL, invaderXim.damageType.DARK, invaderXim.mobskills.shadowBehavior.WIPE_SHADOWS)

    target:takeDamage(damage, mob, invaderXim.attackType.MAGICAL, invaderXim.damageType.DARK)
    invaderXim.mobskills.mobStatusEffectMove(mob, target, invaderXim.effect.SLEEP_I, 1, 0, 60)

    return damage
end

return mobskillObject
