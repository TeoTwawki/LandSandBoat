-----------------------------------
-- ID: 4928
-- Scroll of Katon: Ichi
-- Teaches the ninjutsu Katon: Ichi
-----------------------------------
---@type TItem
local itemObject = {}

itemObject.onItemCheck = function(target, item, param, caster)
    return target:canLearnSpell(invaderXim.magic.spell.KATON_ICHI)
end

itemObject.onItemUse = function(target)
    target:addSpell(invaderXim.magic.spell.KATON_ICHI)
end

return itemObject
