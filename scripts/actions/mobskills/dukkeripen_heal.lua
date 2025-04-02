-----------------------------------
-- Dukkeripen
-- Self healing move
-- Type: Magical
-----------------------------------
---@type TMobSkill
local mobskillObject = {}

mobskillObject.onMobSkillCheck = function(target, mob, skill)
    if mob:getMainJob() == invaderXim.job.COR then
        return 0
    else
        return 1
    end
end

mobskillObject.onMobWeaponSkill = function(target, mob, skill)
    skill:setMsg(invaderXim.msg.basic.SELF_HEAL)

    return invaderXim.mobskills.mobHealMove(mob, math.random(350, 500))
end

return mobskillObject
