-----------------------------------
-- ID: 4629
-- Scroll of Holy
-- Teaches the white magic Holy
-----------------------------------
---@type TItem
local itemObject = {}

itemObject.onItemCheck = function(target, item, param, caster)
    return target:canLearnSpell(invaderXim.magic.spell.HOLY)
end

itemObject.onItemUse = function(target)
    target:addSpell(invaderXim.magic.spell.HOLY)
end

return itemObject
