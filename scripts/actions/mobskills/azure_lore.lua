-----------------------------------
-- Azure Lore
-----------------------------------
---@type TMobSkill
local mobskillObject = {}

mobskillObject.onMobSkillCheck = function(target, mob, skill)
    return 0
end

mobskillObject.onMobWeaponSkill = function(target, mob, skill)
    invaderXim.mobskills.mobBuffMove(mob, invaderXim.effect.AZURE_LORE, 1, 0, 45)

    skill:setMsg(invaderXim.msg.basic.USES)

    return invaderXim.effect.AZURE_LORE
end

return mobskillObject
