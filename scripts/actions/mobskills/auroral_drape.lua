-----------------------------------
-- Auroral Drape
--
-- Description: Silence and Blind Area of Effect (10.0')
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
    local silenced   = invaderXim.mobskills.mobStatusEffectMove(mob, target, invaderXim.effect.SILENCE, 1, 0, 60)
    local blinded    = invaderXim.mobskills.mobStatusEffectMove(mob, target, invaderXim.effect.BLINDNESS, 60, 0, 60)

    skill:setMsg(invaderXim.msg.basic.SKILL_ENFEEB_IS)

    -- display silenced first, else blind
    if silenced == invaderXim.msg.basic.SKILL_ENFEEB_IS then
        typeEffect = invaderXim.effect.SILENCE
    elseif blinded == invaderXim.msg.basic.SKILL_ENFEEB_IS then
        typeEffect = invaderXim.effect.BLINDNESS
    else
        skill:setMsg(invaderXim.msg.basic.SKILL_MISS)
    end

    return typeEffect
end

return mobskillObject
