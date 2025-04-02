-----------------------------------
-- ID: 4679
-- Scroll of Barwatera
-- Teaches the white magic Barwatera
-----------------------------------
---@type TItem
local itemObject = {}

itemObject.onItemCheck = function(target, item, param, caster)
    return target:canLearnSpell(invaderXim.magic.spell.BARWATERA)
end

itemObject.onItemUse = function(target)
    target:addSpell(invaderXim.magic.spell.BARWATERA)
end

return itemObject
