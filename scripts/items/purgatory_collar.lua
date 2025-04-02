-----------------------------------
-- ID: 15507
-- Item: Purgatory Collar
-- Item Effect: Conserve MP
-- Duration: 45 seconds
-----------------------------------
---@type TItem
local itemObject = {}

itemObject.onItemCheck = function(target)
    if target:getStatusEffectBySource(invaderXim.effect.ENCHANTMENT, invaderXim.effectSourceType.EQUIPPED_ITEM, invaderXim.item.PURGATORY_COLLAR) ~= nil then
        target:delStatusEffect(invaderXim.effect.ENCHANTMENT, nil, invaderXim.effectSourceType.EQUIPPED_ITEM, invaderXim.item.PURGATORY_COLLAR)
    end

    return 0
end

itemObject.onItemUse = function(target)
    if target:hasEquipped(invaderXim.item.PURGATORY_COLLAR) then
        target:addStatusEffect(invaderXim.effect.ENCHANTMENT, 0, 0, 45, 0, 0, 0, invaderXim.effectSourceType.EQUIPPED_ITEM, invaderXim.item.PURGATORY_COLLAR)
    end
end

itemObject.onEffectGain = function(target)
    -- **Power needs validation**
    target:addMod(invaderXim.mod.CONSERVE_MP, 10)
end

itemObject.onEffectLose = function(target)
    target:delMod(invaderXim.mod.CONSERVE_MP, 10)
end

return itemObject
