-----------------------------------
-- ID: 4817
-- Scroll of Tornado II
-- Teaches the black magic Tornado II
-----------------------------------
---@type TItem
local itemObject = {}

itemObject.onItemCheck = function(target, item, param, caster)
    return target:canLearnSpell(invaderXim.magic.spell.TORNADO_II)
end

itemObject.onItemUse = function(target)
    target:addSpell(invaderXim.magic.spell.TORNADO_II)
end

return itemObject
