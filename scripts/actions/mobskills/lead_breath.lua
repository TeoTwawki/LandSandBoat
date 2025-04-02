-----------------------------------
-- Lead Breath
-- Description: Weighs down players.
-----------------------------------
---@type TMobSkill
local mobskillObject = {}

mobskillObject.onMobSkillCheck = function(target, mob, skill)
    return 0
end

mobskillObject.onMobWeaponSkill = function(target, mob, skill)
    skill:setMsg(invaderXim.mobskills.mobStatusEffectMove(mob, target, invaderXim.effect.WEIGHT, 50, 0, 300))

    return invaderXim.effect.WEIGHT
end

return mobskillObject
