-----------------------------------
-- ID: 5068
-- Scroll of Light Threnody
-- Teaches the song Light Threnody
-----------------------------------
---@type TItem
local itemObject = {}

itemObject.onItemCheck = function(target, item, param, caster)
    return target:canLearnSpell(invaderXim.magic.spell.LIGHT_THRENODY)
end

itemObject.onItemUse = function(target)
    target:addSpell(invaderXim.magic.spell.LIGHT_THRENODY)
end

return itemObject
