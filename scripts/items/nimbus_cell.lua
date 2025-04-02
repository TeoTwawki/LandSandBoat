-----------------------------------
-- Nimbus Cell
-- 5379
-- Removes AGI Down effect
-----------------------------------
---@type TItem
local itemObject = {}

itemObject.onItemCheck = function(target, item, param, caster)
    return invaderXim.salvage.onCellItemCheck(target, invaderXim.effect.DEBILITATION, 0x008)
end

itemObject.onItemUse = function(target)
    return invaderXim.salvage.onCellItemUse(target, invaderXim.effect.DEBILITATION, 0x008, 14)
end

return itemObject
