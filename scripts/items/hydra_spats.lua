-----------------------------------
-- ID: 15681
-- Item: hydra_spats
-- Item Effect: Eva +15
-- Duration: 20 Minutes
-----------------------------------
---@type TItem
local itemObject = {}

itemObject.onItemCheck = function(target, item, param, caster)
    if target:getStatusEffectBySource(invaderXim.effect.ENCHANTMENT, invaderXim.effectSourceType.EQUIPPED_ITEM, invaderXim.item.HYDRA_SPATS) ~= nil then
        target:delStatusEffect(invaderXim.effect.ENCHANTMENT, nil, invaderXim.effectSourceType.EQUIPPED_ITEM, invaderXim.item.HYDRA_SPATS)
    end

    return 0
end

itemObject.onItemUse = function(target)
    if target:hasEquipped(invaderXim.item.HYDRA_SPATS) then
        target:addStatusEffect(invaderXim.effect.EVASION_BOOST, 15, 0, 1200, 0, 0, 0, invaderXim.effectSourceType.EQUIPPED_ITEM, invaderXim.item.HYDRA_SPATS)
    end
end

return itemObject
