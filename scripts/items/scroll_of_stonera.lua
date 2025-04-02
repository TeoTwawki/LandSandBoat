-----------------------------------
-- ID: 4922
-- Scroll of Stonera
-- Teaches the black magic Stonera
-----------------------------------
---@type TItem
local itemObject = {}

itemObject.onItemCheck = function(target, item, param, caster)
    return target:canLearnSpell(invaderXim.magic.spell.STONERA)
end

itemObject.onItemUse = function(target)
    target:addSpell(invaderXim.magic.spell.STONERA)
end

return itemObject
