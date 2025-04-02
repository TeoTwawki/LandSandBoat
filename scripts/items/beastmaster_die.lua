-----------------------------------
-- ID: 5485
-- Beastmaster Die
-- Teaches the job ability Beast Roll
-----------------------------------
---@type TItem
local itemObject = {}

itemObject.onItemCheck = function(target, item, param, caster)
    return target:canLearnAbility(invaderXim.jobAbility.BEAST_ROLL)
end

itemObject.onItemUse = function(target)
    target:addLearnedAbility(invaderXim.jobAbility.BEAST_ROLL)
end

return itemObject
