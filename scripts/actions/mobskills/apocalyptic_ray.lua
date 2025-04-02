-----------------------------------
-- Apocalyptic Ray
-- Only used by Eldertaur
-- Description: Inflicts Doom upon an enemy. This is not a gaze attack. Turing away will not prevent doom.
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
