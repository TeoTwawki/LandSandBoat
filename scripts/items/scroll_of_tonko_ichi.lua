-----------------------------------
-- ID: 4961
-- Scroll of Tonko: Ichi
-- Teaches the ninjutsu Tonko: Ichi
-----------------------------------
---@type TItem
local itemObject = {}

itemObject.onItemCheck = function(target, item, param, caster)
    return target:canLearnSpell(invaderXim.magic.spell.TONKO_ICHI)
end

itemObject.onItemUse = function(target)
    target:addSpell(invaderXim.magic.spell.TONKO_ICHI)
end

return itemObject
