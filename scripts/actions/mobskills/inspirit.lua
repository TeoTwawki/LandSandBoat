-----------------------------------
-- Inspirit
-- Restores HP to nearby allies.
-----------------------------------
---@type TMobSkill
local mobskillObject = {}

mobskillObject.onMobSkillCheck = function(target, mob, skill)
    return 0
end

mobskillObject.onMobWeaponSkill = function(target, mob, skill)
    skill:setMsg(invaderXim.msg.basic.SELF_HEAL)

    -- Todo: verify/correct maths
    return invaderXim.mobskills.mobHealMove(mob, math.floor(mob:getHP() / 7) * 2)
end

return mobskillObject
