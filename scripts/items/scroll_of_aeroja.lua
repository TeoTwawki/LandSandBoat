-----------------------------------
-- ID: 4892
-- Scroll of Aeroja
-- Teaches the black magic Aeroja
-----------------------------------
---@type TItem
local itemObject = {}

itemObject.onItemCheck = function(target, item, param, caster)
    return target:canLearnSpell(invaderXim.magic.spell.AEROJA)
end

itemObject.onItemUse = function(target)
    target:addSpell(invaderXim.magic.spell.AEROJA)
end

return itemObject
