-----------------------------------
-- ID: 28540
-- Warp Ring
--  Transports the user to their Home Point
-----------------------------------
---@type TItem
local itemObject = {}

itemObject.onItemCheck = function(target, item, param, caster)
    return 0
end

itemObject.onItemUse = function(target)
    target:addStatusEffectEx(invaderXim.effect.TELEPORT, 0, invaderXim.teleport.id.WARP, 0, 3)
end

return itemObject
