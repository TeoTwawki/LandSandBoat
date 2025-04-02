-----------------------------------
-- ID: 6368
-- Geomancer Die
-- Teaches the job ability Naturalists Roll
-----------------------------------
---@type TItem
local itemObject = {}

itemObject.onItemCheck = function(target, item, param, caster)
    return target:canLearnAbility(invaderXim.jobAbility.NATURALISTS_ROLL)
end

itemObject.onItemUse = function(target)
    target:addLearnedAbility(invaderXim.jobAbility.NATURALISTS_ROLL)
end

return itemObject
