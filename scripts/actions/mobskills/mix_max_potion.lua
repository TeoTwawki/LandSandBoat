-----------------------------------
-- Mix: Max Potion - Restores 700 HP.
-- Note the subtle name difference from 'Max Potion'.
-- This feels like a localization error otherwise.
-----------------------------------
---@type TMobSkill
local mobskillObject = {}

mobskillObject.onMobSkillCheck = function(target, mob, skill)
    return 0
end

mobskillObject.onMobWeaponSkill = function(target, mob, skill)
    skill:setMsg(invaderXim.msg.basic.SELF_HEAL)
    return invaderXim.mobskills.mobHealMove(target, 700)
end

return mobskillObject
