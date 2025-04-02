-----------------------------------
-- ID: 4665
-- Scroll of Haste
-- Teaches the white magic Haste
-----------------------------------
---@type TItem
local itemObject = {}

itemObject.onItemCheck = function(target, item, param, caster)
    return target:canLearnSpell(invaderXim.magic.spell.HASTE)
end

itemObject.onItemUse = function(target)
    target:addSpell(invaderXim.magic.spell.HASTE)
end

return itemObject
