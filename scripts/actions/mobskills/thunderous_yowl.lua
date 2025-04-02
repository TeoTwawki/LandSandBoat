-----------------------------------
-- Thunderous_Yowl
-- Emits a booming cry, inflicting curse and plague
-----------------------------------
---@type TMobSkill
local mobskillObject = {}

mobskillObject.onMobSkillCheck = function(target, mob, skill)
    return 0
end

mobskillObject.onMobWeaponSkill = function(target, mob, skill)
    invaderXim.mobskills.mobStatusEffectMove(mob, target, invaderXim.effect.PLAGUE, 5, 3, 60)
    skill:setMsg(invaderXim.mobskills.mobStatusEffectMove(mob, target, invaderXim.effect.CURSE_I, 25, 0, 60))

    return invaderXim.effect.CURSE_I
end

return mobskillObject
