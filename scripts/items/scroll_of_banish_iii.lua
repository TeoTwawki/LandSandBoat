-----------------------------------
-- ID: 4638
-- Scroll of Banish III
-- Teaches the white magic Banish III
-----------------------------------
---@type TItem
local itemObject = {}

itemObject.onItemCheck = function(target, item, param, caster)
    return target:canLearnSpell(invaderXim.magic.spell.BANISH_III)
end

itemObject.onItemUse = function(target)
    target:addSpell(invaderXim.magic.spell.BANISH_III)
end

return itemObject
