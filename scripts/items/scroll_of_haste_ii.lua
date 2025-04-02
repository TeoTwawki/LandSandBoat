-----------------------------------
-- ID: 4692
-- Scroll of Haste II
-- Teaches the white magic Haste II
-----------------------------------
---@type TItem
local itemObject = {}

itemObject.onItemCheck = function(target, item, param, caster)
    return target:canLearnSpell(invaderXim.magic.spell.HASTE_II)
end

itemObject.onItemUse = function(target)
    target:addSpell(invaderXim.magic.spell.HASTE_II)
end

return itemObject
