-----------------------------------
-- ID: 4722
-- Scroll of Enfire II
-- Teaches the white magic Enfire II
-----------------------------------
---@type TItem
local itemObject = {}

itemObject.onItemCheck = function(target, item, param, caster)
    return target:canLearnSpell(invaderXim.magic.spell.ENFIRE_II)
end

itemObject.onItemUse = function(target)
    target:addSpell(invaderXim.magic.spell.ENFIRE_II)
end

return itemObject
