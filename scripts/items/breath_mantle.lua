-----------------------------------
-- ID: 15486
-- Item: Breath Mantle
-- Item Effect: HP+18 / Enmity+3
-----------------------------------
---@type TItem
local itemObject = {}

itemObject.onItemCheck = function(target, item, param, caster)
    if target:getStatusEffectBySource(invaderXim.effect.ENCHANTMENT, invaderXim.effectSourceType.EQUIPPED_ITEM, invaderXim.item.BREATH_MANTLE) ~= nil then
        target:delStatusEffect(invaderXim.effect.ENCHANTMENT, nil, invaderXim.effectSourceType.EQUIPPED_ITEM, invaderXim.item.BREATH_MANTLE)
    end

    return 0
end

itemObject.onItemUse = function(target)
    if target:hasEquipped(invaderXim.item.BREATH_MANTLE) then
        target:addStatusEffect(invaderXim.effect.ENCHANTMENT, 0, 0, 1800, 0, 0, 0, invaderXim.effectSourceType.EQUIPPED_ITEM, invaderXim.item.BREATH_MANTLE)
    end
end

itemObject.onEffectGain = function(target, effect)
    target:addMod(invaderXim.mod.HP, 18)
    target:addMod(invaderXim.mod.ENMITY, 3)
end

itemObject.onEffectLose = function(target, effect)
    target:delMod(invaderXim.mod.HP, 18)
    target:delMod(invaderXim.mod.ENMITY, 3)
end

return itemObject
