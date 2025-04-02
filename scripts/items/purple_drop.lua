-----------------------------------
--  ID: 4262
--  Item: Purple Drop
--  Dexterity 5
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
    target:addStatusEffect(invaderXim.effect.DEX_BOOST, 5, 0, 900)
    target:addStatusEffect(invaderXim.effect.MEDICINE, 0, 0, 3600)
end

return itemObject
