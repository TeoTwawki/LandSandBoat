-----------------------------------
-- ID: 4636
-- Scroll of Banish
-- Teaches the white magic Banish
-----------------------------------
---@type TItem
local itemObject = {}

itemObject.onItemCheck = function(target, item, param, caster)
    return target:canLearnSpell(invaderXim.magic.spell.BANISH)
end

itemObject.onItemUse = function(target)
    target:addSpell(invaderXim.magic.spell.BANISH)
end

return itemObject
