-----------------------------------
-- ID: 5051
-- Scroll of Water Carol
-- Teaches the song Water Carol
-----------------------------------
---@type TItem
local itemObject = {}

itemObject.onItemCheck = function(target, item, param, caster)
    return target:canLearnSpell(invaderXim.magic.spell.WATER_CAROL)
end

itemObject.onItemUse = function(target)
    target:addSpell(invaderXim.magic.spell.WATER_CAROL)
end

return itemObject
