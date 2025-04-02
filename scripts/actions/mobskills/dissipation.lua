-----------------------------------
-- Dissipation
-- Dispels all buffs add terror effect
-----------------------------------
---@type TMobSkill
local mobskillObject = {}

mobskillObject.onMobSkillCheck = function(target, mob, skill)
    return 1
end

mobskillObject.onMobWeaponSkill = function(target, mob, skill)
    invaderXim.mobskills.mobStatusEffectMove(mob, target, invaderXim.effect.TERROR, 1, 0, 10)

    local count = target:dispelAllStatusEffect()

    if count == 0 then
        skill:setMsg(invaderXim.msg.basic.SKILL_NO_EFFECT)
    else
        skill:setMsg(invaderXim.msg.basic.DISAPPEAR_NUM)
    end

    return count
end

return mobskillObject
