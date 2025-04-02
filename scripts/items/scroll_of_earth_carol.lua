-----------------------------------
-- ID: 5049
-- Scroll of Earth Carol
-- Teaches the song Earth Carol
-----------------------------------
---@type TItem
local itemObject = {}

itemObject.onItemCheck = function(target, item, param, caster)
    return target:canLearnSpell(invaderXim.magic.spell.EARTH_CAROL)
end

itemObject.onItemUse = function(target)
    target:addSpell(invaderXim.magic.spell.EARTH_CAROL)
end

return itemObject
