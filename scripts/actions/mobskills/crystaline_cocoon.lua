-----------------------------------
-- Crystaline Cocoon
-- Family: Aern
-- Type: Enhancing
-- Can be dispelled: Yes
-- Utsusemi/Blink absorb: N/A
-- Range: Self
-----------------------------------
---@type TMobSkill
local mobskillObject = {}

mobskillObject.onMobSkillCheck = function(target, mob, skill)
    return 0
end

mobskillObject.onMobWeaponSkill = function(target, mob, skill)
    skill:setMsg(invaderXim.mobskills.mobBuffMove(mob, invaderXim.effect.PROTECT, 50, 0, 300))
    invaderXim.mobskills.mobBuffMove(mob, invaderXim.effect.SHELL, 2000, 0, 300)

    return invaderXim.effect.PROTECT
end

return mobskillObject
