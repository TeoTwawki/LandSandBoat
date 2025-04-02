-----------------------------------
-- Filamented Hold
-- Reduces the attack speed of enemies within a fan-shaped area originating from the caster.
-----------------------------------
---@type TMobSkill
local mobskillObject = {}

mobskillObject.onMobSkillCheck = function(target, mob, skill)
    return 0
end

mobskillObject.onMobWeaponSkill = function(target, mob, skill)
    skill:setMsg(invaderXim.mobskills.mobStatusEffectMove(mob, target, invaderXim.effect.SLOW, 2500, 0, 120))

    return invaderXim.effect.SLOW
end

return mobskillObject
