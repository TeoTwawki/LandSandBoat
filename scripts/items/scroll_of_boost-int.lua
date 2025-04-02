-----------------------------------
-- ID: 5098
-- Scroll of Boost-INT
-- Teaches the white magic Boost-INT
-----------------------------------
---@type TItem
local itemObject = {}

itemObject.onItemCheck = function(target, item, param, caster)
    return target:canLearnSpell(invaderXim.magic.spell.BOOST_INT)
end

itemObject.onItemUse = function(target)
    target:addSpell(invaderXim.magic.spell.BOOST_INT)
end

return itemObject
