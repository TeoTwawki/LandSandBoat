-----------------------------------
-- ID: 5005
-- Scroll of Valor Minuet IV
-- Teaches the song Valor Minuet IV
-----------------------------------
---@type TItem
local itemObject = {}

itemObject.onItemCheck = function(target, item, param, caster)
    return target:canLearnSpell(invaderXim.magic.spell.VALOR_MINUET_IV)
end

itemObject.onItemUse = function(target)
    target:addSpell(invaderXim.magic.spell.VALOR_MINUET_IV)
end

return itemObject
