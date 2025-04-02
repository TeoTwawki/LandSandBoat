-----------------------------------
-- Sheep Bleat
-- Emits a unnerving bleat that slows down players in range.
-- Only used by Nightmare Sheep from Dynamis-Valkurm
-----------------------------------
---@type TMobSkill
local mobskillObject = {}

mobskillObject.onMobSkillCheck = function(target, mob, skill)
    return 1 -- The mob that uses this is not in database yet so returns 1 , when mob is added to game do a check for mob ID and return 0 if it matches nightmare sheep
end

mobskillObject.onMobWeaponSkill = function(target, mob, skill)
    skill:setMsg(invaderXim.mobskills.mobStatusEffectMove(mob, target, invaderXim.effect.SLOW, 1250, 0, 120))

    return invaderXim.effect.SLOW
end

return mobskillObject
