-----------------------------------
-- ID: 14681
-- Item: Getsul Ring
-- Item Effect: +20% HP
-- Duration 3 Minutes
-----------------------------------
---@type TItem
local itemObject = {}

itemObject.onItemCheck = function(target, item, param, caster)
    if target:getStatusEffectBySource(invaderXim.effect.ENCHANTMENT, invaderXim.effectSourceType.EQUIPPED_ITEM, invaderXim.item.GETSUL_RING) ~= nil then
        target:delStatusEffect(invaderXim.effect.ENCHANTMENT, nil, invaderXim.effectSourceType.EQUIPPED_ITEM, invaderXim.item.GETSUL_RING)
    end

    return 0
end

itemObject.onItemUse = function(target)
    if target:hasEquipped(invaderXim.item.GETSUL_RING) then
        target:addStatusEffect(invaderXim.effect.ENCHANTMENT, 0, 0, 180, 0, 0, 0, invaderXim.effectSourceType.EQUIPPED_ITEM, invaderXim.item.GETSUL_RING)
    end
end

itemObject.onEffectGain = function(target, effect)
    target:addMod(invaderXim.mod.HPP, 20)
end

itemObject.onEffectLose = function(target, effect)
    target:delMod(invaderXim.mod.HPP, 20)
end

return itemObject
