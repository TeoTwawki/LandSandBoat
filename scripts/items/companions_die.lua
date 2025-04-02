-----------------------------------
-- ID: 5504
-- Companions Die
-- Teaches the job ability Companions Roll
-----------------------------------
---@type TItem
local itemObject = {}

itemObject.onItemCheck = function(target, item, param, caster)
    return target:canLearnAbility(invaderXim.jobAbility.COMPANIONS_ROLL)
end

itemObject.onItemUse = function(target)
    target:addLearnedAbility(invaderXim.jobAbility.COMPANIONS_ROLL)
end

return itemObject
