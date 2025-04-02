-----------------------------------
-- ID: 5505
-- Avenger's Die
-- Teaches the job ability Avengers Roll
-----------------------------------
---@type TItem
local itemObject = {}

itemObject.onItemCheck = function(target, item, param, caster)
    return target:canLearnAbility(invaderXim.jobAbility.AVENGERS_ROLL)
end

itemObject.onItemUse = function(target)
    target:addLearnedAbility(invaderXim.jobAbility.AVENGERS_ROLL)
end

return itemObject
