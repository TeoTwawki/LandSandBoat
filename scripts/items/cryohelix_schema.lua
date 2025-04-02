-----------------------------------
-- ID: 6044
-- Cryohelix Schema
-- Teaches the black magic Cryohelix
-----------------------------------
---@type TItem
local itemObject = {}

itemObject.onItemCheck = function(target, item, param, caster)
    return target:canLearnSpell(invaderXim.magic.spell.CRYOHELIX)
end

itemObject.onItemUse = function(target)
    target:addSpell(invaderXim.magic.spell.CRYOHELIX)
end

return itemObject
