-----------------------------------
-- ID: 4970
-- Scroll of Gekka: Ichi
-- Teaches the ninjutsu Gekka: Ichi
-----------------------------------
---@type TItem
local itemObject = {}

itemObject.onItemCheck = function(target, item, param, caster)
    return target:canLearnSpell(invaderXim.magic.spell.GEKKA_ICHI)
end

itemObject.onItemUse = function(target)
    target:addSpell(invaderXim.magic.spell.GEKKA_ICHI)
end

return itemObject
