-----------------------------------
-- Battery Charge
-- Description: Gradually restores MP.
-- Type: Magical (Light)
-----------------------------------
---@type TMobSkill
local mobskillObject = {}

mobskillObject.onMobSkillCheck = function(target, mob, skill)
    return 0
end

mobskillObject.onMobWeaponSkill = function(target, mob, skill)
    skill:setMsg(invaderXim.mobskills.mobBuffMove(mob, invaderXim.effect.REFRESH, 3, 3, 300))

    return invaderXim.effect.REFRESH
end

return mobskillObject
