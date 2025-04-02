-----------------------------------
-- ID: 4617
-- Scroll of Curaga III
-- Teaches the white magic Curaga III
-----------------------------------
---@type TItem
local itemObject = {}

itemObject.onItemCheck = function(target, item, param, caster)
    return target:canLearnSpell(invaderXim.magic.spell.CURAGA_III)
end

itemObject.onItemUse = function(target)
    target:addSpell(invaderXim.magic.spell.CURAGA_III)
end

return itemObject
