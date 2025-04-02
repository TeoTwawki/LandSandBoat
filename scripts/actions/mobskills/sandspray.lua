-----------------------------------
-- Sandspray
-- Family: Qiqurn
-- Description: Blinds enemies within a fan-shaped area originating from the user.
-- Type: Magical
-- Utsusemi/Blink absorb: Ignores shadows
-- Range: Unknown
-----------------------------------
---@type TMobSkill
local mobskillObject = {}

mobskillObject.onMobSkillCheck = function(target, mob, skill)
    return 0
end

mobskillObject.onMobWeaponSkill = function(target, mob, skill)
    local power = 25
    local duration = 150

    skill:setMsg(invaderXim.mobskills.mobStatusEffectMove(mob, target, invaderXim.effect.BLINDNESS, power, 0, duration))

    return invaderXim.effect.BLINDNESS
end

return mobskillObject
