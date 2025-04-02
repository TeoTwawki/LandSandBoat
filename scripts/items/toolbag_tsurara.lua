-----------------------------------
-- ID: 5309
-- Toolbag Tsura
-- When used, you will obtain one stack of tsurara
-----------------------------------
---@type TItem
local itemObject = {}

itemObject.onItemCheck = function(target, item, param, caster)
    return invaderXim.itemUtils.itemBoxOnItemCheck(target)
end

itemObject.onItemUse = function(target)
    npcUtil.giveItem(target, { { invaderXim.item.TSURARA, 99 } })
end

return itemObject
