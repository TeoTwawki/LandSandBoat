-----------------------------------
-- ID: 4637
-- Scroll of Banish II
-- Teaches the white magic Banish II
-----------------------------------
---@type TItem
local itemObject = {}

itemObject.onItemCheck = function(target, item, param, caster)
    return target:canLearnSpell(invaderXim.magic.spell.BANISH_II)
end

itemObject.onItemUse = function(target)
    target:addSpell(invaderXim.magic.spell.BANISH_II)
end

return itemObject
