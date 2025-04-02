-----------------------------------
-- ID: 4769
-- Scroll of Stone III
-- Teaches the black magic Stone III
-----------------------------------
---@type TItem
local itemObject = {}

itemObject.onItemCheck = function(target, item, param, caster)
    return target:canLearnSpell(invaderXim.magic.spell.STONE_III)
end

itemObject.onItemUse = function(target)
    target:addSpell(invaderXim.magic.spell.STONE_III)
end

return itemObject
