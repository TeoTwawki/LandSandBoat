-----------------------------------
-- ID: 5063
-- Scroll of Ice Threnody
-- Teaches the song Ice Threnody
-----------------------------------
---@type TItem
local itemObject = {}

itemObject.onItemCheck = function(target, item, param, caster)
    return target:canLearnSpell(invaderXim.magic.spell.ICE_THRENODY)
end

itemObject.onItemUse = function(target)
    target:addSpell(invaderXim.magic.spell.ICE_THRENODY)
end

return itemObject
