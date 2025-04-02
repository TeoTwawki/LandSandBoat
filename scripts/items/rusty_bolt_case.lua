-----------------------------------
-- ID: 4197
-- rusty_bolt_case
-----------------------------------
---@type TItem
local itemObject = {}

itemObject.onItemCheck = function(target, item, param, caster)
    return invaderXim.itemUtils.itemBoxOnItemCheck(target)
end

itemObject.onItemUse = function(target)
    npcUtil.giveItem(target, { { invaderXim.item.RUSTY_BOLT, 99 } })-- 99x rusty_bolt
end

return itemObject
