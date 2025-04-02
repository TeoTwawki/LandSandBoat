-----------------------------------
-- Soul Voice
-----------------------------------
---@type TMobSkill
local mobskillObject = {}

mobskillObject.onMobSkillCheck = function(target, mob, skill)
    return 0
end

mobskillObject.onMobWeaponSkill = function(target, mob, skill)
    invaderXim.mobskills.mobBuffMove(mob, invaderXim.effect.SOUL_VOICE, 1, 0, 180)

    skill:setMsg(invaderXim.msg.basic.USES)

    return invaderXim.effect.SOUL_VOICE
end

return mobskillObject
