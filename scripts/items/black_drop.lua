-----------------------------------
--  ID: 4265
--  Item: Black Drop
--  Transports the user to their Home Point
-----------------------------------
---@type TItem
local itemObject = {}

itemObject.onItemCheck = function(target, item, param, caster)
    if target:hasStatusEffect(invaderXim.effect.MEDICINE) then
        return invaderXim.msg.basic.ITEM_NO_USE_MEDICATED
    end

    return 0
end

itemObject.onItemUse = function(target)
    target:addStatusEffect(invaderXim.effect.MEDICINE, 0, 0, 3600)
    target:warp()
end

return itemObject
