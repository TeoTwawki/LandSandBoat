-----------------------------------
-- ID: 4987
-- Scroll of Armys Paeton II
-- Teaches the song Armys Paeton II
-----------------------------------
---@type TItem
local itemObject = {}

itemObject.onItemCheck = function(target, item, param, caster)
    return target:canLearnSpell(invaderXim.magic.spell.ARMYS_PAEON_II)
end

itemObject.onItemUse = function(target)
    target:addSpell(invaderXim.magic.spell.ARMYS_PAEON_II)
end

return itemObject
