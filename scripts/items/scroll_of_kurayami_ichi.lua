-----------------------------------
-- ID: 4955
-- Scroll of Kurayami: Ichi
-- Teaches the ninjutsu Kurayami: Ichi
-----------------------------------
---@type TItem
local itemObject = {}

itemObject.onItemCheck = function(target, item, param, caster)
    return target:canLearnSpell(invaderXim.magic.spell.KURAYAMI_ICHI)
end

itemObject.onItemUse = function(target)
    target:addSpell(invaderXim.magic.spell.KURAYAMI_ICHI)
end

return itemObject
