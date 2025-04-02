-----------------------------------
-- Hyper Potion - Restores 250 HP.
-----------------------------------
---@type TMobSkill
local mobskillObject = {}

mobskillObject.onMobSkillCheck = function(target, mob, skill)
    return 0
end

mobskillObject.onMobWeaponSkill = function(target, mob, skill)
    skill:setMsg(invaderXim.msg.basic.SELF_HEAL)
    return invaderXim.mobskills.mobHealMove(target, 100)
end

return mobskillObject
