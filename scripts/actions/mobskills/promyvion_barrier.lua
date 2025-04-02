-----------------------------------
-- Promyvion Barrier
-- Enhances defense.
-----------------------------------
---@type TMobSkill
local mobskillObject = {}

mobskillObject.onMobSkillCheck = function(target, mob, skill)
    return 0
end

mobskillObject.onMobWeaponSkill = function(target, mob, skill)
    skill:setMsg(invaderXim.mobskills.mobBuffMove(mob, invaderXim.effect.DEFENSE_BOOST, 17.5, 0, 300))

    return invaderXim.effect.DEFENSE_BOOST
end

return mobskillObject
