-----------------------------------
-- ID: 4829
-- Scroll of Poison II
-- Teaches the black magic Poison II
-----------------------------------
---@type TItem
local itemObject = {}

itemObject.onItemCheck = function(target, item, param, caster)
    return target:canLearnSpell(invaderXim.magic.spell.POISON_II)
end

itemObject.onItemUse = function(target)
    target:addSpell(invaderXim.magic.spell.POISON_II)
end

return itemObject
