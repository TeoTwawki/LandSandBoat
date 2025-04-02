-----------------------------------
-- Petrifactive Breath
-- Description: Petrifies a single target.
-- Type: Breath
-- Utsusemi/Blink absorb: Ignores shadows
-- Range: Unknown
-----------------------------------
---@type TMobSkill
local mobskillObject = {}

mobskillObject.onMobSkillCheck = function(target, mob, skill)
    return 0
end

mobskillObject.onMobWeaponSkill = function(target, mob, skill)
    skill:setMsg(invaderXim.mobskills.mobStatusEffectMove(mob, target, invaderXim.effect.PETRIFICATION, 1, 0, math.random(15, 45)))

    return invaderXim.effect.PETRIFICATION
end

return mobskillObject
