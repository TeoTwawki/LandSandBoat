-----------------------------------
-- Deadeye
-- Family: Qiqurn
-- Description: Lowers the defense and magical defense of enemies within range.
-- Type: Magical
-- Utsusemi/Blink absorb: Ignores shadows
-- Range: Unknown
-- Notes: Used only by certain Notorious Monsters. Strong invaderXim.effect.
-----------------------------------
---@type TMobSkill
local mobskillObject = {}

mobskillObject.onMobSkillCheck = function(target, mob, skill)
    return 0
end

mobskillObject.onMobWeaponSkill = function(target, mob, skill)
    local typeEffect = nil
    local defDown    = invaderXim.mobskills.mobStatusEffectMove(mob, target, invaderXim.effect.DEFENSE_DOWN, 50, 0, 120)
    local mDefDown   = invaderXim.mobskills.mobStatusEffectMove(mob, target, invaderXim.effect.MAGIC_DEF_DOWN, 50, 0, 120)

    skill:setMsg(invaderXim.msg.basic.SKILL_ENFEEB_IS)

    -- display defense down first, else magic defense down
    if defDown == invaderXim.msg.basic.SKILL_ENFEEB_IS then
        typeEffect = invaderXim.effect.DEFENSE_DOWN
    elseif mDefDown == invaderXim.msg.basic.SKILL_ENFEEB_IS then
        typeEffect = invaderXim.effect.MAGIC_DEF_DOWN
    else
        skill:setMsg(invaderXim.msg.basic.SKILL_MISS)
    end

    return typeEffect
end

return mobskillObject
