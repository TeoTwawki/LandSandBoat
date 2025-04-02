-----------------------------------
--  Rising Swell
--  Description: Strips all players in an area of effect of all equipment.
--  Type: Magical Enfeebling
-----------------------------------
---@type TMobSkill
local mobskillObject = {}

mobskillObject.onMobSkillCheck = function(target, mob, skill)
    return 0
end

mobskillObject.onMobWeaponSkill = function(target, mob, skill)
    if target:isPC() then
        for i = invaderXim.slot.MAIN, invaderXim.slot.BACK do
            target:unequipItem(i)
        end
    end

    skill:setMsg(invaderXim.msg.basic.NONE)
    return 0
end

return mobskillObject
