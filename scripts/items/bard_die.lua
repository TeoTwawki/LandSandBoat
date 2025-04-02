-----------------------------------
-- ID: 5486
-- Bard Die
-- Teaches the job ability Choral Roll
-----------------------------------
---@type TItem
local itemObject = {}

itemObject.onItemCheck = function(target, item, param, caster)
    return target:canLearnAbility(invaderXim.jobAbility.CHORAL_ROLL)
end

itemObject.onItemUse = function(target)
    target:addLearnedAbility(invaderXim.jobAbility.CHORAL_ROLL)
end

return itemObject
