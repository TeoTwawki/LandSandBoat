-----------------------------------
-- ID: 6052
-- Hailstorm Schema
-- Teaches the white magic Hailstorm
-----------------------------------
---@type TItem
local itemObject = {}

itemObject.onItemCheck = function(target, item, param, caster)
    return target:canLearnSpell(invaderXim.magic.spell.HAILSTORM)
end

itemObject.onItemUse = function(target)
    target:addSpell(invaderXim.magic.spell.HAILSTORM)
end

return itemObject
