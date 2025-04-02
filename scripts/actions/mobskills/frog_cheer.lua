-----------------------------------
-- Frog Cheer
-- Increases magical attack and grants Elemental Seal effect
-----------------------------------
---@type TMobSkill
local mobskillObject = {}

mobskillObject.onMobSkillCheck = function(target, mob, skill)
    return 0
end

mobskillObject.onMobWeaponSkill = function(target, mob, skill)
    skill:setMsg(invaderXim.mobskills.mobBuffMove(target, invaderXim.effect.MAGIC_ATK_BOOST, 25, 0, 300))
    target:addStatusEffect(invaderXim.effect.ELEMENTAL_SEAL, 1, 0, 60)

    return invaderXim.effect.MAGIC_ATK_BOOST
end

return mobskillObject
