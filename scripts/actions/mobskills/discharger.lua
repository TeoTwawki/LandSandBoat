-----------------------------------
-- Discharger
-- Description: Places a magic barrier and shock spikes.
-- Type: Enhancing
-- Utsusemi/Blink absorb: N/A
-- Range: Self
-- Notes: Used only by Omega
-----------------------------------
---@type TMobSkill
local mobskillObject = {}

mobskillObject.onMobSkillCheck = function(target, mob, skill)
    return 0
end

mobskillObject.onMobWeaponSkill = function(target, mob, skill)
    skill:setMsg(invaderXim.mobskills.mobBuffMove(mob, invaderXim.effect.MAGIC_SHIELD, 1, 0, 60))
    invaderXim.mobskills.mobBuffMove(mob, invaderXim.effect.SHOCK_SPIKES, 25, 0, 60)

    return invaderXim.effect.MAGIC_SHIELD
end

return mobskillObject
