-----------------------------------
-- Royal Savior
-- Grants effect of Protect
-----------------------------------
---@type TMobSkill
local mobskillObject = {}

mobskillObject.onMobSkillCheck = function(target, mob, skill)
    return 0
end

mobskillObject.onMobWeaponSkill = function(target, mob, skill)
    skill:setMsg(invaderXim.mobskills.mobBuffMove(mob, invaderXim.effect.PROTECT, 175, 0, 300))

    return invaderXim.effect.PROTECT
end

return mobskillObject
