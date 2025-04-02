-----------------------------------
-- Fractus Cell
-- 5377
-- Removes DEX Down effect
-----------------------------------
---@type TItem
local itemObject = {}

itemObject.onItemCheck = function(target, item, param, caster)
    return invaderXim.salvage.onCellItemCheck(target, invaderXim.effect.DEBILITATION, 0x002)
end

itemObject.onItemUse = function(target)
    return invaderXim.salvage.onCellItemUse(target, invaderXim.effect.DEBILITATION, 0x002, 12)
end

return itemObject
