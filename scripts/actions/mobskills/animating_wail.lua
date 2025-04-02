-----------------------------------
-- Animating Wail
-- Family: Qutrub
-- Description: Let's out a wail that applies Haste to itself and nearby allies.
-- Type: Enhancing
-- Can be dispelled: Yes
-- Utsusemi/Blink absorb: N/A
-- Range: Self
-----------------------------------
---@type TMobSkill
local mobskillObject = {}

mobskillObject.onMobSkillCheck = function(target, mob, skill)
    return 0
end

mobskillObject.onMobWeaponSkill = function(target, mob, skill)
    local power    = 3000
    local duration = invaderXim.mobskills.calculateDuration(mob:getTP(), 90, 120)
    skill:setMsg(invaderXim.mobskills.mobBuffMove(mob, invaderXim.effect.HASTE, power, 0, duration))

    return invaderXim.effect.HASTE
end

return mobskillObject
