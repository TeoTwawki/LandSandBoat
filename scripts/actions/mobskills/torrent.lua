-----------------------------------
--  Torrent
--  Description: Removes all Equipment
--  Type: Magical Enfeebling
--  Ignore Shadows, Single target
-----------------------------------
---@type TMobSkill
local mobskillObject = {}

mobskillObject.onMobSkillCheck = function(target, mob, skill)
    return 0
end

mobskillObject.onMobWeaponSkill = function(target, mob, skill)
    for i = invaderXim.slot.MAIN, invaderXim.slot.BACK do
        target:unequipItem(i)
    end

    skill:setMsg(invaderXim.msg.basic.NONE)
    return 0
end

return mobskillObject
