-----------------------------------
-- Ululation
-- Paralyzes all enemies in an area of effect.
--
-----------------------------------
---@type TMobSkill
local mobskillObject = {}

mobskillObject.onMobSkillCheck = function(target, mob, skill)
    return 0
end

mobskillObject.onMobWeaponSkill = function(target, mob, skill)
    skill:setMsg(invaderXim.mobskills.mobStatusEffectMove(mob, target, invaderXim.effect.PARALYSIS, math.random(18, 22), 0, 120))

    return invaderXim.effect.PARALYSIS
end

return mobskillObject
