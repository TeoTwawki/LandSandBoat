-----------------------------------
--  ID: 4209
--  Item: Mind Potion
--  Mind 7
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
    target:addStatusEffect(invaderXim.effect.MND_BOOST, 7, 0, 180)
    target:addStatusEffect(invaderXim.effect.MEDICINE, 0, 0, 900)
end

return itemObject
