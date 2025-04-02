-----------------------------------
-- Numbing Noise
-- Description: Creates an unsettling sound. Additional effect: Stun
-- Type: Physical
-- Utsusemi/Blink absorb: Ignore
-- Range: 10' cone
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
