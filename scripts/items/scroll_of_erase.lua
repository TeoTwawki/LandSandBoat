-----------------------------------
-- ID: 4751
-- Scroll of Erase
-- Teaches the white magic Erase
-----------------------------------
---@type TItem
local itemObject = {}

itemObject.onItemCheck = function(target, item, param, caster)
    return target:canLearnSpell(invaderXim.magic.spell.ERASE)
end

itemObject.onItemUse = function(target)
    target:addSpell(invaderXim.magic.spell.ERASE)
end

return itemObject
