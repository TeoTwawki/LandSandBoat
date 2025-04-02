-----------------------------------
-- ID: 14864
-- Item: Palmer's Bangles
-- Item Effect: Gilfinder
-- Duration: 3 Minutes
-----------------------------------
---@type TItem
local itemObject = {}

itemObject.onItemCheck = function(target)
    if target:getStatusEffectBySource(invaderXim.effect.ENCHANTMENT, invaderXim.effectSourceType.EQUIPPED_ITEM, invaderXim.item.PALMERS_BANGLES) ~= nil then
        target:delStatusEffect(invaderXim.effect.ENCHANTMENT, nil, invaderXim.effectSourceType.EQUIPPED_ITEM, invaderXim.item.PALMERS_BANGLES)
    end

    return 0
end

itemObject.onItemUse = function(target)
    if target:hasEquipped(invaderXim.item.PALMERS_BANGLES) then
        target:addStatusEffect(invaderXim.effect.ENCHANTMENT, 0, 0, 180, 0, 0, 0, invaderXim.effectSourceType.EQUIPPED_ITEM, invaderXim.item.PALMERS_BANGLES)
    end
end

itemObject.onEffectGain = function(target)
    target:addMod(invaderXim.mod.GILFINDER, 3)
end

itemObject.onEffectLose = function(target)
    target:delMod(invaderXim.mod.GILFINDER, 3)
end

return itemObject
