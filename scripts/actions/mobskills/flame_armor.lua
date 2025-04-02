-----------------------------------
-- Flame Armor
-- Description: Covers the user in fiery spikes. Enemies that hit it take fire damage.
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
    local power = 50
    local duration = 180

    skill:setMsg(invaderXim.mobskills.mobBuffMove(mob, invaderXim.effect.BLAZE_SPIKES, power, 0, duration))

    return invaderXim.effect.BLAZE_SPIKES
end

return mobskillObject
