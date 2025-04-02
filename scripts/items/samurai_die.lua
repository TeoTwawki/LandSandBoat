-----------------------------------
-- ID: 5488
-- Samurai Die
-- Teaches the job ability Samurai Roll
-----------------------------------
---@type TItem
local itemObject = {}

itemObject.onItemCheck = function(target, item, param, caster)
    return target:canLearnAbility(invaderXim.jobAbility.SAMURAI_ROLL)
end

itemObject.onItemUse = function(target)
    target:addLearnedAbility(invaderXim.jobAbility.SAMURAI_ROLL)
end

return itemObject
