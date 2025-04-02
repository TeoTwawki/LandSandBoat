-----------------------------------
-- ID: 4943
-- Scroll of Suiton: Ichi
-- Teaches the ninjutsu Suiton: Ichi
-----------------------------------
---@type TItem
local itemObject = {}

itemObject.onItemCheck = function(target, item, param, caster)
    return target:canLearnSpell(invaderXim.magic.spell.SUITON_ICHI)
end

itemObject.onItemUse = function(target)
    target:addSpell(invaderXim.magic.spell.SUITON_ICHI)
end

return itemObject
