-----------------------------------
-- Palsy Pollen
-- Conal paralyze
-- Utsusemi/Blink absorb: Ignores shadows
-- Range: Melee?
-----------------------------------
---@type TMobSkill
local mobskillObject = {}

mobskillObject.onMobSkillCheck = function(target, mob, skill)
    return 0
end

mobskillObject.onMobWeaponSkill = function(target, mob, skill)
    skill:setMsg(invaderXim.mobskills.mobStatusEffectMove(mob, target, invaderXim.effect.PARALYSIS, 30, 0, 60))

    return invaderXim.effect.PARALYSIS
end

return mobskillObject
