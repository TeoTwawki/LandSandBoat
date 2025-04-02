-----------------------------------
-- Meikyo Shisui
-----------------------------------
---@type TMobSkill
local mobskillObject = {}

mobskillObject.onMobSkillCheck = function(target, mob, skill)
    return 0
end

mobskillObject.onMobWeaponSkill = function(target, mob, skill)
    invaderXim.mobskills.mobBuffMove(mob, invaderXim.effect.MEIKYO_SHISUI, 1, 0, 30)

    skill:setMsg(invaderXim.msg.basic.USES)

    mob:addTP(3000)

    -- use local var counter to ensure only three mobskills count for Meikyo Shisui
    mob:setLocalVar('[MeikyoShisui]MobSkillCount', 3)

    return invaderXim.effect.MEIKYO_SHISUI
end

return mobskillObject
