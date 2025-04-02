-----------------------------------
-- ID: 5064
-- Scroll of Wind Threnody
-- Teaches the song Wind Threnody
-----------------------------------
---@type TItem
local itemObject = {}

itemObject.onItemCheck = function(target, item, param, caster)
    return target:canLearnSpell(invaderXim.magic.spell.WIND_THRENODY)
end

itemObject.onItemUse = function(target)
    target:addSpell(invaderXim.magic.spell.WIND_THRENODY)
end

return itemObject
