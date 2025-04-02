-----------------------------------
-- Goblin Dice
-- Description: AoE curse.
-----------------------------------
---@type TMobSkill
local mobskillObject = {}

mobskillObject.onMobSkillCheck = function(target, mob, skill)
    return 0
end

mobskillObject.onMobWeaponSkill = function(target, mob, skill)
    skill:setMsg(invaderXim.mobskills.mobStatusEffectMove(mob, target, invaderXim.effect.CURSE_I, 30, 0, 300))

    return invaderXim.effect.CURSE_I
end

return mobskillObject
