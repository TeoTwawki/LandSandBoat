-----------------------------------
-- ID: 5067
-- Scroll of Water Threnody
-- Teaches the song Water Threnody
-----------------------------------
---@type TItem
local itemObject = {}

itemObject.onItemCheck = function(target, item, param, caster)
    return target:canLearnSpell(invaderXim.magic.spell.WATER_THRENODY)
end

itemObject.onItemUse = function(target)
    target:addSpell(invaderXim.magic.spell.WATER_THRENODY)
end

return itemObject
