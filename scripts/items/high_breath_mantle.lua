-----------------------------------
-- ID: 15487
-- Item: High Breath Mantle
-- Item Effect: HP+38 / Enmity+5
-----------------------------------
---@type TItem
local itemObject = {}

itemObject.onItemCheck = function(target, item, param, caster)
    if target:getStatusEffectBySource(invaderXim.effect.ENCHANTMENT, invaderXim.effectSourceType.EQUIPPED_ITEM, invaderXim.item.HIGH_BREATH_MANTLE) ~= nil then
        target:delStatusEffect(invaderXim.effect.ENCHANTMENT, nil, invaderXim.effectSourceType.EQUIPPED_ITEM, invaderXim.item.HIGH_BREATH_MANTLE)
    end

    return 0
end

itemObject.onItemUse = function(target)
    if target:hasEquipped(invaderXim.item.HIGH_BREATH_MANTLE) then
        target:addStatusEffect(invaderXim.effect.ENCHANTMENT, 0, 0, 1800, 0, 0, 0, invaderXim.effectSourceType.EQUIPPED_ITEM, invaderXim.item.HIGH_BREATH_MANTLE)
    end
end

itemObject.onEffectGain = function(target, effect)
    target:addMod(invaderXim.mod.HP, 38)
    target:addMod(invaderXim.mod.ENMITY, 5)
end

itemObject.onEffectLose = function(target, effect)
    target:delMod(invaderXim.mod.HP, 38)
    target:delMod(invaderXim.mod.ENMITY, 5)
end

return itemObject
