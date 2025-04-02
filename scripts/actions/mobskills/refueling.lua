-----------------------------------
-- Refueling
-- Increases attack speed.
-----------------------------------
---@type TMobSkill
local mobskillObject = {}

mobskillObject.onMobSkillCheck = function(target, mob, skill)
    return 0
end

mobskillObject.onMobWeaponSkill = function(target, mob, skill)
    skill:setMsg(invaderXim.mobskills.mobBuffMove(mob, invaderXim.effect.HASTE, 1000, 0, 300))

    return invaderXim.effect.HASTE
end

return mobskillObject
