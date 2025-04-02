-----------------------------------
-- ID: 4779
-- Scroll of Water III
-- Teaches the black magic Water III
-----------------------------------
---@type TItem
local itemObject = {}

itemObject.onItemCheck = function(target, item, param, caster)
    return target:canLearnSpell(invaderXim.magic.spell.WATER_III)
end

itemObject.onItemUse = function(target)
    target:addSpell(invaderXim.magic.spell.WATER_III)
end

return itemObject
