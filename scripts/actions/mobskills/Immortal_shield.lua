-----------------------------------
-- Immortal Shield
-- Description: Grants a Magic Shield effect for a time.
-- Type: Enhancing
-- Range: Self
-----------------------------------
---@type TMobSkill
local mobskillObject = {}

mobskillObject.onMobSkillCheck = function(target, mob, skill)
    return 0
end

mobskillObject.onMobWeaponSkill = function(target, mob, skill)
    mob:addStatusEffect(invaderXim.effect.MAGIC_SHIELD, 0, 1, 0, 45)
    skill:setMsg(invaderXim.msg.basic.SKILL_GAIN_EFFECT)
    return invaderXim.effect.MAGIC_SHIELD
end

return mobskillObject
