-----------------------------------
-- ID: 18231
-- Item: Death Chakram
-- Item Effect: +5% MP
-- Duration 3 Minutes
-----------------------------------
---@type TItem
local itemObject = {}

itemObject.onItemCheck = function(target, item, param, caster)
    if target:getStatusEffectBySource(invaderXim.effect.ENCHANTMENT, invaderXim.effectSourceType.EQUIPPED_ITEM, invaderXim.item.DEATH_CHAKRAM) ~= nil then
        target:delStatusEffect(invaderXim.effect.ENCHANTMENT, nil, invaderXim.effectSourceType.EQUIPPED_ITEM, invaderXim.item.DEATH_CHAKRAM)
    end

    return 0
end

itemObject.onItemUse = function(target)
    if target:hasEquipped(invaderXim.item.DEATH_CHAKRAM) then
        target:addStatusEffect(invaderXim.effect.ENCHANTMENT, 0, 0, 180, 0, 0, 0, invaderXim.effectSourceType.EQUIPPED_ITEM, invaderXim.item.DEATH_CHAKRAM)
    end
end

itemObject.onEffectGain = function(target, effect)
    target:addMod(invaderXim.mod.MPP, 5)
end

itemObject.onEffectLose = function(target, effect)
    target:delMod(invaderXim.mod.MPP, 5)
end

return itemObject
