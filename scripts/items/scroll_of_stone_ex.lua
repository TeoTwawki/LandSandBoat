-----------------------------------
-- ID: 4607
-- Scroll of Stone (Exclusive)
-- Teaches the black magic Stone
-----------------------------------
---@type TItem
local itemObject = {}

itemObject.onItemCheck = function(target, item, param, caster)
    return target:canLearnSpell(invaderXim.magic.spell.STONE)
end

itemObject.onItemUse = function(target)
    target:addSpell(invaderXim.magic.spell.STONE)
end

return itemObject
