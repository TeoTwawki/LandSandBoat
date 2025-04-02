-----------------------------------
-- Spring Breeze
-- Description: AoE TP-Reduction and Sleep invaderXim.effect.
-----------------------------------
---@type TMobSkill
local mobskillObject = {}

mobskillObject.onMobSkillCheck = function(target, mob, skill)
    return 0
end

mobskillObject.onMobWeaponSkill = function(target, mob, skill)
    skill:setMsg(invaderXim.mobskills.mobStatusEffectMove(mob, target, invaderXim.effect.SLEEP_I, 1, 0, 20))
    target:setTP(target:getTP() * 0.5)

    return invaderXim.effect.SLEEP_I
end

return mobskillObject
