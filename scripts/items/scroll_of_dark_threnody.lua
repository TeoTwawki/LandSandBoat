-----------------------------------
-- ID: 5069
-- Scroll of Dark Threnody
-- Teaches the song Dark Threnody
-----------------------------------
---@type TItem
local itemObject = {}

itemObject.onItemCheck = function(target, item, param, caster)
    return target:canLearnSpell(invaderXim.magic.spell.DARK_THRENODY)
end

itemObject.onItemUse = function(target)
    target:addSpell(invaderXim.magic.spell.DARK_THRENODY)
end

return itemObject
