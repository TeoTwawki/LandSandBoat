-----------------------------------
-- ID: 5095
-- Scroll of Boost-DEX
-- Teaches the white magic Boost-DEX
-----------------------------------
---@type TItem
local itemObject = {}

itemObject.onItemCheck = function(target, item, param, caster)
    return target:canLearnSpell(invaderXim.magic.spell.BOOST_DEX)
end

itemObject.onItemUse = function(target)
    target:addSpell(invaderXim.magic.spell.BOOST_DEX)
end

return itemObject
