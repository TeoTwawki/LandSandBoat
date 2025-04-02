-----------------------------------
--  ID: 4205
--  Item: Agility Potion
--  Agility 7
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
    target:addStatusEffect(invaderXim.effect.AGI_BOOST, 7, 0, 180)
    target:addStatusEffect(invaderXim.effect.MEDICINE, 0, 0, 900)
end

return itemObject
