-----------------------------------
-- ID: 18117
-- Item: gimlet_spear
-- Item Effect: Attack +3
-- Duration: 30 Minutes
-----------------------------------
---@type TItem
local itemObject = {}

itemObject.onItemCheck = function(target, item, param, caster)
    if target:getStatusEffectBySource(invaderXim.effect.ENCHANTMENT, invaderXim.effectSourceType.EQUIPPED_ITEM, invaderXim.item.GIMLET_SPEAR) ~= nil then
        target:delStatusEffect(invaderXim.effect.ENCHANTMENT, nil, invaderXim.effectSourceType.EQUIPPED_ITEM, invaderXim.item.GIMLET_SPEAR)
    end

    return 0
end

itemObject.onItemUse = function(target)
    if target:hasEquipped(invaderXim.item.GIMLET_SPEAR) then
        target:addStatusEffect(invaderXim.effect.ENCHANTMENT, 0, 0, 1800, 0, 0, 0, invaderXim.effectSourceType.EQUIPPED_ITEM, invaderXim.item.GIMLET_SPEAR)
    end
end

itemObject.onEffectGain = function(target, effect)
    target:addMod(invaderXim.mod.ATT, 3)
end

itemObject.onEffectLose = function(target, effect)
    target:delMod(invaderXim.mod.ATT, 3)
end

return itemObject
