-----------------------------------
-- ID: 4937
-- Scroll of Doton: Ichi
-- Teaches the ninjutsu Doton: Ichi
-----------------------------------
---@type TItem
local itemObject = {}

itemObject.onItemCheck = function(target, item, param, caster)
    return target:canLearnSpell(invaderXim.magic.spell.DOTON_ICHI)
end

itemObject.onItemUse = function(target)
    target:addSpell(invaderXim.magic.spell.DOTON_ICHI)
end

return itemObject
