-----------------------------------
-- Chainspell
-----------------------------------
---@type TMobSkill
local mobskillObject = {}

mobskillObject.onMobSkillCheck = function(target, mob, skill)
    return 0
end

mobskillObject.onMobWeaponSkill = function(target, mob, skill)
    invaderXim.mobskills.mobBuffMove(mob, invaderXim.effect.CHAINSPELL, 1, 0, 60)

    skill:setMsg(invaderXim.msg.basic.USES)

    return invaderXim.effect.CHAINSPELL
end

return mobskillObject
