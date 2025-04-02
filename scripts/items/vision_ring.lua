-----------------------------------
-- ID: 15559
-- Item: vision_ring
-- Item Effect: ACC+2 RACC+2
-- Duration: 30 Minutes
-----------------------------------
---@type TItem
local itemObject = {}

itemObject.onItemCheck = function(target, item, param, caster)
    if target:getStatusEffectBySource(invaderXim.effect.ENCHANTMENT, invaderXim.effectSourceType.EQUIPPED_ITEM, invaderXim.item.VISION_RING) ~= nil then
        target:delStatusEffect(invaderXim.effect.ENCHANTMENT, nil, invaderXim.effectSourceType.EQUIPPED_ITEM, invaderXim.item.VISION_RING)
    end

    return 0
end

itemObject.onItemUse = function(target)
    if target:hasEquipped(invaderXim.item.VISION_RING) then
        target:addStatusEffect(invaderXim.effect.ENCHANTMENT, 0, 0, 1800, 0, 0, 0, invaderXim.effectSourceType.EQUIPPED_ITEM, invaderXim.item.VISION_RING)
    end
end

itemObject.onEffectGain = function(target, effect)
    target:addMod(invaderXim.mod.ACC, 2)
    target:addMod(invaderXim.mod.RACC, 2)
end

itemObject.onEffectLose = function(target, effect)
    target:delMod(invaderXim.mod.ACC, 2)
    target:delMod(invaderXim.mod.RACC, 2)
end

return itemObject
