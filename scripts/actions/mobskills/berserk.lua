-----------------------------------
-- Berserk
-- Berserk Ability.
-----------------------------------
---@type TMobSkill
local mobskillObject = {}

mobskillObject.onMobSkillCheck = function(target, mob, skill)
    return 0
end

mobskillObject.onMobWeaponSkill = function(target, mob, skill)
    skill:setMsg(invaderXim.mobskills.mobBuffMove(mob, invaderXim.effect.BERSERK, 50, 0, 180))
    return invaderXim.effect.BERSERK
end

return mobskillObject
