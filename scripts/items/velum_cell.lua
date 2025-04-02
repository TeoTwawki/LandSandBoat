-----------------------------------
-- Velum Cell
-- ID 5380
-- Removes INT Down effect
-----------------------------------
---@type TItem
local itemObject = {}

itemObject.onItemCheck = function(target, item, param, caster)
    return invaderXim.salvage.onCellItemCheck(target, invaderXim.effect.DEBILITATION, 0x010)
end

itemObject.onItemUse = function(target)
    return invaderXim.salvage.onCellItemUse(target, invaderXim.effect.DEBILITATION, 0x010, 15)
end

return itemObject
