-----------------------------------
-- ID: 5490
-- Dragoon Die
-- Teaches the job ability Drachen Roll
-----------------------------------
---@type TItem
local itemObject = {}

itemObject.onItemCheck = function(target, item, param, caster)
    return target:canLearnAbility(invaderXim.jobAbility.DRACHEN_ROLL)
end

itemObject.onItemUse = function(target)
    target:addLearnedAbility(invaderXim.jobAbility.DRACHEN_ROLL)
end

return itemObject
