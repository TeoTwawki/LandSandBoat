-----------------------------------
-- Rage
--
-- Description: The Ram goes berserk
-- Type: Enhancing
-- Utsusemi/Blink absorb: N/A
-- Range: Self
-- Notes: 25% Attack UP, -25% defense DOWN
-----------------------------------
---@type TMobSkill
local mobskillObject = {}

mobskillObject.onMobSkillCheck = function(target, mob, skill)
    return 0
end

mobskillObject.onMobWeaponSkill = function(target, mob, skill)
    skill:setMsg(invaderXim.mobskills.mobBuffMove(mob, invaderXim.effect.BERSERK, 1, 0, 60))

    return invaderXim.effect.BERSERK
end

return mobskillObject
