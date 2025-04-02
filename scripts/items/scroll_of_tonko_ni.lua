-----------------------------------
-- ID: 4962
-- Scroll of Tonko: Ichi
-- Teaches the ninjutsu Tonko: Ichi
-----------------------------------
---@type TItem
local itemObject = {}

itemObject.onItemCheck = function(target, item, param, caster)
    return target:canLearnSpell(invaderXim.magic.spell.TONKO_NI)
end

itemObject.onItemUse = function(target)
    target:addSpell(invaderXim.magic.spell.TONKO_NI)
end

return itemObject
