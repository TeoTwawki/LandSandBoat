-----------------------------------
--  ID: 4260
--  Item: Green Drop
--  Agility 5
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
    target:addStatusEffect(invaderXim.effect.AGI_BOOST, 5, 0, 900)
    target:addStatusEffect(invaderXim.effect.MEDICINE, 0, 0, 3600)
end

return itemObject
