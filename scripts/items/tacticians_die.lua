-----------------------------------
-- ID: 5501
-- Tactician's Die
-- Teaches the job ability Tactician's Roll
-----------------------------------
---@type TItem
local itemObject = {}

itemObject.onItemCheck = function(target, item, param, caster)
    return target:canLearnAbility(invaderXim.jobAbility.TACTICIANS_ROLL)
end

itemObject.onItemUse = function(target)
    target:addLearnedAbility(invaderXim.jobAbility.TACTICIANS_ROLL)
end

return itemObject
