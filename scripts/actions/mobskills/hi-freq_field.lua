-----------------------------------
-- Hi-Freq Field
-- Lowers the evasion of enemies in a fan-shaped area of effect.
-----------------------------------
---@type TMobSkill
local mobskillObject = {}

mobskillObject.onMobSkillCheck = function(target, mob, skill)
    return 0
end

mobskillObject.onMobWeaponSkill = function(target, mob, skill)
    skill:setMsg(invaderXim.mobskills.mobStatusEffectMove(mob, target, invaderXim.effect.EVASION_DOWN, 50, 0, 120))

    return invaderXim.effect.EVASION_DOWN
end

return mobskillObject
