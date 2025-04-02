-----------------------------------
-- ID: 4971
-- Scroll of Yain: Ichi
-- Teaches the ninjutsu Yain: Ichi
-----------------------------------
---@type TItem
local itemObject = {}

itemObject.onItemCheck = function(target, item, param, caster)
    return target:canLearnSpell(invaderXim.magic.spell.YAIN_ICHI)
end

itemObject.onItemUse = function(target)
    target:addSpell(invaderXim.magic.spell.YAIN_ICHI)
end

return itemObject
