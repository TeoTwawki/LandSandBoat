-----------------------------------
-- ID: 15770
-- Item: Random Ring
-- Item Effect: Enchantment Dex + math.random(1, 8)
-- Duration: 30 Mins
-----------------------------------
---@type TItem
local itemObject = {}

itemObject.onItemCheck = function(target, item, param, caster)
    if target:getStatusEffectBySource(invaderXim.effect.ENCHANTMENT, invaderXim.effectSourceType.EQUIPPED_ITEM, invaderXim.item.RANDOM_RING) ~= nil then
        target:delStatusEffect(invaderXim.effect.ENCHANTMENT, nil, invaderXim.effectSourceType.EQUIPPED_ITEM, invaderXim.item.RANDOM_RING)
    end

    return 0
end

itemObject.onItemUse = function(target)
    if target:hasEquipped(invaderXim.item.RANDOM_RING) then
        local power = math.random(1, 8)

        target:addStatusEffect(invaderXim.effect.ENCHANTMENT, power, 0, 3600, 0, 0, 0, invaderXim.effectSourceType.EQUIPPED_ITEM, invaderXim.item.RANDOM_RING)
    end
end

itemObject.onEffectGain = function(target, effect)
    target:addMod(invaderXim.mod.DEX, effect:getPower())
end

itemObject.onEffectLose = function(target, effect)
    target:delMod(invaderXim.mod.DEX, effect:getPower())
end

return itemObject
