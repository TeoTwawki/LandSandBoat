-----------------------------------
-- Frost Armor
-----------------------------------
---@type TMobSkill
local mobskillObject = {}

mobskillObject.onMobSkillCheck = function(target, mob, skill)
    return 0
end

mobskillObject.onMobWeaponSkill = function(target, mob, skill)
    skill:setMsg(invaderXim.mobskills.mobBuffMove(mob, invaderXim.effect.ICE_SPIKES, 10, 0, 180))

    return invaderXim.effect.ICE_SPIKES
end

return mobskillObject
