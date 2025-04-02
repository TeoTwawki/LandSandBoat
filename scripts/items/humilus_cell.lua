-----------------------------------
-- Humilus Cell
-- ID 5383
-- Removes HP Down effect
-----------------------------------
---@type TItem
local itemObject = {}

itemObject.onItemCheck = function(target, item, param, caster)
    return invaderXim.salvage.onCellItemCheck(target, invaderXim.effect.DEBILITATION, 0x080)
end

itemObject.onItemUse = function(target)
    return invaderXim.salvage.onCellItemUse(target, invaderXim.effect.DEBILITATION, 0x080, 18)
end

return itemObject
