-----------------------------------
-- ID: 4616
-- Scroll of Curaga II
-- Teaches the white magic Curaga II
-----------------------------------
---@type TItem
local itemObject = {}

itemObject.onItemCheck = function(target, item, param, caster)
    return target:canLearnSpell(invaderXim.magic.spell.CURAGA_II)
end

itemObject.onItemUse = function(target)
    target:addSpell(invaderXim.magic.spell.CURAGA_II)
end

return itemObject
