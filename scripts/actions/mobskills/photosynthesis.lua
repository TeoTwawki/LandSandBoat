-----------------------------------
-- Photosynthesis
--
-- Description: Adds a Regen invaderXim.effect.
-- Type: Enhancing
-- Utsusemi/Blink absorb: N/A
-- Range: Self
-- Notes: Only available during daytime.
-----------------------------------
---@type TMobSkill
local mobskillObject = {}

mobskillObject.onMobSkillCheck = function(target, mob, skill)
    -- only used during daytime
    local currentTime = VanadielHour()
    if currentTime >= 6 and currentTime <= 18 then
        return 0
    end

    return 1
end

mobskillObject.onMobWeaponSkill = function(target, mob, skill)
    local power = mob:getMainLvl() / 10 * 4 + 5

    skill:setMsg(invaderXim.mobskills.mobBuffMove(mob, invaderXim.effect.REGEN, power, 0, 30))

    return invaderXim.effect.REGEN
end

return mobskillObject
