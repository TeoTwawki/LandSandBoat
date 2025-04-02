-----------------------------------
-- ID: 5482
-- Thief Die
-- Teaches the job ability Rogue's Roll
-----------------------------------
---@type TItem
local itemObject = {}

itemObject.onItemCheck = function(target, item, param, caster)
    return target:canLearnAbility(invaderXim.jobAbility.ROGUES_ROLL)
end

itemObject.onItemUse = function(target)
    target:addLearnedAbility(invaderXim.jobAbility.ROGUES_ROLL)
end

return itemObject
