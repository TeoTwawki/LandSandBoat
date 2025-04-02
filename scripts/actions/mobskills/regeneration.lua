-----------------------------------
-- Regeneration
--
-- Description: Adds a Regen invaderXim.effect.
-- Type: Enhancing
-- Utsusemi/Blink absorb: N/A
-- Range: Self
-----------------------------------
---@type TMobSkill
local mobskillObject = {}

mobskillObject.onMobSkillCheck = function(target, mob, skill)
    return 0
end

mobskillObject.onMobWeaponSkill = function(target, mob, skill)
    local power = mob:getMainLvl() / 10 * 4 + 5

    skill:setMsg(invaderXim.mobskills.mobBuffMove(mob, invaderXim.effect.REGEN, power, 3, 60))

    return invaderXim.effect.REGEN
end

return mobskillObject
