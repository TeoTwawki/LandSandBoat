-----------------------------------
-- Sigh
--
-- Description: Self Evasion Boost. Extremely potent, but quickly decays over time.
-- Type: Enhancing
-- Utsusemi/Blink absorb: N/A
-- Range: Self
-- Notes: Very sharp evasion increase.
-----------------------------------
---@type TMobSkill
local mobskillObject = {}

mobskillObject.onMobSkillCheck = function(target, mob, skill)
    return 0
end

mobskillObject.onMobWeaponSkill = function(target, mob, skill)
    skill:setMsg(invaderXim.mobskills.mobBuffMove(mob, invaderXim.effect.EVASION_BOOST, 50, 0, 30))

    return invaderXim.effect.EVASION_BOOST
end

return mobskillObject
