-----------------------------------
-- Blank Gaze
-- Gaze dispel
-- Utsusemi/Blink absorb: Ignores shadows
-- Range: Melee?
-----------------------------------
---@type TMobSkill
local mobskillObject = {}

mobskillObject.onMobSkillCheck = function(target, mob, skill)
    return 0
end

mobskillObject.onMobWeaponSkill = function(target, mob, skill)
    local effect = 0
    if target:isFacing(mob) then

        effect = target:dispelStatusEffect()

        if effect == invaderXim.effect.NONE then
            skill:setMsg(invaderXim.msg.basic.SKILL_NO_EFFECT) -- no effect
        else
            skill:setMsg(invaderXim.msg.basic.SKILL_ERASE)
        end
    else
        skill:setMsg(invaderXim.msg.basic.SKILL_NO_EFFECT) -- no effect
    end

    return effect
end

return mobskillObject
