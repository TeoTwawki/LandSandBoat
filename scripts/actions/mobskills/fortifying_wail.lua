-----------------------------------
-- Fortifying Wail
-- Family: Qutrub
-- Description: Let's out a wail that applies Protect to itself and nearby allies.
-- Type: Enhancing
-- Can be dispelled: Yes
-- Utsusemi/Blink absorb: N/A
-- Range: AoE
-----------------------------------
---@type TMobSkill
local mobskillObject = {}

mobskillObject.onMobSkillCheck = function(target, mob, skill)
    return 0
end

mobskillObject.onMobWeaponSkill = function(target, mob, skill)
    local power = 60
    local duration = invaderXim.mobskills.calculateDuration(mob:getTP(), 120, 180)
    skill:setMsg(invaderXim.mobskills.mobBuffMove(mob, invaderXim.effect.PROTECT, power, 0, duration))

    return invaderXim.effect.PROTECT
end

return mobskillObject
