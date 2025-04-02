-----------------------------------
-- Kibosh
-- Family: Qiqurn
-- Description: Inflicts amnesia on a single target.
-- Type: Magical
-- Utsusemi/Blink absorb: Ignores shadows
-- Range: Melee
-----------------------------------
---@type TMobSkill
local mobskillObject = {}

mobskillObject.onMobSkillCheck = function(target, mob, skill)
    return 0
end

mobskillObject.onMobWeaponSkill = function(target, mob, skill)
    local power = 1
    local duration = 60

    skill:setMsg(invaderXim.mobskills.mobStatusEffectMove(mob, target, invaderXim.effect.AMNESIA, power, 0, duration))

    return invaderXim.effect.AMNESIA
end

return mobskillObject
