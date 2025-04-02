-----------------------------------
-- ID: 6056
-- Voidstorm Schema
-- Teaches the white magic Voidstorm
-----------------------------------
---@type TItem
local itemObject = {}

itemObject.onItemCheck = function(target, item, param, caster)
    return target:canLearnSpell(invaderXim.magic.spell.VOIDSTORM)
end

itemObject.onItemUse = function(target)
    target:addSpell(invaderXim.magic.spell.VOIDSTORM)
end

return itemObject
