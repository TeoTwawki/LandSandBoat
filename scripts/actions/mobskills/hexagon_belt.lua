-----------------------------------
-- Hexagon Belt
-- Enhances defense by 20%.
-----------------------------------
---@type TMobSkill
local mobskillObject = {}

mobskillObject.onMobSkillCheck = function(target, mob, skill)
    return 0
end

mobskillObject.onMobWeaponSkill = function(target, mob, skill)
    skill:setMsg(invaderXim.mobskills.mobBuffMove(mob, invaderXim.effect.DEFENSE_BOOST, 20, 0, 120))

    return invaderXim.effect.DEFENSE_BOOST
end

return mobskillObject
