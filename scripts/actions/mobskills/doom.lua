-----------------------------------
-- Doom
-- Description: Inflicts Doom upon an enemy.
-- Type: Magical (Dark)
-----------------------------------
---@type TMobSkill
local mobskillObject = {}

mobskillObject.onMobSkillCheck = function(target, mob, skill)
    return 0
end

mobskillObject.onMobWeaponSkill = function(target, mob, skill)
    skill:setMsg(invaderXim.mobskills.mobStatusEffectMove(mob, target, invaderXim.effect.DOOM, 10, 3, 30))

    return invaderXim.effect.DOOM
end

return mobskillObject
