-----------------------------------
-- ID: 14678
-- Item: Assassin's Ring
-- Item Effect: Ranged Accuracy 20
-- Duration 3 Minutes
-----------------------------------
---@type TItem
local itemObject = {}

itemObject.onItemCheck = function(target, item, param, caster)
    if target:getStatusEffectBySource(invaderXim.effect.ENCHANTMENT, invaderXim.effectSourceType.EQUIPPED_ITEM, invaderXim.item.ASSASSINS_RING) ~= nil then
        target:delStatusEffect(invaderXim.effect.ENCHANTMENT, nil, invaderXim.effectSourceType.EQUIPPED_ITEM, invaderXim.item.ASSASSINS_RING)
    end

    return 0
end

itemObject.onItemUse = function(target)
    if target:hasEquipped(invaderXim.item.ASSASSINS_RING) then
        target:addStatusEffect(invaderXim.effect.ENCHANTMENT, 0, 0, 180, 0, 0, 0, invaderXim.effectSourceType.EQUIPPED_ITEM, invaderXim.item.ASSASSINS_RING)
    end
end

itemObject.onEffectGain = function(target, effect)
    target:addMod(invaderXim.mod.RACC, 20)
end

itemObject.onEffectLose = function(target, effect)
    target:delMod(invaderXim.mod.RACC, 20)
end

return itemObject
