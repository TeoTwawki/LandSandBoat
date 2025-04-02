-----------------------------------
-- Dukkeripen
-- adds 10 shadows
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
    skill:setMsg(invaderXim.mobskills.mobBuffMove(mob, invaderXim.effect.BLINK, 10, 0, 120))

    return invaderXim.effect.BLINK
end

return mobskillObject
