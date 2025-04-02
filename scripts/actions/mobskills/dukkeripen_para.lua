-----------------------------------
-- Dukkeripen
-- paralyzes target
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
    if invaderXim.mobskills.mobStatusEffectMove(mob, target, invaderXim.effect.PARALYSIS, 20, 0, 120) then
        skill:setMsg(invaderXim.msg.basic.SKILL_ENFEEB_IS)
    else
        skill:setMsg(invaderXim.msg.basic.SKILL_MISS)
    end

    return invaderXim.effect.PARALYSIS
end

return mobskillObject
