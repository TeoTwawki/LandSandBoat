-----------------------------------
-- Feeble Bleat
-- Emits a unnerving bleat that paralyzes down players in range.
-----------------------------------
---@type TMobSkill
local mobskillObject = {}

mobskillObject.onMobSkillCheck = function(target, mob, skill)
    return 0
end

mobskillObject.onMobWeaponSkill = function(target, mob, skill)
    skill:setMsg(invaderXim.mobskills.mobStatusEffectMove(mob, target, invaderXim.effect.PARALYSIS, 25, 0, 120))

    return invaderXim.effect.PARALYSIS
end

return mobskillObject
