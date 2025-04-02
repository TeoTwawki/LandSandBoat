-----------------------------------
-- ID: 6047
-- Luminohelix Schema
-- Teaches the black magic Luminohelix
-----------------------------------
---@type TItem
local itemObject = {}

itemObject.onItemCheck = function(target, item, param, caster)
    return target:canLearnSpell(invaderXim.magic.spell.LUMINOHELIX)
end

itemObject.onItemUse = function(target)
    target:addSpell(invaderXim.magic.spell.LUMINOHELIX)
end

return itemObject
