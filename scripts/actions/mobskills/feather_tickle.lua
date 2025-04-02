-----------------------------------
-- Feather Tickle
-- Description: Reduces tp to zero.
-----------------------------------
---@type TMobSkill
local mobskillObject = {}

mobskillObject.onMobSkillCheck = function(target, mob, skill)
    return 0
end

mobskillObject.onMobWeaponSkill = function(target, mob, skill)
    local tpReduced = 0
    target:setTP(tpReduced)

    skill:setMsg(invaderXim.msg.basic.TP_REDUCED)

    return tpReduced
end

return mobskillObject
