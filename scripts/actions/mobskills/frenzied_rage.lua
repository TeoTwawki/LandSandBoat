-----------------------------------
-- Frenzied Rage
--
-- Description: Attack Boost
-- Type: Enhancing
-- Utsusemi/Blink absorb: N/A
-- Range: Self
-- Notes: 20% Attack Boost.
-----------------------------------
---@type TMobSkill
local mobskillObject = {}

mobskillObject.onMobSkillCheck = function(target, mob, skill)
    return 0
end

mobskillObject.onMobWeaponSkill = function(target, mob, skill)
    local power = 20
    local duration = 120

    skill:setMsg(invaderXim.mobskills.mobBuffMove(mob, invaderXim.effect.ATTACK_BOOST, power, 0, duration))
    return invaderXim.effect.ATTACK_BOOST
end

return mobskillObject
