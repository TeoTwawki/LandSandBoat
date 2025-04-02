-----------------------------------
-- Echo Drops - Removes Silence.
-----------------------------------
---@type TMobSkill
local mobskillObject = {}

mobskillObject.onMobSkillCheck = function(target, mob, skill)
    return 0
end

-- TODO: verify no effect messaging
mobskillObject.onMobWeaponSkill = function(target, mob, skill)
    if target:hasStatusEffect(invaderXim.effect.SILENCE) then
        skill:setMsg(invaderXim.msg.basic.SKILL_ERASE)
        target:delStatusEffect(invaderXim.effect.SILENCE)
        return invaderXim.effect.SILENCE
    else
        skill:setMsg(invaderXim.msg.basic.NO_EFFECT)
    end
end

return mobskillObject
