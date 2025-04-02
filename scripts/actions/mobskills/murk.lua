-----------------------------------
-- Murk
--
-- Description: Slow and Weight Area of Effect (10.0')
-- Type: Enfeebling
-- Utsusemi/Blink absorb: Ignores shadows
-----------------------------------
---@type TMobSkill
local mobskillObject = {}

mobskillObject.onMobSkillCheck = function(target, mob, skill)
    return 0
end

mobskillObject.onMobWeaponSkill = function(target, mob, skill)
    local typeEffect = nil
    local slowed     = invaderXim.mobskills.mobStatusEffectMove(mob, target, invaderXim.effect.SLOW, 1250, 0, 60)
    local weight     = invaderXim.mobskills.mobStatusEffectMove(mob, target, invaderXim.effect.WEIGHT, 40, 0, 60)

    skill:setMsg(invaderXim.msg.basic.SKILL_ENFEEB_IS)

    -- display slow first, else weight
    if slowed == invaderXim.msg.basic.SKILL_ENFEEB_IS then
        typeEffect = invaderXim.effect.SLOW
    elseif weight == invaderXim.msg.basic.SKILL_ENFEEB_IS then
        typeEffect = invaderXim.effect.WEIGHT
    else
        skill:setMsg(invaderXim.msg.basic.SKILL_MISS)
    end

    return typeEffect
end

return mobskillObject
