-----------------------------------
-- ID: 14533
-- onago_yukata
-- Dispense: Muteppo x99
-----------------------------------
---@type TItem
local itemObject = {}

itemObject.onItemCheck = function(target, item, param, caster)
    return invaderXim.itemUtils.itemBoxOnItemCheck(target)
end

itemObject.onItemUse = function(target)
    npcUtil.giveItem(target, { { invaderXim.item.MUTEPPO, 99 } })
end

return itemObject
