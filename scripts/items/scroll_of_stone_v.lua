-----------------------------------
-- ID: 4771
-- Scroll of Stone V
-- Teaches the black magic Stone V
-----------------------------------
---@type TItem
local itemObject = {}

itemObject.onItemCheck = function(target, item, param, caster)
    return target:canLearnSpell(invaderXim.magic.spell.STONE_V)
end

itemObject.onItemUse = function(target)
    target:addSpell(invaderXim.magic.spell.STONE_V)
end

return itemObject
