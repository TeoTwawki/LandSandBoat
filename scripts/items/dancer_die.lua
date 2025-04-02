-----------------------------------
-- ID: 5495
-- Dancer Die
-- Teaches the job ability Dancer's Roll
-----------------------------------
---@type TItem
local itemObject = {}

itemObject.onItemCheck = function(target, item, param, caster)
    return target:canLearnAbility(invaderXim.jobAbility.DANCERS_ROLL)
end

itemObject.onItemUse = function(target)
    target:addLearnedAbility(invaderXim.jobAbility.DANCERS_ROLL)
end

return itemObject
