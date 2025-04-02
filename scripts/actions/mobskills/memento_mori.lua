-----------------------------------
-- Memento Mori
-- Enhances Magic Attack.
-----------------------------------
---@type TMobSkill
local mobskillObject = {}

mobskillObject.onMobSkillCheck = function(target, mob, skill)
    return 0
end

mobskillObject.onMobWeaponSkill = function(target, mob, skill)
    skill:setMsg(invaderXim.mobskills.mobBuffMove(mob, invaderXim.effect.MAGIC_ATK_BOOST, 20, 0, 300))

    return invaderXim.effect.MAGIC_ATK_BOOST
end

return mobskillObject
