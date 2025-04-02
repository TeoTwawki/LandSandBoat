-----------------------------------
-- Castellanus Cell
-- ID 5366
-- Unlocks head and neck equipment
-----------------------------------
---@type TItem
local itemObject = {}

itemObject.onItemCheck = function(target, item, param, caster)
    return invaderXim.salvage.onCellItemCheck(target, invaderXim.effect.ENCUMBRANCE_I, 0x0210)
end

itemObject.onItemUse = function(target)
    return invaderXim.salvage.onCellItemUse(target, invaderXim.effect.ENCUMBRANCE_I, 0x0210, 1)
end

return itemObject
