-----------------------------------
-- ID: 15596
-- Item: Hydra Tights
-- Item Effect: 10% haste
-- Duration: 3 minutes
-----------------------------------
---@type TItem
local itemObject = {}

itemObject.onItemCheck = function(target)
    if target:getStatusEffectBySource(invaderXim.effect.HASTE, invaderXim.effectSourceType.EQUIPPED_ITEM, invaderXim.item.HYDRA_TIGHTS) ~= nil then
        target:delStatusEffect(invaderXim.effect.HASTE, nil, invaderXim.effectSourceType.EQUIPPED_ITEM, invaderXim.item.HYDRA_TIGHTS)
    end

    return 0
end

itemObject.onItemUse = function(target)
    if target:hasEquipped(invaderXim.item.HYDRA_TIGHTS) then
        if not target:hasStatusEffect(invaderXim.effect.HASTE) then
            target:addStatusEffect(invaderXim.effect.HASTE, 1000, 0, 180, 0, 0, 0, invaderXim.effectSourceType.EQUIPPED_ITEM, invaderXim.item.HYDRA_TIGHTS)
        else
            target:messageBasic(invaderXim.msg.basic.NO_EFFECT)
        end
    end
end

return itemObject
