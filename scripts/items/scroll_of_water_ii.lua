-----------------------------------
-- ID: 4778
-- Scroll of Water II
-- Teaches the black magic Water II
-----------------------------------
---@type TItem
local itemObject = {}

itemObject.onItemCheck = function(target, item, param, caster)
    return target:canLearnSpell(invaderXim.magic.spell.WATER_II)
end

itemObject.onItemUse = function(target)
    target:addSpell(invaderXim.magic.spell.WATER_II)
end

return itemObject
