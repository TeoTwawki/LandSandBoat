-----------------------------------
-- Goblin Dice
-- Description: Stun
-- Type: Physical (Blunt)
-----------------------------------
---@type TMobSkill
local mobskillObject = {}

mobskillObject.onMobSkillCheck = function(target, mob, skill)
    return 0
end

mobskillObject.onMobWeaponSkill = function(target, mob, skill)
    skill:setMsg(invaderXim.mobskills.mobStatusEffectMove(mob, target, invaderXim.effect.STUN, 1, 0, 6))

    return invaderXim.effect.STUN
end

return mobskillObject
