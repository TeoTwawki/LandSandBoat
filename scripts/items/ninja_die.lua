-----------------------------------
-- ID: 5489
-- Ninja Die
-- Teaches the job ability Ninja Roll
-----------------------------------
---@type TItem
local itemObject = {}

itemObject.onItemCheck = function(target, item, param, caster)
    return target:canLearnAbility(invaderXim.jobAbility.NINJA_ROLL)
end

itemObject.onItemUse = function(target)
    target:addLearnedAbility(invaderXim.jobAbility.NINJA_ROLL)
end

return itemObject
