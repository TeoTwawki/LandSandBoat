-----------------------------------
-- ID: 4652
-- Scroll of Protect II
-- Teaches the white magic Protect II
-----------------------------------
---@type TItem
local itemObject = {}

itemObject.onItemCheck = function(target, item, param, caster)
    return target:canLearnSpell(invaderXim.magic.spell.PROTECT_II)
end

itemObject.onItemUse = function(target)
    target:addSpell(invaderXim.magic.spell.PROTECT_II)
end

return itemObject
