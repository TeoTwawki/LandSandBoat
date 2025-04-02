-----------------------------------
-- ID: 5492
-- Blue Mage Die
-- Teaches the job ability Magus's Roll
-----------------------------------
---@type TItem
local itemObject = {}

itemObject.onItemCheck = function(target, item, param, caster)
    return target:canLearnAbility(invaderXim.jobAbility.MAGUSS_ROLL)
end

itemObject.onItemUse = function(target)
    target:addLearnedAbility(invaderXim.jobAbility.MAGUSS_ROLL)
end

return itemObject
