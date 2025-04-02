-----------------------------------
-- ID: 4853
-- Scroll of Drain
-- Teaches the black magic Drain
-----------------------------------
---@type TItem
local itemObject = {}

itemObject.onItemCheck = function(target, item, param, caster)
    return target:canLearnSpell(invaderXim.magic.spell.DRAIN)
end

itemObject.onItemUse = function(target)
    target:addSpell(invaderXim.magic.spell.DRAIN)
end

return itemObject
