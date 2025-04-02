-----------------------------------
-- ID: 5106
-- Scroll of Inundation
-- Teaches the white Inundation
-----------------------------------
---@type TItem
local itemObject = {}

itemObject.onItemCheck = function(target, item, param, caster)
    return target:canLearnSpell(invaderXim.magic.spell.INUNDATION)
end

itemObject.onItemUse = function(target)
    target:addSpell(invaderXim.magic.spell.INUNDATION)
end

return itemObject
