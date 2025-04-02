-----------------------------------
-- ID: 5493
-- Corsair Die
-- Teaches the job ability Corsair's Roll
-----------------------------------
---@type TItem
local itemObject = {}

itemObject.onItemCheck = function(target, item, param, caster)
    return target:canLearnAbility(invaderXim.jobAbility.CORSAIRS_ROLL)
end

itemObject.onItemUse = function(target)
    target:addLearnedAbility(invaderXim.jobAbility.CORSAIRS_ROLL)
end

return itemObject
