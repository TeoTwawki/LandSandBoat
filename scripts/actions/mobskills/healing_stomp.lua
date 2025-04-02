-----------------------------------
-- Healing Stomp
--
-- Description: Stomps the ground to apply regeneration.
-- Type: Enhancing
-- Utsusemi/Blink absorb: N/A
-- Range: Self
-- Notes: Only used by notorious monsters.
-----------------------------------
---@type TMobSkill
local mobskillObject = {}

mobskillObject.onMobSkillCheck = function(target, mob, skill)
    return 0
end

mobskillObject.onMobWeaponSkill = function(target, mob, skill)
    skill:setMsg(invaderXim.mobskills.mobBuffMove(mob, invaderXim.effect.REGEN, 25, 3, 180))

    return invaderXim.effect.REGEN
end

return mobskillObject
