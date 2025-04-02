-----------------------------------
-- Ability: Berserk-ruf
-----------------------------------
---@type TMobSkill
local mobskillObject = {}

mobskillObject.onMobSkillCheck = function(target, mob, skill)
    return 0
end

mobskillObject.onMobWeaponSkill = function(target, mob, skill)
    skill:setMsg(invaderXim.mobskills.mobBuffMove(mob, invaderXim.effect.WARCRY, 25, 0, 180))

    return invaderXim.effect.WARCRY
end

return mobskillObject
