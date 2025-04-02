-----------------------------------
-- ID: 18239
-- Item: Healing Feather
-- Item Effect: Cure Potency +15%
-- Duration: 3 Minutes
-----------------------------------
---@type TItem
local itemObject = {}

itemObject.onItemCheck = function(target, item, param, caster)
    if target:getStatusEffectBySource(invaderXim.effect.ENCHANTMENT, invaderXim.effectSourceType.EQUIPPED_ITEM, invaderXim.item.HEALING_FEATHER) ~= nil then
        target:delStatusEffect(invaderXim.effect.ENCHANTMENT, nil, invaderXim.effectSourceType.EQUIPPED_ITEM, invaderXim.item.HEALING_FEATHER)
    end

    return 0
end

itemObject.onItemUse = function(target)
    if target:hasEquipped(invaderXim.item.HEALING_FEATHER) then
        target:addStatusEffect(invaderXim.effect.ENCHANTMENT, 0, 0, 180, 0, 0, 0, invaderXim.effectSourceType.EQUIPPED_ITEM, invaderXim.item.HEALING_FEATHER)
    end
end

itemObject.onEffectGain = function(target, effect)
    target:addMod(invaderXim.mod.CURE_POTENCY, 15)
end

itemObject.onEffectLose = function(target, effect)
    target:delMod(invaderXim.mod.CURE_POTENCY, 15)
end

return itemObject
