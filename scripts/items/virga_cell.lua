-----------------------------------
-- Virga Cell
-- ID 5372
-- Unlocks earring and ring equipment
-----------------------------------
---@type TItem
local itemObject = {}

itemObject.onItemCheck = function(target, item, param, caster)
    return invaderXim.salvage.onCellItemCheck(target, invaderXim.effect.ENCUMBRANCE_I, 0x7800)
end

itemObject.onItemUse = function(target)
    return invaderXim.salvage.onCellItemUse(target, invaderXim.effect.ENCUMBRANCE_I, 0x7800, 7)
end

return itemObject
