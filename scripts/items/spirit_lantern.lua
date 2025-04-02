-----------------------------------
-- ID: 18240
-- Item: Spirit Lantern
-- Item Effect: Magic Damage +10%
-- Duration: 3 Minutes
-----------------------------------
---@type TItem
local itemObject = {}

itemObject.onItemCheck = function(target, item, param, caster)
    if target:getStatusEffectBySource(invaderXim.effect.ENCHANTMENT, invaderXim.effectSourceType.EQUIPPED_ITEM, invaderXim.item.SPIRIT_LANTERN) ~= nil then
        target:delStatusEffect(invaderXim.effect.ENCHANTMENT, nil, invaderXim.effectSourceType.EQUIPPED_ITEM, invaderXim.item.SPIRIT_LANTERN)
    end

    return 0
end

itemObject.onItemUse = function(target)
    if target:hasEquipped(invaderXim.item.SPIRIT_LANTERN) then
        target:addStatusEffect(invaderXim.effect.ENCHANTMENT, 0, 0, 180, 0, 0, 0, invaderXim.effectSourceType.EQUIPPED_ITEM, invaderXim.item.SPIRIT_LANTERN)
    end
end

itemObject.onEffectGain = function(target, effect)
    target:addMod(invaderXim.mod.MAGIC_DAMAGE, 10)
end

itemObject.onEffectLose = function(target, effect)
    target:delMod(invaderXim.mod.MAGIC_DAMAGE, 10)
end

return itemObject
