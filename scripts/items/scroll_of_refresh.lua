-----------------------------------
-- ID: 4717
-- Scroll of Refresh
-- Teaches the white magic Refresh
-----------------------------------
---@type TItem
local itemObject = {}

itemObject.onItemCheck = function(target, item, param, caster)
    return target:canLearnSpell(invaderXim.magic.spell.REFRESH)
end

itemObject.onItemUse = function(target)
    target:addSpell(invaderXim.magic.spell.REFRESH)
end

return itemObject
