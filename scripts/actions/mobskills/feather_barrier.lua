-----------------------------------
-- Feather Barrier
--
-- Description: Enhances evasion.
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
    skill:setMsg(invaderXim.mobskills.mobBuffMove(mob, invaderXim.effect.EVASION_BOOST, 20, 0, 120))

    return invaderXim.effect.EVASION_BOOST
end

return mobskillObject
