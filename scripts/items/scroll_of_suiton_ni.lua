-----------------------------------
-- ID: 4944
-- Scroll of Suiton: Ni
-- Teaches the ninjutsu Suiton: Ni
-----------------------------------
---@type TItem
local itemObject = {}

itemObject.onItemCheck = function(target, item, param, caster)
    return target:canLearnSpell(invaderXim.magic.spell.SUITON_NI)
end

itemObject.onItemUse = function(target)
    target:addSpell(invaderXim.magic.spell.SUITON_NI)
end

return itemObject
