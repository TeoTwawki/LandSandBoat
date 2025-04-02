-----------------------------------
-- ID: 4671
-- Scroll of Barstone
-- Teaches the white magic Barstone
-----------------------------------
---@type TItem
local itemObject = {}

itemObject.onItemCheck = function(target, item, param, caster)
    return target:canLearnSpell(invaderXim.magic.spell.BARSTONE)
end

itemObject.onItemUse = function(target)
    target:addSpell(invaderXim.magic.spell.BARSTONE)
end

return itemObject
