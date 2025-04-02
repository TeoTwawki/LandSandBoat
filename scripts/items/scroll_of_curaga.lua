-----------------------------------
-- ID: 4615
-- Scroll of Curaga
-- Teaches the white magic Curaga
-----------------------------------
---@type TItem
local itemObject = {}

itemObject.onItemCheck = function(target, item, param, caster)
    return target:canLearnSpell(invaderXim.magic.spell.CURAGA)
end

itemObject.onItemUse = function(target)
    target:addSpell(invaderXim.magic.spell.CURAGA)
end

return itemObject
