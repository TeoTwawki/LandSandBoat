-----------------------------------
-- ID: 5498
-- Casters Die
-- Teaches the job ability Casters Roll
-----------------------------------
---@type TItem
local itemObject = {}

itemObject.onItemCheck = function(target, item, param, caster)
    return target:canLearnAbility(invaderXim.jobAbility.CASTERS_ROLL)
end

itemObject.onItemUse = function(target)
    target:addLearnedAbility(invaderXim.jobAbility.CASTERS_ROLL)
end

return itemObject
