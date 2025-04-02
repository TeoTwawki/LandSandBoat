-----------------------------------
--  Wild Oats
--  Description: Additional effect: Vitality Down. Duration of effect varies on TP.
--  Type: Physical (Piercing)
-----------------------------------
---@type TMobSkill
local mobskillObject = {}

mobskillObject.onMobSkillCheck = function(target, mob, skill)
    return 0
end

mobskillObject.onMobWeaponSkill = function(target, mob, skill)
    skill:setMsg(invaderXim.mobskills.mobStatusEffectMove(mob, target, invaderXim.effect.VIT_DOWN, 10, 3, 120))

    return invaderXim.effect.VIT_DOWN
end

return mobskillObject
