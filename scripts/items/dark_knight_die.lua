-----------------------------------
-- ID: 5484
-- Dark Knight Die
-- Teaches the job ability Chaos Roll
-----------------------------------
---@type TItem
local itemObject = {}

itemObject.onItemCheck = function(target, item, param, caster)
    return target:canLearnAbility(invaderXim.jobAbility.CHAOS_ROLL)
end

itemObject.onItemUse = function(target)
    target:addLearnedAbility(invaderXim.jobAbility.CHAOS_ROLL)
end

return itemObject
