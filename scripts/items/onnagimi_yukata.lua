-----------------------------------
-- ID: 14535
-- onnagimi_yukata
-- Dispense: Datechochin x99
-----------------------------------
---@type TItem
local itemObject = {}

itemObject.onItemCheck = function(target, item, param, caster)
    return invaderXim.itemUtils.itemBoxOnItemCheck(target)
end

itemObject.onItemUse = function(target)
    npcUtil.giveItem(target, { { invaderXim.item.DATECHOCHIN, 99 } })
end

return itemObject
