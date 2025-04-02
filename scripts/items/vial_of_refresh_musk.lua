-----------------------------------
-- ID: 18241
-- Item: Vial of Refresh Musk
-- Item Effect: 60 seconds
-- Duration: 30 Seconds
-----------------------------------
---@type TItem
local itemObject = {}

itemObject.onItemCheck = function(target, item, param, caster)
    if target:getStatusEffectBySource(invaderXim.effect.REFRESH, invaderXim.effectSourceType.EQUIPPED_ITEM, invaderXim.item.VIAL_OF_REFRESH_MUSK) ~= nil then
        target:delStatusEffect(invaderXim.effect.REFRESH, nil, invaderXim.effectSourceType.EQUIPPED_ITEM, invaderXim.item.VIAL_OF_REFRESH_MUSK)
    end

    return 0
end

itemObject.onItemUse = function(target)
    if target:hasEquipped(invaderXim.item.VIAL_OF_REFRESH_MUSK) then
        target:addStatusEffect(invaderXim.effect.REFRESH, 3, 3, 30, 0, 0, 0, invaderXim.effectSourceType.EQUIPPED_ITEM, invaderXim.item.VIAL_OF_REFRESH_MUSK)
    end
end

return itemObject
