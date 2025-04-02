-----------------------------------
-- ID: 4966
-- Scroll of Myoshu: Ichi
-- Teaches the ninjutsu Myoshu: Ichi
-----------------------------------
---@type TItem
local itemObject = {}

itemObject.onItemCheck = function(target, item, param, caster)
    return target:canLearnSpell(invaderXim.magic.spell.MYOSHU_ICHI)
end

itemObject.onItemUse = function(target)
    target:addSpell(invaderXim.magic.spell.MYOSHU_ICHI)
end

return itemObject
