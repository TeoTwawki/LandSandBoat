-----------------------------------
-- ID: 20953
-- Escritorio
-- Dispense: Cone Calamary
-----------------------------------
---@type TItem
local itemObject = {}

itemObject.onItemCheck = function(target, item, param, caster)
    return invaderXim.itemUtils.itemBoxOnItemCheck(target)
end

itemObject.onItemUse = function(target)
    npcUtil.giveItem(target, { { invaderXim.item.CONE_CALAMARY, 1 } })
end

return itemObject
