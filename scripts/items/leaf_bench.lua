-----------------------------------
-- ID: 6412
-- Item: Leaf Bench
-- Item Effect: Grant Leaf bench key item
-----------------------------------
---@type TItem
local itemObject = {}

local keyItemId = invaderXim.ki.LEAF_BENCH

itemObject.onItemCheck = function(target, item, param, caster)
    if target:hasKeyItem(keyItemId) then
        return invaderXim.msg.basic.ALREADY_HAVE_KEY_ITEM, 0, keyItemId
    end

    return 0
end

itemObject.onItemUse = function(target)
    target:addKeyItem(keyItemId)
    target:messageBasic(invaderXim.msg.basic.OBTAINED_KEY_ITEM, 6412, keyItemId)
end

return itemObject
