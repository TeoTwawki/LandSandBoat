-----------------------------------
-- ID: 15261
-- Item: hydra_tiara
-- Item Effect: Crit Rate +7% **Needs validation**
-- Duration: 3 Minutes
-----------------------------------
---@type TItem
local itemObject = {}

itemObject.onItemCheck = function(target)
    if target:getStatusEffectBySource(invaderXim.effect.POTENCY, invaderXim.effectSourceType.EQUIPPED_ITEM, invaderXim.item.HYDRA_TIARA) ~= nil then
        target:delStatusEffect(invaderXim.effect.POTENCY, nil, invaderXim.effectSourceType.EQUIPPED_ITEM, invaderXim.item.HYDRA_TIARA)
    end

    return 0
end

itemObject.onItemUse = function(target)
    if target:hasEquipped(invaderXim.item.HYDRA_TIARA) then
        target:addStatusEffect(invaderXim.effect.POTENCY, 7, 0, 180, 0, 0, 0, invaderXim.effectSourceType.EQUIPPED_ITEM, invaderXim.item.HYDRA_TIARA)
    end
end

return itemObject
