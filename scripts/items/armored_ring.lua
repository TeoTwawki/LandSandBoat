-----------------------------------
-- ID: 15783
-- Item: Armored Ring
-- Item Effect: Defence +8
-- Duration 30 Minutes
-----------------------------------
---@type TItem
local itemObject = {}

itemObject.onItemCheck = function(target, item, param, caster)
    if target:getStatusEffectBySource(invaderXim.effect.ENCHANTMENT, invaderXim.effectSourceType.EQUIPPED_ITEM, invaderXim.item.ARMORED_RING) ~= nil then
        target:delStatusEffect(invaderXim.effect.ENCHANTMENT, nil, invaderXim.effectSourceType.EQUIPPED_ITEM, invaderXim.item.ARMORED_RING)
    end

    return 0
end

itemObject.onItemUse = function(target)
    if target:hasEquipped(invaderXim.item.ARMORED_RING) then
        target:addStatusEffect(invaderXim.effect.ENCHANTMENT, 0, 0, 1800, 0, 0, 0, invaderXim.effectSourceType.EQUIPPED_ITEM, invaderXim.item.ARMORED_RING)
    end
end

itemObject.onEffectGain = function(target, effect)
    target:addMod(invaderXim.mod.DEF, 8)
end

itemObject.onEffectLose = function(target, effect)
    target:delMod(invaderXim.mod.DEF, 8)
end

return itemObject
