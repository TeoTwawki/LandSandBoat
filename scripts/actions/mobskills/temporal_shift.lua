-----------------------------------
-- Temporal Shift
-- Family: Hpemde
-- Description: Enemies within range are temporarily prevented from acting.
-- Type: Magical
-- Utsusemi/Blink absorb: Ignores shadows
-- Range: 15 yalms
-----------------------------------
---@type TMobSkill
local mobskillObject = {}

mobskillObject.onMobSkillCheck = function(target, mob, skill)
    return 0
end

mobskillObject.onMobWeaponSkill = function(target, mob, skill)
    skill:setMsg(invaderXim.mobskills.mobStatusEffectMove(mob, target, invaderXim.effect.STUN, 1, 0, 5))

    return invaderXim.effect.STUN
end

return mobskillObject
