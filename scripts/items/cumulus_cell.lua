-----------------------------------
-- Cumulus Cell
-- ID 5367
-- Unlocks body equipment
-----------------------------------
---@type TItem
local itemObject = {}

itemObject.onItemCheck = function(target, item, param, caster)
    return invaderXim.salvage.onCellItemCheck(target, invaderXim.effect.ENCUMBRANCE_I, 0x0020)
end

itemObject.onItemUse = function(target)
    return invaderXim.salvage.onCellItemUse(target, invaderXim.effect.ENCUMBRANCE_I, 0x0020, 2)
end

return itemObject
