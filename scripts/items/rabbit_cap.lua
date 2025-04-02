-----------------------------------
-- ID: 26788
-- Item: Rabbit Cap
-- When used, you will obtain 1-2 random initial eggs
-----------------------------------
---@type TItem
local itemObject = {}

itemObject.onItemCheck = function(target, item, param, caster)
    return invaderXim.itemUtils.itemBoxOnItemCheck(target)
end

itemObject.onItemUse = function(target)
    npcUtil.giveItem(target, { { math.random(invaderXim.item.A_EGG, invaderXim.item.Z_EGG), 1 } })

    if math.random(1, 5) > 4 then
        npcUtil.giveItem(target, { { math.random(invaderXim.item.A_EGG, invaderXim.item.Z_EGG), 1 } })
    end
end

return itemObject
