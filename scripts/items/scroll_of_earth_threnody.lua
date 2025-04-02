-----------------------------------
-- ID: 5065
-- Scroll of Earth Threnody
-- Teaches the song Earth Threnody
-----------------------------------
---@type TItem
local itemObject = {}

itemObject.onItemCheck = function(target, item, param, caster)
    return target:canLearnSpell(invaderXim.magic.spell.EARTH_THRENODY)
end

itemObject.onItemUse = function(target)
    target:addSpell(invaderXim.magic.spell.EARTH_THRENODY)
end

return itemObject
