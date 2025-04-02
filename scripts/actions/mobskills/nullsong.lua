-----------------------------------
-- Nullsong
-- Description: Removes all beneficial effects from players in an area of effect. Deals darkness damage for each buff removed.
-- Type: Magical
-- Utsusemi/Blink absorb: Wipes Shadows
-- Range: 15' radial
-- NOTE: Only used if target has 3 or more effects to dispel
-----------------------------------
---@type TMobSkill
local mobskillObject = {}

mobskillObject.onMobSkillCheck = function(target, mob, skill)
    if
        mob:hasStatusEffect(invaderXim.effect.SILENCE) or
        target:countEffectWithFlag(invaderXim.effectFlag.DISPELABLE) < 3
    then
        return 1
    end

    return 0
end

mobskillObject.onMobWeaponSkill = function(target, mob, skill)
    local count = target:dispelAllStatusEffect(invaderXim.effectFlag.DISPELABLE)

    if count == 0 then
        skill:setMsg(invaderXim.msg.basic.SKILL_NO_EFFECT)
        return count
    end

    local damage = invaderXim.mobskills.mobFinalAdjustments(117 * count, mob, skill, target, invaderXim.attackType.SPECIAL, invaderXim.damageType.ELEMENTAL, invaderXim.mobskills.shadowBehavior.WIPE_SHADOWS)
    target:takeDamage(damage, mob, invaderXim.attackType.SPECIAL, invaderXim.damageType.ELEMENTAL)

    return damage
end

return mobskillObject
