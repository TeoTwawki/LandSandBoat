-----------------------------------
-- ID: 5022
-- Scroll of Warding Round
-- Teaches the song Warding Round
-----------------------------------
---@type TItem
local itemObject = {}

itemObject.onItemCheck = function(target, item, param, caster)
    return target:canLearnSpell(invaderXim.magic.spell.WARDING_ROUND)
end

itemObject.onItemUse = function(target)
    target:addSpell(invaderXim.magic.spell.WARDING_ROUND)
end

return itemObject
