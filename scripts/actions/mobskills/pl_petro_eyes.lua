-----------------------------------
-- Petro Eyes
-- Description: Petrifies opponents with a gaze attack.
-- Type: Gaze
-- Utsusemi/Blink absorb: Ignores shadows
-- Range: Single gaze
-----------------------------------
---@type TMobSkill
local mobskillObject = {}

mobskillObject.onMobSkillCheck = function(target, mob, skill)
    local mobSkin = mob:getModelId()

    if mobSkin == 421 then
        return 0
    else
        return 1
    end
end

mobskillObject.onMobWeaponSkill = function(target, mob, skill)
    skill:setMsg(invaderXim.mobskills.mobGazeMove(mob, target, invaderXim.effect.PETRIFICATION, 1, 0, 30))

    return invaderXim.effect.PETRIFICATION
end

return mobskillObject
