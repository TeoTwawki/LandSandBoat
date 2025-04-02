-----------------------------------
-- ID: 4840
-- Scroll of Bio III
-- Teaches the black magic Bio III
-----------------------------------
---@type TItem
local itemObject = {}

itemObject.onItemCheck = function(target, item, param, caster)
    return target:canLearnSpell(invaderXim.magic.spell.BIO_III)
end

itemObject.onItemUse = function(target)
    target:addSpell(invaderXim.magic.spell.BIO_III)
end

return itemObject
