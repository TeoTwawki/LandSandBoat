-----------------------------------
-- ID: 4870
-- Scroll of Warp II
-- Teaches the black magic Warp II
-----------------------------------
---@type TItem
local itemObject = {}

itemObject.onItemCheck = function(target, item, param, caster)
    return target:canLearnSpell(invaderXim.magic.spell.WARP_II)
end

itemObject.onItemUse = function(target)
    target:addSpell(invaderXim.magic.spell.WARP_II)
end

return itemObject
