-----------------------------------
-- ID: 5057
-- Scroll of Earth Carol II
-- Teaches the song Earth Carol II
-----------------------------------
---@type TItem
local itemObject = {}

itemObject.onItemCheck = function(target, item, param, caster)
    return target:canLearnSpell(invaderXim.magic.spell.EARTH_CAROL_II)
end

itemObject.onItemUse = function(target)
    target:addSpell(invaderXim.magic.spell.EARTH_CAROL_II)
end

return itemObject
