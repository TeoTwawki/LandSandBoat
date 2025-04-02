-----------------------------------
-- Demonic Howl
-- 10' AoE +50%. Slow (weaker than Haste)
-----------------------------------
---@type TMobSkill
local mobskillObject = {}

mobskillObject.onMobSkillCheck = function(target, mob, skill)
    return 0
end

mobskillObject.onMobWeaponSkill = function(target, mob, skill)
    skill:setMsg(invaderXim.mobskills.mobStatusEffectMove(mob, target, invaderXim.effect.SLOW, 1250, 0, 120))

    return invaderXim.effect.SLOW
end

return mobskillObject
