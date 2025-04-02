-----------------------------------
-- ID: 104
-- Courser's Die
-- Teaches the job ability Coursers Roll
-----------------------------------
---@type TItem
local itemObject = {}

itemObject.onItemCheck = function(target, item, param, caster)
    return target:canLearnAbility(invaderXim.jobAbility.COURSERS_ROLL)
end

itemObject.onItemUse = function(target)
    target:addLearnedAbility(invaderXim.jobAbility.COURSERS_ROLL)
end

return itemObject
