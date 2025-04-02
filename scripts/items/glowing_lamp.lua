-----------------------------------
-- ID: 5414
-- Item: Glowing Lamp
-- Use: Creates a replica of the Glowing Lamp
-----------------------------------
---@type TItem

local itemObject = {}

itemObject.onItemCheck = function(target, item)
    return invaderXim.einherjar.onLampCheck(target, item)
end

itemObject.onItemUse = function(player, target, item)
    invaderXim.einherjar.onLampUse(player, item)
end

itemObject.onItemDrop = function(target, item)
    invaderXim.einherjar.onLampDrop(target, item)
end

return itemObject
