-----------------------------------
-- ID: 4699
-- Scroll of Barpetra
-- Teaches the white magic Barpetra
-----------------------------------
---@type TItem
local itemObject = {}

itemObject.onItemCheck = function(target, item, param, caster)
    return target:canLearnSpell(invaderXim.magic.spell.BARPETRA)
end

itemObject.onItemUse = function(target)
    target:addSpell(invaderXim.magic.spell.BARPETRA)
end

return itemObject
