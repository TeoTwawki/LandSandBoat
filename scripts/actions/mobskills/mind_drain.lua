-----------------------------------
-- Mind Drain
-- Steals mnd from target
-----------------------------------
---@type TMobSkill
local mobskillObject = {}

mobskillObject.onMobSkillCheck = function(target, mob, skill)
    return 0
end

mobskillObject.onMobWeaponSkill = function(target, mob, skill)
    skill:setMsg(invaderXim.mobskills.mobStatusEffectMove(mob, target, invaderXim.effect.MND_DOWN, 10, 3, 120))

    return invaderXim.effect.MND_DOWN
end

return mobskillObject
