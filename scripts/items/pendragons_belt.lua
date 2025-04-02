-----------------------------------
-- ID: 15869
-- Item: pendragons_belt
-- Item Effect: DEX +10
-- Duration: 60 seconds
-----------------------------------
---@type TItem
local itemObject = {}

itemObject.onItemCheck = function(target, item, param, caster)
    if target:getStatusEffectBySource(invaderXim.effect.ENCHANTMENT, invaderXim.effectSourceType.EQUIPPED_ITEM, invaderXim.item.PENDRAGONS_BELT) ~= nil then
        target:delStatusEffect(invaderXim.effect.ENCHANTMENT, nil, invaderXim.effectSourceType.EQUIPPED_ITEM, invaderXim.item.PENDRAGONS_BELT)
    end

    return 0
end

itemObject.onItemUse = function(target)
    if target:hasEquipped(invaderXim.item.PENDRAGONS_BELT) then
        target:addStatusEffect(invaderXim.effect.DEX_BOOST, 10, 0, 60, 0, 0, 0, invaderXim.effectSourceType.EQUIPPED_ITEM, invaderXim.item.PENDRAGONS_BELT)
    end
end

return itemObject
