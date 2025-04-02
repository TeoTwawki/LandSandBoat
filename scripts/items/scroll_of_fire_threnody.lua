-----------------------------------
-- ID: 5062
-- Scroll of Fire Threnody
-- Teaches the song Fire Threnody
-----------------------------------
---@type TItem
local itemObject = {}

itemObject.onItemCheck = function(target, item, param, caster)
    return target:canLearnSpell(invaderXim.magic.spell.FIRE_THRENODY)
end

itemObject.onItemUse = function(target)
    target:addSpell(invaderXim.magic.spell.FIRE_THRENODY)
end

return itemObject
