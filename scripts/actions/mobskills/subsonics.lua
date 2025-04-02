-----------------------------------
-- Subsonics
-- Lower defense
-----------------------------------
---@type TMobSkill
local mobskillObject = {}

mobskillObject.onMobSkillCheck = function(target, mob, skill)
    if mob:isMobType(invaderXim.mobType.NOTORIOUS) then
        return 0
    end

    return 1
end

mobskillObject.onMobWeaponSkill = function(target, mob, skill)
    skill:setMsg(invaderXim.mobskills.mobStatusEffectMove(mob, target, invaderXim.effect.DEFENSE_DOWN, 25, 0, 180))

    return invaderXim.effect.DEFENSE_DOWN
end

return mobskillObject
