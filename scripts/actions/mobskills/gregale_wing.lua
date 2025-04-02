-----------------------------------
--  Gregale Wing
--  Description: An icy wind deals Ice damage to enemies within a very wide area of effect. Additional effect: Paralyze
--  Type: Magical
--  Utsusemi/Blink absorb: Wipes shadows
--  Range: 30' radial.
--  Notes: Used only by Jormungand and Isgebind
-----------------------------------
---@type TMobSkill
local mobskillObject = {}

mobskillObject.onMobSkillCheck = function(target, mob, skill)
    if mob:hasStatusEffect(invaderXim.effect.BLOOD_WEAPON) then
        return 1
    elseif mob:getAnimationSub() == 1 then
        return 1
    elseif target:isBehind(mob, 48) then
        return 1
    end

    return 0
end

mobskillObject.onMobWeaponSkill = function(target, mob, skill)
    local damage = invaderXim.mobskills.mobMagicalMove(mob, target, skill, mob:getMainLvl() + 2, invaderXim.element.ICE, 4, invaderXim.mobskills.magicalTpBonus.NO_EFFECT)
    damage = invaderXim.mobskills.mobFinalAdjustments(damage, mob, skill, target, invaderXim.attackType.MAGICAL, invaderXim.damageType.ICE, invaderXim.mobskills.shadowBehavior.WIPE_SHADOWS)

    target:takeDamage(damage, mob, invaderXim.attackType.MAGICAL, invaderXim.damageType.ICE)
    invaderXim.mobskills.mobStatusEffectMove(mob, target, invaderXim.effect.PARALYSIS, 40, 0, 120)

    return damage
end

return mobskillObject
