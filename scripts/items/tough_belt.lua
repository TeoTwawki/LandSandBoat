-----------------------------------
-- ID: 15864
-- Item: tough_belt
-- Item Effect: VIT +3
-- Duration: 60 seconds
-----------------------------------
---@type TItem
local itemObject = {}

itemObject.onItemCheck = function(target, item, param, caster)
    if target:getStatusEffectBySource(invaderXim.effect.VIT_BOOST, invaderXim.effectSourceType.EQUIPPED_ITEM, invaderXim.item.TOUGH_BELT) ~= nil then
        target:delStatusEffect(invaderXim.effect.VIT_BOOST, nil, invaderXim.effectSourceType.EQUIPPED_ITEM, invaderXim.item.TOUGH_BELT)
    end

    return 0
end

itemObject.onItemUse = function(target)
    if target:hasEquipped(invaderXim.item.TOUGH_BELT) then
        target:addStatusEffect(invaderXim.effect.VIT_BOOST, 3, 0, 60, 0, 0, 0, invaderXim.effectSourceType.EQUIPPED_ITEM, invaderXim.item.TOUGH_BELT)
    end
end

return itemObject
