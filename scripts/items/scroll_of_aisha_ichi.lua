-----------------------------------
-- ID: 4965
-- Scroll of Aisha: Ichi
-- Teaches the ninjutsu Aisha: Ichi
-----------------------------------
---@type TItem
local itemObject = {}

itemObject.onItemCheck = function(target, item, param, caster)
    return target:canLearnSpell(invaderXim.magic.spell.AISHA_ICHI)
end

itemObject.onItemUse = function(target)
    target:addSpell(invaderXim.magic.spell.AISHA_ICHI)
end

return itemObject
