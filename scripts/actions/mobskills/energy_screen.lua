-----------------------------------
-- Energy_Screen
-- Description: Invincible
-----------------------------------
---@type TMobSkill
local mobskillObject = {}

mobskillObject.onMobSkillCheck = function(target, mob, skill)
    if mob:getLocalVar('citadelBuster') == 0 then
        return 0
    end

    return 1
end

mobskillObject.onMobWeaponSkill = function(target, mob, skill)
    skill:setMsg(invaderXim.mobskills.mobBuffMove(mob, invaderXim.effect.PHYSICAL_SHIELD, 1, 0, 60))

    return invaderXim.effect.PHYSICAL_SHIELD
end

return mobskillObject
