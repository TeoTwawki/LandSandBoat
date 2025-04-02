-----------------------------------
-- ID: 4748
-- Scroll of Raise II
-- Teaches the white magic Raise III
-----------------------------------
---@type TItem
local itemObject = {}

itemObject.onItemCheck = function(target, item, param, caster)
    return target:canLearnSpell(invaderXim.magic.spell.RAISE_III)
end

itemObject.onItemUse = function(target)
    target:addSpell(invaderXim.magic.spell.RAISE_III)
end

return itemObject
