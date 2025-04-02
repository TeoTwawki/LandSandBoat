-----------------------------------
-- ID: 4823
-- Scroll of Flood II
-- Teaches the black magic Flood II
-----------------------------------
---@type TItem
local itemObject = {}

itemObject.onItemCheck = function(target, item, param, caster)
    return target:canLearnSpell(invaderXim.magic.spell.FLOOD_II)
end

itemObject.onItemUse = function(target)
    target:addSpell(invaderXim.magic.spell.FLOOD_II)
end

return itemObject
