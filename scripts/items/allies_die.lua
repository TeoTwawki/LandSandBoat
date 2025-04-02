-----------------------------------
-- ID: 5502
-- Allies' Die
-- Teaches the job ability Allies Roll
-----------------------------------
---@type TItem
local itemObject = {}

itemObject.onItemCheck = function(target, item, param, caster)
    return target:canLearnAbility(invaderXim.jobAbility.ALLIES_ROLL)
end

itemObject.onItemUse = function(target)
    target:addLearnedAbility(invaderXim.jobAbility.ALLIES_ROLL)
end

return itemObject
