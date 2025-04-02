-----------------------------------
-- ID: 5479
-- White Mage Die
-- Teaches the job ability Healer's Roll
-----------------------------------
---@type TItem
local itemObject = {}

itemObject.onItemCheck = function(target, item, param, caster)
    return target:canLearnAbility(invaderXim.jobAbility.HEALERS_ROLL)
end

itemObject.onItemUse = function(target)
    target:addLearnedAbility(invaderXim.jobAbility.HEALERS_ROLL)
end

return itemObject
