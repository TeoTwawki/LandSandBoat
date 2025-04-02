-----------------------------------
-- ID: 16227
-- Persikos Tank
-- When used, you will obtain one Persikos au lait
-----------------------------------
---@type TItem
local itemObject = {}

itemObject.onItemCheck = function(target, item, param, caster)
    return invaderXim.itemUtils.itemBoxOnItemCheck(target)
end

itemObject.onItemUse = function(target)
    npcUtil.giveItem(target, { { invaderXim.item.FLASK_OF_PERSIKOS_AU_LAIT, 1 } })
end

return itemObject
