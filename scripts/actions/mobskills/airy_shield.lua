-----------------------------------
-- Airy Shield
--
-- Description: Ranged shield
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
    skill:setMsg(invaderXim.mobskills.mobBuffMove(mob, invaderXim.effect.ARROW_SHIELD, 1, 0, 60))

    return invaderXim.effect.ARROW_SHIELD
end

return mobskillObject
