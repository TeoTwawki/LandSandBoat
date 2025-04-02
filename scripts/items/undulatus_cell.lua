-----------------------------------
-- Undulatus Cell
-- ID 5371
-- Unlocks ranged and ammo equipment
-----------------------------------
---@type TItem
local itemObject = {}

itemObject.onItemCheck = function(target, item, param, caster)
    return invaderXim.salvage.onCellItemCheck(target, invaderXim.effect.ENCUMBRANCE_I, 0x000C)
end

itemObject.onItemUse = function(target)
    return invaderXim.salvage.onCellItemUse(target, invaderXim.effect.ENCUMBRANCE_I, 0x000C, 6)
end

return itemObject
