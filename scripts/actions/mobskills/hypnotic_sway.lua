-----------------------------------
-- Hypnotic Sway
-- Description: Inflicts amnesia conal
-- Type: Enfeebling
-- Utsusemi/Blink absorb: Ignores shadows
-----------------------------------
---@type TMobSkill
local mobskillObject = {}

mobskillObject.onMobSkillCheck = function(target, mob, skill)
    return 0
end

mobskillObject.onMobWeaponSkill = function(target, mob, skill)
    local power = 1
    local duration = invaderXim.mobskills.calculateDuration(skill:getTP(), 30, 60)

    skill:setMsg(invaderXim.mobskills.mobGazeMove(mob, target, invaderXim.effect.AMNESIA, power, 0, duration))
    return invaderXim.effect.AMNESIA
end

return mobskillObject
