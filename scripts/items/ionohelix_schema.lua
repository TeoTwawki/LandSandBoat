-----------------------------------
-- ID: 6043
-- Ionohelix Schema
-- Teaches the black magic Ionohelix
-----------------------------------
---@type TItem
local itemObject = {}

itemObject.onItemCheck = function(target, item, param, caster)
    return target:canLearnSpell(invaderXim.magic.spell.IONOHELIX)
end

itemObject.onItemUse = function(target)
    target:addSpell(invaderXim.magic.spell.IONOHELIX)
end

return itemObject
