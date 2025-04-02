-----------------------------------
-- ID: 14925
-- Item: hydra_mittens
-- Item Effect: ACC +15 RACC +15
-- Duration: 3 Minutes
-----------------------------------
---@type TItem
local itemObject = {}

itemObject.onItemCheck = function(target, item, param, caster)
    if target:getStatusEffectBySource(invaderXim.effect.ENCHANTMENT, invaderXim.effectSourceType.EQUIPPED_ITEM, invaderXim.item.HYDRA_MITTENS) ~= nil then
        target:delStatusEffect(invaderXim.effect.ENCHANTMENT, nil, invaderXim.effectSourceType.EQUIPPED_ITEM, invaderXim.item.HYDRA_MITTENS)
    end

    return 0
end

itemObject.onItemUse = function(target)
    if target:hasEquipped(invaderXim.item.HYDRA_MITTENS) then
        target:addStatusEffect(invaderXim.effect.ENCHANTMENT, 0, 0, 180, 0, 0, 0, invaderXim.effectSourceType.EQUIPPED_ITEM, invaderXim.item.HYDRA_MITTENS)
    end
end

itemObject.onEffectGain = function(target, effect)
    target:addMod(invaderXim.mod.ACC, 15)
    target:addMod(invaderXim.mod.RACC, 15)
end

itemObject.onEffectLose = function(target, effect)
    target:delMod(invaderXim.mod.ACC, 15)
    target:delMod(invaderXim.mod.RACC, 15)
end

return itemObject
