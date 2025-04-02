-----------------------------------
-- ID: 14786
-- Item: Counter Earring
-- Item Effect: Counter 5%
-- Duration: 3 Minutes
-----------------------------------
---@type TItem
local itemObject = {}

itemObject.onItemCheck = function(target, item, param, caster)
    if target:getStatusEffectBySource(invaderXim.effect.ENCHANTMENT, invaderXim.effectSourceType.EQUIPPED_ITEM, invaderXim.item.COUNTER_EARRING) ~= nil then
        target:delStatusEffect(invaderXim.effect.ENCHANTMENT, nil, invaderXim.effectSourceType.EQUIPPED_ITEM, invaderXim.item.COUNTER_EARRING)
    end

    return 0
end

itemObject.onItemUse = function(target)
    if target:hasEquipped(invaderXim.item.COUNTER_EARRING) then
        target:addStatusEffect(invaderXim.effect.ENCHANTMENT, 0, 0, 180, 0, 0, 0, invaderXim.effectSourceType.EQUIPPED_ITEM, invaderXim.item.COUNTER_EARRING)
    end
end

itemObject.onEffectGain = function(target, effect)
    target:addMod(invaderXim.mod.COUNTER, 5)
end

itemObject.onEffectLose = function(target, effect)
    target:delMod(invaderXim.mod.COUNTER, 5)
end

return itemObject
