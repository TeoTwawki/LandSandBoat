-----------------------------------
-- ID: 5003
-- Scroll of Valor Minuet II
-- Teaches the song Valor Minuet II
-----------------------------------
---@type TItem
local itemObject = {}

itemObject.onItemCheck = function(target, item, param, caster)
    return target:canLearnSpell(invaderXim.magic.spell.VALOR_MINUET_II)
end

itemObject.onItemUse = function(target)
    target:addSpell(invaderXim.magic.spell.VALOR_MINUET_II)
end

return itemObject
