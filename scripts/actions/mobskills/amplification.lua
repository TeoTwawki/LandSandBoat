-----------------------------------
-- Amplification
-- Enhances Magic Attack and Magic Defense. Bonus stacks when used by mobs.
-----------------------------------
---@type TMobSkill
local mobskillObject = {}

mobskillObject.onMobSkillCheck = function(target, mob, skill)
    return 0
end

mobskillObject.onMobWeaponSkill = function(target, mob, skill)
    skill:setMsg(invaderXim.mobskills.mobBuffMove(mob, invaderXim.effect.MAGIC_DEF_BOOST, 30, 0, 120))
    invaderXim.mobskills.mobBuffMove(mob, invaderXim.effect.MAGIC_ATK_BOOST, 30, 0, 120)

    return invaderXim.effect.MAGIC_DEF_BOOST
end

return mobskillObject
