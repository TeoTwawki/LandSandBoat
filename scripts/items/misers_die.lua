-----------------------------------
-- ID: 5503
-- Miser's Die
-- Teaches the job ability Miser's Roll
-----------------------------------
---@type TItem
local itemObject = {}

itemObject.onItemCheck = function(target, item, param, caster)
    return target:canLearnAbility(invaderXim.jobAbility.MISERS_ROLL)
end

itemObject.onItemUse = function(target)
    target:addLearnedAbility(invaderXim.jobAbility.MISERS_ROLL)
end

return itemObject
