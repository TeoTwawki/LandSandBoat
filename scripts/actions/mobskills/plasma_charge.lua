-----------------------------------
-- Plasma Charge
-- Covers the user in Shock spikes and absorbs damage. Enemies that hit it take fire damage.
-----------------------------------
---@type TMobSkill
local mobskillObject = {}

mobskillObject.onMobSkillCheck = function(target, mob, skill)
    return 0
end

mobskillObject.onMobWeaponSkill = function(target, mob, skill)
    skill:setMsg(invaderXim.mobskills.mobBuffMove(mob, invaderXim.effect.SHOCK_SPIKES, math.random(15, 30), 0, 180))

    return invaderXim.effect.SHOCK_SPIKES
end

return mobskillObject
