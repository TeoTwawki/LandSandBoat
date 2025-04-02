-----------------------------------
-- ID: 5099
-- Scroll of Boost-MND
-- Teaches the white magic Boost-MND
-----------------------------------
---@type TItem
local itemObject = {}

itemObject.onItemCheck = function(target, item, param, caster)
    return target:canLearnSpell(invaderXim.magic.spell.BOOST_MND)
end

itemObject.onItemUse = function(target)
    target:addSpell(invaderXim.magic.spell.BOOST_MND)
end

return itemObject
