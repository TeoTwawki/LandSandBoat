-----------------------------------
-- Mediocris Cell
-- ID 5382
-- Removes CHR Down effect
-----------------------------------
---@type TItem
local itemObject = {}

itemObject.onItemCheck = function(target, item, param, caster)
    return invaderXim.salvage.onCellItemCheck(target, invaderXim.effect.DEBILITATION, 0x040)
end

itemObject.onItemUse = function(target)
    return invaderXim.salvage.onCellItemUse(target, invaderXim.effect.DEBILITATION, 0x040, 17)
end

return itemObject
