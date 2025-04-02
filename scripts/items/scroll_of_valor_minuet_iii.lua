-----------------------------------
-- ID: 5004
-- Scroll of Valor Minuet III
-- Teaches the song Valor Minuet III
-----------------------------------
---@type TItem
local itemObject = {}

itemObject.onItemCheck = function(target, item, param, caster)
    return target:canLearnSpell(invaderXim.magic.spell.VALOR_MINUET_III)
end

itemObject.onItemUse = function(target)
    target:addSpell(invaderXim.magic.spell.VALOR_MINUET_III)
end

return itemObject
