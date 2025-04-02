-----------------------------------
-- ID: 14516
-- Item: hydra_harness
-- Item Effect: Attack +25, Ranged Attack +25
-- Duration: 3 Minutes
-----------------------------------
---@type TItem
local itemObject = {}

itemObject.onItemCheck = function(target, item, param, caster)
    if target:getStatusEffectBySource(invaderXim.effect.ENCHANTMENT, invaderXim.effectSourceType.EQUIPPED_ITEM, invaderXim.item.HYDRA_HARNESS) ~= nil then
        target:delStatusEffect(invaderXim.effect.ENCHANTMENT, nil, invaderXim.effectSourceType.EQUIPPED_ITEM, invaderXim.item.HYDRA_HARNESS)
    end

    return 0
end

itemObject.onItemUse = function(target)
    if target:hasEquipped(invaderXim.item.HYDRA_HARNESS) then
        target:addStatusEffect(invaderXim.effect.ENCHANTMENT, 0, 0, 180, 0, 0, 0, invaderXim.effectSourceType.EQUIPPED_ITEM, invaderXim.item.HYDRA_HARNESS)
    end
end

itemObject.onEffectGain = function(target, effect)
    target:addMod(invaderXim.mod.ATT, 25)
    target:addMod(invaderXim.mod.RATT, 25)
end

itemObject.onEffectLose = function(target, effect)
    target:delMod(invaderXim.mod.ATT, 25)
    target:delMod(invaderXim.mod.RATT, 25)
end

return itemObject
