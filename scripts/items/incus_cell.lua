-----------------------------------
-- Incus Cell
-- ID 5365
-- Unlocks weapons and shields
-----------------------------------
---@type TItem
local itemObject = {}

itemObject.onItemCheck = function(target, item, param, caster)
    return invaderXim.salvage.onCellItemCheck(target, invaderXim.effect.ENCUMBRANCE_I, 0x0003)
end

itemObject.onItemUse = function(target)
    return invaderXim.salvage.onCellItemUse(target, invaderXim.effect.ENCUMBRANCE_I, 0x0003, 0)
end

return itemObject
