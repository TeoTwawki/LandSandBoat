-----------------------------------
-- ID: 15505
-- Item: dhalmel_whistle
-- Item Effect: AGI +6
-- Duration: 3 minutes
-----------------------------------
---@type TItem
local itemObject = {}

itemObject.onItemCheck = function(target, item, param, caster)
    if target:getStatusEffectBySource(invaderXim.effect.ENCHANTMENT, invaderXim.effectSourceType.EQUIPPED_ITEM, invaderXim.item.DHALMEL_WHISTLE) ~= nil then
        target:delStatusEffect(invaderXim.effect.ENCHANTMENT, nil, invaderXim.effectSourceType.EQUIPPED_ITEM, invaderXim.item.DHALMEL_WHISTLE)
    end

    return 0
end

itemObject.onItemUse = function(target)
    if target:hasEquipped(invaderXim.item.DHALMEL_WHISTLE) then
        target:addStatusEffect(invaderXim.effect.ENCHANTMENT, 0, 0, 180, 0, 0, 0, invaderXim.effectSourceType.EQUIPPED_ITEM, invaderXim.item.DHALMEL_WHISTLE)
    end
end

itemObject.onEffectGain = function(target, effect)
    target:addMod(invaderXim.mod.AGI, 6)
end

itemObject.onEffectLose = function(target, effect)
    target:delMod(invaderXim.mod.AGI, 6)
end

return itemObject
