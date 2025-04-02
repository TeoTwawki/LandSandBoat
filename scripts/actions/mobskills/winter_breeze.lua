-----------------------------------
-- Winter Breeze
-- Description: AoE Dispel (Only removes one effect) and Stun
-----------------------------------
---@type TMobSkill
local mobskillObject = {}

mobskillObject.onMobSkillCheck = function(target, mob, skill)
    return 0
end

mobskillObject.onMobWeaponSkill = function(target, mob, skill)
    local DISPEL = target:dispelStatusEffect()

    invaderXim.mobskills.mobStatusEffectMove(mob, target, invaderXim.effect.STUN, 1, 0, 2)

    if DISPEL == invaderXim.effect.NONE then
        skill:setMsg(invaderXim.msg.basic.SKILL_NO_EFFECT) -- no effect
    else
        skill:setMsg(invaderXim.msg.basic.SKILL_ERASE)
    end

    return DISPEL
end

return mobskillObject
