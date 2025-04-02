-----------------------------------
-- Abominable Belch
-- Description: inflicts all targets in an area of effect with silence, paralysis and plague.
-- Radial
-- Ignores Shadows
-----------------------------------
---@type TMobSkill
local mobskillObject = {}

mobskillObject.onMobSkillCheck = function(target, mob, skill)
    return 0
end

mobskillObject.onMobWeaponSkill = function(target, mob, skill)
    local duration = invaderXim.mobskills.calculateDuration(skill:getTP(), 30, 60)

    skill:setMsg(invaderXim.mobskills.mobStatusEffectMove(mob, target, invaderXim.effect.PLAGUE, 10, 3, invaderXim.mobskills.calculateDuration(skill:getTP(), 15, 45)))
    skill:setMsg(invaderXim.mobskills.mobStatusEffectMove(mob, target, invaderXim.effect.SILENCE, 1, 0, duration))
    skill:setMsg(invaderXim.mobskills.mobStatusEffectMove(mob, target, invaderXim.effect.PARALYSIS, 25, 0, duration))

    return invaderXim.effect.PLAGUE
end

return mobskillObject
