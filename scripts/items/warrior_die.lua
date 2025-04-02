-----------------------------------
-- ID: 5477
-- Warrior Die
-- Teaches the job ability Fighter's Roll
-----------------------------------
---@type TItem
local itemObject = {}

itemObject.onItemCheck = function(target, item, param, caster)
    return target:canLearnAbility(invaderXim.jobAbility.FIGHTERS_ROLL)
end

itemObject.onItemUse = function(target)
    target:addLearnedAbility(invaderXim.jobAbility.FIGHTERS_ROLL)
end

return itemObject
