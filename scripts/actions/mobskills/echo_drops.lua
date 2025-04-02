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
        target:delStatusEffect(invaderXim.effect.SILENCE)
        return invaderXim.effect.SILENCE
    end

    skill:setMsg(invaderXim.msg.basic.MAGIC_NO_EFFECT)
    return invaderXim.effect.NONE
end

return mobskillObject
